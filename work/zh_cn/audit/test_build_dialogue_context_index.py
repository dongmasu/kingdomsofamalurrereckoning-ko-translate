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

    def test_asset_catalog_covers_all_assets_and_reports_ledger_gaps(self):
        first = b"12345678"
        second = b"abcdefgh"
        assets = [
            (
                "100.quest_bxml",
                b"QUEST_ID\x00SQ01\x00NPC_TEST_One\x00"
                b"dialog_line_SQ01_TOPIC_0\x00dialog_line_SQ01_TOPIC_1\x00"
                + first
                + second,
            ),
            ("200.quest_bxml", b"NPC_TEST_Two\x00" + first),
            ("300.quest_bxml", b"no localization keys"),
        ]
        review_rows = [
            {"id": "0", "linked_assets": "100.quest_bxml|200.quest_bxml"}
        ]

        rows = INDEX.build_asset_catalog(
            [first, second], assets, review_rows
        )

        self.assertEqual(len(rows), 3)
        self.assertEqual(
            rows[0],
            (
                "100.quest_bxml",
                "SQ01",
                "NPC_TEST_One",
                2,
                1,
                2,
                "dialog_line_SQ01_TOPIC_0,dialog_line_SQ01_TOPIC_1",
                "single_quest_single_npc_candidate",
                "partially_recorded",
            ),
        )
        self.assertEqual(rows[1][7], "single_npc_no_quest_asset_no_dialog_handler")
        self.assertEqual(rows[1][8], "all_ids_recorded")
        self.assertEqual(rows[2][7], "no_default_key_link")
        self.assertEqual(rows[2][8], "no_default_key_links")

    def test_id_catalog_includes_unlinked_ids_and_preserves_review_scope(self):
        first = b"12345678"
        second = b"abcdefgh"
        assets = [
            (
                "100.quest_bxml",
                b"QUEST_ID\x00SQ01\x00NPC_TEST_One\x00"
                b"dialog_line_SQ01_TOPIC_0\x00" + first,
            )
        ]
        index_rows = INDEX.build_rows([first, second], assets)
        catalog_rows = INDEX.build_asset_catalog([first, second], assets, [])
        review_rows = [
            {
                "id": "0",
                "linked_assets": "100.quest_bxml",
                "review_groups": "SQ01",
                "speaker_attribution": "unassigned",
                "speaker_confidence": "asset_level_only",
                "dialogue_order": "unknown",
                "finding_ref": "sq01-review.md",
            }
        ]

        rows = INDEX.build_id_catalog(
            [first, second], index_rows, catalog_rows, review_rows
        )

        self.assertEqual(len(rows), 2)
        self.assertEqual(
            rows[0],
            (
                "default",
                "0",
                "quest_asset_linked",
                "100.quest_bxml",
                "SQ01",
                "NPC_TEST_One",
                "single_quest_single_npc_candidate",
                "SQ01",
                "reviewed",
                "unassigned",
                "asset_level_only",
                "unknown",
                "sq01-review.md",
            ),
        )
        self.assertEqual(rows[1][1:4], ("1", "no_quest_asset_match", ""))
        self.assertEqual(rows[1][7:13], ("", "not_reviewed", "unassigned",
                                         "unknown", "unknown", ""))

    def test_asset_catalog_serialization_is_stable(self):
        rows = [
            ("100.quest_bxml", "SQ01", "NPC_TEST_One", 1, 1, 1,
             "dialog_line_SQ01_TOPIC_0", "single_quest_single_npc_candidate",
             "all_ids_recorded")
        ]
        rendered = INDEX.render_tsv(rows, INDEX.CATALOG_HEADER)
        self.assertIn(b"asset\tquest_ids\tnpc_symbols\tmatched_id_count", rendered)
        self.assertTrue(rendered.endswith(b"\n"))
        self.assertEqual(rendered.count(b"\n"), 2)

    def test_classifies_grouping_evidence_without_inventing_key_speakers(self):
        classify = INDEX.classify_asset_grouping
        self.assertEqual(
            classify("", "NPC_TEST_One", 1, 4),
            "single_npc_no_quest_asset_candidate",
        )
        self.assertEqual(
            classify("", "NPC_TEST_One,NPC_TEST_Two", 1, 4),
            "multi_npc_no_quest_asset",
        )
        self.assertEqual(
            classify("", "", 1, 4),
            "dialog_handlers_no_quest_or_npc",
        )
        self.assertEqual(
            classify("SQ01", "NPC_TEST_One", 0, 4),
            "single_quest_single_npc_no_dialog_handler",
        )
        self.assertEqual(
            classify("SQ01,SQ02", "NPC_TEST_One", 2, 4),
            "multi_quest_asset",
        )

    def test_asset_metadata_recognizes_dlc_prefixed_npc_symbols(self):
        quest_ids, npc_symbols, handlers = INDEX.asset_details(
            b"QUEST_ID\x00DLC1_SQ08\x00"
            b"DLC1_NPC_GAL_VAR_AsaArding\x00"
            b"conditional_quest_dlc1_sq05_dialog_line_0\x00"
        )

        self.assertEqual(quest_ids, "DLC1_SQ08")
        self.assertEqual(npc_symbols, "DLC1_NPC_GAL_VAR_AsaArding")
        self.assertEqual(handlers, ["dialog_line_0"])

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
