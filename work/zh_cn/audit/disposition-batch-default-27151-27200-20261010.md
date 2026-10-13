# Disposition and Edit Batch: `default` IDs 27151-27200

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27151-27200, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: zero accepted, two `not an issue`, and five uncertain.
- No CSV wording was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27152, 27195 | House of Sorrows / Warsworn | Uncertain: these are named organizations, but their institutional meaning and Korean display convention remain unresolved in the historical audit. Preserve the existing traceable forms pending corpus-wide alignment. |
| 27164 | `Moderate increase to Health` -> `체력 소폭 증가` | Uncertain: English and Japanese indicate a moderate/medium increase, while Chinese says slight. The magnitude conflict cannot be settled from locale text alone; do not change the stat label yet. |
| 27168, 27191 | Master's Pick / Pledgeshield | Uncertain: `명장의 곡괭이` is plausible, but the named artifact convention and whether Pledgeshield is a rank/title need broader context. |
| 27189 | `of Fire Attenuation` -> `화염 방어` | Uncertain: this is an isolated English fragment; Japanese and Chinese differ on the fire-related category. Verify the game/stat term before normalizing. |
| 27196 | `Dame Oleyn` -> `올레인 경녀` | Uncertain: the person/name is identifiable, but the Korean convention for the title `Dame` is not established by this line. |
| 27155, 27160-27161, 27175-27176 | QA label / stone prompt / deuce / trade ledger / Thresh venom | Not an issue: the QA string remains a label, the card-game deuce and stone question retain their basic sense, and the ledger/venom passage preserves the described object and rare reaction. Context-dependent terminology remains open separately. |
| 27151, 27153-27154, 27156-27159, 27162-27163, 27165-27167, 27169-27174, 27177-27190, 27192-27194, 27197-27200 | Dialogue, lore, quest, and concise UI/item wording | Not an issue: reviewed wording generally preserves the English meaning and Japanese-supported tone. Proper names remain subject to the project-wide terminology pass. |

## Verification

- English, Japanese, Chinese, and Korean key/order, line-break, and
  runtime-token checks from the preliminary report remain valid.
- The `Moderate`/medium/slight disagreement at ID 27164 remains open; no
  locale was treated as authoritative over the others.
- No CSV wording, IDs, variants, or row order changed.
- Active default CSV SHA-256 remains
  `efd7e58202bb7744a2949fb6e2580a397901077813a20171dcd6f9ae4b73c11d`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings.
- Register totals after this batch: 848 accepted, 2,939 `not an issue`, and
  4,883 uncertain (8,670 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27201; 37,934 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

D-19349 resolves ID 27164 with one accepted magnitude correction; D-19350
clears 27168 as `not an issue`; D-19351 retains IDs 27152, 27189, 27191,
27195, and 27196. Totals: 2,224 accepted / 24,659 `not an issue` /
11,641 uncertain (38,524). See
[`consolidated context review`](consolidated-context-review-default-27151-27200-20261011.md).
