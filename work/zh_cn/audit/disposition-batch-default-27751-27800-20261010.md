# Disposition and Edit Batch: `default` IDs 27751-27800

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27751-27800, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, three `not an issue`, and one uncertain.
- Accepted corrections at IDs 27771 and 27796 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27771 | `네 친구 델프처럼 멍청하다고 말하지 마라` | Accepted: change to `설마 네 친구 델프처럼 멍청하진 않겠지.` English `Don't tell me you're as thick as your friend` and Chinese use an incredulous warning, not an order to keep silent. Japanese also renders the insult as a direct comparison. |
| 27796 | `어두운 곳에서` for `in dim light` | Accepted: change to `희미한 조명 아래에서도 눈에 띄지 않고 언제든 편하게 신을 수 있다.` English, Japanese, and Chinese specify low/dim lighting, not a dark location; the new phrasing also reads naturally as an item description. |
| 27756 | Vacancy in the House of Ballads | Not an issue: Korean `빈자리` conveys an open seat/position. Japanese `空席` and Chinese `虚席` support the same House-seat reading; no structural reordering is needed. |
| 27755, 27762, 27765, 27800 | Damage values, embedded break, markup, and variables | Not an issue: values `400`, `35`, and `145`, the line break, wrapper identities/order, `$STR0`, and `$STR1` are preserved. The wording of Fate/Reckoning and the localized `Socketed` convention remain separate terminology questions. |
| 27752-27754, 27757-27758, 27761, 27763-27766, 27769-27770, 27773-27774, 27783-27785, 27788-27789, 27792-27795, 27797-27799 | Dialogue, objectives, item prose, and Astor's sales-pitch repetition | Not an issue: the Korean generally preserves English meaning and Japanese-supported voice. Astor's repeated “competitive” sales phrasing remains intentional, and the ordinary-rocks punchline is intact. |
| 27751, 27759-27760, 27762, 27767-27768, 27772, 27775-27782, 27786-27787, 27790-27791, 27800 | Bristletongue / names / Templar and Tome / Fate and Reckoning / Gwalchmai / High Fulgen and Bolgan Masters / Sagecraft / Great Cycle / hunt spirit / Socketed | Uncertain: retain current identities and gameplay relations, but defer canonical spellings, title/skill/faction terms, source-context questions, and equipment-suffix policy to integrated glossary/UI review. Structural integrity at 27762 and 27800 is separately recorded as `not an issue`. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the preserved Japanese-derived Korean CSV and active Korean
  CSV were also checked. Historical notes in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` were reconciled.
- The four-locale key/order, line-break, and normalized runtime-token checks
  recorded in the preliminary report remain valid. Numeric values and
  placeholders are unchanged.
- Only Korean `Texto` values at IDs 27771 and 27796 changed in this batch.
  IDs, variants, row order, and source CSVs remain unchanged.
- Active default CSV SHA-256:
  `0c28734a75edddb8f1fb6116c0be29ce2ac4d8f338931dbdb203fae7dacb145d`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 861 accepted, 2,975 `not an issue`, and
  4,945 uncertain (8,781 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27801; 37,334 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Context Re-review (2026-10-12)

D-19396-D-19398 re-reviewed the twenty IDs in D-8786: one accepted suffix
correction, eighteen `not an issue`, and one specific High Fulgen location
question at 27777. D-19397 also resolves the earlier Fateless One question at
27705. See
[`consolidated-context-review-default-27751-27800-20261012.md`](consolidated-context-review-default-27751-27800-20261012.md)
for the full evidence, two-cell edit, backup, and validation.
