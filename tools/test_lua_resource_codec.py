import json
from pathlib import Path
import struct
import tempfile
import unittest

import lua_resource_codec as CODEC


def lua_payload(body=b"opaque instructions"):
    result = CODEC.LUA_HEADER + struct.pack(">I", len(CODEC.TYPE_NAMES))
    for index, name in enumerate(CODEC.TYPE_NAMES):
        raw = name.encode("ascii") + b"\0"
        result += struct.pack(">II", index, len(raw)) + raw
    return result + body


def text(value):
    raw = value.encode("utf-8")
    return struct.pack("<I", len(raw)) + raw


def script_record(name, refs, payload):
    result = text(name) + struct.pack("<I", len(refs))
    result += b"".join(text(ref) for ref in refs)
    return result + struct.pack("<I", len(payload)) + payload


def batch_file(records):
    directory_end = 4 + 8 * len(records)
    directory = bytearray(struct.pack("<I", len(records)))
    body = bytearray()
    for asset_id, record in records:
        directory.extend(struct.pack("<II", asset_id, len(record)))
        body.extend(record)
    return bytes(directory + body), directory_end


class LuaResourceCodecTests(unittest.TestCase):
    def test_bxml_multiple_payloads_round_trip_and_resize(self):
        first = lua_payload(b"first")
        second = lua_payload(b"second")
        raw = (b"prefix" + b"\x02" + struct.pack("<I", len(first)) + first
               + b"middle" + b"\x02" + struct.pack("<I", len(second)) + second
               + b"suffix")
        rows = CODEC.find_bxml_payloads(raw, "sample.quest_bxml")
        self.assertEqual([row["payload_offset"] for row in rows],
                         [11, 11 + len(first) + 11])
        self.assertEqual(CODEC.rebuild_bxml(raw, rows, {}), raw)

        replacement = lua_payload(b"a longer body")
        rebuilt = CODEC.rebuild_bxml(raw, rows, {rows[0]["occurrence_key"]: replacement})
        reparsed = CODEC.find_bxml_payloads(rebuilt, "sample.quest_bxml")
        self.assertEqual([row["payload"] for row in reparsed], [replacement, second])
        self.assertEqual(rebuilt[:6], b"prefix")
        self.assertTrue(rebuilt.endswith(b"suffix"))

    def test_batch_resize_updates_record_directory_and_preserves_other_record(self):
        payload = lua_payload(b"script body")
        record = script_record("QuestScript", ["REF_A", "REF_B"], payload)
        bxml_payload = lua_payload(b"embedded BXML")
        bxml_record = b"prefix\x02" + struct.pack("<I", len(bxml_payload)) + bxml_payload
        raw, directory_end = batch_file([(101, bxml_record), (202, record)])
        rows = CODEC.find_batch_bxml_payloads(raw, "resources.batch")
        rows.extend(CODEC.find_batch_payloads(raw, "resources.batch"))
        self.assertEqual(len(rows), 2)
        self.assertEqual(rows[0]["record_offset"], directory_end)
        self.assertEqual(CODEC.rebuild_batch(raw, rows, {}), raw)

        replacement = lua_payload(b"changed script body with a new length")
        bxml_replacement = lua_payload(b"expanded embedded BXML body")
        replacements = {
            next(row for row in rows if row["container_kind"] == "batch_script")[
                "occurrence_key"
            ]: replacement,
            next(row for row in rows if row["container_kind"] == "batch_bxml")[
                "occurrence_key"
            ]: bxml_replacement,
        }
        rebuilt = CODEC.rebuild_batch(raw, rows, replacements)
        entries = CODEC.parse_batch_records(rebuilt)
        self.assertEqual(entries[0]["asset_id"], 101)
        updated_bxml_record = rebuilt[
            entries[0]["record_offset"]:
            entries[0]["record_offset"] + entries[0]["record_bytes"]
        ]
        self.assertTrue(updated_bxml_record.startswith(b"prefix\x02"))
        self.assertEqual(
            CODEC.find_bxml_payloads(updated_bxml_record, "record")[0]["payload"],
            bxml_replacement,
        )
        updated_record = rebuilt[
            entries[1]["record_offset"]:
            entries[1]["record_offset"] + entries[1]["record_bytes"]
        ]
        parsed = CODEC.parse_script_record(updated_record)
        self.assertEqual(parsed["record_name"], "QuestScript")
        self.assertEqual(parsed["string_references"], ["REF_A", "REF_B"])
        self.assertEqual(parsed["payload"], replacement)

    def test_extraction_roundtrip_and_reencoding_never_changes_source(self):
        payload = lua_payload()
        bxml = b"before\x02" + struct.pack("<I", len(payload)) + payload + b"after"
        batch_bxml = b"record\x02" + struct.pack("<I", len(payload)) + payload
        batch, _ = batch_file([
            (7, batch_bxml),
            (8, script_record("test", [], payload)),
        ])
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "source"
            source.mkdir()
            (source / "one.quest_bxml").write_bytes(bxml)
            (source / "scripts.batch").write_bytes(batch)
            extraction = root / "extracted"
            result = CODEC.extract_corpus(source, extraction)
            self.assertEqual(result["summary"]["occurrences"], 3)
            self.assertEqual(CODEC.verify_roundtrip(source, extraction)["containers"], 2)
            self.assertEqual((source / "one.quest_bxml").read_bytes(), bxml)
            self.assertEqual((source / "scripts.batch").read_bytes(), batch)

            manifest = json.loads((extraction / "manifest.json").read_text())
            occurrence = next(
                row for row in manifest["occurrences"]
                if row["container_kind"] == "bxml"
            )
            edited = lua_payload(b"edited, longer")
            (extraction / occurrence["payload_path"]).write_bytes(edited)
            output = root / "reencoded"
            summary = CODEC.reencode_corpus(source, extraction, output)
            self.assertEqual(summary["changed_containers"], 1)
            self.assertEqual((source / "one.quest_bxml").read_bytes(), bxml)
            self.assertNotEqual((output / "one.quest_bxml").read_bytes(), bxml)

    def test_stale_source_and_invalid_replacement_are_rejected(self):
        payload = lua_payload()
        raw = b"\x02" + struct.pack("<I", len(payload)) + payload
        rows = CODEC.find_bxml_payloads(raw, "sample.quest_bxml")
        invalid = b"not a Lua payload"
        with self.assertRaisesRegex(ValueError, "Lua-family header"):
            CODEC.rebuild_bxml(raw, rows, {rows[0]["occurrence_key"]: invalid})

        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "source"
            source.mkdir()
            asset = source / "sample.quest_bxml"
            asset.write_bytes(raw)
            extraction = root / "extracted"
            CODEC.extract_corpus(source, extraction)
            asset.write_bytes(raw + b"changed")
            with self.assertRaisesRegex(ValueError, "source hash changed"):
                CODEC.verify_roundtrip(source, extraction)

    def test_unframed_signatures_are_reported_not_extracted(self):
        payload = lua_payload()
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "source"
            source.mkdir()
            (source / "unknown.bin").write_bytes(b"prefix" + payload + b"suffix")
            found = CODEC.scan_corpus(source)
            self.assertEqual(found["occurrences"], [])
            self.assertEqual(len(found["unclassified_signatures"]), 1)
            self.assertTrue(found["unclassified_signatures"][0]["valid_type_table"])

    def test_manifest_requires_complete_payload_set(self):
        payload = lua_payload()
        raw = b"\x02" + struct.pack("<I", len(payload)) + payload
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "source"
            source.mkdir()
            (source / "sample.quest_bxml").write_bytes(raw)
            extraction = root / "extracted"
            CODEC.extract_corpus(source, extraction)
            manifest_path = extraction / "manifest.json"
            manifest = json.loads(manifest_path.read_text())
            manifest["occurrences"][0]["payload_sha256"] = "0" * 64
            manifest_path.write_text(json.dumps(manifest))
            with self.assertRaisesRegex(ValueError, "manifest payload hash mismatch"):
                CODEC.verify_roundtrip(source, extraction)


if __name__ == "__main__":
    unittest.main()
