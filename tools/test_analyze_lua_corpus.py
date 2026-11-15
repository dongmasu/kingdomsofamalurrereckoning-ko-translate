import hashlib
import io
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from contextlib import redirect_stdout
from unittest.mock import patch

from analyze_lua_corpus import (
    analyze_occurrences, expand_analysis, main, run, validate_output_dir,
)
from lua_bytecode_reader import ParseError, analyze_function, parse_payload
from lua_review_inputs import snapshot_inputs
from test_lua_bytecode_reader import abc, abx, function, payload


def digest(data):
    return hashlib.sha256(data).hexdigest()


class CorpusAccountingTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.extraction = self.root / "work/zh_cn/audit/lua-script-extracted"
        self.extraction.mkdir(parents=True)
        self.output = self.root / "work/zh_cn/audit/lua-corpus-review-20261115"
        self.output.mkdir()
        for resource in ("affix", "base", "default"):
            for locale in ("en_us", "ja_jp", "zh_cn"):
                self.put(f"src/csv/{locale}/locatexts_{locale}.koalocatext_{resource}.csv", b"csv")
            self.put(f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv", b"work")
        for category in ("classification", "glossary", "exceptions"):
            self.put(f"work/zh_cn/translation-reference/{category}/reference.tsv", b"ref")
        self.put("work/zh_cn/audit/dialogue-context-review-ledger.tsv", b"ledger")
        self.put("tools/lua_resource_codec.py", b"codec")
        self.rows = []
        self.shared = payload(function(code=[127 << 25], constants=(b"\xffabc", 42),
                                       children=(function(constants=(b"child",)),)))
        self.add_row("a", self.shared)
        self.add_row("b", self.shared)
        self.add_row("c", payload(function(vararg=7)))
        self.add_row("d", b"\x1bLua")
        self.write_manifest()
        self.snapshot = self.output / "input-snapshot.json"
        self.snapshot.write_text(json.dumps(snapshot_inputs(self.root, self.extraction)))

    def put(self, relative, data):
        path = self.root / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        return path

    def add_row(self, name, data):
        (self.extraction / f"{name}.bin").write_bytes(data)
        self.rows.append({
            "occurrence_key": f"{name}.quest_bxml|bxml|5",
            "container_kind": "bxml", "container_path": f"{name}.quest_bxml",
            "container_sha256": digest(name.encode()), "container_bytes": len(data) + 5,
            "payload_offset": 5, "payload_length_offset": 1, "asset_id": "",
            "payload_path": f"{name}.bin", "payload_bytes": len(data),
            "payload_sha256": digest(data),
        })

    def write_manifest(self):
        manifest = {
            "schema_version": 2,
            "summary": {"scanned_files": len(self.rows), "containers": len(self.rows),
                        "occurrences": len(self.rows), "signature_count": len(self.rows),
                        "unclassified_signatures": 0, "bxml_payloads": len(self.rows),
                        "batch_script_payloads": 0},
            "container_paths": [row["container_path"] for row in self.rows],
            "unclassified_signatures": [], "occurrences": self.rows,
        }
        (self.extraction / "manifest.json").write_text(json.dumps(manifest))

    def test_occurrences_sorted_cached_and_errors_classified(self):
        with patch("analyze_lua_corpus.parse_payload", wraps=parse_payload) as parser:
            coverage, evidence = analyze_occurrences(list(reversed(self.rows)), self.extraction)
        self.assertEqual(parser.call_count, 3)
        self.assertEqual([row["occurrence_key"] for row in coverage],
                         sorted(row["occurrence_key"] for row in self.rows))
        self.assertEqual([row["status"] for row in coverage],
                         ["parsed", "parsed", "unsupported", "malformed"])
        self.assertEqual([row["instruction_support"] for row in coverage],
                         ["partial", "partial", "unavailable", "unavailable"])
        self.assertEqual([row["diagnostic_code"] for row in coverage[2:]],
                         ["unsupported_function_header", "malformed_truncated"])
        self.assertEqual(coverage[2]["diagnostic_offset"], 262)
        self.assertEqual(coverage[2]["payload_path"], "c.bin")
        self.assertEqual(len(evidence), 4)
        self.assertEqual([row["occurrence_key"] for row in evidence],
                         [self.rows[0]["occurrence_key"]] * 2
                         + [self.rows[1]["occurrence_key"]] * 2)
        self.assertEqual(evidence[0]["container_sha256"], self.rows[0]["container_sha256"])
        self.assertEqual(evidence[0]["payload_offset"], 5)
        self.assertEqual(evidence[0]["function"]["constants"][0]["bytes_hex"], "ff616263")
        self.assertEqual(evidence[0]["function"]["path"], [])
        self.assertEqual(evidence[1]["function"]["path"], [0])

    def test_compact_evidence_reconstructs_exact_analysis_and_offsets(self):
        _, rows = analyze_occurrences(self.rows[:1], self.extraction)
        parsed = parse_payload(self.shared)
        for row, original in zip(rows, parsed["functions"]):
            compact = row["function"]
            self.assertEqual(compact["constants"], original["constants"])
            self.assertEqual(expand_analysis(compact), analyze_function(original))
            self.assertEqual(compact["code_hex"],
                             "".join(f'{ins["word"]:08x}' for ins in original["instructions"]))
            self.assertEqual(compact["code_offset"], original["instructions"][0]["offset"])
        self.assertEqual(expand_analysis(rows[0]["function"])["dataflow_status"], "blocked")

    def test_roundtrip_full_sites_for_calls_bindings_edges_and_references(self):
        code = [abx(60), abx(27), abx(85), abc(70), abx(25, a=1, bx=1),
                abc(2, b=2, c=1), abc(9, b=1)]
        body = payload(function(code=code, constants=(b"callback", b"text"),
                                children=(function(code=[abc(9, b=1)]),)))
        self.add_row("e", body)
        coverage, evidence = analyze_occurrences(self.rows[-1:], self.extraction)
        original = parse_payload(body)["functions"][0]
        expanded = expand_analysis(evidence[0]["function"])
        self.assertEqual(expanded, analyze_function(original))
        for name in ("instruction_statuses", "references", "control_flow_edges",
                     "calls", "closure_bindings"):
            self.assertTrue(expanded[name], name)
        self.assertEqual(coverage[0]["semantic_support"], "supported")
        self.assertEqual(expanded["calls"][0]["localization_role"], "unknown")
        self.assertIsNone(expanded["calls"][0]["localization_key"])

    def test_open_call_is_semantically_partial_despite_supported_instructions(self):
        body = payload(function(code=[abc(2, b=0, c=1), abc(9, b=1)]))
        self.add_row("e", body)
        coverage, evidence = analyze_occurrences(self.rows[-1:], self.extraction)
        self.assertEqual(coverage[0]["instruction_support"], "supported")
        self.assertEqual(coverage[0]["semantic_support"], "partial")
        self.assertEqual(expand_analysis(evidence[0]["function"])["calls"][0]
                         ["arguments_status"], "open_unknown")

    def test_batch_record_identity_and_absolute_offset_survive_cache_reuse(self):
        batch = dict(self.rows[0], occurrence_key="q.batch|batch_script|42:123",
                     container_kind="batch_script", container_path="q.batch",
                     asset_id=123, record_index=7, record_name="quest",
                     record_offset=20, record_length_offset=64, record_bytes=500,
                     record_payload_offset=22, payload_offset=42,
                     payload_length_offset=38, string_references=["literal"])
        coverage, evidence = analyze_occurrences([batch, self.rows[0]], self.extraction)
        row = next(item for item in coverage if item["container_kind"] == "batch_script")
        function = next(item for item in evidence if item["container_kind"] == "batch_script")
        for field in ("container_path", "container_sha256", "asset_id", "record_index",
                      "record_name", "record_offset", "payload_offset", "payload_sha256",
                      "string_references"):
            self.assertEqual(row[field], batch[field])
            self.assertEqual(function[field], batch[field])

    def test_every_payload_is_rehashed_even_after_cache_hit(self):
        (self.extraction / "b.bin").write_bytes(b"tampered")
        with self.assertRaisesRegex(ValueError, "hash|size"):
            analyze_occurrences(self.rows[:2], self.extraction)

    def test_duplicate_keys_and_unsafe_paths_fail(self):
        with self.assertRaisesRegex(ValueError, "Duplicate"):
            analyze_occurrences([self.rows[0], self.rows[0]], self.extraction)
        row = dict(self.rows[0], payload_path="../outside.bin")
        with self.assertRaisesRegex(ValueError, "path"):
            analyze_occurrences([row], self.extraction)

    def test_only_expected_parse_errors_are_accounted(self):
        for error in (RuntimeError("bug"), ParseError("unknown_error", 1, "bug")):
            with self.subTest(error=error), patch("analyze_lua_corpus.parse_payload",
                                                  side_effect=error):
                with self.assertRaises(type(error)):
                    analyze_occurrences(self.rows[:1], self.extraction)

    def test_run_check_recomputes_without_writes_and_detects_drift(self):
        run(self.root, self.extraction, self.output, self.snapshot, check=False)
        paths = [self.output / name for name in
                 ("coverage.tsv", "decoded-evidence.jsonl", "coverage-summary.json")]
        before = [(path.read_bytes(), path.stat().st_mtime_ns) for path in paths]
        run(self.root, self.extraction, self.output, self.snapshot, check=True)
        self.assertEqual(before, [(path.read_bytes(), path.stat().st_mtime_ns) for path in paths])
        for path in paths:
            with self.subTest(path=path):
                original = path.read_bytes()
                path.write_bytes(original + b"tampered")
                with self.assertRaisesRegex(ValueError, "differs"):
                    run(self.root, self.extraction, self.output, self.snapshot, check=True)
                path.write_bytes(original)
        (self.extraction / "a.bin").write_bytes(b"changed")
        with self.assertRaises(ValueError):
            run(self.root, self.extraction, self.output, self.snapshot, check=True)

    def test_missing_check_output_is_not_created(self):
        with self.assertRaises((ValueError, FileNotFoundError)):
            run(self.root, self.extraction, self.output, self.snapshot, check=True)
        self.assertFalse((self.output / "coverage.tsv").exists())

    def test_output_directory_rejects_protected_locations_and_escape(self):
        refs = self.root / "references"
        refs.mkdir()
        for target in (self.root, self.root / "src", refs, self.extraction,
                       self.root / "work/zh_cn", self.snapshot,
                       self.root / "work/zh_cn/audit/dialogue-context-review-ledger.tsv",
                       self.root / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"):
            with self.subTest(target=target), self.assertRaises(ValueError):
                validate_output_dir(self.root, self.extraction, self.snapshot, target)
        escape = self.output / "escape"
        escape.symlink_to(refs, target_is_directory=True)
        with self.assertRaises(ValueError):
            validate_output_dir(self.root, self.extraction, self.snapshot, escape)
        self.assertEqual(validate_output_dir(self.root, self.extraction, self.snapshot,
                                             self.output), self.output.resolve())

    def test_output_files_reject_symlink_and_hardlink_to_protected_inputs(self):
        destination = self.output / "coverage.tsv"
        targets = [self.root / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv",
                   self.root / "src/csv/en_us/locatexts_en_us.koalocatext_default.csv",
                   self.root / "work/zh_cn/audit/dialogue-context-review-ledger.tsv",
                   self.snapshot, self.extraction / "a.bin"]
        for target in targets:
            original = target.read_bytes()
            for link in ("symlink", "hardlink"):
                with self.subTest(target=target, link=link):
                    if link == "symlink":
                        destination.symlink_to(target)
                    else:
                        os.link(target, destination)
                    with self.assertRaises(ValueError):
                        run(self.root, self.extraction, self.output, self.snapshot, check=False)
                    destination.unlink()
                    self.assertEqual(target.read_bytes(), original)

    def test_candidate_cli_is_separate_and_forwards_check(self):
        with patch.object(sys, "argv", ["analyze_lua_corpus.py", "--candidates", "--check"]), \
             patch("lua_translation_candidates.run_candidates", return_value={"ok": True}) as run_candidates, \
             patch("analyze_lua_corpus.run") as coverage_run, redirect_stdout(io.StringIO()):
            main()
        run_candidates.assert_called_once()
        self.assertTrue(run_candidates.call_args.args[-1])
        coverage_run.assert_not_called()


if __name__ == "__main__":
    unittest.main()
