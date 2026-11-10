import importlib.util
from pathlib import Path
import unittest


SCRIPT = Path(__file__).with_name("build_dialogue_context_index.py")
SPEC = importlib.util.spec_from_file_location("dialogue_context_index", SCRIPT)
INDEX = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(INDEX)


class DialogueContextIndexTests(unittest.TestCase):
    def test_matches_exact_keys_once_per_asset_and_leaves_voice_unmapped(self):
        first = b"12345678"
        second = b"abcdefgh"
        asset = (
            b"QUEST_ID\x00SQ01\x00NPC_TEST_One\x00"
            b"conditional_quest_dialog_line_SQ01_TOPIC_0\x00"
            + first
            + first
            + second
        )
        rows = INDEX.build_rows(
            [first, second],
            [("100.quest_bxml", asset), ("200.quest_bxml", b"no key here")],
        )

        self.assertEqual(len(rows), 2)
        self.assertEqual([row[1] for row in rows], [0, 1])
        self.assertEqual(rows[0][3], "SQ01")
        self.assertEqual(rows[0][4], "NPC_TEST_One")
        self.assertEqual(rows[0][5], 1)
        self.assertEqual(rows[0][6], "exact_8_byte_key_match")
        self.assertEqual(rows[0][7], "not_mapped_to_key")
        self.assertEqual(rows[0][8], "unknown")

    def test_rejects_duplicate_hash_keys(self):
        class FakePath:
            def read_bytes(self):
                return b"12345678" * 2

        with self.assertRaisesRegex(ValueError, "duplicate"):
            INDEX.read_default_keys(FakePath())

    def test_tsv_is_stable_and_escapes_tabs(self):
        rows = [
            ("default", 1, "100.quest_bxml", "SQ01", "", 0,
             "exact_8_byte_key_match", "not_mapped_to_key", "unknown")
        ]
        rendered = INDEX.render_tsv(rows)
        self.assertTrue(rendered.endswith(b"\n"))
        self.assertIn(b"resource\tid\tasset", rendered)
        self.assertEqual(rendered.count(b"\n"), 2)

    def test_review_ledger_fingerprint_and_statuses_are_checked(self):
        tables = {
            language: {7: f"{language} text"}
            for language in ("en", "ja", "zh", "ko")
        }
        row = {
            "resource": "default",
            "id": "7",
            "review_groups": "TEST",
            "linked_assets": "100.quest_bxml",
            "speaker_attribution": "unassigned",
            "speaker_confidence": "unknown",
            "dialogue_order": "unknown",
            "meaning": "not_flagged",
            "naturalness": "candidate",
            "speech_level": "not_flagged",
            "address": "not_flagged",
            "honorifics": "n/a",
            "format": "not_flagged",
            "overall": "candidate",
            "finding_ref": "test.md",
            "source_fingerprint": INDEX.source_fingerprint(7, tables),
        }
        self.assertEqual(INDEX.validate_review_rows([row], tables), 1)
        with self.assertRaisesRegex(ValueError, "Stale source"):
            INDEX.validate_review_rows(
                [{**row, "source_fingerprint": "stale"}], tables
            )
        with self.assertRaisesRegex(ValueError, "Duplicate review key"):
            INDEX.validate_review_rows([row, row], tables)


if __name__ == "__main__":
    unittest.main()
