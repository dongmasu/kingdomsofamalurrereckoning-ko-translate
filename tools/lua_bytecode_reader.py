#!/usr/bin/env python3
"""Read-only Lua-family structural reader and conservative instruction analysis."""

import hashlib
import struct
from collections import deque

from lua_resource_codec import LUA_HEADER, TYPE_TABLE_BYTES, validate_lua_type_table


MAX_PAYLOAD_BYTES = 8 * 1024 * 1024
MAX_DEPTH = 64
MAX_FUNCTIONS = 10000
MAX_ITEMS = 300000
TRAILER = bytes.fromhex("0000000100000000")


class ParseError(ValueError):
    def __init__(self, code: str, offset: int, detail: str):
        self.code = code
        self.offset = offset
        self.detail = detail
        super().__init__(f"{code} at {offset}: {detail}")


def decode_fields(word: int) -> tuple[int, int, int, int, int]:
    return (word >> 25, word & 255, (word >> 17) & 255,
            (word >> 8) & 511, (word >> 8) & 131071)


class _Reader:
    def __init__(self, payload):
        self.data = payload
        self.pos = TYPE_TABLE_BYTES
        self.functions = []
        self.opaque = []
        self.items = 0

    def fail(self, code, detail, offset=None):
        raise ParseError(code, self.pos if offset is None else offset, detail)

    def take(self, size):
        start = self.pos
        if size < 0 or size > len(self.data) - start:
            self.fail("malformed_truncated", f"need {size} bytes", start)
        self.pos += size
        return self.data[start:self.pos]

    def uint(self):
        return struct.unpack(">I", self.take(4))[0]

    def count(self, minimum, label):
        offset = self.pos
        count = self.uint()
        if count > (len(self.data) - self.pos) // minimum:
            self.fail("malformed_count", f"{label} count {count} exceeds remaining bytes", offset)
        if count > MAX_ITEMS - self.items:
            self.fail("unsupported_work_limit", f"{label} count exceeds work limit", offset)
        self.items += count
        return count

    def opaque_region(self, kind, start, end):
        region = {"kind": kind, "start": start, "end": end,
                  "raw_hex": self.data[start:end].hex()}
        self.opaque.append(region)
        return region

    def constant(self, index):
        start = self.pos
        tag = self.take(1)[0]
        entry = {"index": index, "tag": tag, "start": start}
        if tag == 0:
            entry.update(type="nil", value=None)
        elif tag == 1:
            offset = self.pos
            value = self.take(1)[0]
            if value not in (0, 1):
                self.fail("malformed_boolean", f"invalid boolean {value}", offset)
            entry.update(type="boolean", value=bool(value))
        elif tag == 3:
            entry.update(type="integer", value=struct.unpack(">i", self.take(4))[0])
        elif tag == 4:
            size = self.count(1, "string byte")
            data_start = self.pos
            raw = self.take(size)
            if not raw or raw[-1] != 0:
                self.fail("malformed_string", "string lacks NUL terminator", data_start)
            raw = raw[:-1]
            try:
                text = raw.decode("utf-8")
            except UnicodeDecodeError:
                text = None
            entry.update(type="string", value=text, bytes_hex=raw.hex(),
                         data_start=data_start, data_end=data_start + len(raw))
        else:
            self.fail("unsupported_constant_tag", f"constant tag {tag}", start)
        entry["end"] = self.pos
        entry["raw_hex"] = self.data[start:self.pos].hex()
        return entry

    def function(self, path):
        if len(path) > MAX_DEPTH:
            self.fail("unsupported_depth_limit", f"depth exceeds {MAX_DEPTH}")
        if len(self.functions) >= MAX_FUNCTIONS:
            self.fail("unsupported_work_limit", "function count exceeds limit")
        start = self.pos
        prefix = [self.uint() for _ in range(4)]
        if prefix[:2] != [0, 0]:
            self.fail("unsupported_metadata", "nonzero first two prefix words", start)
        self.opaque_region("function_prefix", start, self.pos)
        nups, params = self.uint(), self.uint()
        vararg = self.take(1)[0]
        stack = self.uint()
        if nups != 0:
            self.fail("unsupported_function_header", f"unverified nups={nups}", start + 16)
        if params > stack:
            self.fail("unsupported_function_header",
                      f"params={params} exceeds stack={stack}", start + 20)
        if vararg not in (0, 2):
            self.fail("unsupported_function_header", f"unverified vararg={vararg}", start + 24)
        if stack > 255:
            self.fail("unsupported_function_header", f"unverified stack={stack}", start + 25)
        code_count = self.count(4, "instruction")
        instructions = []
        for pc in range(code_count):
            offset = self.pos
            word = self.uint()
            opcode, a, b, c, bx = decode_fields(word)
            instructions.append({"pc": pc, "offset": offset, "word": word,
                                 "opcode": opcode, "a": a, "b": b, "c": c, "bx": bx,
                                 "semantic_support": "unassessed",
                                 "reference_support": "unassessed"})
        constants = [self.constant(i) for i in range(self.count(1, "constant"))]
        count = self.count(53, "child")
        fn = {"path": path, "start": start, "end": None,
              "metadata": {"prefix_words": prefix, "nups": nups, "params": params,
                           "vararg": vararg, "stack": stack, "suffix_words": None},
              "instructions": instructions, "constants": constants,
              "child_paths": [path + [i] for i in range(count)]}
        self.functions.append(fn)
        for child in fn["child_paths"]:
            self.function(child)
        suffix_start = self.pos
        suffix = [self.uint() for _ in range(3)]
        if suffix != [0, 0, 0]:
            self.fail("unsupported_metadata", "nonzero suffix words", suffix_start)
        self.opaque_region("function_suffix", suffix_start, self.pos)
        fn["metadata"]["suffix_words"] = suffix
        fn["end"] = self.pos


def parse_payload(payload: bytes) -> dict:
    if len(payload) > MAX_PAYLOAD_BYTES:
        raise ParseError("unsupported_work_limit", 0, "payload exceeds size limit")
    if len(payload) < TYPE_TABLE_BYTES:
        raise ParseError("malformed_truncated", len(payload), "incomplete header/type table")
    if payload[:len(LUA_HEADER)] != LUA_HEADER:
        raise ParseError("unsupported_header", 0, "unrecognized Lua-family header")
    try:
        validate_lua_type_table(payload)
    except (ValueError, struct.error) as error:
        raise ParseError("unsupported_type_table", 14, str(error)) from error
    reader = _Reader(payload)
    reader.function([])
    start = reader.pos
    trailer = reader.take(len(TRAILER))
    if trailer != TRAILER:
        reader.fail("unsupported_trailer", f"unrecognized trailer {trailer.hex()}", start)
    reader.opaque_region("trailer", start, reader.pos)
    if reader.pos != len(payload):
        reader.fail("malformed_trailing_bytes", "bytes after recognized trailer")
    return {"payload_sha256": hashlib.sha256(payload).hexdigest(),
            "functions": reader.functions, "opaque_regions": reader.opaque}


# Rules are limited to the pinned FFQ35 report/disassembly. Names are labels,
# not a source of semantics. Table operations have reference-only support.
_INSTRUCTION_RULES = {
    2: {"name": "CALL_I", "registers": (("a", "read"),)},
    4: {"name": "EQ", "registers": (("b", "read"),), "rk": "c"},
    9: {"name": "RETURN", "registers": (("a", "read"),)},
    13: {"name": "LOADBOOL", "registers": (("a", "write"),)},
    15: {"name": "SETFIELD", "registers": (("a", "bounds"),),
         "constants": (("b", "string"),), "reference_only": True},
    25: {"name": "LOADK", "registers": (("a", "write"),),
         "constants": (("bx", None),)},
    27: {"name": "SETGLOBAL", "registers": (("a", "read"),),
         "constants": (("bx", "string"),)},
    28: {"name": "JMP"},
    46: {"name": "NEWTABLE", "registers": (("a", "bounds"),), "reference_only": True},
    60: {"name": "CLOSURE", "registers": (("a", "write"),), "child": "bx"},
    67: {"name": "GETFIELD_R1", "registers": (("a", "write"), ("b", "read")),
         "constants": (("c", "string"),), "cache": 2},
    68: {"name": "SETFIELD_R1", "registers": (("a", "bounds"),),
         "constants": (("b", "string"),), "reference_only": True},
    85: {"name": "GETGLOBAL_MEM", "registers": (("a", "write"),),
         "constants": (("bx", "string"),), "cache": 1},
}
_CALL_FORMS = {(3, 1), (2, 1), (2, 2), (2, 0), (0, 2), (0, 1), (5, 1), (4, 1)}
MAX_DATAFLOW_STEPS = 50000


def _instruction_site(function, instruction, rationale):
    return {"path": list(function["path"]), "pc": instruction["pc"],
            "offset": instruction["offset"], "word": instruction["word"],
            "raw_operands": {key: instruction[key] for key in ("opcode", "a", "b", "c", "bx")},
            "support_rationale": rationale}


def _validate_instructions(function):
    instructions = function["instructions"]
    stack, constants = function["metadata"]["stack"], function["constants"]
    owners, missing = {}, set()
    for ins in instructions:
        count = _INSTRUCTION_RULES.get(ins["opcode"], {}).get("cache", 0)
        for pc in range(ins["pc"] + 1, ins["pc"] + 1 + count):
            if pc >= len(instructions) or instructions[pc]["opcode"] != 70:
                missing.add(ins["pc"])
                break
            owners[pc] = ins["pc"]

    statuses, references, edges = [], [], []
    for ins in instructions:
        pc, op = ins["pc"], ins["opcode"]
        rule = _INSTRUCTION_RULES.get(op)
        rationale = ("FFQ35 pinned " + rule["name"] + " operand/cache rule"
                     if rule else "No pinned instruction rule")
        site = _instruction_site(function, ins, rationale)
        row = dict(site, status="supported", semantic_support="supported",
                   reference_support="validated", reason_codes=[], cache_owner=None,
                   reachable=None)
        statuses.append(row)
        if pc in owners:
            row.update(status="auxiliary", semantic_support="not_executable",
                       reference_support="not_applicable", cache_owner=owners[pc],
                       support_rationale="DATA marker owned by the preceding pinned cache rule")
            continue
        if not rule:
            row.update(status="unsupported", semantic_support="unsupported",
                       reference_support="unsupported",
                       reason_codes=["unowned_data_marker" if op == 70 else "unknown_opcode"])
            continue

        def reference(kind, field, index, access=None, expected_type=None):
            limit = {"register": stack, "constant": len(constants),
                     "prototype": len(function["child_paths"])}[kind]
            valid = 0 <= index < limit
            if valid and expected_type:
                valid = constants[index]["type"] == expected_type
            ref = dict(site, kind=kind, field=field, index=index,
                       status="valid" if valid else "invalid")
            if access:
                ref["access"] = access
            if expected_type:
                ref["expected_type"] = expected_type
            if kind == "prototype":
                ref["child_path"] = list(function["child_paths"][index]) if valid else None
            references.append(ref)
            if not valid:
                row["reason_codes"].append("invalid_" + kind + "_reference")
                row["reference_support"] = "invalid"

        for field, access in rule.get("registers", ()):
            if op == 9 and ins["b"] == 1:
                access = "bounds"
            reference("register", field, ins[field], access=access)
        for field, expected in rule.get("constants", ()):
            reference("constant", field, ins[field], expected_type=expected)
        if rule.get("child"):
            reference("prototype", "bx", ins["bx"])
        if rule.get("rk"):
            field = rule["rk"]
            if ins[field] >= 256:
                reference("constant", field, ins[field] - 256)
            else:
                reference("register", field, ins[field], access="read")
        if op in (15, 68) and ins["c"] >= 256:
            reference("constant", "c", ins["c"] - 256)
        if op == 2 and (ins["b"], ins["c"]) in _CALL_FORMS:
            for index in range(ins["a"] + 1, ins["a"] + ins["b"]):
                reference("register", "arguments", index, access="read")
            if ins["c"] == 2:
                reference("register", "results", ins["a"], access="write")
        if pc in missing:
            row["reason_codes"].append("missing_cache_words")
            row["reference_support"] = "invalid"

        supported_form = True
        if op == 2:
            supported_form = (ins["b"], ins["c"]) in _CALL_FORMS
            if supported_form and (ins["b"] == 0 or ins["c"] == 0):
                row["semantic_support"] = "partial"
        elif op == 4:
            supported_form = (ins["a"] in (0, 1) and pc + 1 < len(instructions)
                              and instructions[pc + 1]["opcode"] == 28)
        elif op == 9:
            supported_form = ins["b"] in (1, 2) and ins["c"] == 0
        elif op == 13:
            supported_form = (ins["b"], ins["c"]) in ((1, 0), (0, 1))
        elif op == 28:
            supported_form = ins["a"] == 0
        if rule.get("reference_only"):
            supported_form = False
            row["reason_codes"].append("unverified_effects_and_control_flow")
        elif not supported_form:
            row["reason_codes"].append("unverified_operand_form")

        if row["reference_support"] == "invalid":
            row.update(status="invalid", semantic_support="unsupported")
        elif not supported_form:
            row.update(status="unsupported", semantic_support="unsupported",
                       reference_support="partial")
        if row["status"] != "supported":
            continue

        next_pc = pc + 1 + rule.get("cache", 0)
        destinations = []
        if op == 28:
            destinations = [(pc + 1 + ins["bx"] - 65535, "jump")]
        elif op == 4:
            destinations = [(pc + 1, "conditional_next"), (pc + 2, "conditional_skip")]
        elif op == 13 and ins["c"] == 1:
            destinations = [(pc + 2, "skip")]
        elif op != 9:
            destinations = [(next_pc, "fallthrough")]
        for target, kind in destinations:
            valid = 0 <= target < len(instructions) and target not in owners
            # An unowned DATA marker is not an executable destination either.
            valid = valid and instructions[target]["opcode"] != 70
            edges.append(dict(site, source_pc=pc, target_pc=target, kind=kind,
                              target_offset=instructions[target]["offset"]
                              if 0 <= target < len(instructions) else None,
                              status="valid" if valid else "invalid"))
            if not valid:
                row.update(status="invalid", semantic_support="unsupported")
                row["reason_codes"].append("invalid_control_flow_target")
    return statuses, references, edges


def _join_registers(left, right):
    # Absence means unknown, including an incoming path with no assignment.
    result = {}
    for register in left.keys() & right.keys():
        a, b = left[register], right[register]
        if a[:2] == b[:2]:
            result[register] = (a[0], a[1], tuple(sorted(set(a[2]) | set(b[2]))))
    return result


def _transfer_registers(instruction, incoming):
    values = dict(incoming)
    op, a, pc = instruction["opcode"], instruction["a"], instruction["pc"]
    if op == 25:
        values[a] = ("constant", instruction["bx"], (pc,))
    elif op == 85:
        values[a] = ("lookup", (instruction["bx"],), (pc,))
    elif op == 67:
        base = incoming.get(instruction["b"])
        values.pop(a, None)
        # Only the pinned global + one field lookup chain is modeled.
        if base and base[0] == "lookup" and len(base[1]) == 1:
            values[a] = ("lookup", base[1] + (instruction["c"],),
                         tuple(sorted(set(base[2]) | {pc})))
    elif op == 13:
        values[a] = ("boolean", bool(instruction["b"]), (pc,))
    elif op == 60:
        values[a] = ("closure", instruction["bx"], (pc,))
    elif op == 2:
        # Do not equate a returned engine value with its constructor argument.
        # Also forget all higher scratch/argument slots, even for fixed results.
        values = {register: value for register, value in values.items() if register < a}
    return values


def _register_value(value, function):
    if value is None:
        return {"kind": "unknown"}
    kind, payload, sources = value
    result = {"kind": kind, "source_pcs": list(sources)}
    if kind == "constant":
        result["constant_index"] = payload
    elif kind == "boolean":
        result["value"] = payload
    elif kind == "lookup":
        result["constant_indexes"] = list(payload)
    elif kind == "closure":
        result["child_path"] = list(function["child_paths"][payload])
    return result


def analyze_function(function: dict) -> dict:
    """Analyze one parse_payload function, without mutation or API-role inference.

    Lookups describe load-site provenance, not runtime callee identity. Unknown
    reachable control flow blocks *all* value evidence: it might bypass a load
    or enter any call directly. References/statuses survive that barrier.
    """
    statuses, references, edges = _validate_instructions(function)
    instructions = function["instructions"]
    successors = [[] for _ in instructions]
    for edge in edges:
        if edge["status"] == "valid" and statuses[edge["source_pc"]]["status"] == "supported":
            successors[edge["source_pc"]].append(edge["target_pc"])
    reachable, pending = set(), [0] if instructions else []
    while pending:
        pc = pending.pop()
        if pc not in reachable:
            reachable.add(pc)
            pending.extend(successors[pc])
    complete = bool(instructions) and all(statuses[pc]["status"] == "supported"
                                          for pc in reachable)
    reasons = []
    if any(s["status"] == "unsupported" for s in statuses):
        reasons.append("unsupported_instructions")
    if any(s["status"] == "invalid" for s in statuses):
        reasons.append("invalid_instructions")
    if not complete:
        reasons.append("incomplete_control_flow")
    for row in statuses:
        row["reachable"] = True if row["pc"] in reachable else (False if complete else None)
        if row["status"] == "auxiliary":
            row["reachable"] = False

    incoming = {0: {}} if complete else {}
    queue = deque([0] if complete else [])
    queued = set(queue)
    steps = 0
    while queue:
        if steps >= MAX_DATAFLOW_STEPS:
            incoming = {}
            reasons.append("dataflow_work_limit")
            break
        pc = queue.popleft()
        queued.remove(pc)
        steps += 1
        outgoing = _transfer_registers(instructions[pc], incoming[pc])
        for target in successors[pc]:
            merged = (_join_registers(incoming[target], outgoing)
                      if target in incoming else dict(outgoing))
            if target not in incoming or merged != incoming[target]:
                incoming[target] = merged
                if target not in queued:
                    queued.add(target)
                    queue.append(target)

    blocked = not complete or "dataflow_work_limit" in reasons
    calls, bindings = [], []
    for ins, row in zip(instructions, statuses):
        if row["status"] != "supported" or row["reachable"] is False:
            continue
        pc, a = ins["pc"], ins["a"]
        registers = {} if blocked else incoming.get(pc, {})
        site = _instruction_site(function, ins, row["support_rationale"])
        if ins["opcode"] == 2:
            callee = registers.get(a)
            if callee and callee[0] not in ("lookup", "closure"):
                callee = None
            arguments = None if ins["b"] == 0 else [
                {"register": register, "value": _register_value(registers.get(register), function)}
                for register in range(a + 1, a + ins["b"])]
            calls.append(dict(site, reachable=row["reachable"],
                              dataflow_status="blocked" if blocked else "available",
                              callee=_register_value(callee, function),
                              arguments=arguments,
                              arguments_status="open_unknown" if ins["b"] == 0 else "fixed",
                              results_status={0: "open_unknown", 1: "none", 2: "unknown"}[ins["c"]],
                              localization_role="unknown", localization_key=None,
                              evidence_level="unresolved"))
        elif ins["opcode"] == 27:
            value = registers.get(a)
            if value and value[0] == "closure":
                bindings.append(dict(site, child_path=list(function["child_paths"][value[1]]),
                                     name_constant_index=ins["bx"],
                                     closure_source_pcs=list(value[2]),
                                     relationship="static_global_assignment"))
    return {"path": list(function["path"]),
            "status": "partial" if reasons else "supported",
            "dataflow_status": "blocked" if blocked else "complete",
            "control_flow_complete": complete, "reason_codes": reasons,
            "instruction_statuses": statuses, "references": references,
            "control_flow_edges": edges, "calls": calls, "closure_bindings": bindings}
