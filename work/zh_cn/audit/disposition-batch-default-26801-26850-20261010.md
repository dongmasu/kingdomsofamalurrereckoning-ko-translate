# Disposition and Edit Batch: `default` IDs 26801-26850

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26801-26850, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: zero accepted, two `not an issue`, and two uncertain.
- No Korean CSV text was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26801-26805, 26807-26825, 26827-26836, 26838-26839, 26842-26850 | Dialogue, quest, and concise UI/item strings | Not an issue: the reviewed wording generally retains English meaning and Japanese-supported voice. Separate proper-name and terminology questions remain open. |
| 26812, 26840-26841, 26844 | Bare-Handed Brawl count / combat values / equipment rating | Not an issue: the displayed count and all listed damage, duration, defense, and efficacy values match the English source. |
| 26805-26806, 26808-26811, 26815, 26821-26824, 26828, 26830-26833, 26837-26838, 26846-26849 | Aster / Mitharan Rivets / Midden / Weeping King / Dverga / Ansilla / Tuatha / Bonewhite Forest / Trueshield / Sparrows and related names | Uncertain: canonical spellings and terms need corpus-wide alignment. English misspells `Clarity` as `Clairty` at ID 26806; Korean follows the apparent intended meaning, but the item term is not settled. |
| 26815 | “Dverga pieces” | Uncertain: Korean `드베르가 유물` may over-specify the nature of the pieces; English, Japanese, and Chinese do not establish the exact inventory item category. |

## Verification

- Four-locale key/order, embedded-line-break, and runtime-token checks from
  the preliminary report were retained. ID 26837's six embedded line breaks
  and all combat values remain unchanged.
- No Korean CSV was edited. Active default CSV SHA-256 remains
  `76cffc6701a1943ad4d5efe4af7cb8cf60c2d1495a49c20b9b3e8ab075531843`.
- Register totals after this batch: 843 accepted, 2,924 `not an issue`, and
  4,855 uncertain (8,622 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26851; 38,284 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Contextual Re-review (2026-10-11)

D-19326-D-19327 re-reviewed the 22 unique uncertainties in this range;
the overlapping ID 26815 was counted once. The unsupported artifact
classification at ID 26815 was removed (`유물` to `조각`); the other 21
candidate rows were cleared as `not an issue`. The embedded poem layout,
runtime checks, and values remain unchanged. See
[`consolidated-context-review-default-26801-26850-20261011.md`](consolidated-context-review-default-26801-26850-20261011.md).
