"""Synthetic contracts for mechanical reconciliation; no linguistic defaults."""

import copy
import csv
import hashlib
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import reconcile_lua_reviews as reconcile
import lua_translation_candidates as candidates


def dump(path, value):
    path.write_text(json.dumps(value, sort_keys=True) + "\n", encoding="utf-8")


def jsonl(path, rows):
    path.write_text("".join(json.dumps(row, sort_keys=True) + "\n" for row in rows),
                    encoding="utf-8")


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


class ReconciliationTests(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        self.audit = self.root / reconcile.AUDIT_PATH
        self.audit.mkdir(parents=True)
        self.output_dir = self.audit / "reconciliation"
        self.extraction = self.root / "extraction"
        self.extraction.mkdir()
        self.packets = []
        self.reviews = []
        self.rows = []
        self.links = []
        self.candidate_rows = []
        self.fingerprints = {locale: str(i) * 64 for i, locale in enumerate(
            candidates.LOCALES, 1)}
        for index, variant in enumerate(("00", "FF"), 1):
            name = f"review-packet-{index:04d}.jsonl"
            packet = {
                "resource": "affix", "id": "7", "variant": variant,
                "input_fingerprints": self.fingerprints,
                "locales": {
                    locale: {"status": "present", "text": f"{locale}-{variant}",
                             "input_sha256": self.fingerprints[locale]}
                    for locale in candidates.LOCALES
                },
                "available_evidence_refs": [f"{name}#L1"],
                "candidate_counts": {"total": 1, "parsed": 1, "raw": 0},
                "matched_english_variants": ["00"],
                "candidate_id_mapping_ref":
                    f"candidate-id-mapping.jsonl#L{index}-L{index}",
            }
            review = {
                "resource": "affix", "id": "7", "variant": variant,
                "disposition": "retain", "reason": f"Bounded review of {variant}.",
                "review_dimensions": ["meaning"], "source_conflicts": [],
                "confidence": 0.75, "proposed_text": None,
                "input_fingerprints": self.fingerprints,
                "evidence_refs": packet["available_evidence_refs"],
            }
            self.rows.append(packet)
            self.reviews.append(review)
            self.packets.append(self.audit / name)
            self.links.append({
                "candidate_id": "candidate-a", "resource": "affix", "id": "7",
                "variant": variant, "candidate_variant": "00",
                "matched_english_variant": "00",
                "evidence_level": candidates.LEVEL,
                "extraction_method": "parsed_string_constant",
                "context_inventory_line": index,
            })
        self.candidate_rows.append({
            "candidate_id": "candidate-a", "resource": "affix", "id": "7",
            "variant": "00", "evidence_level": candidates.LEVEL,
            "extraction_method": "parsed_string_constant",
        })
        self.snapshot = self.audit / "input-snapshot.json"
        dump(self.snapshot, {"synthetic": True})
        self.summary_path = self.audit / "review-packet-summary.json"
        self.review_path = self.audit / "worker-reviews.jsonl"
        self.mapping = self.audit / "candidate-id-mapping.jsonl"
        self.candidate_path = self.audit / "candidates.jsonl"
        self.task5 = {
            "snapshot_sha256": digest(self.snapshot),
            "input_fingerprints": {
                str(candidates._locale_csv_path("affix", locale)):
                    {"sha256": value, "size": 0}
                for locale, value in self.fingerprints.items()
            },
        }
        dump(self.snapshot, {"inputs": [
            {"path": name, **fingerprint}
            for name, fingerprint in self.task5["input_fingerprints"].items()
        ]})
        self.task5["snapshot_sha256"] = digest(self.snapshot)
        self.freeze()
        self.verify = patch.object(reconcile, "verify_snapshot")
        self.verify_mock = self.verify.start()
        self.addCleanup(self.verify.stop)

    def freeze(self):
        for path, row in zip(self.packets, self.rows):
            jsonl(path, [row])
        jsonl(self.review_path, self.reviews)
        jsonl(self.mapping, self.links)
        jsonl(self.candidate_path, self.candidate_rows)
        dump(self.audit / "candidate-summary.json", self.task5)
        jsonl(self.audit / "review-context-inventory.jsonl", [{"synthetic": True}])
        comparison_path = self.audit / "four-language-comparisons.tsv"
        fields = ["candidate_id", "resource", "id", "variant",
                  "matched_english_variant", "evidence_level", "canonical_references"]
        fields += [f"{locale}_{field}" for locale in candidates.LOCALES
                   for field in ("status", "text", "input_sha256")]
        with comparison_path.open("w", encoding="utf-8", newline="") as stream:
            writer = csv.DictWriter(stream, fields, delimiter="\t")
            writer.writeheader()
            for index, packet in enumerate(self.rows):
                row = {field: self.links[index][field] for field in fields
                       if field in self.links[index]}
                row["canonical_references"] = "[]"
                for locale, evidence in packet["locales"].items():
                    for field, value in evidence.items():
                        row[f"{locale}_{field}"] = value
                writer.writerow(row)
        summary = {
            "snapshot_sha256": digest(self.snapshot),
            "candidate_ids": len(self.candidate_rows),
            "comparison_mapping_rows": len(self.links),
            "unique_keys": len(self.rows), "packet_count": len(self.packets),
            "packet_files": [path.name for path in self.packets],
            "machine_files": [
                "candidate-id-mapping.jsonl", "review-context-inventory.jsonl"],
            "task5_frozen_outputs": {
                name: digest(self.audit / name) for name in
                ("candidates.jsonl", "candidate-summary.json",
                 "four-language-comparisons.tsv")
            },
            "output_sha256": {path.name: digest(path) for path in [
                *self.packets, self.mapping,
                self.audit / "review-context-inventory.jsonl"]},
        }
        dump(self.summary_path, summary)

    def run_reconciliation(self, **kwargs):
        return reconcile.reconcile(
            repo_root=self.root, extraction_dir=self.extraction,
            summary_path=self.summary_path, packet_paths=self.packets,
            review_paths=[self.review_path], candidate_path=self.candidate_path,
            mapping_path=self.mapping, output_dir=self.output_dir, **kwargs)

    def output(self, name="adjudications.jsonl"):
        return [json.loads(line) for line in (self.output_dir / name).read_text().splitlines()]

    def test_unanimous_retain_preserves_join_and_exact_schema(self):
        original = copy.deepcopy(self.candidate_rows)
        result = self.run_reconciliation(chunk_size=1)
        self.assertEqual(result["candidate_ids"], 1)
        self.assertEqual(result["comparison_mapping_rows"], 2)
        self.assertEqual(self.output()[0]["disposition"], "retain")
        self.assertEqual(set(self.output()[0]), {
            "candidate_id", "disposition", "reason", "confidence", "proposed_text",
            "review_dimensions", "source_conflicts", "evidence_refs",
            "input_fingerprints"})
        joined = self.output("candidate-variant-decisions.jsonl")
        self.assertEqual([row["key_review"] for row in joined], self.reviews)
        self.assertEqual([row["comparison"] for row in joined], self.rows)
        self.assertEqual(self.candidate_rows, original)
        self.verify_mock.assert_called()

    def test_bounded_validator_runs_for_enriched_candidate_chunk(self):
        validated = []

        def capture(candidates_chunk, decisions_chunk):
            validated.append(copy.deepcopy(candidates_chunk))
            return candidates.validate_adjudications(candidates_chunk, decisions_chunk)

        with patch.object(reconcile, "validate_adjudications",
                          side_effect=capture) as validate:
            self.run_reconciliation(chunk_size=1)
        self.assertEqual(validate.call_count, 1)
        self.assertEqual(len(validated[0]), 1)
        self.assertEqual(len(validated[0][0]["comparisons"]), 2)

    def test_aggregation_rules(self):
        cases = [
            (["proposed correction"] * 2, ["same", "same"], "proposed correction"),
            (["proposed correction"] * 2, ["first", "second"], "unresolved"),
            (["retain", "proposed correction"], [None, "new"], "unresolved"),
            (["retain", "unresolved"], [None, None], "unresolved"),
        ]
        for dispositions, texts, expected in cases:
            with self.subTest(dispositions=dispositions, texts=texts):
                for review, disposition, text in zip(self.reviews, dispositions, texts):
                    review.update(disposition=disposition, proposed_text=text)
                self.freeze()
                output = self.audit / ("case-" + str(cases.index(
                    (dispositions, texts, expected))))
                self.run_with_output(output)
                decision = json.loads((output / "adjudications.jsonl").read_text())
                self.assertEqual(decision["disposition"], expected)
                for review in self.reviews:
                    self.assertIn(review["reason"], decision["reason"])

    def run_with_output(self, output, **kwargs):
        return reconcile.reconcile(
            repo_root=self.root, extraction_dir=self.extraction,
            summary_path=self.summary_path, packet_paths=self.packets,
            review_paths=[self.review_path], candidate_path=self.candidate_path,
            mapping_path=self.mapping, output_dir=output, **kwargs)

    def test_single_key_inherits_exact_review(self):
        self.rows.pop()
        self.links.pop()
        self.reviews.pop()
        self.packets.pop()
        self.freeze()
        self.run_reconciliation()
        decision = self.output()[0]
        for field in self.reviews[0].keys() - {"resource", "id", "variant"}:
            self.assertEqual(decision[field], self.reviews[0][field])

    def test_missing_locale_and_conflict_remain_unresolved(self):
        self.rows[1]["locales"]["en"].update(status="missing", text=None)
        self.reviews[1].update(disposition="unresolved",
                               source_conflicts=["Explicit reference disagreement."])
        self.freeze()
        self.run_reconciliation()
        self.assertEqual(self.output()[0]["disposition"], "unresolved")
        self.assertIn("Explicit reference disagreement.",
                      self.output()[0]["source_conflicts"])

    def test_check_is_deterministic_and_never_writes(self):
        self.run_reconciliation()
        before = {path: (path.read_bytes(), path.stat().st_mtime_ns)
                  for path in self.audit.rglob("*") if path.is_file()}
        with patch.object(Path, "mkdir", side_effect=AssertionError("write")), \
                patch.object(Path, "write_text", side_effect=AssertionError("write")), \
                patch.object(reconcile.tempfile, "TemporaryDirectory",
                             side_effect=AssertionError("staging")), \
                patch.object(reconcile.os, "replace", side_effect=AssertionError("publish")):
            self.run_reconciliation(check=True, chunk_size=1)
        self.assertEqual(before, {path: (path.read_bytes(), path.stat().st_mtime_ns)
                                  for path in before})
        (self.output_dir / "adjudications.jsonl").write_text("stale\n")
        with self.assertRaisesRegex(ValueError, "differ|mismatch"):
            self.run_reconciliation(check=True)

    def test_frozen_hash_and_snapshot_fail_before_outputs(self):
        self.packets[0].write_text("{}\n")
        with self.assertRaisesRegex(ValueError, "hash"):
            self.run_reconciliation()
        self.freeze()
        self.verify_mock.side_effect = ValueError("Frozen snapshot changed")
        with self.assertRaisesRegex(ValueError, "snapshot"):
            self.run_reconciliation()
        self.assertFalse(self.output_dir.exists())

    def test_task5_input_outside_snapshot_is_still_fingerprinted(self):
        relative = "work/translation-reference/duplicates.jsonl"
        path = self.root / relative
        path.parent.mkdir(parents=True)
        path.write_bytes(b'{"snapshot-omitted":true}\n')
        self.task5["input_fingerprints"][relative] = {
            "sha256": digest(path), "size": path.stat().st_size,
        }
        self.freeze()

        result = self.run_reconciliation()
        self.assertEqual(result["candidate_ids"], 1)

        path.write_bytes(b'{"snapshot-omitted":false}\n')
        with self.assertRaisesRegex(ValueError, "Task5 input fingerprint changed"):
            self.run_reconciliation(check=True)

    def test_inventory_hash_record_and_content_are_required(self):
        name = "review-context-inventory.jsonl"
        for mutation in ("hash", "record", "declaration", "content", "file"):
            with self.subTest(mutation=mutation):
                self.freeze()
                summary = json.loads(self.summary_path.read_text())
                if mutation in ("hash", "record"):
                    del summary["output_sha256"][name]
                if mutation in ("record", "declaration"):
                    summary["machine_files"].remove(name)
                if mutation == "content":
                    (self.audit / name).write_text("changed\n")
                elif mutation == "file":
                    (self.audit / name).unlink()
                dump(self.summary_path, summary)
                with self.assertRaisesRegex(ValueError, "hash|machine"):
                    self.run_reconciliation()
                self.assertFalse(self.output_dir.exists())

    def test_declared_machine_files_require_exact_complete_hashes(self):
        for mutation in ("missing", "extra", "duplicate", "undeclared", "task5"):
            with self.subTest(mutation=mutation):
                self.freeze()
                summary = json.loads(self.summary_path.read_text())
                if mutation == "missing":
                    summary["machine_files"].append("additional.jsonl")
                elif mutation == "extra":
                    path = self.audit / "additional.jsonl"
                    jsonl(path, [])
                    summary["output_sha256"][path.name] = digest(path)
                elif mutation == "duplicate":
                    summary["machine_files"].append(summary["machine_files"][0])
                elif mutation == "undeclared":
                    del summary["machine_files"]
                else:
                    del summary["task5_frozen_outputs"]["candidate-summary.json"]
                dump(self.summary_path, summary)
                with self.assertRaisesRegex(ValueError, "hash|machine"):
                    self.run_reconciliation()
                self.assertFalse(self.output_dir.exists())

    def test_publication_failure_leaves_no_partial_directory(self):
        before = set(self.audit.iterdir())
        handles = []
        open_path = Path.open

        def track(path, *args, **kwargs):
            stream = open_path(path, *args, **kwargs)
            if args and args[0] == "wb":
                handles.append(stream)
            return stream

        def fail(source, target):
            self.assertEqual(len(handles), len(reconcile.OUTPUT_NAMES))
            self.assertTrue(all(stream.closed for stream in handles))
            self.assertEqual(source.parent, self.output_dir.parent.resolve())
            self.assertEqual(target, self.output_dir.resolve())
            self.assertEqual({path.name for path in source.iterdir()},
                             set(reconcile.OUTPUT_NAMES))
            for name in reconcile.OUTPUT_NAMES:
                for line in (source / name).read_text().splitlines():
                    json.loads(line)
            raise OSError("injected publication failure")

        with patch.object(Path, "open", autospec=True, side_effect=track), \
                patch.object(reconcile.os, "replace", side_effect=fail) as publish:
            with self.assertRaisesRegex(OSError, "injected"):
                self.run_reconciliation()
        publish.assert_called_once()
        self.assertEqual(set(self.audit.iterdir()), before)
        self.assertFalse(self.output_dir.exists())

    def test_additional_declared_machine_file_is_frozen(self):
        path = self.audit / "additional-machine.jsonl"
        jsonl(path, [{"synthetic": True}])
        summary = json.loads(self.summary_path.read_text())
        summary["machine_files"].append(path.name)
        summary["output_sha256"][path.name] = digest(path)
        dump(self.summary_path, summary)
        self.run_reconciliation()
        path.write_text("changed\n")
        with self.assertRaisesRegex(ValueError, "hash mismatch"):
            self.run_reconciliation(check=True)

    def test_existing_directory_requires_exact_match_and_is_idempotent(self):
        self.run_reconciliation()
        before = {path: (path.read_bytes(), path.stat().st_mtime_ns)
                  for path in self.output_dir.iterdir()}
        with patch.object(reconcile.os, "replace", side_effect=AssertionError("publish")):
            self.run_reconciliation()
        self.assertEqual(before, {path: (path.read_bytes(), path.stat().st_mtime_ns)
                                  for path in before})
        for mutation in ("extra", "missing", "changed", "empty"):
            with self.subTest(mutation=mutation):
                output = self.audit / mutation
                output.mkdir()
                if mutation != "empty":
                    for path, (data, _) in before.items():
                        (output / path.name).write_bytes(data)
                    if mutation == "extra":
                        (output / "unexpected").write_text("keep\n")
                    elif mutation == "missing":
                        (output / reconcile.OUTPUT_NAMES[0]).unlink()
                    else:
                        (output / reconcile.OUTPUT_NAMES[0]).write_text("stale\n")
                original = {path: path.read_bytes() for path in output.iterdir()}
                with self.assertRaises(ValueError):
                    self.run_with_output(output)
                self.assertEqual(original, {path: path.read_bytes()
                                            for path in output.iterdir()})

    def test_concurrent_first_writer_cannot_mix_generations(self):
        replace = reconcile.os.replace
        winner = {}

        def race(source, target):
            staged = {path.name: path.read_bytes() for path in source.iterdir()}
            self.review_path = self.audit / "other-worker-reviews.jsonl"
            jsonl(self.review_path, [{**row, "reason": "Different bounded review."}
                                     for row in self.reviews])
            with patch.object(reconcile.os, "replace", wraps=replace):
                self.run_reconciliation(chunk_size=1)
            winner.update({path.name: path.read_bytes() for path in target.iterdir()})
            self.assertNotEqual(winner, staged)
            replace(source, target)

        with patch.object(reconcile.os, "replace", side_effect=race) as publish:
            with self.assertRaises(OSError):
                self.run_reconciliation()
        publish.assert_called_once()
        self.assertEqual(winner, {path.name: path.read_bytes()
                                  for path in self.output_dir.iterdir()})
        self.assertEqual({path.name for path in self.output_dir.iterdir()},
                         set(reconcile.OUTPUT_NAMES))
        self.assertFalse(list(self.audit.glob(".task6c-*")))

    def test_check_missing_directory_never_writes(self):
        before = set(self.audit.iterdir())
        with patch.object(reconcile.tempfile, "TemporaryDirectory",
                          side_effect=AssertionError("staging")), \
                patch.object(Path, "mkdir", side_effect=AssertionError("mkdir")), \
                patch.object(reconcile.os, "replace", side_effect=AssertionError("publish")):
            with self.assertRaisesRegex(ValueError, "Missing output"):
                self.run_reconciliation(check=True)
        self.assertEqual(set(self.audit.iterdir()), before)

    def test_destination_appearing_before_publication_is_preserved(self):
        verify = reconcile._verify_files

        def race(expected):
            verify(expected)
            self.output_dir.mkdir()
            (self.output_dir / "other-writer").write_text("preserve\n")

        with patch.object(reconcile, "_verify_files", side_effect=race), \
                patch.object(reconcile.os, "replace", side_effect=AssertionError("publish")):
            with self.assertRaisesRegex(ValueError, "appeared"):
                self.run_reconciliation()
        self.assertEqual({path.name for path in self.output_dir.iterdir()},
                         {"other-writer"})
        self.assertEqual((self.output_dir / "other-writer").read_text(), "preserve\n")
        self.assertFalse(list(self.audit.glob(".task6c-*")))

    def test_late_inventory_mutation_prevents_publication(self):
        validate = reconcile.validate_adjudications

        def mutate(*args):
            result = validate(*args)
            (self.audit / "review-context-inventory.jsonl").write_text("changed\n")
            return result

        with patch.object(reconcile, "validate_adjudications", side_effect=mutate):
            with self.assertRaisesRegex(ValueError, "hash changed"):
                self.run_reconciliation()
        self.assertFalse(self.output_dir.exists())
        self.assertFalse(list(self.audit.glob(".task6c-*")))

    def test_output_directory_symlink_and_ancestor_are_rejected(self):
        alias = self.audit / "alias"
        alias.symlink_to(self.audit, target_is_directory=True)
        for output in (alias, alias / "child", self.audit / "new" / ".."):
            with self.subTest(output=output):
                with self.assertRaises(ValueError):
                    self.run_with_output(output)
        self.assertFalse(self.output_dir.exists())

    def test_missing_extra_duplicate_or_wrong_variant_mapping_fails(self):
        original = copy.deepcopy(self.links)
        for mutation in ("missing", "extra", "duplicate", "variant", "key"):
            with self.subTest(mutation=mutation):
                self.links = copy.deepcopy(original)
                if mutation == "missing":
                    self.links.pop()
                elif mutation == "extra":
                    self.links.append({**self.links[0], "candidate_id": "unknown"})
                elif mutation == "duplicate":
                    self.links.append(self.links[0])
                elif mutation == "variant":
                    self.links[0]["candidate_variant"] = "FF"
                else:
                    self.links[0]["id"] = "8"
                jsonl(self.mapping, self.links)
                summary = json.loads(self.summary_path.read_text())
                summary["output_sha256"][self.mapping.name] = digest(self.mapping)
                dump(self.summary_path, summary)
                with self.assertRaises(ValueError):
                    self.run_reconciliation()

    def test_duplicate_candidate_ids_and_missing_reviews_fail(self):
        self.candidate_rows.append(copy.deepcopy(self.candidate_rows[0]))
        self.freeze()
        with self.assertRaisesRegex(ValueError, "duplicate|Duplicate"):
            self.run_reconciliation()
        self.candidate_rows.pop()
        self.reviews.pop()
        self.freeze()
        with self.assertRaisesRegex(ValueError, "missing"):
            self.run_reconciliation()

    def test_exact_packet_paths_and_output_safety(self):
        with self.assertRaisesRegex(ValueError, "packet"):
            reconcile.reconcile(
                repo_root=self.root, extraction_dir=self.extraction,
                summary_path=self.summary_path, packet_paths=self.packets[:1],
                review_paths=[self.review_path], candidate_path=self.candidate_path,
                mapping_path=self.mapping, output_dir=self.output_dir)
        for output in (self.root / "src", self.root / "references", self.audit,
                       self.audit / ".." / "escape"):
            with self.assertRaises(ValueError):
                self.run_with_output(output)
        self.output_dir.mkdir()
        protected = self.output_dir / "adjudications.jsonl"
        protected.symlink_to(self.candidate_path)
        with self.assertRaises(ValueError):
            self.run_reconciliation()

    def test_input_overwrite_is_rejected(self):
        self.output_dir.mkdir()
        target = self.output_dir / "adjudications.jsonl"
        self.review_path.rename(target)
        self.review_path = target
        with self.assertRaisesRegex(ValueError, "input|overlap"):
            self.run_reconciliation()


if __name__ == "__main__":
    unittest.main()
