# Disposition and Edit Batch: `default` IDs 3450-3499

- Decision date: 2026-10-09.
- Scope: preliminary findings and source-keyed historical questions for
  `default` IDs 3450-3499.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Thirteen candidates were dispositioned: two accepted, two `not an issue`,
  and nine uncertain. Only the two accepted `Texto` cells below were edited.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3456 | Kollossae Catacombs / `never raised up` | Unchanged; the phrase may refer to the city's magical elevation, and the lore-specific sense remains unresolved. | D-718: uncertain |
| 3464 | `They became a meal for many vines` | Unchanged; the source shifts from singular `it` to plural `they`, leaving the antecedent uncertain. | D-719: uncertain |
| 3465 | `entered a reverie` | Unchanged; the references support differing altered-state readings, and the canonical term is not established. | D-720: uncertain |
| 3470 | Freemen / Victory Games / protection money | Unchanged; proper-name conventions and the exact Korean force of the extortion wording remain open. | D-721: uncertain |
| 3471 | `Five Finger Discount` | Unchanged; `슬쩍하기` conveys shoplifting, but the source's playful euphemistic wordplay lacks a supported Korean title replacement. | D-722: uncertain |
| 3474 | Speaker's assigned service role | `네가 필요한 건 뭐든 돕는 게 내 명령이야. 꽤 괜찮은 임무지, 안 그래?` -> `필요한 게 있으면 뭐든 도와주라고 명령받았어. 꽤 괜찮은 임무지, 안 그래?` | D-723: accepted |
| 3476 | Sylvanite / `crude runes` | Unchanged; material spelling is unresolved, and Japanese differs from English/Chinese on the necklace description. | D-724: uncertain |
| 3481 | `Warsworn Vault` | Unchanged; `보물창고` conveys the supported vault/treasury meaning. | D-725: not an issue |
| 3486 | `our great House` | Unchanged; identifying the House as the House of Ballads is supported by Japanese and consistent Korean usage. | D-726: not an issue |
| 3488 | `Ohn's Stand` | Unchanged; active occurrences use competing names and place-type renderings, so no local normalization is approved. | D-727: uncertain |
| 3489 | Embassy as the speaker's `chambers` | `대사관이라니 정말 멋지겠군. 내 집무실로 써도 좋겠어. 나처럼 뛰어나고 권세 있는 사람은 그런 탑에서 살아야지.` -> `대사관이라니 정말 멋지겠군. 내 거처로 써도 좋겠어. 나처럼 뛰어나고 권세 있는 사람은 그런 탑에서 살아야지.` | D-728: accepted |
| 3490 | `Truesworn` | Unchanged; whether this is a formal faction/rank and its Korean form are unresolved. | D-729: uncertain |
| 3498 | `St. Eadric's Mission` | Unchanged; English/Chinese say Mission, while Japanese specifies a monastery. | D-730: uncertain |

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical ordered
  IDs; IDs 3450-3499 occur once.
- Across IDs 3450-3499, parsed newline counts and runtime-marker identities
  and order match the reference locales. ID 3479 retains 35%, 12 seconds,
  knockdown, and 30 Mana in the original order.
- The Korean CSV retains its UTF-8 BOM and CRLF record endings with no bare
  LF. Both approved cell values were checked after editing; uncertain cells
  remain unchanged.

## Checkpoint

- Decisions recorded: D-718-D-730.
- Cumulative dispositions: 169 accepted, 115 `not an issue`, and 446
  uncertain.
- The `default` disposition cursor now covers IDs 0-3499. Resume with IDs
  3500-3549 and reconcile the existing preliminary report.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
