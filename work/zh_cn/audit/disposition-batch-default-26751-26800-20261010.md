# Disposition and Edit Batch: `default` IDs 26751-26800

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26751-26800, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and two uncertain.
- Accepted correction at ID 26796 is applied to the active Korean CSV.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26796 | Kandrian Keep fortified | Accepted: change the repetitive `칸드리안 요새를 요새화했어` to `칸드리안 요새의 방어를 강화했어`. English `fortified` and Japanese `砦を守ることを選んだ` support reinforcing/defending the fort. |
| 26751-26762, 26764-26782, 26784-26795, 26797-26800 | Dialogue, quest, and concise UI/item wording | Not an issue: the reviewed wording generally preserves English meaning and Japanese-supported tone. Separate terminology and lore questions remain open. |
| 26763, 26780 | Socket-help markers / silverware cost variable | Not an issue: `{LINE_SPACE}` and `{LINE_LEFT}` remain in source order, and the exact cost variable and Gold label are preserved. |
| 26751, 26756, 26762-26765, 26767-26770, 26772-26774, 26780-26783, 26786-26788, 26791, 26795-26799 | Names / race and profession terms / Tyrenium / lore terminology | Uncertain: canonical forms need corpus-wide alignment. In particular, active `티레니움` at ID 26783 conflicts with historical `타이레니움`; do not normalize it in isolation. |
| 26783 | Apotyre/Tyrenium chapter | Uncertain: all nine embedded line breaks and the historical sequence are retained, but several names, class metaphors, and the Tyrenium spelling need integrated review. |

## Verification

- The preliminary report's four-locale key/order, line-break, and token checks
  were retained. ID 26783 still has nine embedded line breaks; ID 26763 keeps
  both layout markers in order.
- Only ID 26796's `Texto` wording was edited. No IDs, variants, or row order
  were changed.
- The active default CSV preserves its UTF-8 BOM and pre-existing newline
  counts (72,046 CRLF endings and 39 bare-LF endings).
- Active default CSV SHA-256:
  `76cffc6701a1943ad4d5efe4af7cb8cf60c2d1495a49c20b9b3e8ab075531843`.
- Register totals after this batch: 843 accepted, 2,922 `not an issue`, and
  4,853 uncertain (8,618 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26801; 38,334 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Contextual Re-review (2026-10-11)

D-19324-D-19325 re-reviewed the 26 unique uncertain keys in this range,
counting repeated ID 26783 once and linking the already accepted ID 26796.
ID 26770's unclear agent construction was corrected; the remaining 24
previously unresolved rows were cleared as `not an issue`. The accepted
Kandrian Keep correction at 26796 remains unchanged. See
[`consolidated-context-review-default-26751-26800-20261011.md`](consolidated-context-review-default-26751-26800-20261011.md).
