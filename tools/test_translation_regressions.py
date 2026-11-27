import csv
from pathlib import Path
import unittest


DEFAULT_CSV = (
    Path(__file__).resolve().parents[1]
    / "work/zh_cn/locatexts_zh_cn.koalocatext_default.csv"
)
EXPECTED_35608 = (
    "나는 W. 에문다스(W. Emundas)야. '진기한 물품점"
    "(Oddities and Curios, by W. Emundas)' 주인이지. "
    "에메어(Emaire) 마을에 산 지도 거의 1년 됐어. 여긴 지긋지긋해. "
    "알파르(Alfar) 이야기는 꺼내지도 마."
)


def read_translation(row_id):
    with DEFAULT_CSV.open(encoding="utf-8-sig", newline="") as stream:
        rows = [
            row
            for row in csv.DictReader(stream, delimiter=";")
            if row["ID_Linha"] == str(row_id)
        ]
    if len(rows) != 1:
        raise AssertionError(
            f"Expected one default row for {row_id}, found {len(rows)}"
        )
    return rows[0]["Texto"]


class TranslationRegressionTests(unittest.TestCase):
    def test_35608_does_not_repeat_the_name_in_the_translated_shop_label(self):
        text = read_translation(35608)

        self.assertEqual(text, EXPECTED_35608)
        self.assertEqual(text.count("W. 에문다스"), 1)
        self.assertIn(
            "'진기한 물품점(Oddities and Curios, by W. Emundas)' 주인이지.",
            text,
        )

    def test_explicit_element_triads_use_consistent_element_names(self):
        expected_phrases = {
            3797: "불과 번개, 얼음",
            4336: "번개와 불, 얼음",
            34908: "번개와 불, 얼음",
            42280: "불, 얼음, 번개",
            42825: "불, 얼음, 번개의 원소",
            51469: "불, 얼음, 번개의 세 원소",
            51550: "불, 번개, 얼음의 신비 원소",
            55176: "불과 얼음과 번개가",
            59011: "불과 관계있고 세데아스(Sedeas)가 얼음과 관계있듯",
        }
        for row_id, expected_phrase in expected_phrases.items():
            with self.subTest(row_id=row_id):
                text = read_translation(row_id)
                self.assertIn(expected_phrase, text)
                self.assertNotIn("서리", text)
                self.assertNotIn("화염", text)

    def test_combat_damage_type_names_remain_distinct(self):
        text = read_translation(64998)

        self.assertIn("화염(Fire)", text)
        self.assertIn("냉기(Ice)", text)
        self.assertIn("번개(Lightning)", text)


if __name__ == "__main__":
    unittest.main()
