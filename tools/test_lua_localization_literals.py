import hashlib
import tempfile
import unittest
from pathlib import Path

import index_lua_localization_literals as INDEX


class LuaLocalizationLiteralTests(unittest.TestCase):
    def test_only_exact_ascii_runs_match_and_duplicate_ids_are_retained(self):
        payload = (
            b"Lead Quality Assurance Tester\0"
            b"Prefix Lead Quality Assurance Tester Suffix\0"
            b"Business Development Manager\0"
            b"Player\0"
        )
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / "payload.bin").write_bytes(payload)
            occurrence = {
                "container_kind": "batch_script",
                "asset_id": 10,
                "container_path": "scripts.batch",
                "record_offset": 100,
                "record_bytes": 200,
                "payload_offset": 130,
                "payload_bytes": len(payload),
                "payload_sha256": hashlib.sha256(payload).hexdigest(),
                "payload_path": "payload.bin",
                "record_name": "TestScript",
            }
            manifest = {"occurrences": [occurrence]}
            english = [
                {"ID_Linha": "20", "Texto": "Lead Quality Assurance Tester"},
                {"ID_Linha": "21", "Texto": "Lead Quality Assurance Tester"},
                {"ID_Linha": "22", "Texto": "Business Development Manager"},
                {"ID_Linha": "23", "Texto": "Quality Assurance Tester"},
                {"ID_Linha": "24", "Texto": "Player"},
            ]
            registry = {
                "10": {
                    "registry_name": "test_script",
                    "source_path": "c:/test.lua",
                }
            }

            rows = INDEX.build_literal_rows(manifest, root, english, registry)
            self.assertEqual(
                [(row[12], row[13]) for row in rows],
                [
                    ("20", "Lead Quality Assurance Tester"),
                    ("21", "Lead Quality Assurance Tester"),
                    ("22", "Business Development Manager"),
                ],
            )
            self.assertEqual(rows[0][16], INDEX.USAGE_LIMIT)
            self.assertEqual(rows, sorted(rows, key=lambda row: (int(row[11]), int(row[12]))))

    def test_edited_payload_is_rejected(self):
        payload = b"Changed"
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / "payload.bin").write_bytes(payload)
            occurrence = {
                "container_kind": "batch_script",
                "asset_id": 10,
                "payload_path": "payload.bin",
                "payload_sha256": "0" * 64,
            }
            with self.assertRaisesRegex(ValueError, "Edited or stale"):
                INDEX.build_literal_rows(
                    {"occurrences": [occurrence]},
                    root,
                    [{"ID_Linha": "1", "Texto": "Changed"}],
                    {
                        "10": {
                            "registry_name": "test",
                            "source_path": "test.lua",
                        }
                    },
                )

    def test_non_script_payloads_are_not_promoted_to_script_literal_matches(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            payload = b"Business Development Manager"
            (root / "payload.bin").write_bytes(payload)
            occurrence = {
                "container_kind": "bxml",
                "asset_id": "4",
                "payload_path": "payload.bin",
                "payload_sha256": hashlib.sha256(payload).hexdigest(),
            }
            self.assertEqual(
                INDEX.build_literal_rows(
                    {"occurrences": [occurrence]},
                    root,
                    [{"ID_Linha": "1", "Texto": "Business Development Manager"}],
                    {},
                ),
                [],
            )


if __name__ == "__main__":
    unittest.main()
