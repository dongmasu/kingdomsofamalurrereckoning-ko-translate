# Disposition and Edit Batch: `default` IDs 27251-27300

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 27251-27300, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: zero accepted, three `not an issue`, and five uncertain.
- No CSV wording was changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27264, 27269, 27273, 27284, 27286, 27288, 27300 | Pteryx / Chaos Critter / Hireling / Great General / Fall of Valor / Luminitsa / Archsage | Uncertain: creature, faction/rank, title, ability, and item/place conventions need broader glossary alignment. Preserve the current forms pending context. |
| 27275 | Great Cycle / fonts | Uncertain: capitalization and plural `fonts` may indicate named cosmology concepts or generic sources. Korean follows the named reading, but the exact referents remain open. |
| 27278 | Guaranteed +300% Critical Hit after Evasion | Uncertain: English, Japanese, and Chinese describe a guaranteed critical-hit effect, while Korean narrows it to critical-hit damage increasing by 300%. The precise mechanic is unresolved; preserve the displayed value and defer wording. |
| 27291 | “I took over his job, and his heart” | Uncertain: Korean reads `his heart` as affection, but the hunting/stalking context and Japanese rendering leave open whether the line means affection, an inherited role, or a literal heart. |
| 27287 | Space before `#NAMED_ICON_360_A#` | Uncertain: wrapper identity and order are intact, but English/Korean include a preceding space while Japanese/Chinese do not. Defer display spacing until the UI layout is known. |
| 27208, 27239 | Demo/minimap/options runtime markers | Not an issue: wrappers and marker order are preserved; locale-specific visible labels are expected. |
| 27278, 27292 | Combat-effect values and stat block | Not an issue: `+300%` and all attack damage, range, duration, projectile, and Mana values remain unchanged. The interpretation of the `+300% Critical Hit` effect at 27278 is separately uncertain. |
| 27251-27263, 27265-27268, 27270-27274, 27276-27277, 27279-27286, 27288-27290, 27293-27299 | Dialogue, quest, lore, and concise UI/item wording | Not an issue: reviewed wording generally retains the English meaning and Japanese-supported tone. Separate proper-name and context candidates remain open. |

## Verification

- The four-locale key/order, line-break, and runtime-token checks from the
  preliminary report remain valid. The four embedded line breaks at ID 27292
  and the `#NAMED_ICON_360_A#` token at ID 27287 are preserved.
- The displayed `+300%` and the ID 27292 stat values are unchanged.
- No CSV wording, IDs, variants, or row order changed.
- Active default CSV SHA-256 remains
  `efd7e58202bb7744a2949fb6e2580a397901077813a20171dcd6f9ae4b73c11d`.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39 bare-LF
  endings.
- Register totals after this batch: 848 accepted, 2,945 `not an issue`, and
  4,894 uncertain (8,687 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27301; 37,834 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.

## Integrated Context Re-review (2026-10-11)

D-19356 resolves eight uncertainties as `not an issue`; D-19357 retains IDs
27278, 27287, and 27291 for mechanic, runtime-spacing, and referent context.
Totals: 2,226 accepted / 24,669 `not an issue` / 11,629 uncertain
(38,524). See
[`consolidated context review`](consolidated-context-review-default-27251-27300-20261011.md).
