import hashlib
import json
from pathlib import Path
import tempfile
import unittest

from lua_resource_codec import parse_script_record
from lua_review_inputs import (
    PINNED_FFQ35_HASHES,
    load_occurrences,
    select_pilot,
    snapshot_inputs,
    verify_snapshot,
)
from test_lua_resource_codec import lua_payload, script_record


def digest(data):
    return hashlib.sha256(data).hexdigest()


class ReviewInputsTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.extraction = self.root / "extracted"
        self.extraction.mkdir()
        for resource in ("affix", "base", "default"):
            for locale in ("en_us", "ja_jp", "zh_cn"):
                self.put(f"src/csv/{locale}/locatexts_{locale}.koalocatext_{resource}.csv", b"csv\r\n")
            self.put(f"work/zh_cn/locatexts_zh_cn.koalocatext_{resource}.csv", b"work\r\n")
        for category in ("classification", "glossary", "exceptions"):
            self.put(f"work/zh_cn/translation-reference/{category}/reference.tsv", category.encode())
        self.put("work/zh_cn/audit/dialogue-context-review-ledger.tsv", b"ledger")
        self.put("tools/lua_resource_codec.py", b"codec")
        self.rows = []
        self.add_row("z.quest_bxml|bxml|5", "z.quest_bxml", "bxml", b"same", "z.bin")
        self.add_row("a.batch|batch_script|30:1", "a.batch", "batch_script", b"same", "a.bin")
        self.write_manifest()

    def put(self, name, data):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)
        return path

    def add_row(self, key, container, kind, payload, path):
        (self.extraction / path).write_bytes(payload)
        row = {
            "occurrence_key": key, "container_path": container,
            "container_kind": kind, "payload_path": path,
            "payload_bytes": len(payload), "payload_sha256": digest(payload),
            "payload_offset": 5 if kind == "bxml" else 20,
            "payload_length_offset": 1 if kind == "bxml" else 16,
            "container_bytes": 128, "container_sha256": digest(container.encode()),
            "asset_id": "" if kind == "bxml" else (1 if kind == "batch_script" else 2),
        }
        if kind != "bxml":
            row.update(record_index=0, record_length_offset=8, record_offset=12,
                       record_bytes=8 + len(payload))
        if kind == "batch_script":
            row.update(record_name="script", string_references=[], record_payload_offset=18,
                       payload_offset=30, payload_length_offset=26,
                       record_bytes=18 + len(payload))
        self.rows.append(row)

    def write_manifest(self):
        manifest = {
            "schema_version": 2,
            "summary": {"scanned_files": 7,
                        "containers": len({row["container_path"] for row in self.rows}),
                        "occurrences": len(self.rows), "signature_count": len(self.rows),
                        "unclassified_signatures": 0,
                        "bxml_payloads": sum(row["container_kind"] == "bxml" for row in self.rows),
                        "batch_script_payloads": sum(row["container_kind"] == "batch_script"
                                                     for row in self.rows)},
            "container_paths": sorted({row["container_path"] for row in self.rows}),
            "unclassified_signatures": [],
            "occurrences": self.rows,
        }
        (self.extraction / "manifest.json").write_text(json.dumps(manifest), encoding="utf-8")

    def test_occurrences_keep_duplicate_hashes_and_sort_by_key(self):
        rows = load_occurrences(self.extraction)
        self.assertEqual([row["occurrence_key"] for row in rows],
                         ["a.batch|batch_script|30:1", "z.quest_bxml|bxml|5"])
        self.assertEqual(rows[0]["payload_sha256"], rows[1]["payload_sha256"])

    def test_rejects_duplicate_occurrence_key(self):
        self.rows[1]["occurrence_key"] = self.rows[0]["occurrence_key"]
        self.write_manifest()
        with self.assertRaisesRegex(ValueError, "Duplicate occurrence"):
            load_occurrences(self.extraction)

    def test_rejects_changed_payload(self):
        (self.extraction / "z.bin").write_bytes(b"diff")
        with self.assertRaisesRegex(ValueError, "hash"):
            load_occurrences(self.extraction)

    def test_rejects_wrong_size(self):
        self.rows[0]["payload_bytes"] += 1
        self.write_manifest()
        with self.assertRaisesRegex(ValueError, "size|length"):
            load_occurrences(self.extraction)

    def test_rejects_absolute_and_parent_paths(self):
        for path in ("/tmp/payload.bin", "C:/payload.bin", "../payload.bin", "dir/../z.bin"):
            with self.subTest(path=path):
                self.rows[0]["payload_path"] = path
                self.write_manifest()
                with self.assertRaisesRegex(ValueError, "path"):
                    load_occurrences(self.extraction)

    def test_rejects_escaping_symlink(self):
        target = self.put("outside.bin", b"same")
        (self.extraction / "link.bin").symlink_to(target)
        self.rows[0]["payload_path"] = "link.bin"
        self.write_manifest()
        with self.assertRaisesRegex(ValueError, "path"):
            load_occurrences(self.extraction)

    def test_rejects_missing_file(self):
        self.rows[0]["payload_path"] = "missing.bin"
        self.write_manifest()
        with self.assertRaisesRegex(ValueError, "missing|read"):
            load_occurrences(self.extraction)

    def test_rejects_invalid_manifest(self):
        self.write_manifest()
        manifest = json.loads((self.extraction / "manifest.json").read_text())
        manifest["schema_version"] = 99
        (self.extraction / "manifest.json").write_text(json.dumps(manifest))
        with self.assertRaisesRegex(ValueError, "schema"):
            load_occurrences(self.extraction)

    def test_rejects_manifest_summary_mismatch(self):
        manifest = json.loads((self.extraction / "manifest.json").read_text())
        manifest["summary"]["containers"] = 99
        (self.extraction / "manifest.json").write_text(json.dumps(manifest))
        with self.assertRaisesRegex(ValueError, "summary"):
            load_occurrences(self.extraction)

    def test_signature_accounting_rejects_inconsistent_or_invalid_counts(self):
        original = json.loads((self.extraction / "manifest.json").read_text())
        for field, value in (("signature_count", 1), ("signature_count", -1),
                             ("signature_count", True), ("unclassified_signatures", 1),
                             ("unclassified_signatures", False)):
            manifest = json.loads(json.dumps(original))
            manifest["summary"][field] = value
            (self.extraction / "manifest.json").write_text(json.dumps(manifest))
            with self.subTest(field=field, value=value), self.assertRaisesRegex(
                    ValueError, "signature"):
                load_occurrences(self.extraction)
        del original["summary"]["signature_count"]
        (self.extraction / "manifest.json").write_text(json.dumps(original))
        with self.assertRaisesRegex(ValueError, "signature"):
            load_occurrences(self.extraction)

    def test_internal_signature_hits_can_exceed_occurrence_count(self):
        manifest = json.loads((self.extraction / "manifest.json").read_text())
        manifest["summary"]["signature_count"] = 3
        (self.extraction / "manifest.json").write_text(json.dumps(manifest))
        self.assertEqual(len(load_occurrences(self.extraction)), 2)

    def test_unclassified_signatures_are_surfaced_and_not_frozen(self):
        manifest = json.loads((self.extraction / "manifest.json").read_text())
        manifest["unclassified_signatures"] = [{
            "container_path": "unknown.batch", "signature_offset": 42,
            "valid_type_table": False, "declared_length": None,
            "reason": "signature_without_supported_envelope",
        }]
        manifest["summary"].update(signature_count=3, unclassified_signatures=1)
        (self.extraction / "manifest.json").write_text(json.dumps(manifest))
        with self.assertRaisesRegex(ValueError, r"unclassified.*unknown.batch.*42"):
            snapshot_inputs(self.root, self.extraction)

    def test_rejects_missing_or_malformed_provenance_by_kind(self):
        self.add_row("c.batch|batch_bxml|20:2", "c.batch", "batch_bxml", b"same", "c.bin")
        self.write_manifest()
        self.assertEqual(len(load_occurrences(self.extraction)), 3)
        cases = {
            "bxml": ("asset_id", "payload_offset", "payload_length_offset",
                     "container_bytes", "container_sha256"),
            "batch_bxml": ("asset_id", "record_index", "record_offset", "record_bytes",
                           "record_length_offset", "container_sha256"),
            "batch_script": ("asset_id", "record_index", "record_offset", "record_bytes",
                             "record_length_offset", "record_name", "string_references",
                             "record_payload_offset"),
        }
        for index, row in enumerate(self.rows):
            for field in cases[row["container_kind"]]:
                with self.subTest(kind=row["container_kind"], field=field):
                    value = row.pop(field)
                    self.write_manifest()
                    with self.assertRaises(ValueError):
                        load_occurrences(self.extraction)
                    row[field] = value
        for field, value in (("container_sha256", "invalid"), ("payload_offset", -1),
                             ("asset_id", True), ("record_index", -1),
                             ("string_references", [42])):
            with self.subTest(field=field, value=value):
                row = self.rows[1]
                old = row[field]
                row[field] = value
                self.write_manifest()
                with self.assertRaises(ValueError):
                    load_occurrences(self.extraction)
                row[field] = old

    def test_rejects_inconsistent_container_and_record_metadata(self):
        self.rows.pop(1)
        self.add_row("a.batch|batch_bxml|29:1", "a.batch", "batch_bxml", b"same", "c.bin")
        row = self.rows[-1]
        row.update(payload_offset=29, payload_length_offset=25, asset_id=1,
                   record_bytes=21)
        self.add_row("a.batch|batch_bxml|20:1", "a.batch", "batch_bxml", b"same", "a.bin")
        self.rows[-1].update(asset_id=1, record_bytes=21)
        self.write_manifest()
        self.assertEqual(len(load_occurrences(self.extraction)), 3)
        for field, value in (("container_sha256", digest(b"other")),
                             ("record_bytes", 22)):
            with self.subTest(field=field):
                previous = row[field]
                row[field] = value
                self.write_manifest()
                with self.assertRaisesRegex(ValueError, "Inconsistent"):
                    load_occurrences(self.extraction)
                row[field] = previous

    def test_rejects_key_and_provenance_inconsistencies(self):
        self.add_row("c.batch|batch_bxml|20:2", "c.batch", "batch_bxml", b"same", "c.bin")
        for index, field, value in (
                (0, "occurrence_key", "wrong|bxml|5"),
                (0, "asset_id", "wrong"),
                (0, "payload_length_offset", 0),
                (0, "container_bytes", 7),
                (1, "asset_id", 2),
                (1, "record_payload_offset", 7),
                (1, "record_offset", 13),
                (1, "record_length_offset", 9),
                (2, "occurrence_key", "c.batch|batch_bxml|20:3")):
            with self.subTest(index=index, field=field):
                row = self.rows[index]
                old = row[field]
                row[field] = value
                self.write_manifest()
                with self.assertRaises(ValueError):
                    load_occurrences(self.extraction)
                row[field] = old

    def test_script_prefix_matches_producer_utf8_encoding(self):
        row = self.rows[1]
        for name, refs in (
                ("script", []),
                ("", []),
                ("\u6f22\U0001f642", ["\u00e9", "\u03bb", ""]),
                ("ascii", ["one", "two"])):
            with self.subTest(name=name, refs=refs):
                parsed = parse_script_record(script_record(name, refs, lua_payload()))
                prefix = parsed["payload_offset"]
                offset = row["record_offset"] + prefix
                row.update(record_name=name, string_references=refs,
                           record_payload_offset=prefix, payload_offset=offset,
                           payload_length_offset=offset - 4, record_bytes=prefix + 4,
                           occurrence_key=f"a.batch|batch_script|{offset}:1")
                self.write_manifest()
                self.assertEqual(len(load_occurrences(self.extraction)), 2)
                character_prefix = 12 + len(name) + sum(4 + len(ref) for ref in refs)
                invalid_prefixes = {prefix - 1, prefix + 1}
                if character_prefix != prefix:
                    invalid_prefixes.add(character_prefix)
                for incorrect in sorted(invalid_prefixes):
                    invalid_offset = row["record_offset"] + incorrect
                    row.update(record_payload_offset=incorrect, payload_offset=invalid_offset,
                               payload_length_offset=invalid_offset - 4,
                               record_bytes=incorrect + 4,
                               occurrence_key=f"a.batch|batch_script|{invalid_offset}:1")
                    self.write_manifest()
                    with self.assertRaisesRegex(ValueError, "script"):
                        load_occurrences(self.extraction)

    def test_rejects_invalid_script_record_text(self):
        row = self.rows[1]
        for field, value in (("record_name", "bad\0name"),
                             ("string_references", ["bad\0ref"]),
                             ("record_name", "\ud800"),
                             ("string_references", ["\ud800"])):
            with self.subTest(field=field, value=value):
                previous = row[field]
                row[field] = value
                self.write_manifest()
                with self.assertRaises(ValueError):
                    load_occurrences(self.extraction)
                row[field] = previous

    def test_rejects_unsafe_or_mislabeled_container_paths(self):
        for container in ("../outside.quest_bxml", "/absolute.quest_bxml",
                          "C:/file.quest_bxml", "wrong.batch"):
            with self.subTest(container=container):
                row = self.rows[0]
                previous = row.copy()
                row["container_path"] = container
                row["occurrence_key"] = f"{container}|bxml|5"
                self.write_manifest()
                with self.assertRaises(ValueError):
                    load_occurrences(self.extraction)
                row.clear()
                row.update(previous)

    def test_rejects_malformed_manifest_types(self):
        for manifest in ([], {"schema_version": 2, "occurrences": [{}]}):
            with self.subTest(manifest=manifest):
                (self.extraction / "manifest.json").write_text(json.dumps(manifest))
                with self.assertRaises(ValueError):
                    load_occurrences(self.extraction)
        self.write_manifest()
        manifest = json.loads((self.extraction / "manifest.json").read_text())
        manifest["occurrences"][0]["container_kind"] = []
        (self.extraction / "manifest.json").write_text(json.dumps(manifest))
        with self.assertRaises(ValueError):
            load_occurrences(self.extraction)

    def test_snapshot_is_sorted_and_detects_drift_and_new_reference(self):
        snapshot = snapshot_inputs(self.root, self.extraction)
        self.assertEqual(snapshot["occurrence_count"], 2)
        self.assertEqual(len(snapshot["occurrences"]), 2)
        self.assertEqual(snapshot["kind_counts"], {"batch_script": 1, "bxml": 1})
        self.assertEqual(snapshot["scanned_files"], 7)
        self.assertEqual(snapshot["payload_containing_files"], 2)
        self.assertEqual(snapshot["inputs"], sorted(snapshot["inputs"], key=lambda r: r["path"]))
        verify_snapshot(snapshot, self.root, self.extraction)
        path = self.root / "work/zh_cn/translation-reference/glossary/reference.tsv"
        path.write_bytes(b"changed")
        with self.assertRaisesRegex(ValueError, "changed"):
            verify_snapshot(snapshot, self.root, self.extraction)
        path.write_bytes(b"glossary")
        self.put("work/zh_cn/translation-reference/glossary/new.tsv", b"new")
        with self.assertRaisesRegex(ValueError, "changed"):
            verify_snapshot(snapshot, self.root, self.extraction)

    def test_tool_source_changes_do_not_invalidate_snapshot(self):
        snapshot = snapshot_inputs(self.root, self.extraction)
        self.put("tools/lua_resource_codec.py", b"new codec")
        verify_snapshot(snapshot, self.root, self.extraction)

    def test_snapshot_rejects_payload_drift(self):
        snapshot = snapshot_inputs(self.root, self.extraction)
        (self.extraction / "z.bin").write_bytes(b"diff")
        with self.assertRaisesRegex(ValueError, "hash"):
            verify_snapshot(snapshot, self.root, self.extraction)

    def test_pilot_is_deterministic_and_covers_strata_and_pins(self):
        rows = [
            {"occurrence_key": f"key-{i}", "container_kind": kind,
             "container_path": path, "payload_bytes": size, "header_group": header,
             "payload_sha256": sha}
            for i, (kind, path, size, header, sha) in enumerate([
                ("bxml", "a.quest_bxml", 10, "aa", PINNED_FFQ35_HASHES[0]),
                ("batch_script", "b.batch", 20, "bb", PINNED_FFQ35_HASHES[1]),
                ("batch_bxml", "c.batch", 30, "aa", PINNED_FFQ35_HASHES[2]),
                ("bxml", "d.interaction_bxml", 40, "cc", digest(b"extra")),
                ("bxml", "e.quest_bxml", 100, "aa", digest(b"large")),
            ])
        ]
        keys = select_pilot(rows)
        self.assertEqual(keys, select_pilot(list(reversed(rows))))
        selected = [row for row in rows if row["occurrence_key"] in keys]
        self.assertEqual({row["container_kind"] for row in selected},
                         {row["container_kind"] for row in rows})
        self.assertEqual({Path(row["container_path"]).suffix for row in selected},
                         {Path(row["container_path"]).suffix for row in rows})
        self.assertEqual({row["header_group"] for row in selected}, {"aa", "bb", "cc"})
        self.assertEqual({row["payload_sha256"] for row in selected} & set(PINNED_FFQ35_HASHES),
                         set(PINNED_FFQ35_HASHES))
        self.assertIn("key-4", keys)

    def test_pilot_fails_if_pin_missing(self):
        with self.assertRaisesRegex(ValueError, "pinned"):
            select_pilot([])


if __name__ == "__main__":
    unittest.main()
