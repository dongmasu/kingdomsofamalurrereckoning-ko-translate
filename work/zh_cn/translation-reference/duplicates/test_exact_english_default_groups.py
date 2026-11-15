import unittest

from build_exact_english_default_groups import (
    IndexError,
    build_groups,
    render_jsonl,
)


class ExactEnglishDefaultGroupsTests(unittest.TestCase):
    def test_keeps_contextual_translations_by_id(self):
        rows = {
            "en": {"1": "Goodbye.", "2": "Goodbye.", "3": "Hello."},
            "ja": {"1": "さらば。", "2": "またね。", "3": "こんにちは。"},
            "zh": {"1": "再见。", "2": "回头见。", "3": "你好。"},
            "ko": {"1": "잘 가라.", "2": "또 보자.", "3": "안녕하세요."},
        }

        groups = build_groups(rows)

        self.assertEqual(len(groups), 1)
        self.assertEqual(groups[0]["english"], "Goodbye.")
        self.assertEqual(
            groups[0]["occurrences"],
            [
                {"id": "1", "ja": "さらば。", "zh": "再见。", "ko": "잘 가라."},
                {"id": "2", "ja": "またね。", "zh": "回头见。", "ko": "또 보자."},
            ],
        )
        metadata = render_jsonl(groups, {"en": "fingerprint"}).splitlines()[0]
        self.assertIn(b'"group_count":1', metadata)
        self.assertIn(b'"occurrence_count":2', metadata)
        self.assertIn(b'"source_sha256":{"en":"fingerprint"}', metadata)

    def test_rejects_language_id_mismatch(self):
        rows = {
            "en": {"1": "A", "2": "A"},
            "ja": {"1": "a"},
            "zh": {"1": "a", "2": "a"},
            "ko": {"1": "a", "2": "a"},
        }

        with self.assertRaises(IndexError):
            build_groups(rows)


if __name__ == "__main__":
    unittest.main()
