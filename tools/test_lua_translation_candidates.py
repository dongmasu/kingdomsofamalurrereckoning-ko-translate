import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from lua_translation_candidates import (
    build_candidates, compare_candidates, load_locale_rows, raw_literal_fallback,
    exception_keys, reference_links, run_candidates, validate_candidate_outputs,
    validate_adjudications, validate_key_review_files, prepare_review_packets,
)


def row(key, text, variant=""):
    return {"ID_Linha": key, "Tipo_Variante": variant, "Texto": text}


def evidence(value, kind="string"):
    return {
        "occurrence_key": "sample|bxml|5", "container_kind": "bxml",
        "container_path": "sample", "payload_path": "payload.bin",
        "payload_sha256": "a" * 64, "payload_bytes": 100, "payload_offset": 5,
        "function": {
            "path": [1], "start": 10, "end": 99, "code_offset": 20,
            "constants": [{"index": 0, "type": kind, "value": value,
                           "data_start": 60, "data_end": 60 + len(str(value)),
                           "start": 55, "end": 70}],
            "analysis": {"references": [
                {"kind": "constant", "index": 0, "pc": 2, "status": "valid"}],
                "calls": []},
        },
    }


def adjudication_candidate(candidate_id="candidate-1", missing=()):
    fingerprints = {
        locale: hashlib.sha256(locale.encode("ascii")).hexdigest()
        for locale in ("en", "ja", "zh", "ko")
    }
    locale_evidence = {}
    for locale in ("en", "ja", "zh", "ko"):
        status = "missing" if locale in missing else "present"
        locale_evidence[locale] = {
            "resource": "affix", "id": "5", "variant": "11",
            "status": status, "text": None if status == "missing" else f"{locale}-text",
            "input_sha256": fingerprints[locale],
        }
    return {
        "candidate_id": candidate_id, "resource": "affix", "id": "5", "variant": "11",
        "evidence_level": "exact_source_literal_candidate",
        "input_fingerprints": fingerprints, "locale_evidence": locale_evidence,
        "available_evidence_refs": [
            "review-packet-0001.jsonl#L1",
            "review-context-inventory.jsonl#L1-L1",
        ],
    }


def adjudication_decision(candidate, **overrides):
    decision = {
        "candidate_id": candidate["candidate_id"], "disposition": "retain",
        "reason": "No supported correction identified in this bounded review.",
        "confidence": 0.7, "proposed_text": None, "review_dimensions": ["meaning"],
        "source_conflicts": [], "evidence_refs": ["review-packet-0001.jsonl#L1"],
        "input_fingerprints": dict(candidate["input_fingerprints"]),
    }
    decision.update(overrides)
    return decision


def packet_key(resource, key, variant="", missing=()):
    fingerprints = {
        locale: hashlib.sha256(locale.encode("ascii")).hexdigest()
        for locale in ("en", "ja", "zh", "ko")
    }
    locales = {}
    for locale in ("en", "ja", "zh", "ko"):
        status = "missing" if locale in missing else "present"
        locales[locale] = {
            "status": status, "text": None if status == "missing" else f"{locale}:{key}",
            "input_sha256": fingerprints[locale],
        }
    return {
        "resource": resource, "id": str(key), "variant": variant,
        "locales": locales, "input_fingerprints": fingerprints,
        "matched_english_variants": [variant], "canonical_references": [],
        "candidate_counts": {"parsed": 1, "raw": 0, "total": 1},
        "evidence_level_counts": {"exact_source_literal_candidate": 1},
        "linkage_uncertainty": {
            "direct_key_mappings": 0, "supported_static_call_site_mappings": 0,
            "localization_role": "unknown",
        },
        "available_evidence_refs": [
            "review-packet-0001.jsonl#L1",
            "review-context-inventory.jsonl#L1-L1",
        ],
    }


class CandidateTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def test_bom_multiline_quotes_and_duplicate_key(self):
        path = self.root / "locale.csv"
        path.write_bytes(b'\xef\xbb\xbfID_Linha;Texto\r\n1;"a;""b""\r\nc"\r\n')
        self.assertEqual(load_locale_rows(path, "default")[("1", "")]["Texto"],
                         'a;"b"\r\nc')
        path.write_bytes(b"ID_Linha;Texto\n1;a\n1;b\n")
        with self.assertRaisesRegex(ValueError, "Duplicate"):
            load_locale_rows(path, "default")

    def test_exact_duplicates_short_strings_and_offsets(self):
        locales = {
            "default": {"en": {("1", ""): row("1", "x"),
                               ("2", ""): row("2", "x")}},
            "base": {"en": {("3", ""): row("3", "x")}},
        }
        rows = build_candidates([evidence("x")], locales)
        self.assertEqual({(r["resource"], r["id"]) for r in rows},
                         {("default", "1"), ("default", "2"), ("base", "3")})
        self.assertTrue(all(r["evidence_level"] == "exact_source_literal_candidate"
                            for r in rows))
        self.assertEqual(rows[0]["constant"]["data_start"], 60)
        self.assertEqual(rows[0]["references"][0]["offset"], 28)
        self.assertEqual(rows, build_candidates([evidence("x")], locales))
        self.assertEqual(build_candidates([evidence("X")], locales), [])

    def test_numeric_coincidence_is_not_direct_mapping(self):
        locales = {"default": {"en": {("23533", ""): row("23533", "23533")}}}
        self.assertEqual(build_candidates([evidence(23533, "integer")], locales), [])

    def test_missing_affix_variants_never_borrow_english(self):
        locales = {"affix": {
            "en": {("5", "FF"): row("5", "x", "FF")},
            "ja": {}, "zh": {("5", "11"): row("5", "zh", "11")},
            "ko": {("5", "11"): row("5", "ko", "11"),
                   ("5", "12"): row("5", "ko12", "12")},
        }}
        rows = compare_candidates(build_candidates([evidence("x")], locales), locales)
        self.assertEqual({r["variant"] for r in rows}, {"FF", "11", "12"})
        variant = next(r for r in rows if r["variant"] == "11")
        self.assertEqual(variant["en_status"], "missing")
        self.assertIsNone(variant["en_text"])
        self.assertEqual(variant["ko_text"], "ko")

    def test_fallback_is_maximal_ascii_and_checks_hash_and_size(self):
        body = b"\x00hello\x00x\x00"
        (self.root / "payload.bin").write_bytes(body)
        occurrence = {"occurrence_key": "one", "payload_path": "payload.bin",
                      "payload_bytes": len(body),
                      "payload_sha256": hashlib.sha256(body).hexdigest()}
        runs = list(raw_literal_fallback(occurrence, self.root))
        self.assertEqual([(r["text"], r["start"], r["end"]) for r in runs],
                         [("hello", 1, 6), ("x", 7, 8)])
        for bad in (dict(occurrence, payload_bytes=1),
                    dict(occurrence, payload_sha256="0" * 64)):
            with self.assertRaisesRegex(ValueError, "mismatch"):
                list(raw_literal_fallback(bad, self.root))

    def test_reference_links_are_key_scoped_not_speaker_assertions(self):
        indexes = {
            "glossary": {("default", "1", ""): ["glossary.tsv#entity=x"],
                         ("affix", "5", "11"): ["glossary.tsv#entity=affix"]},
            "exceptions": {("default", "1"): ["exceptions.md#L3"]},
            "duplicates": {"1": "duplicates.jsonl#L2"},
            "contexts": {"1"},
        }
        links = reference_links({"resource": "default", "id": "1", "variant": ""},
                                indexes)
        self.assertEqual(len(links), 4)
        self.assertFalse(reference_links({"resource": "base", "id": "1", "variant": ""},
                                         indexes))
        self.assertEqual(reference_links({"resource": "affix", "id": "5", "variant": "11"},
                                         indexes), ["glossary.tsv#entity=affix"])
        self.assertFalse(reference_links({"resource": "affix", "id": "5", "variant": "FF"},
                                         indexes))

    def test_exception_resource_shorthand_only_extends_explicit_list(self):
        self.assertEqual(exception_keys("`default:1`, `2`, `3` and `base:9`"),
                         {("default", "1"), ("default", "2"), ("default", "3"),
                          ("base", "9")})
        self.assertEqual(exception_keys("`default:1` versus `2`"),
                         {("default", "1")})

    def test_matching_call_sites_keep_real_pc_offsets_and_unknown_role(self):
        from analyze_lua_corpus import analyze_occurrences
        from test_lua_bytecode_reader import abc, abx, function, payload
        body = payload(function(code=[abx(25, a=1, bx=0), abc(2, b=2, c=1), abc(9, b=1)],
                                constants=(b"hello",)))
        (self.root / "payload.bin").write_bytes(body)
        occurrence = {"occurrence_key": "one", "payload_path": "payload.bin",
                      "payload_bytes": len(body),
                      "payload_sha256": hashlib.sha256(body).hexdigest()}
        _, rows = analyze_occurrences([occurrence], self.root)
        locales = {"default": {"en": {("1", ""): row("1", "hello")}}}
        candidate = build_candidates(rows, locales)[0]
        self.assertEqual(candidate["references"][0]["offset"],
                         rows[0]["function"]["code_offset"])
        self.assertEqual(candidate["calls"][0]["pc"], 1)
        self.assertEqual(candidate["calls"][0]["offset"],
                         rows[0]["function"]["code_offset"] + 4)
        self.assertEqual(candidate["calls"][0]["localization_role"], "unknown")

    def test_candidate_outputs_reject_links(self):
        directory = self.root / "work/zh_cn/audit/lua-corpus-review-20261115"
        directory.mkdir(parents=True)
        target = self.root / "protected"
        target.write_text("data")
        (directory / "candidates.jsonl").symlink_to(target)
        with self.assertRaisesRegex(ValueError, "Unsafe|Protected"):
            validate_candidate_outputs(self.root, self.root / "extraction",
                                       self.root / "snapshot", directory)
        self.assertEqual(target.read_text(), "data")

    def test_snapshot_collision_with_every_candidate_output_rejected_in_both_modes(self):
        from lua_translation_candidates import OUTPUT_NAMES
        from lua_review_inputs import verify_snapshot
        from test_analyze_lua_corpus import CorpusAccountingTests
        fixture = CorpusAccountingTests()
        fixture.setUp()
        self.addCleanup(fixture.doCleanups)
        directory, extraction = fixture.output, fixture.extraction
        snapshot_bytes = fixture.snapshot.read_bytes()
        verify_snapshot(json.loads(snapshot_bytes), fixture.root, extraction)
        for name in OUTPUT_NAMES:
            (directory / name).write_bytes(snapshot_bytes)
        for name in OUTPUT_NAMES:
            snapshot = directory / name
            alias = fixture.root / f"snapshot-alias-{name}"
            alias.symlink_to(snapshot)
            for snapshot_path in (snapshot, alias):
                for check in (False, True):
                    with self.subTest(name=name, alias=snapshot_path == alias, check=check), \
                         patch("lua_review_inputs.verify_snapshot", wraps=verify_snapshot) as verify, \
                         patch("lua_translation_candidates.TASK4_HASHES", {}), \
                         patch("lua_translation_candidates._generate",
                               side_effect=AssertionError("generation reached")):
                        with self.assertRaisesRegex(ValueError, "Protected|snapshot"):
                            run_candidates(fixture.root, extraction, directory, snapshot_path, check)
                        verify.assert_not_called()
                        self.assertEqual(snapshot.read_bytes(), snapshot_bytes)

    def test_custom_extraction_overlap_rejected_in_both_modes(self):
        extraction = self.root / "work/zh_cn/audit/lua-corpus-review-20261115/custom"
        nested = extraction / "nested"
        nested.mkdir(parents=True)
        snapshot = self.root / "snapshot.json"
        snapshot.write_text("{}")
        for output in (extraction, nested):
            for check in (False, True):
                with self.subTest(output=output, check=check), \
                     patch("lua_review_inputs.verify_snapshot") as verify, \
                     patch("lua_translation_candidates.TASK4_HASHES", {}), \
                     patch("lua_translation_candidates._generate",
                           side_effect=AssertionError("generation reached")):
                    with self.assertRaisesRegex(ValueError, "overlaps extraction"):
                        run_candidates(self.root, extraction, output, snapshot, check)
                    verify.assert_not_called()
                    self.assertEqual(snapshot.read_text(), "{}")

    def test_candidate_output_links_to_snapshot_rejected_in_both_modes(self):
        from lua_translation_candidates import OUTPUT_NAMES
        directory = self.root / "work/zh_cn/audit/lua-corpus-review-20261115"
        directory.mkdir(parents=True)
        snapshot = self.root / "snapshot.json"
        snapshot.write_text("{}")
        extraction = self.root / "custom-extraction"
        extraction.mkdir()
        for name in OUTPUT_NAMES:
            target = directory / name
            for kind in ("symlink", "hardlink"):
                if kind == "symlink":
                    target.symlink_to(snapshot)
                else:
                    target.hardlink_to(snapshot)
                for check in (False, True):
                    with self.subTest(name=name, kind=kind, check=check), \
                         patch("lua_review_inputs.verify_snapshot") as verify:
                        with self.assertRaisesRegex(ValueError, "Unsafe|Protected"):
                            run_candidates(self.root, extraction, directory, snapshot, check)
                        verify.assert_not_called()
                        self.assertEqual(snapshot.read_text(), "{}")
                target.unlink()

    def test_end_to_end_check_detects_tampering_and_preserves_task4(self):
        from analyze_lua_corpus import OUTPUT_NAMES as task4_names, run
        from lua_review_inputs import snapshot_inputs
        from test_analyze_lua_corpus import CorpusAccountingTests
        from test_lua_bytecode_reader import function, payload

        fixture = CorpusAccountingTests()
        fixture.setUp()
        self.addCleanup(fixture.doCleanups)
        for resource in ("affix", "base", "default"):
            for directory, locale in (("src/csv/en_us", "en_us"),
                                      ("src/csv/ja_jp", "ja_jp"),
                                      ("src/csv/zh_cn", "zh_cn"),
                                      ("work/zh_cn", "zh_cn")):
                header = "ID_Linha;Tipo_Variante;Texto\n" if resource == "affix" else "ID_Linha;Texto\n"
                content = "1;FF;child\n" if resource == "affix" else "1;child\n"
                fixture.put(f"{directory}/locatexts_{locale}.koalocatext_{resource}.csv",
                            (header + content).encode())
        ref = "work/zh_cn/translation-reference"
        fixture.put(f"{ref}/glossary/proper-name-occurrences.tsv",
                    b"resource\tID_Linha\tTipo_Variante\tentity_key\n")
        fixture.put(f"{ref}/exceptions/translation-exceptions.md", b"# no decisions\n")
        fixture.put(f"{ref}/duplicates/exact-english-default-groups.jsonl", b'{"_meta":{}}\n')
        fixture.put(f"{ref}/classification/dialogue-context-id-catalog.tsv",
                    b"resource\tid\ndefault\t1\n")
        fixture.put(f"{ref}/classification/lua-script-localization-literal-index.tsv",
                    b"batch\tscript_payload_offset\n")
        from lua_translation_candidates import CREDITS
        report = "".join(f"| `{key}` | `child` | `child` | `child` |\n" for key in CREDITS)
        fixture.put("work/zh_cn/audit/lua-script-extraction-and-reencoding-20261115.md",
                    report.encode())
        fixture.add_row("e", payload(function(vararg=7, constants=(b"child",))))
        fixture.write_manifest()
        fixture.snapshot.write_text(json.dumps(snapshot_inputs(fixture.root, fixture.extraction)))
        run(fixture.root, fixture.extraction, fixture.output, fixture.snapshot)
        before = {name: (fixture.output / name).read_bytes() for name in task4_names}
        hashes = {name: hashlib.sha256(data).hexdigest() for name, data in before.items()}
        with patch("lua_translation_candidates.TASK4_HASHES", hashes), \
             patch("lua_translation_candidates.validate_candidate_outputs",
                   wraps=validate_candidate_outputs) as validate:
            summary = run_candidates(fixture.root, fixture.extraction, fixture.output,
                                     fixture.snapshot)
            self.assertEqual(validate.call_count, 2)
            self.assertTrue(all(call.args[1] == fixture.extraction.resolve()
                                for call in validate.call_args_list))
            self.assertGreater(summary["counts"]["candidates"], 0)
            self.assertGreater(summary["counts"]["candidate_default_unsupported_maximal_printable_ascii_run"], 0)
            self.assertEqual(summary["counts"]["fallback_ascii_runs"],
                             summary["counts"]["fallback_matched_ascii_runs"] +
                             summary["counts"]["fallback_unmatched_ascii_runs"])
            self.assertEqual(summary["evidence_levels"]["unmapped_or_unresolved"]
                             ["call_observations"],
                             summary["counts"]["unresolved_call_observations"])
            validate.reset_mock()
            run_candidates(fixture.root, fixture.extraction, fixture.output, fixture.snapshot, True)
            self.assertEqual(validate.call_count, 1)
            self.assertEqual(validate.call_args.args[1], fixture.extraction.resolve())
            target = fixture.output / "candidates.jsonl"
            target.write_bytes(target.read_bytes() + b"x")
            with self.assertRaisesRegex(ValueError, "differs"):
                run_candidates(fixture.root, fixture.extraction, fixture.output, fixture.snapshot, True)
        self.assertEqual(before, {name: (fixture.output / name).read_bytes()
                                  for name in task4_names})

    def test_adjudications_require_exact_ids_and_current_fingerprints(self):
        candidate = adjudication_candidate()
        valid = adjudication_decision(candidate)
        with self.assertRaisesRegex(ValueError, "missing"):
            validate_adjudications([candidate], [])
        with self.assertRaisesRegex(ValueError, "duplicate"):
            validate_adjudications([candidate], [valid, valid])
        with self.assertRaisesRegex(ValueError, "extra"):
            validate_adjudications([], [valid])
        with self.assertRaisesRegex(ValueError, "disposition"):
            validate_adjudications([candidate], [adjudication_decision(
                candidate, disposition="keep")])
        stale = dict(valid, input_fingerprints=dict(valid["input_fingerprints"], en="0" * 64))
        with self.assertRaisesRegex(ValueError, "fingerprint"):
            validate_adjudications([candidate], [stale])

    def test_missing_decisions_fail_completion_before_enrichment(self):
        with self.assertRaisesRegex(ValueError, "missing"):
            validate_adjudications([{"candidate_id": "example"}], [])

    def test_adjudication_proposal_rejects_missing_or_wrong_key_evidence(self):
        candidate = adjudication_candidate()
        proposal = adjudication_decision(
            candidate, disposition="proposed correction", proposed_text="New text",
            reason="Specific four-language meaning rationale.")
        validate_adjudications([candidate], [proposal])
        for locale in ("en", "ja", "zh", "ko"):
            for bad_field, bad_value in (("variant", "FF"), ("id", "6"),
                                         ("resource", "base"),
                                         ("input_sha256", "0" * 64)):
                bad = json.loads(json.dumps(candidate))
                bad["locale_evidence"][locale][bad_field] = bad_value
                with self.subTest(locale=locale, field=bad_field):
                    with self.assertRaises(ValueError):
                        validate_adjudications([bad], [proposal])
            bad = json.loads(json.dumps(candidate))
            del bad["locale_evidence"][locale]
            with self.subTest(locale=locale), self.assertRaisesRegex(
                    ValueError, "four-language"):
                validate_adjudications([bad], [proposal])

    def test_adjudication_all_variant_evidence_is_required_for_candidate(self):
        candidate = adjudication_candidate()
        packets = [packet_key("affix", 5, "11"), packet_key("affix", 5, "FF")]
        for packet in packets:
            packet["matched_english_variants"] = ["11"]
        packets[0]["available_evidence_refs"] = ["review-packet-0001.jsonl#L1"]
        packets[1]["available_evidence_refs"] = ["review-packet-0002.jsonl#L1"]
        candidate.pop("locale_evidence")
        candidate["comparisons"] = packets
        valid = adjudication_decision(candidate)
        valid["evidence_refs"] = ["review-packet-0002.jsonl#L1"]
        validate_adjudications([candidate], [valid])
        for evidence_ref in ("review-packet-0003.jsonl#L999999",
                             "review-packet-0004.jsonl#L1"):
            with self.subTest(evidence_ref=evidence_ref), self.assertRaisesRegex(
                    ValueError, "unavailable or not linked"):
                validate_adjudications(
                    [candidate], [dict(valid, evidence_refs=[evidence_ref])])
        packets[1]["locales"]["en"].update(status="missing", text=None)
        with self.assertRaisesRegex(ValueError, "missing locale"):
            validate_adjudications([candidate], [valid])
        validate_adjudications(
            [candidate], [dict(valid, disposition="unresolved")])
        candidate["comparisons"] = [packets[1]]
        with self.assertRaisesRegex(ValueError, "matched variant"):
            validate_adjudications(
                [candidate], [dict(valid, disposition="unresolved")])

    def test_adjudication_malformed_fields_and_undeclared_evidence_promotion_fail(self):
        candidate = adjudication_candidate()
        for field, value in (
                ("disposition", []), ("disposition", None),
                ("confidence", True), ("confidence", float("nan")),
                ("confidence", -0.1), ("confidence", 1.1),
                ("reason", " "), ("review_dimensions", ["invented"]),
                ("source_conflicts", "not a list"), ("proposed_text", "non-proposal"),
                ("evidence_level", "direct_key_mapping")):
            with self.subTest(field=field, value=value), self.assertRaises(ValueError):
                validate_adjudications(
                    [candidate], [adjudication_decision(candidate, **{field: value})])

    def test_proposed_adjudication_requires_same_key_four_language_evidence(self):
        candidate = adjudication_candidate(missing=("ja",))
        proposal = adjudication_decision(
            candidate, disposition="proposed correction", proposed_text="수정문",
            reason="The current Korean omits the meaning supported by the four-language row.",
        )
        with self.assertRaisesRegex(ValueError, "missing locale"):
            validate_adjudications([candidate], [proposal])
        candidate = adjudication_candidate()
        proposal = adjudication_decision(
            candidate, disposition="proposed correction", proposed_text="수정문")
        with self.assertRaisesRegex(ValueError, "rationale"):
            validate_adjudications([candidate], [dict(proposal, reason="")])

    def test_adjudication_requires_evidence_refs_dimensions_and_unresolved_missing_locale(self):
        candidate = adjudication_candidate()
        for field, value in (("evidence_refs", []), ("review_dimensions", [])):
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, field):
                validate_adjudications(
                    [candidate], [adjudication_decision(candidate, **{field: value})])
        candidate = adjudication_candidate(missing=("ko",))
        retain = adjudication_decision(candidate)
        with self.assertRaisesRegex(ValueError, "missing locale"):
            validate_adjudications([candidate], [retain])
        unresolved = dict(retain, disposition="unresolved")
        validate_adjudications([candidate], [unresolved])

    def test_key_review_helper_checks_packet_coverage_fingerprints_and_evidence(self):
        packet_dir = self.root / "packets"
        packet_dir.mkdir()
        packet = packet_dir / "review-packet-0001.jsonl"
        packet.write_text(json.dumps(packet_key("affix", 5, "11")) + "\n")
        review = self.root / "review.jsonl"
        row = {
            "resource": "affix", "id": "5", "variant": "11",
            "disposition": "retain", "reason": "No supported correction identified.",
            "review_dimensions": ["meaning"], "source_conflicts": [],
            "confidence": 0.7, "proposed_text": None,
            "input_fingerprints": packet_key("affix", 5, "11")["input_fingerprints"],
            "evidence_refs": ["review-packet-0001.jsonl#L1"],
        }
        review.write_text(json.dumps(row) + "\n")
        result = validate_key_review_files([packet], [review])
        self.assertEqual(result["reviewed_keys"], 1)
        for bad, message in (
            (dict(row, input_fingerprints=dict(row["input_fingerprints"], en="0" * 64)),
             "fingerprint"),
            (dict(row, evidence_refs=[]), "evidence_refs"),
            (dict(row, evidence_refs=["unavailable#L1"]), "unavailable"),
            (dict(row, review_dimensions=[]), "review_dimensions"),
            (dict(row, disposition="keep"), "disposition"),
            (dict(row, source_conflicts=["Unresolved meaning conflict"]), "conflicts"),
            (dict(row, proposed_text="Not a proposal"), "null"),
            (dict(row, confidence=True), "confidence"),
            (dict(row, id="6"), "extra"),
        ):
            review.write_text(json.dumps(bad) + "\n")
            with self.subTest(message=message), self.assertRaisesRegex(ValueError, message):
                validate_key_review_files([packet], [review])
        review.write_text("")
        with self.assertRaisesRegex(ValueError, "missing"):
            validate_key_review_files([packet], [review])
        review.write_text((json.dumps(row) + "\n") * 2)
        with self.assertRaisesRegex(ValueError, "duplicate"):
            validate_key_review_files([packet], [review])
        review.write_text(json.dumps(row) + "\n")
        with self.assertRaisesRegex(ValueError, "duplicate packet"):
            validate_key_review_files([packet, packet], [review])
        missing_locale = packet_key("affix", 5, "11", missing=("ko",))
        packet.write_text(json.dumps(missing_locale) + "\n")
        review.write_text(json.dumps(row) + "\n")
        with self.assertRaisesRegex(ValueError, "missing locale"):
            validate_key_review_files([packet], [review])
        row["disposition"] = "unresolved"
        review.write_text(json.dumps(row) + "\n")
        self.assertEqual(validate_key_review_files([packet], [review])["reviewed_keys"], 1)

    def test_review_packet_generation_is_sorted_bounded_and_preserves_affix_mapping(self):
        from lua_translation_candidates import (
            REVIEW_PACKET_SIZE, TASK5_OUTPUT_HASHES, prepare_review_packets,
        )
        audit = self.root / "work/zh_cn/audit/lua-corpus-review-20261115"
        audit.mkdir(parents=True)
        snapshot_path = audit / "input-snapshot.json"
        snapshot_path.write_text("{}")
        candidate_rows = [
            {
                "candidate_id": "candidate-affix", "resource": "affix", "id": "10",
                "variant": "FF", "extraction_method": "parsed_string_constant",
                "evidence_level": "exact_source_literal_candidate",
                "usage_limit": "Exact constant does not prove display.",
                "occurrence": {"occurrence_key": "payload-a", "container_kind": "batch_bxml",
                               "container_path": "a.batch", "payload_offset": 12,
                               "payload_sha256": "a" * 64, "payload_bytes": 100},
                "prototype_path": [0], "function_range": [4, 20],
                "constant": {"index": 1, "start": 30, "end": 40, "data_start": 34,
                             "data_end": 38},
                "references": [{"pc": 2, "offset": 16, "localization_role": "unknown"}],
                "calls": [{"pc": 3, "offset": 20, "localization_role": "unknown"}],
            },
            {
                "candidate_id": "candidate-raw", "resource": "affix", "id": "10",
                "variant": "11", "extraction_method": "unsupported_maximal_printable_ascii_run",
                "evidence_level": "exact_source_literal_candidate",
                "usage_limit": "Raw bytes are not proven to be a string or displayed.",
                "occurrence": {"occurrence_key": "payload-b", "container_kind": "batch",
                               "container_path": "b.batch", "payload_offset": 24,
                               "payload_sha256": "b" * 64, "payload_bytes": 200},
                "prototype_path": None, "function_range": None,
                "constant": {"start": 44, "end": 54}, "references": [], "calls": [],
            },
            {
                "candidate_id": "candidate-base", "resource": "base", "id": "2",
                "variant": "", "extraction_method": "parsed_string_constant",
                "evidence_level": "exact_source_literal_candidate",
                "usage_limit": "Exact constant does not prove display.",
                "occurrence": {"occurrence_key": "payload-c", "container_kind": "bxml",
                               "container_path": "c.bxml", "payload_offset": 8,
                               "payload_sha256": "c" * 64, "payload_bytes": 80},
                "prototype_path": [0], "function_range": [1, 8],
                "constant": {"index": 0, "start": 2, "end": 8, "data_start": 4,
                             "data_end": 7},
                "references": [], "calls": [],
            },
        ]
        candidate_path = audit / "candidates.jsonl"
        candidate_path.write_text("".join(json.dumps(row) + "\n" for row in candidate_rows))
        fields = ["candidate_id", "evidence_level", "resource", "id", "variant",
                  "matched_english_variant"]
        for language in ("en", "ja", "zh", "ko"):
            fields += [f"{language}_status", f"{language}_text",
                       f"{language}_input_sha256"]
        fields += ["canonical_references"]
        fingerprints_by_resource = {}
        input_fingerprints = {}
        for resource in ("affix", "base"):
            fingerprints_by_resource[resource] = {}
            for locale, directory, prefix in (
                    ("en", "src/csv/en_us", "en_us"),
                    ("ja", "src/csv/ja_jp", "ja_jp"),
                    ("zh", "src/csv/zh_cn", "zh_cn"),
                    ("ko", "work/zh_cn", "zh_cn")):
                relative = (Path(directory) /
                            f"locatexts_{prefix}.koalocatext_{resource}.csv")
                path = self.root / relative
                path.parent.mkdir(parents=True, exist_ok=True)
                content = f"{locale}:{resource}".encode("ascii")
                path.write_bytes(content)
                digest = hashlib.sha256(content).hexdigest()
                fingerprints_by_resource[resource][locale] = digest
                input_fingerprints[str(relative)] = {"sha256": digest, "size": len(content)}
        comparisons = []
        for candidate, variants in ((candidate_rows[0], ("11", "FF")),
                                     (candidate_rows[1], ("11", "FF")),
                                     (candidate_rows[2], ("",))):
            for variant in variants:
                row = {
                    "candidate_id": candidate["candidate_id"],
                    "evidence_level": candidate["evidence_level"],
                    "resource": candidate["resource"], "id": candidate["id"],
                    "variant": variant, "matched_english_variant": candidate["variant"],
                    "canonical_references": json.dumps(["exceptions.md#L1"]),
                }
                for locale in ("en", "ja", "zh", "ko"):
                    row[f"{locale}_status"] = "missing" if locale == "ja" and variant == "11" else "present"
                    row[f"{locale}_text"] = (
                        "" if row[f"{locale}_status"] == "missing" else
                        "한국어" if locale == "ko" else f"{locale}-{variant}")
                    row[f"{locale}_input_sha256"] = fingerprints_by_resource[
                        candidate["resource"]][locale]
                comparisons.append(row)
        comparison_path = audit / "four-language-comparisons.tsv"
        import csv
        with comparison_path.open("w", newline="") as stream:
            writer = csv.DictWriter(stream, fieldnames=fields, delimiter="\t",
                                    lineterminator="\n")
            writer.writeheader()
            writer.writerows(comparisons)
        summary = {
            "input_fingerprints": input_fingerprints,
            "snapshot_sha256": hashlib.sha256(snapshot_path.read_bytes()).hexdigest(),
        }
        summary_path = audit / "candidate-summary.json"
        summary_path.write_text(json.dumps(summary))
        frozen_hashes = {
            name: hashlib.sha256((audit / name).read_bytes()).hexdigest()
            for name in ("candidates.jsonl", "four-language-comparisons.tsv",
                         "candidate-summary.json")
        }
        with patch("lua_translation_candidates.TASK5_OUTPUT_HASHES", frozen_hashes), \
             patch("lua_translation_candidates.EXPECTED_TASK5_CANDIDATES", 3), \
             patch("lua_translation_candidates.EXPECTED_REVIEW_KEYS", 3), \
             patch("lua_translation_candidates.EXPECTED_COMPARISON_ROWS", 5):
            summary = prepare_review_packets(self.root, audit, packet_size=2)
            outputs = [audit / name for name in
                       (*summary["output_sha256"], "review-packet-summary.json")]
            original = {path: (path.read_bytes(), path.stat().st_mtime_ns)
                        for path in outputs}
            self.assertEqual(summary, prepare_review_packets(self.root, audit, packet_size=2))
            self.assertEqual(original, {
                path: (path.read_bytes(), path.stat().st_mtime_ns) for path in outputs})
            for invalid_size in (0, 51, True):
                with self.subTest(packet_size=invalid_size), self.assertRaisesRegex(
                        ValueError, "packet_size"):
                    prepare_review_packets(self.root, audit, packet_size=invalid_size)
            target = audit / "review-packet-summary.json"
            target.write_bytes(b"do not replace")
            with self.assertRaisesRegex(ValueError, "Refusing to replace"):
                prepare_review_packets(self.root, audit, packet_size=2)
            self.assertEqual(target.read_bytes(), b"do not replace")
            self.assertTrue(all(path.read_bytes() == data for path, (data, _) in
                                original.items() if path != target))
            self.assertTrue(all(hashlib.sha256((audit / name).read_bytes()).hexdigest()
                                == digest for name, digest in frozen_hashes.items()))
        self.assertEqual(REVIEW_PACKET_SIZE, 50)
        self.assertEqual(summary["packet_count"], 2)
        self.assertEqual(summary["unique_keys"], 3)
        self.assertEqual(summary["candidate_ids"], 3)
        packet_files = sorted(audit.glob("review-packet-*.jsonl"))
        packet_rows = [json.loads(line) for path in packet_files
                       for line in path.read_text().splitlines()]
        self.assertEqual([(r["resource"], r["id"], r["variant"]) for r in packet_rows],
                         [("affix", "10", "11"), ("affix", "10", "FF"),
                          ("base", "2", "")])
        self.assertTrue(all("candidate_id" not in row for row in packet_rows))
        self.assertTrue(all("input_fingerprints" in row for row in packet_rows))
        self.assertIn("한국어", (audit / "review-packet-0001.jsonl").read_text())
        self.assertEqual(packet_rows[0]["candidate_counts"], {"parsed": 1, "raw": 1, "total": 2})
        self.assertIn("Raw bytes are not proven", packet_rows[0]["linkage_uncertainty"]["warning"])
        mappings = [json.loads(line) for line in
                    (audit / "candidate-id-mapping.jsonl").read_text().splitlines()]
        affix_mapping = [row for row in mappings if row["candidate_id"] == "candidate-affix"]
        self.assertEqual({row["variant"] for row in affix_mapping}, {"11", "FF"})
        self.assertTrue(all(row["candidate_variant"] == "FF" for row in affix_mapping))
        self.assertEqual(len((audit / "review-context-inventory.jsonl")
                             .read_text().splitlines()), 5)

    def test_review_packet_output_rejects_symlinked_audit_directory_or_ancestor(self):
        outside = self.root / "outside"
        outside.mkdir()
        audit_parent = self.root / "work/zh_cn/audit"
        audit_parent.mkdir(parents=True)
        dated = audit_parent / "lua-corpus-review-20261115"
        dated.symlink_to(outside, target_is_directory=True)
        with self.assertRaisesRegex(ValueError, "(?i)symlink"):
            prepare_review_packets(self.root, dated)
        self.assertEqual(list(outside.iterdir()), [])
        dated.unlink()
        audit_parent.rmdir()
        audit_parent.symlink_to(outside, target_is_directory=True)
        with self.assertRaisesRegex(ValueError, "(?i)symlink"):
            prepare_review_packets(
                self.root, self.root / "work/zh_cn/audit/lua-corpus-review-20261115")
        self.assertEqual(list(outside.iterdir()), [])


if __name__ == "__main__":
    unittest.main()
