import hashlib
import json
from collections import Counter
from pathlib import Path
import struct
import sys
import unittest
from unittest.mock import patch

from lua_bytecode_reader import (
    MAX_DEPTH, ParseError, analyze_function, decode_fields, parse_payload,
)
from test_lua_resource_codec import lua_payload


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "work/zh_cn/audit"))
import probe_ffq35_lua as PROBE


def u32(value):
    return struct.pack(">I", value)


def constant(value):
    if value is None:
        return b"\x00"
    if isinstance(value, bool):
        return b"\x01" + bytes([value])
    if isinstance(value, int):
        return b"\x03" + struct.pack(">i", value)
    if isinstance(value, bytes):
        return b"\x04" + u32(len(value) + 1) + value + b"\x00"
    raise TypeError(value)


def function(code=None, constants=(), children=(), prefix=(0, 0, 0, 0),
             nups=0, params=0, vararg=0, stack=2, suffix=(0, 0, 0)):
    if code is None:
        code = [9 << 25]
    return (b"".join(map(u32, prefix)) + u32(nups) + u32(params)
            + bytes([vararg]) + u32(stack) + u32(len(code))
            + b"".join(map(u32, code)) + u32(len(constants))
            + b"".join(map(constant, constants)) + u32(len(children))
            + b"".join(children) + b"".join(map(u32, suffix)))


def payload(body=None, trailer=bytes.fromhex("0000000100000000")):
    return lua_payload((function() if body is None else body) + trailer)


def pilot_results():
    audit = ROOT / "work/zh_cn/audit"
    inventory = json.loads((audit / "lua-corpus-review-20261115/pilot-inventory.json")
                           .read_text(encoding="utf-8"))
    rows = []
    for occurrence in inventory["occurrences"]:
        body = (audit / "lua-script-extracted" / occurrence["payload_path"]).read_bytes()
        if (len(body) != occurrence["payload_bytes"]
                or hashlib.sha256(body).hexdigest() != occurrence["payload_sha256"]):
            raise ValueError(f"Pilot payload changed: {occurrence['occurrence_key']}")
        row = {key: occurrence[key] for key in ("occurrence_key", "container_kind",
               "payload_path", "payload_sha256", "payload_bytes")}
        try:
            parsed = parse_payload(body)
        except ParseError as error:
            row.update(status="unsupported" if error.code.startswith("unsupported_") else "malformed",
                       diagnostic={"code": error.code, "offset": error.offset,
                                   "detail": error.detail,
                                   "window_start": max(0, error.offset - 8),
                                   "window_hex": body[max(0, error.offset - 8):
                                                      error.offset + 24].hex()},
                       function_count=None, function_ranges=None,
                       constant_tags=None, opcode_population=None, consumed_bytes=None,
                       observed_tail_hex=body[-8:].hex())
        else:
            functions = parsed["functions"]
            tags = Counter(str(c["tag"]) for f in functions for c in f["constants"])
            opcodes = Counter(str(i["opcode"]) for f in functions for i in f["instructions"])
            row.update(status="success", diagnostic=None, function_count=len(functions),
                       function_ranges=[{"path": f["path"], "start": f["start"],
                                         "end": f["end"], "instructions": len(f["instructions"]),
                                         "constants": len(f["constants"]),
                                         "metadata": f["metadata"]} for f in functions],
                       constant_tags=dict(sorted(tags.items())),
                       opcode_population=dict(sorted(opcodes.items(), key=lambda item: int(item[0]))),
                       consumed_bytes=len(body), observed_tail_hex=body[-8:].hex())
        rows.append(row)
    return "".join(json.dumps(row, ensure_ascii=True, sort_keys=True,
                              separators=(",", ":")) + "\n" for row in rows)


class LuaBytecodeReaderTests(unittest.TestCase):
    def assert_error(self, data, code):
        with self.assertRaises(ParseError) as context:
            parse_payload(data)
        error = context.exception
        self.assertEqual(error.code, code)
        self.assertIsInstance(error.offset, int)
        self.assertGreaterEqual(error.offset, 0)
        self.assertIsInstance(error.detail, str)
        self.assertTrue(error.detail)
        return error

    def test_decode_fields(self):
        self.assertEqual(decode_fields((25 << 25) | (3 << 8) | 2),
                         (25, 2, 0, 3, 3))

    def test_probe_pinned_samples_match_every_function_and_word(self):
        totals = [0, 0]
        samples = PROBE.samples()
        self.assertEqual(tuple(hashlib.sha256(body).hexdigest() for _, _, body in samples),
                         PROBE.EXPECTED_HASHES)
        for _, _, body in samples:
            expected = PROBE.parse(body)
            actual = parse_payload(body)
            self.assertEqual(actual["payload_sha256"], hashlib.sha256(body).hexdigest())
            by_path = {tuple(fn["path"]): fn for fn in actual["functions"]}

            def compare(fn, path):
                parsed = by_path[tuple(path)]
                self.assertEqual((parsed["start"], parsed["end"]), (fn["start"], fn["end"]))
                self.assertEqual([ins["word"] for ins in parsed["instructions"]], fn["code"])
                self.assertEqual([c["value"] for c in parsed["constants"]], fn["constants"])
                self.assertEqual([ins["offset"] for ins in parsed["instructions"]],
                                 list(range(fn["code_start"], fn["code_start"]
                                            + 4 * len(fn["code"]), 4)))
                self.assertEqual(parsed["child_paths"],
                                 [path + [i] for i in range(len(fn["children"]))])
                totals[0] += 1
                totals[1] += len(fn["code"])
                for i, child in enumerate(fn["children"]):
                    compare(child, path + [i])

            compare(expected, [])
            self.assertEqual(len(by_path), len(actual["functions"]))
            self.assertEqual(actual["opaque_regions"][-1],
                             {"kind": "trailer", "start": len(body) - 8,
                              "end": len(body), "raw_hex": "0000000100000000"})
        self.assertEqual(totals, [27, 687])

    def test_nested_constants_offsets_and_raw_bytes_are_json_safe(self):
        child = function(constants=(None, False, True, -17, b"ok", b"\xff\x80"))
        body = payload(function(children=(child,)))
        result = parse_payload(body)
        json.dumps(result, allow_nan=False)
        root, nested = result["functions"]
        self.assertEqual(root["path"], [])
        self.assertEqual(root["child_paths"], [[0]])
        self.assertEqual(nested["path"], [0])
        self.assertLess(root["start"], nested["start"])
        self.assertLess(nested["end"], root["end"])
        self.assertEqual([c["type"] for c in nested["constants"]],
                         ["nil", "boolean", "boolean", "integer", "string", "string"])
        self.assertEqual([c["value"] for c in nested["constants"]],
                         [None, False, True, -17, "ok", None])
        for entry in nested["constants"]:
            self.assertEqual(body[entry["start"]:entry["end"]].hex(), entry["raw_hex"])
        self.assertEqual(nested["constants"][-1]["bytes_hex"], "ff80")
        self.assertIsNone(nested["constants"][-1]["value"])
        self.assertEqual(body[nested["constants"][-1]["data_start"]:
                              nested["constants"][-1]["data_end"]], b"\xff\x80")

    def test_opcode_support_is_independent_of_structure(self):
        body = payload(function(code=[127 << 25]))
        instruction = parse_payload(body)["functions"][0]["instructions"][0]
        self.assertEqual(instruction["opcode"], 127)
        self.assertEqual(instruction["semantic_support"], "unassessed")
        self.assertEqual(instruction["reference_support"], "unassessed")

    def test_truncated_header_type_table_and_body(self):
        self.assert_error(b"\x1bLua", "malformed_truncated")
        original = payload()
        for end in (14, 237, 238, 239, len(original) - 1):
            with self.subTest(end=end):
                error = None
                with self.assertRaises(ParseError) as context:
                    parse_payload(original[:end])
                error = context.exception
                self.assertTrue(error.code.startswith("malformed_"), error)

    def test_unsupported_header_type_table_and_tag(self):
        original = bytearray(payload())
        original[5] ^= 1
        self.assert_error(bytes(original), "unsupported_header")
        original = bytearray(payload())
        original[20] ^= 1
        self.assert_error(bytes(original), "unsupported_type_table")
        original = payload(function(constants=(None,)))
        offset = 238 + 29 + 4 + 4 + 4
        self.assertEqual(original[offset], 0)
        self.assert_error(original[:offset] + b"\x7f" + original[offset + 1:],
                          "unsupported_constant_tag")

    def test_invalid_boolean_and_string(self):
        original = payload(function(constants=(True,)))
        offset = 238 + 29 + 4 + 4 + 4 + 1
        bad_bool = original[:offset] + b"\x02" + original[offset + 1:]
        self.assert_error(bad_bool, "malformed_boolean")
        original = payload(function(constants=(b"abc",)))
        offset = original.index(b"abc\x00")
        self.assert_error(original[:offset + 3] + b"x" + original[offset + 4:],
                          "malformed_string")

    def test_impossible_counts(self):
        original = bytearray(payload())
        for offset in (238 + 29, 238 + 29 + 4 + 4):
            changed = bytearray(original)
            struct.pack_into(">I", changed, offset, 0xffffffff)
            self.assert_error(bytes(changed), "malformed_count")

    def test_unsupported_metadata_and_trailers(self):
        self.assert_error(payload(function(prefix=(1, 0, 0, 0))), "unsupported_metadata")
        self.assert_error(payload(function(suffix=(0, 0, 1))), "unsupported_metadata")
        self.assert_error(payload(function(nups=1)), "unsupported_function_header")
        self.assert_error(payload(trailer=b"\x00" * 8), "unsupported_trailer")
        self.assert_error(payload() + b"\x00", "malformed_trailing_bytes")

    def test_unsupported_function_header_reports_the_failing_byte(self):
        error = self.assert_error(payload(function(vararg=7)), "unsupported_function_header")
        self.assertEqual(error.offset, 238 + 24)

    def test_excessive_depth_is_bounded(self):
        body = function()
        for _ in range(MAX_DEPTH + 1):
            body = function(children=(body,))
        self.assert_error(payload(body), "unsupported_depth_limit")

    def test_work_and_size_limits_are_enforced(self):
        with patch("lua_bytecode_reader.MAX_PAYLOAD_BYTES", 100):
            self.assert_error(payload(), "unsupported_work_limit")
        with patch("lua_bytecode_reader.MAX_ITEMS", 0):
            self.assert_error(payload(), "unsupported_work_limit")
        with patch("lua_bytecode_reader.MAX_FUNCTIONS", 1):
            self.assert_error(payload(function(children=(function(),))),
                              "unsupported_work_limit")

    def test_all_truncations_fail_without_unstructured_exceptions(self):
        original = payload(function(constants=(None, True, -5, b"abc"),
                                    children=(function(),)))
        for end in range(len(original)):
            with self.subTest(end=end), self.assertRaises(ParseError):
                parse_payload(original[:end])

    def test_pilot_raw_byte_boundaries_and_hashes(self):
        audit = ROOT / "work/zh_cn/audit"
        inventory = json.loads((audit / "lua-corpus-review-20261115/pilot-inventory.json")
                               .read_text(encoding="utf-8"))
        extraction = audit / "lua-script-extracted"
        self.assertEqual(len(inventory["occurrences"]), 13)
        self.assertEqual([r["occurrence_key"] for r in inventory["occurrences"]],
                         inventory["pilot_keys"])
        outcomes = {}
        for row in inventory["occurrences"]:
            body = (extraction / row["payload_path"]).read_bytes()
            self.assertEqual(len(body), row["payload_bytes"])
            self.assertEqual(hashlib.sha256(body).hexdigest(), row["payload_sha256"])
            try:
                parsed = parse_payload(body)
            except ParseError as error:
                outcomes[row["occurrence_key"]] = (error.code, error.offset)
                continue
            outcomes[row["occurrence_key"]] = ("success", None)
            functions = {tuple(fn["path"]): fn for fn in parsed["functions"]}

            def check_raw(path):
                fn = functions[tuple(path)]
                start = fn["start"]
                self.assertEqual(struct.unpack_from(">4I", body, start),
                                 tuple(fn["metadata"]["prefix_words"]))
                self.assertEqual(struct.unpack_from(">IIBI", body, start + 16),
                                 tuple(fn["metadata"][key] for key in
                                       ("nups", "params", "vararg", "stack")))
                count = struct.unpack_from(">I", body, start + 29)[0]
                self.assertEqual(count, len(fn["instructions"]))
                cursor = start + 33
                for pc, instruction in enumerate(fn["instructions"]):
                    self.assertEqual(instruction["pc"], pc)
                    self.assertEqual(instruction["offset"], cursor)
                    self.assertEqual(instruction["word"], struct.unpack_from(">I", body, cursor)[0])
                    cursor += 4
                self.assertEqual(struct.unpack_from(">I", body, cursor)[0], len(fn["constants"]))
                cursor += 4
                for index, entry in enumerate(fn["constants"]):
                    self.assertEqual((entry["index"], entry["start"], entry["tag"]),
                                     (index, cursor, body[cursor]))
                    self.assertEqual(entry["raw_hex"], body[cursor:entry["end"]].hex())
                    if entry["tag"] == 4:
                        length = struct.unpack_from(">I", body, cursor + 1)[0]
                        self.assertEqual(entry["end"], cursor + 5 + length)
                        self.assertEqual(body[entry["end"] - 1], 0)
                        self.assertEqual(entry["bytes_hex"],
                                         body[cursor + 5:entry["end"] - 1].hex())
                    else:
                        self.assertEqual(entry["end"] - cursor,
                                         {0: 1, 1: 2, 3: 5}[entry["tag"]])
                        if entry["tag"] == 1:
                            self.assertEqual(entry["value"], bool(body[cursor + 1]))
                        if entry["tag"] == 3:
                            self.assertEqual(entry["value"],
                                             struct.unpack_from(">i", body, cursor + 1)[0])
                    cursor = entry["end"]
                self.assertEqual(struct.unpack_from(">I", body, cursor)[0], len(fn["child_paths"]))
                cursor += 4
                for child in fn["child_paths"]:
                    self.assertEqual(functions[tuple(child)]["start"], cursor)
                    cursor = check_raw(child)
                self.assertEqual(body[cursor:cursor + 12], b"\x00" * 12)
                self.assertEqual(fn["end"], cursor + 12)
                return fn["end"]

            root_end = check_raw([])
            self.assertEqual(body[root_end:], bytes.fromhex("0000000100000000"))
        self.assertEqual(sum(status == "success" for status, _ in outcomes.values()), 12)
        self.assertEqual(outcomes["134230570_klua.batch|batch_script|930574:13535"],
                         ("unsupported_function_header", 110835))

    def test_saved_pilot_results_are_reproducible(self):
        saved = ROOT / "work/zh_cn/audit/lua-corpus-review-20261115/parser-pilot-results.jsonl"
        self.assertEqual(saved.read_text(encoding="utf-8"), pilot_results())


def abc(opcode, a=0, b=0, c=0):
    return (opcode << 25) | (b << 17) | (c << 8) | a


def abx(opcode, a=0, bx=0):
    return (opcode << 25) | (bx << 8) | a


def jump(pc, target):
    return abx(28, bx=target - pc - 1 + 65535)


class LuaInstructionAnalysisTests(unittest.TestCase):
    def function_fixture(self, words, constants=(), children=(), stack=5):
        return parse_payload(payload(function(code=words, constants=constants,
                                              children=children, stack=stack)))["functions"][0]

    def analyze(self, words, constants=(), children=(), stack=5):
        return analyze_function(self.function_fixture(words, constants, children, stack))

    def simple_call(self, middle=()):
        return [abx(85), abc(70, a=20, c=1), abx(25, a=1, bx=1),
                *middle, abc(2, b=2, c=1), abc(9, b=1)]

    def test_unknown_opcode_does_not_claim_call_evidence(self):
        fn = self.function_fixture(words=[127 << 25, abc(9, b=1)])
        result = analyze_function(fn)
        self.assertEqual(result["calls"], [])
        self.assertEqual(result["instruction_statuses"][0]["status"], "unsupported")
        self.assertEqual(result["dataflow_status"], "blocked")
        self.assertFalse(result["control_flow_complete"])
        self.assertEqual(len(result["instruction_statuses"]), 2)

    def test_analysis_is_separate_json_safe_and_does_not_mutate_structure(self):
        fn = self.function_fixture(self.simple_call(), constants=(b"show_text", b"hello"))
        before = json.dumps(fn, sort_keys=True)
        result = analyze_function(fn)
        self.assertEqual(before, json.dumps(fn, sort_keys=True))
        self.assertEqual(result, analyze_function(fn))
        json.dumps(result, allow_nan=False)
        call = result["calls"][0]
        self.assertEqual(call["callee"]["constant_indexes"], [0])
        self.assertEqual(call["arguments"][0]["value"]["constant_index"], 1)
        self.assertEqual(call["path"], [])
        self.assertEqual(call["offset"], fn["instructions"][3]["offset"])
        self.assertEqual(call["raw_operands"], {k: fn["instructions"][3][k]
                                               for k in ("opcode", "a", "b", "c", "bx")})
        self.assertTrue(call["support_rationale"])
        self.assertEqual(call["localization_role"], "unknown")
        self.assertIsNone(call["localization_key"])
        self.assertEqual(call["evidence_level"], "unresolved")
        self.assertEqual(call["results_status"], "none")

    def test_register_constant_and_child_references_are_checked(self):
        cases = [
            ([abx(25, a=5)], (b"x",), (), "register"),
            ([abx(25, bx=1)], (b"x",), (), "constant"),
            ([abx(60, bx=1)], (), (function(),), "prototype"),
            ([abc(67, b=5), abc(70), abc(70)], (b"key",), (), "register"),
            ([abc(2, a=4, b=2, c=1)], (), (), "register"),
            ([abc(2, a=4, b=2, c=2)], (), (), "register"),
            ([abc(9, a=5, b=2)], (), (), "register"),
            ([abc(4, b=5), jump(1, 2), abc(9, b=1)], (), (), "register"),
            ([abc(4, c=256), jump(1, 2), abc(9, b=1)], (), (), "constant"),
        ]
        for words, constants, children, kind in cases:
            with self.subTest(words=words):
                result = self.analyze(words, constants, children)
                self.assertEqual(result["instruction_statuses"][0]["status"], "invalid")
                self.assertTrue(any(r["kind"] == kind and r["status"] == "invalid"
                                    for r in result["references"]))
                self.assertEqual(result["dataflow_status"], "blocked")
        valid = self.analyze([abx(60), abc(9, b=2)], children=(function(),))
        self.assertEqual(valid["references"][1]["child_path"], [0])
        self.assertEqual(valid["dataflow_status"], "complete")

    def test_global_and_field_keys_must_be_string_constants(self):
        for words in ([abx(85), abc(70), abc(9, b=1)],
                      [abc(67), abc(70), abc(70), abc(9, b=1)]):
            with self.subTest(words=words):
                result = self.analyze(words, constants=(17,))
                self.assertEqual(result["instruction_statuses"][0]["status"], "invalid")
                self.assertTrue(any(r["kind"] == "constant" and r["status"] == "invalid"
                                    for r in result["references"]))

    def test_cache_words_have_one_owner_and_are_never_register_operations(self):
        words = [abx(85), abc(70, a=255), abc(67, b=0, c=1),
                 abc(70, a=255), abc(70, a=255), abc(9, b=1)]
        result = self.analyze(words, constants=(b"table", b"field"))
        statuses = result["instruction_statuses"]
        self.assertEqual([statuses[i]["cache_owner"] for i in (1, 3, 4)], [0, 2, 2])
        self.assertTrue(all(statuses[i]["status"] == "auxiliary" for i in (1, 3, 4)))
        self.assertFalse(any(r["pc"] in (1, 3, 4) for r in result["references"]))
        self.assertIn((0, 2), [(e["source_pc"], e["target_pc"])
                               for e in result["control_flow_edges"]])

    def test_missing_partial_and_orphan_cache_words_are_explicit(self):
        for words in ([abx(85)], [abx(85), abc(9, b=1)],
                      [abc(67), abc(70), abc(9, b=1)]):
            with self.subTest(words=words):
                result = self.analyze(words, constants=(b"key",))
                self.assertEqual(result["instruction_statuses"][0]["status"], "invalid")
                self.assertEqual(result["dataflow_status"], "blocked")
                self.assertTrue(result["instruction_statuses"][0]["reason_codes"])
        result = self.analyze([abx(85), abc(70), abc(70), abc(9, b=1)],
                              constants=(b"key",))
        self.assertEqual(result["instruction_statuses"][1]["status"], "auxiliary")
        self.assertEqual(result["instruction_statuses"][2]["status"], "unsupported")

    def test_unowned_data_marker_does_not_guess_unknown_cache_ownership(self):
        result = self.analyze([abc(0), abc(70), abc(70), abc(9, b=1)])
        for pc in (1, 2):
            row = result["instruction_statuses"][pc]
            self.assertEqual(row["status"], "unsupported")
            self.assertIsNone(row["cache_owner"])
            self.assertIn("unowned_data_marker", row["reason_codes"])
        self.assertFalse(result["control_flow_complete"])
        self.assertEqual(result["dataflow_status"], "blocked")

    def test_jumps_check_instruction_starts_not_just_word_bounds(self):
        valid = self.analyze([jump(0, 3), abx(85), abc(70), abc(9, b=1)],
                             constants=(b"key",))
        self.assertEqual(valid["instruction_statuses"][0]["status"], "supported")
        self.assertFalse(valid["instruction_statuses"][1]["reachable"])
        for target in (-1, 2, 4):
            with self.subTest(target=target):
                result = self.analyze([jump(0, target), abx(85), abc(70), abc(9, b=1)],
                                      constants=(b"key",))
                self.assertEqual(result["instruction_statuses"][0]["status"], "invalid")
                self.assertFalse(result["control_flow_complete"])
                self.assertEqual(result["calls"], [])

    def test_conditional_and_skip_edges_cannot_enter_auxiliary_words(self):
        result = self.analyze([abc(13, b=0, c=1), abx(85), abc(70), abc(9, b=1)],
                              constants=(b"key",))
        self.assertEqual(result["instruction_statuses"][0]["status"], "invalid")
        result = self.analyze([abc(4), abx(85), abc(70), abc(9, b=1)],
                              constants=(b"key",))
        self.assertEqual(result["instruction_statuses"][0]["status"], "unsupported")

    def test_unverified_forms_remain_unsupported(self):
        for word in (abc(7, a=1), abc(13), abc(13, b=2),
                     abc(2, b=1, c=1), abc(2, b=2, c=3), abc(9, b=3),
                     abx(28, a=1, bx=65535)):
            with self.subTest(word=word):
                result = self.analyze([word, abc(9, b=1)])
                self.assertEqual(result["instruction_statuses"][0]["status"], "unsupported")
        result = self.analyze([abc(2, b=255, c=255), abc(9, b=1)])
        self.assertEqual([(r["field"], r["index"]) for r in result["references"] if r["pc"] == 0],
                         [("a", 0)])

    def test_overwritten_or_call_result_register_is_not_old_constant(self):
        result = self.analyze(self.simple_call([abc(13, a=1, b=1)]),
                              constants=(b"f", b"stale"))
        value = result["calls"][0]["arguments"][0]["value"]
        self.assertEqual(value["kind"], "boolean")
        self.assertNotIn("constant_index", value)
        # The nested call destroys its callee/argument slots, not the outer callee.
        words = [abx(85), abc(70), abx(85, a=1), abc(70),
                 abx(25, a=2, bx=1), abc(2, a=1, b=2, c=2),
                 abc(2, b=2, c=1), abc(9, b=1)]
        result = self.analyze(words, constants=(b"f", b"not_a_return_value"))
        self.assertEqual(result["calls"][-1]["arguments"][0]["value"]["kind"], "unknown")
        self.assertEqual(result["calls"][-1]["callee"]["kind"], "lookup")
        result = self.analyze(self.simple_call([abc(67, a=1, b=4), abc(70), abc(70)]),
                              constants=(b"f", b"stale"))
        self.assertEqual(result["dataflow_status"], "complete")
        self.assertEqual(result["calls"][0]["arguments"][0]["value"]["kind"], "unknown")

    def test_literal_callee_and_overwritten_lookup_never_become_named_target(self):
        result = self.analyze(self.simple_call([abx(25, bx=1)]),
                              constants=(b"f", b"localization.display"))
        self.assertEqual(result["calls"][0]["callee"]["kind"], "unknown")
        self.assertIsNone(result["calls"][0]["localization_key"])

    def test_reference_only_instructions_do_not_claim_complete_reference_support(self):
        for word in (abc(46, c=2), abc(15, b=0, c=257), abc(68, b=0, c=257)):
            with self.subTest(word=word):
                row = self.analyze([word], constants=(b"field", False))["instruction_statuses"][0]
                self.assertEqual(row["status"], "unsupported")
                self.assertEqual(row["reference_support"], "partial")
                refs = self.analyze([word], constants=(b"field", False))["references"]
                self.assertEqual(refs[0]["access"], "bounds")

    def test_unsupported_or_invalid_path_blocks_all_confirmed_values(self):
        for middle in ([127 << 25], [abc(7)], [abx(25, a=255)],
                       [abc(46, c=2)], [abc(15, b=0, c=257)]):
            with self.subTest(middle=middle):
                result = self.analyze(self.simple_call(middle), constants=(b"f", b"text"))
                call = result["calls"][-1]
                self.assertEqual(call["dataflow_status"], "blocked")
                self.assertEqual(call["callee"]["kind"], "unknown")
                self.assertTrue(all(a["value"]["kind"] == "unknown"
                                    for a in call["arguments"]))

    def branch_call(self, right_constant):
        # Both EQ successors remain possible; no condition evaluation is assumed.
        return [abx(85), abc(70), abc(4, b=2, c=3), jump(3, 6),
                abx(25, a=1, bx=1), jump(5, 7),
                abx(25, a=1, bx=right_constant), abc(2, b=2, c=1), abc(9, b=1)]

    def test_branch_joins_drop_conflicts_but_keep_identical_values_with_origins(self):
        conflict = self.analyze(self.branch_call(2), constants=(b"f", b"left", b"right"))
        self.assertEqual(conflict["calls"][0]["arguments"][0]["value"]["kind"], "unknown")
        identical = self.analyze(self.branch_call(1), constants=(b"f", b"same"))
        value = identical["calls"][0]["arguments"][0]["value"]
        self.assertEqual(value["constant_index"], 1)
        self.assertEqual(value["source_pcs"], [4, 6])
        self.assertEqual(identical["dataflow_status"], "complete")

    def test_missing_predecessor_value_and_loop_entry_are_unknown(self):
        words = self.branch_call(1)
        words[4] = jump(4, 7)
        result = self.analyze(words, constants=(b"f", b"x"))
        self.assertEqual(result["calls"][0]["arguments"][0]["value"]["kind"], "unknown")
        loop = [abx(85), abc(70), abc(2, b=2, c=1),
                abx(25, a=1, bx=1), jump(4, 2)]
        result = self.analyze(loop, constants=(b"f", b"later"))
        self.assertEqual(result["calls"][0]["arguments"][0]["value"]["kind"], "unknown")

    def test_unknown_in_known_dead_code_does_not_taint_live_path(self):
        result = self.analyze([jump(0, 2), 127 << 25, *self.simple_call()],
                              constants=(b"f", b"x"))
        self.assertFalse(result["instruction_statuses"][1]["reachable"])
        self.assertEqual(result["dataflow_status"], "complete")
        self.assertEqual(result["calls"][0]["arguments"][0]["value"]["constant_index"], 1)

    def test_closure_global_binding_requires_validated_register_flow(self):
        words = [abx(60), abx(27), abc(9, b=1)]
        result = self.analyze(words, constants=(b"callback",), children=(function(),))
        binding = result["closure_bindings"][0]
        self.assertEqual(binding["child_path"], [0])
        self.assertEqual(binding["name_constant_index"], 0)
        self.assertEqual(binding["closure_source_pcs"], [0])
        result = self.analyze([abx(60), abx(25), abx(27), abc(9, b=1)],
                              constants=(b"callback",), children=(function(),))
        self.assertEqual(result["closure_bindings"], [])
        result = self.analyze([abx(60), abx(27, a=1), abc(9, b=1)],
                              constants=(b"callback",), children=(function(),))
        self.assertEqual(result["closure_bindings"], [])
        words = self.branch_call(1)
        words[4], words[6], words[7] = abx(60, a=1), abx(60, a=1, bx=1), abx(27, a=1)
        result = self.analyze(words, constants=(b"callback",),
                              children=(function(), function()))
        self.assertEqual(result["closure_bindings"], [])

    def test_open_arity_has_no_invented_arguments_or_nested_return_value(self):
        words = [abx(85), abc(70), abx(25, a=1, bx=1),
                 abc(2, b=2, c=0), abc(2, b=0, c=1), abc(9, b=1)]
        result = self.analyze(words, constants=(b"f", b"x"))
        self.assertEqual(result["calls"][1]["arguments_status"], "open_unknown")
        self.assertIsNone(result["calls"][1]["arguments"])
        self.assertEqual(result["calls"][1]["callee"]["kind"], "unknown")
        self.assertEqual(result["calls"][0]["results_status"], "open_unknown")

    def test_dataflow_work_limit_is_explicit_and_cannot_leave_partial_evidence(self):
        with patch("lua_bytecode_reader.MAX_DATAFLOW_STEPS", 1):
            result = self.analyze(self.simple_call(), constants=(b"f", b"x"))
        self.assertEqual(result["dataflow_status"], "blocked")
        self.assertIn("dataflow_work_limit", result["reason_codes"])
        self.assertEqual(result["calls"][0]["callee"]["kind"], "unknown")

    def test_every_declared_rule_has_a_literal_pinned_real_word(self):
        from lua_bytecode_reader import _INSTRUCTION_RULES

        body = PROBE.samples()[0][2]
        self.assertEqual(hashlib.sha256(body).hexdigest(), PROBE.EXPECTED_HASHES[0])
        parsed = parse_payload(body)
        by_path = {tuple(fn["path"]): fn for fn in parsed["functions"]}
        examples = [
            ((), 0, 0xaa000000, "supported"), ((), 1, 0x8c000114, "auxiliary"),
            ((), 2, 0x32000301, "supported"), ((), 5, 0x86040702, "supported"),
            ((), 8, 0x04060100, "supported"), ((), 21, 0x5c000200, "unsupported"),
            ((), 22, 0x881f1000, "unsupported"), ((), 23, 0x1e231000, "unsupported"),
            ((), 24, 0x36000e00, "supported"), ((), 32, 0x78000000, "supported"),
            ((), 76, 0x12020000, "supported"), ((0,), 7, 0x08020200, "supported"),
            ((0,), 8, 0x39002300, "supported"), ((0,), 83, 0x1a020003, "supported"),
        ]
        seen = set()
        for path, pc, word, status in examples:
            with self.subTest(path=path, pc=pc):
                fn = by_path[path]
                self.assertEqual(fn["instructions"][pc]["word"], word)
                self.assertEqual(struct.unpack_from(">I", body, fn["instructions"][pc]["offset"])[0],
                                 word)
                self.assertEqual(analyze_function(fn)["instruction_statuses"][pc]["status"], status)
                seen.add(word >> 25)
        self.assertEqual(seen - {70}, set(_INSTRUCTION_RULES))

    def test_pinned_real_byte_forms_references_and_call_observations(self):
        samples = PROBE.samples()
        self.assertEqual(tuple(hashlib.sha256(b).hexdigest() for _, _, b in samples),
                         PROBE.EXPECTED_HASHES)
        script = parse_payload(samples[0][2])
        root, got_dagger = script["functions"][:2]
        result = analyze_function(got_dagger)
        self.assertEqual(result["dataflow_status"], "complete")
        self.assertEqual(result["instruction_statuses"][7]["status"], "supported")
        self.assertEqual(result["instruction_statuses"][8]["status"], "supported")
        self.assertEqual(result["instruction_statuses"][83]["status"], "supported")
        self.assertEqual(got_dagger["instructions"][83]["word"], 0x1a020003)
        calls = {c["pc"]: c for c in result["calls"]}
        self.assertEqual(calls[17]["arguments"][0]["value"]["constant_index"], 12)
        self.assertEqual(calls[18]["arguments_status"], "open_unknown")
        self.assertEqual(calls[43]["callee"]["constant_indexes"], [5, 20])
        self.assertEqual(calls[43]["arguments"][0]["value"]["kind"], "unknown")
        self.assertEqual(calls[43]["arguments"][1]["value"]["constant_index"], 21)
        # Exact real-byte closure/assignment suffix, analyzed as an isolated block.
        suffix = dict(root, instructions=[dict(i, pc=i["pc"] - 32)
                                         for i in root["instructions"][32:]])
        bindings = analyze_function(suffix)["closure_bindings"]
        self.assertEqual(len(bindings), 22)
        self.assertEqual(bindings[10]["child_path"], [10])
        self.assertEqual(bindings[10]["name_constant_index"], 35)
        self.assertEqual(root["instructions"][32]["word"], 0x78000000)
        for sample_index in (1, 2):
            wrapper, predicate = parse_payload(samples[sample_index][2])["functions"]
            self.assertEqual(analyze_function(wrapper)["dataflow_status"], "complete")
            analyzed = analyze_function(predicate)
            self.assertEqual(analyzed["dataflow_status"], "complete")
            self.assertEqual(predicate["instructions"][24]["word"], 0x1a000102)
            self.assertEqual(analyzed["instruction_statuses"][24]["status"], "supported")
            self.assertEqual(analyzed["instruction_statuses"][25]["status"], "supported")
            self.assertEqual(analyzed["instruction_statuses"][26]["status"], "supported")
        # Every supported fixed/open CALL_I count pair has a pinned real example.
        forms = set()
        for _, _, body in samples:
            for fn in parse_payload(body)["functions"]:
                analyzed = analyze_function(fn)
                for ins, status in zip(fn["instructions"], analyzed["instruction_statuses"]):
                    if ins["opcode"] == 2:
                        self.assertEqual(status["status"], "supported")
                        forms.add((ins["b"], ins["c"]))
        self.assertEqual(forms, {(3, 1), (2, 1), (2, 2), (2, 0),
                                 (0, 2), (0, 1), (5, 1), (4, 1)})

    def test_pinned_semantic_counts_are_not_confirmed_localization_links(self):
        results = [analyze_function(fn) for _, _, body in PROBE.samples()
                   for fn in parse_payload(body)["functions"]]
        statuses = Counter(s["status"] for a in results for s in a["instruction_statuses"])
        self.assertEqual(statuses, {"supported": 464, "auxiliary": 220, "unsupported": 3})
        self.assertEqual(sum(a["dataflow_status"] == "complete" for a in results), 26)
        calls = [c for a in results for c in a["calls"]]
        self.assertEqual(len(calls), 99)
        self.assertEqual(sum(c["callee"]["kind"] == "lookup" for c in calls), 94)
        self.assertTrue(all(c["localization_key"] is None for c in calls))
        self.assertTrue(all(c["localization_role"] == "unknown" for c in calls))
        self.assertTrue(all(c["evidence_level"] == "unresolved" for c in calls))
        self.assertEqual(results[0]["dataflow_status"], "blocked")
        self.assertEqual(results[0]["closure_bindings"], [])


if __name__ == "__main__":
    if sys.argv[1:] == ["--pilot-results"]:
        print(pilot_results(), end="")
    else:
        unittest.main()
