# Disposition and Edit Batch: `default` IDs 27201-27250

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27201-27250, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: zero accepted, three `not an issue`, and four uncertain.
- No CSV wording was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27202, 27227, 27250 | the First / Scion / great Houses / the Maid | Uncertain: these terms identify setting-specific titles, cosmology, or factions. Their Korean forms and scope need wider lore alignment; preserve the active translations. |
| 27214 | Temporary 75% Freeze chance | Uncertain: English says the effect temporarily gives a 75% chance, while Korean says the chance temporarily increases to 75%. Japanese and Chinese support the value but do not resolve whether this is a new chance or a modification to an existing one. |
| 27217-27218, 27223, 27237 | Theater of Andronikos / Plant Snapper / Revival Prison / Trellis | Uncertain: named venue, creature, prison, and place/structure terms need cross-corpus alignment; the current forms remain plausible but unconfirmed. |
| 27224, 27243, 27249 | The Tree / dark arm of justice / Aurenda's lantern and “my light” | Uncertain: the capitalization and identity of `The Tree`, the agent/action relation in the justice metaphor, and Aurenda's canonical Korean form require context beyond these strings. |
| 27208, 27239 | Demo and minimap/options UI markers | Not an issue: runtime wrappers and marker order are intact. Localized or retained visible payloads differ by locale as expected and are not structural defects. |
| 27230 | Sleeping woman and magic barrier | Not an issue: English, Japanese, Chinese, and Korean agree that she can cross the barrier but the speakers cannot pass through to reach her. |
| 27201, 27203-27207, 27209-27213, 27215-27216, 27219-27222, 27225-27226, 27228-27229, 27231-27236, 27238, 27240-27242, 27244-27248 | Dialogue, quest, lore, and concise UI/item wording | Not an issue: reviewed wording generally retains the source intent and Japanese-supported voice. Separate terminology candidates are recorded above. |

## Verification

- The preliminary key/order, line-break, and runtime-marker checks remain
  valid. `{*1...}` and `{LINE_SPACE}` at ID 27208 and the localized marker
  wrappers at ID 27239 remain in order.
- The `75%` value at ID 27214 is preserved; no gameplay value was altered.
- No CSV wording, IDs, variants, or row order changed.
- Active default CSV SHA-256 remains
  `efd7e58202bb7744a2949fb6e2580a397901077813a20171dcd6f9ae4b73c11d`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings.
- Register totals after this batch: 848 accepted, 2,942 `not an issue`, and
  4,887 uncertain (8,677 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27251; 37,884 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

D-19352-D-19354 resolve four uncertain IDs with two accepted corrections and
two `not an issue`; 27217 links to D-18241 without recounting. D-19355
retains IDs 27202, 27218, 27224, 27227, 27249, and 27250. Totals: 2,226
accepted / 24,661 `not an issue` / 11,637 uncertain (38,524). See
[`consolidated context review`](consolidated-context-review-default-27201-27250-20261011.md).
