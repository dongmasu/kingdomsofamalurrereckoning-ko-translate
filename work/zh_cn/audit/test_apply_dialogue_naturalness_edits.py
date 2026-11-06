import importlib.util
from pathlib import Path
import unittest


SCRIPT = Path(__file__).with_name("apply-dialogue-naturalness-edits-20261107.py")
SPEC = importlib.util.spec_from_file_location("apply_dialogue_naturalness_edits", SCRIPT)
APPLY = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(APPLY)


class ApplyDialogueEditsTests(unittest.TestCase):
    def test_targets_the_id_when_text_is_duplicated(self):
        source = b"\xef\xbb\xbfID_Linha;Texto\r\n0;shared\r\n1;shared\n"
        updated = APPLY.replace_id_field(source, 1, "shared", "changed")
        self.assertEqual(
            updated,
            b"\xef\xbb\xbfID_Linha;Texto\r\n0;shared\r\n1;changed\n",
        )

    def test_preserves_quoted_field_and_embedded_line_endings(self):
        source = b'ID_Linha;Texto\r\n4;"line one\r\nline; two"\r\n'
        updated = APPLY.replace_id_field(
            source, 4, "line one\r\nline; two", "first\r\nsecond; revised"
        )
        self.assertEqual(
            updated,
            b'ID_Linha;Texto\r\n4;"first\r\nsecond; revised"\r\n',
        )

    def test_rejects_line_ending_changes_in_embedded_text(self):
        source = b'ID_Linha;Texto\r\n4;"line one\r\nline two"\r\n'
        with self.assertRaisesRegex(ValueError, "line-ending"):
            APPLY.replace_id_field(source, 4, "line one\r\nline two", "one\nline two")

    def test_preflight_preserves_bom_rows_and_line_endings(self):
        source = b"\xef\xbb\xbfID_Linha;Texto\r\n0;hello\r\n1;hello\n"
        approved = [{
            "id": "1",
            "original_ko": "hello",
            "proposed_ko": "greetings",
        }]
        updated = APPLY.prepare_edits(source, approved)
        self.assertTrue(updated.startswith(b"\xef\xbb\xbf"))
        self.assertEqual(APPLY.read_csv_rows(updated), {0: "hello", 1: "greetings"})
        self.assertEqual(APPLY.line_ending_counts(source), APPLY.line_ending_counts(updated))

    def test_reverse_manifest_restores_the_exact_source_hash(self):
        source = b"\xef\xbb\xbfID_Linha;Texto\r\n0;hello\r\n1;hello\n"
        approved = [{
            "id": "1",
            "original_ko": "hello",
            "proposed_ko": "greetings",
        }]
        updated = APPLY.prepare_edits(source, approved)
        summary = APPLY.verify_applied_bytes(
            updated, approved, __import__("hashlib").sha256(source).hexdigest()
        )
        self.assertTrue(summary["reverse_patch_restores_source"])
        self.assertEqual(summary["applied_edits"], 1)

    def test_final_dispositions_keep_held_and_uncertain_candidates_unresolved(self):
        adjudicated = [
            {"id": "1", "decision": "corrected"},
            {"id": "2", "decision": "retained"},
            {"id": "3", "decision": "uncertain"},
            {"id": "4", "decision": "corrected"},
        ]
        verified = [
            {"id": "1", "verification": "apply", "reason": "근거 확인"},
            {"id": "4", "verification": "hold", "reason": "근거 부족"},
        ]
        final = APPLY.merge_final_dispositions(adjudicated, verified)
        self.assertEqual(
            [item["final_decision"] for item in final],
            ["corrected", "retained", "unresolved", "unresolved"],
        )


if __name__ == "__main__":
    unittest.main()
