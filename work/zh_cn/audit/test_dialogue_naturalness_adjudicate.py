import importlib.util
from pathlib import Path
import unittest


SCRIPT = Path(__file__).with_name("dialogue-naturalness-adjudicate-20261107.py")
SPEC = importlib.util.spec_from_file_location("dialogue_naturalness_adjudicate", SCRIPT)
ADJUDICATE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(ADJUDICATE)


class AdjudicationTests(unittest.TestCase):
    def setUp(self):
        self.batch = [{
            "id": 7,
            "ko": "우린 {1}을 기다려.",
            "ja": "私たちは{1}を待っている。",
            "en": "We are waiting for {1}.",
            "findings": {},
        }]

    def test_accepts_source_supported_minimal_correction(self):
        result = {"decisions": [{
            "id": 7,
            "decision": "corrected",
            "evidence_language": "en",
            "evidence_quote": "We are waiting",
            "reason": "원문은 현재 기다리는 중이라고 하므로 표현을 자연스럽게 다듬는다.",
            "revised_ko": "우린 {1}을 기다리고 있어.",
        }]}
        self.assertIs(ADJUDICATE.validate_decisions(result, self.batch), result)

    def test_rejects_missing_or_reordered_candidate(self):
        result = {"decisions": [{
            "id": 8,
            "decision": "uncertain",
            "evidence_language": "",
            "evidence_quote": "",
            "reason": "문맥이 부족하다.",
            "revised_ko": "",
        }]}
        with self.assertRaisesRegex(ValueError, "coverage"):
            ADJUDICATE.validate_decisions(result, self.batch)

    def test_preserves_invalid_corrections_as_uncertain(self):
        result = {"decisions": [{
            "id": 7,
            "decision": "corrected",
            "evidence_language": "en",
            "evidence_quote": "not in source",
            "reason": "수정 근거",
            "revised_ko": "우린 기다리고 있어.",
        }]}
        ADJUDICATE.preserve_unverifiable_as_uncertain(result, self.batch)
        ADJUDICATE.validate_decisions(result, self.batch)
        self.assertEqual(result["decisions"][0]["decision"], "uncertain")
        self.assertEqual(len(result["validation_issues"]), 1)

    def test_preserves_placeholder_changes_as_uncertain(self):
        result = {"decisions": [{
            "id": 7,
            "decision": "corrected",
            "evidence_language": "en",
            "evidence_quote": "We are waiting",
            "reason": "수정 근거",
            "revised_ko": "우린 기다리고 있어.",
        }]}
        ADJUDICATE.preserve_unverifiable_as_uncertain(result, self.batch)
        ADJUDICATE.validate_decisions(result, self.batch)
        self.assertEqual(result["decisions"][0]["decision"], "uncertain")
        self.assertEqual(result["decisions"][0]["revised_ko"], "")

    def test_batches_cover_every_candidate_once(self):
        candidates = [
            {"id": index, "ko": "문장", "ja": "台詞", "en": "Line", "findings": {}}
            for index in range(11)
        ]
        batches = ADJUDICATE.make_batches(candidates, max_rows=4, max_chars=10000)
        self.assertEqual([row["id"] for batch in batches for row in batch], list(range(11)))
        self.assertTrue(all(len(batch) <= 4 for batch in batches))

    def test_verification_requires_exact_ids_and_source_evidence(self):
        batch = [{
            "id": 7,
            "ko": "현재 문장",
            "ja": "原文",
            "en": "Source sentence",
            "proposed_ko": "수정 문장",
        }]
        result = {"decisions": [{
            "id": 7,
            "decision": "apply",
            "evidence_language": "en",
            "evidence_quote": "Source sentence",
            "reason": "원문의 의미를 더 정확히 반영한다.",
        }]}
        self.assertIs(ADJUDICATE.validate_verification(result, batch), result)
        result["decisions"][0]["evidence_quote"] = "not in source"
        with self.assertRaisesRegex(ValueError, "source row"):
            ADJUDICATE.validate_verification(result, batch)

    def test_unverifiable_apply_is_preserved_as_hold(self):
        batch = [{"id": 7, "ko": "현재", "ja": "原文", "en": "Source"}]
        result = {"decisions": [{
            "id": 7,
            "decision": "apply",
            "evidence_language": "en",
            "evidence_quote": "missing",
            "reason": "근거",
        }]}
        ADJUDICATE.preserve_unverifiable_as_hold(result, batch)
        ADJUDICATE.validate_verification(result, batch)
        self.assertEqual(result["decisions"][0]["decision"], "hold")
        self.assertEqual(len(result["validation_issues"]), 1)


if __name__ == "__main__":
    unittest.main()
