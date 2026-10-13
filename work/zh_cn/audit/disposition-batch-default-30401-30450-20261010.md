# Disposition and Edit Batch: `default` IDs 30401-30450

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30401-30450, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, prior decisions, and recurring
  terminology.
- Decisions: two accepted, seven `not an issue`, and twelve uncertain.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 30419 | `노움 중에서도 가장 뛰어난 지성인, 곧 학자들이 존재의 근본 법칙을 밝혀내는 곳이지.` | `노움 중에서도 가장 뛰어난 지성인, 곧 학자들이 존재의 근본 법칙을 정립하는 곳이지.` | English says the Scholars `determine` the underlying laws; Japanese and Chinese likewise say they decide/set them. `밝혀내다` instead makes the laws pre-existing facts that the Scholars discover. |
| 30421 | `네 존경을 얻었군, 새그렐.` | `네가 내 존경을 얻었어, 새그렐.` | English, Japanese, and Chinese all say the addressee earned the speaker's respect. The previous Korean possessive incorrectly made it the addressee's own respect. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30401, 30403, 30405-30406, 30410-30418, 30422-30431, 30433-30435, 30437-30441, 30443-30448 | Remaining dialogue, objectives, concise labels, and ordinary text | Not an issue: the Korean preserves the evident English meaning and register at preliminary level; names and terminology are tracked separately where needed. |
| 30402 | Bed rental and gold-cost variable | Not an issue: English and Japanese say bed, Korean preserves that object, and `$NQD_City_Ysa.m_inn_cost$` remains unchanged. Chinese's “room” does not outweigh the primary source. |
| 30406 | Inventory equipment tutorial controls | Not an issue: the `{*1}` wrappers, `{1}` button marker, indices, order, and localized payload positions are preserved across the instructions. |
| 30411 | Arcane theory / cunning / experience | Not an issue: Korean retains the challenge of whether arcane theory can overcome cunning and experience; Japanese and Chinese also describe a contest against experience/strategy. |
| 30428 | Reagents given | Not an issue: the concise completion label preserves that reagents were handed over. |
| 30442, 30450 | Potion recipes | Not an issue for structure and mechanics: workbench, effect, ingredient order, quantities 2/1 and 3/3/2/1, and blank-line layout are preserved. Canonical ingredient names remain open separately. |
| 30449 | Clearing the coastal cliffs | Not an issue: driving the bolgans away from the cliffs is the condition for hearing the final tale. Creature spelling remains open separately. |

## Uncertain

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30404 | `There are things for it` | Uncertain: Korean specifies medicine, while English leaves the helpful things unspecified; Japanese/Chinese imply useful or healing items, but the referent and exact item type are absent. |
| 30407 | Saturnyn | Uncertain: Korean spelling varies across the active corpus for the same English name. Defer normalization to the consolidated name pass. |
| 30408 | The Sidhe | Uncertain: the term may identify a place/realm or people; English capitalization/article and locale renderings do not settle the referent. |
| 30409 | The Testament | Uncertain: `유언단` risks reading as a generic “will sect,” but English Testament conflicts with Japanese/Chinese Belen organization renderings and earlier ID 30089 remains open. Do not normalize one row before resolving the faction convention. |
| 30412 | Paling Wand | Uncertain: English may be a named item or farming pun; Japanese describes a plowing wand, while Chinese uses another name. |
| 30420 | Wooed Rast Brattigan | Uncertain: `유혹했다` may imply seduction, while Japanese/Chinese suggest winning affection/courting. The achievement nuance and Rast Brattigan spelling need context. |
| 30432 | `Don't Render To Texture` | Uncertain: the negative option is conveyed, but concise Korean renderer/UI terminology needs project-wide alignment. |
| 30436 | Hierophant / Missives of Sable | Uncertain: the plot sequence is retained, but the title varies between `대사제` and `히에로판트`, and the book's canonical Korean name is unresolved. |
| 30442 | White Flake / Ysa's Breath | Uncertain: recipe structure and quantities are exact, but locale item names differ and canonical Korean reagent terms need alignment. |
| 30449 | bolgans | Uncertain: the quest is clear, but Korean `볼간` differs from other corpus spellings such as `볼건`; creature terminology needs glossary review. |
| 30450 | Sativa Fibers / Scarwood Bark / Bloodroot / Essence of Fate | Uncertain: values and layout are preserved, but Korean/Japanese/Chinese disagree on the first reagent and canonical material names need alignment. |
| Other named terms in IDs 30401-30450 | Bonnlach / Ariel / Saturnyn / Sidhe / Testament / Fyragnos / Paling Wand / Rast Brattigan / Sagrell / Mandolph / Helyc / Narca / Sylvanite / Canneroc / Missives of Sable / Scholia Arcana / Summer Court / Bolgan and related terms | Uncertain: canonical personal-name, faction, title, location, creature, and item spellings require integrated glossary review. |

## Verification

- IDs 30401-30450 occur once and in ascending order in English, Japanese,
  Chinese, and Korean. Embedded line-break counts and normalized runtime-token
  identities/order match across all four locales, including the 30402 cost
  variable and nested controls at 30406.
- Recipe quantities match: ID 30442 has 2 and 1; ID 30450 has 3, 3, 2, and
  1. Korean blank-line layout is preserved.
- Only the accepted Korean `Texto` cells at IDs 30419 and 30421 changed.
  The UTF-8 BOM, 72,046 CRLF endings, and 39 existing bare-LF endings remain.
- Active default CSV SHA-256:
  `0f0e65560e4822ac736bae3aa4f446d1543d553bb47481da29a80558ecfae68d`.
- Register totals after this batch: 919 accepted, 3,431 `not an issue`, and
  5,511 uncertain (9,861 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30451; 34,684 `default` IDs remain.

These working dispositions are not independent linguistic approval.
