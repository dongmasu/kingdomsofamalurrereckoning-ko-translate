import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest import mock


SCRIPT = Path(__file__).with_name("dialogue-naturalness-audit-20261106.py")
SPEC = importlib.util.spec_from_file_location("dialogue_naturalness_audit", SCRIPT)
AUDIT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(AUDIT)


class ReviewValidationTests(unittest.TestCase):
    def setUp(self):
        self.batch = [
            {"id": 11, "ko": "안녕.", "en": "Hello.", "ja": "こんにちは。", "zh": "你好。"},
            {"id": 12, "ko": "여기 있어.", "en": "Here.", "ja": "ここだ。", "zh": "在这里。"},
        ]

    def test_requires_exact_id_coverage_and_order(self):
        result = {
            "reviews": [
                [11, "D", "natural", "", ""],
                [12, "A", "uncertain", "여기 있어.", "말투를 판단하기 어렵다."],
            ]
        }
        self.assertIs(AUDIT.validate_result(result, self.batch), result)

        with self.assertRaisesRegex(ValueError, "coverage"):
            AUDIT.validate_result({"reviews": result["reviews"][:1]}, self.batch)

        reversed_result = {"reviews": list(reversed(result["reviews"]))}
        with self.assertRaisesRegex(ValueError, "coverage"):
            AUDIT.validate_result(reversed_result, self.batch)

    def test_retains_findings_with_invalid_quotes_for_manual_review(self):
        result = {
            "reviews": [
                [11, "D", "awkward", "안녕하세요.", "문체가 어색하다."],
                [12, "D", "natural", "", ""],
            ]
        }
        AUDIT.validate_result(result, self.batch)
        self.assertEqual(result["reviews"][0][2], "uncertain")
        self.assertEqual(result["reviews"][0][3], self.batch[0]["ko"])
        self.assertEqual(
            result["validation_issues"][0]["issue"],
            "finding-quote-not-in-korean-row",
        )

    def test_union_keeps_one_reviewer_findings_and_disagreements(self):
        first = [
            [11, "D", "awkward", "안녕.", "문장이 지나치게 딱딱하다."],
            [12, "A", "natural", "", ""],
        ]
        second = [
            [11, "D", "natural", "", ""],
            [12, "D", "awkward", "여기 있어.", "구어로 부자연스럽다."],
        ]
        candidates = AUDIT.combine_reviews({
            AUDIT.REVIEWERS[0]: first,
            AUDIT.REVIEWERS[1]: second,
        })

        self.assertEqual([item["id"] for item in candidates], [11, 12])
        self.assertTrue(candidates[0]["disagreement"])
        self.assertEqual(
            candidates[1]["findings"][AUDIT.REVIEWERS[1]]["verdict"], "awkward"
        )

    def test_batches_cover_each_input_once(self):
        rows = [
            {"id": index, "ko": "짧은 대사", "en": "Short line", "ja": "短い台詞", "zh": "短句"}
            for index in range(9)
        ]
        batches = AUDIT.make_batches(rows, max_rows=3, max_chars=10_000)
        flattened = [row["id"] for batch in batches for row in batch]
        self.assertEqual(flattened, list(range(9)))
        self.assertTrue(all(len(batch) <= 3 for batch in batches))

    def test_rejects_misaligned_language_ids(self):
        with tempfile.TemporaryDirectory() as temporary:
            paths = {}
            for language in ("ko", "en", "ja", "zh"):
                path = Path(temporary) / f"{language}.csv"
                ids = ("0", "2") if language == "ja" else ("0", "1")
                body = "ID_Linha;Texto\r\n" + "".join(
                    f"{row_id};text\r\n" for row_id in ids
                )
                path.write_bytes(b"\xef\xbb\xbf" + body.encode("utf-8"))
                paths[language] = path
            with self.assertRaisesRegex(ValueError, "IDs"):
                AUDIT.load_corpus(paths, expected_rows=None)

    def test_resume_uses_verified_cache_and_rejects_stale_snapshot(self):
        batch = [self.batch[0]]
        result = {"reviews": [[11, "D", "natural", "", ""]]}
        with tempfile.TemporaryDirectory() as temporary:
            with mock.patch.object(AUDIT, "OUT", Path(temporary)):
                with mock.patch.object(
                    AUDIT, "call_model", return_value=(result, {})
                ) as call_model:
                    AUDIT.run_batch(
                        AUDIT.REVIEWERS[0], 0, batch, "snapshot-a"
                    )
                    cached = AUDIT.run_batch(
                        AUDIT.REVIEWERS[0], 0, batch, "snapshot-a"
                    )
                    self.assertEqual(cached[2], "cached")
                    call_model.assert_called_once()
                    with self.assertRaisesRegex(ValueError, "snapshot"):
                        AUDIT.run_batch(
                            AUDIT.REVIEWERS[0], 0, batch, "snapshot-b"
                        )


if __name__ == "__main__":
    unittest.main()
