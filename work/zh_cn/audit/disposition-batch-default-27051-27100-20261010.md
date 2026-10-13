# Disposition and Edit Batch: `default` IDs 27051-27100

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27051-27100, checked against English,
  Japanese, Chinese, active Korean, and historical terminology questions.
- Decisions: zero accepted, two `not an issue`, and six uncertain.
- No CSV wording was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27052 | `House of Sorrows` -> `슬픔의 가문` | Uncertain: English and Japanese identify a named House, while Korean records use several translated and transliterated forms and the organization's exact nature is unsettled. Preserve the current form pending corpus-wide terminology review. |
| 27061 | `{*1[Passive]}` -> `{*1[지속]}` | Uncertain: the `{*1[...]}` wrapper and order are intact, but `지속` may read as duration rather than a passive ability label. Defer the visible-label decision to consolidated UI terminology review. |
| 27067, 27071, 27098 | Savant / Testament or Belen Covenant / Missives / Praetorians | Uncertain: proper titles and institutional terminology require alignment. Japanese and Chinese call the Testament a Belen Covenant at 27071, unlike English; at 27098 the source says to plant the missives without Grim's knowledge, while Korean's `들키지 않게` does not name him as the person unaware. Preserve pending context and terminology decisions. |
| 27078, 27099 | Deep Gloam and Rathir founding poems | Uncertain: the Korean preserves the five-line and three-line layouts, but imagery and phrasing need a literary pass against the surrounding poems. Do not rewrite from isolated lines. |
| 27089 | `Just Fight` -> `그냥 싸워` | Uncertain: Korean follows the English imperative/title literally; Japanese and Chinese give a “righteous fight” reading. Keep the English-grounded draft until the UI context and intended label are established. |
| 27100 | `Plasma` -> `플라스마` | Uncertain: retain the current transliteration pending alignment with the historical `Plasma`/`Dispelling` terminology question and related effect/item strings. |
| 27051, 27053-27060, 27062-27066, 27068-27070, 27072-27077, 27079-27088, 27090-27097 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed wording generally retains the English meaning and Japanese-supported tone. Separate named-term questions above remain open. |
| 27061 | Passive marker structure | Not an issue: the `{*1[...]}` runtime wrapper and marker order match the locale references; only the Korean visible label remains uncertain. |

## Verification

- The preliminary key/order, line-break, and runtime-token checks remain valid.
  The five line breaks at ID 27078 and three at ID 27099 are preserved; the
  passive marker wrapper at ID 27061 is intact.
- English `Testament` versus Japanese/Chinese `Belen Covenant` at ID 27071
  remains explicitly unresolved; no locale was treated as decisive without
  context.
- No CSV wording, IDs, variants, or row order changed.
- Active default CSV SHA-256 remains
  `efd7e58202bb7744a2949fb6e2580a397901077813a20171dcd6f9ae4b73c11d`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings.
- Register totals after this batch: 848 accepted, 2,934 `not an issue`, and
  4,873 uncertain (8,655 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27101; 38,034 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

D-19343-D-19345 resolve six prior uncertainty IDs (two accepted wording
corrections and four `not an issue`); D-19346 retains 27052, 27067, and 27071
for House/Savant terminology and the Testament/Belen Covenant source
conflict. Totals: 2,223 accepted / 24,650 `not an issue` / 11,651 uncertain
(38,524). See
[`consolidated context review`](consolidated-context-review-default-27051-27100-20261011.md).
