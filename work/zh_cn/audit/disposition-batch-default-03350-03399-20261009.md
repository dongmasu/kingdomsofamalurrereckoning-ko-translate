# Disposition and Edit Batch: `default` IDs 3350-3399

- Decision date: 2026-10-09.
- Scope: findings in the preliminary report and source-keyed historical
  questions for `default` IDs 3350-3399.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Fifteen candidates were dispositioned: three accepted, five `not an issue`,
  and seven uncertain. Only the three accepted `Texto` cells were changed.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3351 | `Fatesworn` asked about as a term | Unchanged; whether to translate, transliterate, or retain the expansion/title name is not settled by the line. | D-687: uncertain |
| 3353 | `Erathell` | Unchanged; all three sources retain the same name, with no translation error in the Korean transliteration. | D-688: not an issue |
| 3355 | `Muffin` | Unchanged; Korean preserves the food name and the Japanese source transliterates it; the Chinese food-term variation does not establish an error. | D-689: not an issue |
| 3356 | Bed/lodging request | `잘 침대가 필요하면 술집의 로브(Rove)에게 말해 봐.` -> `잠자리가 필요하면 술집의 로브(Rove)에게 말해 봐.` | D-690: accepted |
| 3364 | Capitalized `Sorrows` and House of Sorrows | Unchanged; whether the Sorrows are beings, a force, or both remains unresolved. | D-691: uncertain |
| 3368 | Player title `Beckoned` | `돌아왔구나, 초대받은 자여.` -> `돌아왔구나, 부름받은 자여.` | D-692: accepted |
| 3370 | The Maid has gone mad | Unchanged; `미쳐 버렸어` preserves the source assertion. The Maid's canonical title remains a separate open question. | D-693: not an issue |
| 3373 | Banshaen count and attack | Unchanged; the Korean preserves the source's uncertainty about the count and its inference that there is more than one. | D-694: not an issue |
| 3374 | `Lord Setter` | Unchanged; Japanese specifies a viscount, while English and Chinese use Lord. The canonical Korean rank convention is unresolved. | D-695: uncertain |
| 3381 | Epitaph quote escaping | Unchanged; parsed Korean contains literal backslash-quote sequences, but runtime rendering is unverified and matching rows use the same pattern. | D-696: uncertain |
| 3384 | Mystery of the player's death | `네가 죽은 이유는 나도 수수께끼야.` -> `네 죽음은 나에게도 수수께끼야.` | D-697: accepted |
| 3388 | `St. Odwig's Mission` | Unchanged; English and Chinese support a mission, while Japanese specifies a monastery. The institution and canonical place-name reading need context. | D-698: uncertain |
| 3394 | Gnome keepsake's age/tarnish | Unchanged; references differ between tarnish, discoloration, and stains, and the item's material is not established. | D-699: uncertain |
| 3397 | `Aron Excavations` | Unchanged; English capitalization, Japanese's excavation-site reading, and Chinese's mining-company reading do not resolve the entity. | D-700: uncertain |
| 3399 | Wencen rendered `무력해졌어` | Unchanged; this expresses the loss of agency/power in context and does not imply sexual impotence. | D-701: not an issue |

The three accepted Korean values had already been applied in the active CSV
before this disposition record was completed. This report records and
authorizes those exact values; no other translation cell was changed.

## Structural Verification

- All four locale `default` CSVs contain 65,135 rows with identical ID order;
  IDs 3350-3399 are present once.
- The three authorized edits change only Korean `Texto`; runtime markers,
  embedded line breaks, UTF-8 BOM, and CRLF record endings are preserved.
- All uncertain candidates remain unchanged.

## Checkpoint

- Decisions recorded: D-687-D-701.
- Cumulative dispositions: 162 accepted, 110 `not an issue`, and 429
  uncertain.
- The `default` disposition cursor now covers IDs 0-3399. Resume with IDs
  3400-3449 and reconcile the existing preliminary report before disposition.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
