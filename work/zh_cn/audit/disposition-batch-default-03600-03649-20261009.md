# Disposition and Edit Batch: `default` IDs 3600-3649

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions for
  `default` IDs 3600-3649.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Twelve findings were dispositioned: three accepted, four `not an issue`,
  and five uncertain. Three accepted `Texto` corrections were applied to
  three rows.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3601 | `United Merchants Delegation` | Unchanged; the literal translation is understandable, but the formal body's official Korean name remains unsettled. | D-756: uncertain |
| 3605 | Unnamed `he` / benevolence and protection | Unchanged; Korean preserves the source's unnamed referent. | D-757: not an issue |
| 3613 | `Ayten's folk` | Unchanged; broad Korean wording preserves the source's inhabitants/faction ambiguity. | D-758: not an issue |
| 3616 | Ysa / High King / access | Unchanged; the meaning is preserved, while name/title terminology remains open. | D-759: uncertain |
| 3621 | `Reckoning` in the in-game manual | Unchanged; product title versus generic game reference is unclear. | D-760: uncertain |
| 3624 | `The Alley` | Unchanged; tavern context and capitalization support the Korean business-name reading. | D-761: not an issue |
| 3628 | Saturnyn eluding people's minds | `사투르닌(Saturnyn)이 그 오랜 세월 수많은 이들의 눈을 어떻게 속였을까?` -> `그 오랜 세월 수많은 사람이 사투르닌(Saturnyn)의 존재를 어떻게 알아채지 못했을까?` | D-762: accepted |
| 3636 | Interrupted `He was supposed to—` | `그는 분명...` -> `그는 그래야 했는데...`; preserve the unfinished expectation without supplying the missing action. | D-763: accepted |
| 3639 | Generic or named `henge` | Unchanged; current Korean phonetic rendering is plausible and no more specific interpretation is supported. | D-764: not an issue |
| 3640 | `Souldeep Fasting` | Unchanged; proper name versus underground passage/source issue remains unresolved. | D-765: uncertain |
| 3646 | `Primos` | Unchanged; religious title/rank and canonical Korean form remain unresolved. | D-766: uncertain |
| 3648 | Unexpected encounter | `흥미롭군... 여기서 이런 사람을 만나게 될 줄은 몰랐어.` -> `흥미롭군... 여기서 널 만나게 될 줄은 몰랐어.` | D-767: accepted |

Historical questions in this range were reconciled. Same-numbered equipment
and affix questions, including `Grounded Boots` (3605), `Ash Frost Dowel`
(3623), `The Apothecary's Unrivaled Rings` (3635), and `Scion's Amulet`
(3640), belong to other resources and were not merged into `default`.

## Structural Verification

- All four `default` locale CSVs parse to 65,135 rows with identical ordered
  IDs; IDs 3600-3649 are present once.
- Newline counts match across the four locales throughout the range.
- The three edited rows retain their original structure and marker content.
  ID 3637's `#NAMED_ICON_PS3_R2#` token is unchanged.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings with no bare LF. Other uncertain cells remain unchanged.
- Current Korean `default` SHA-256:
  `94af81b579d4e8e1f4d58b86d34a833b0ae56a2121600dbd477c5bc3544913a5`

## Checkpoint

- Decisions recorded: D-756-D-767.
- Cumulative dispositions: 177 accepted, 124 `not an issue`, and 466
  uncertain.
- Direct findings and carried historical questions in `default` now cover
  IDs 0-3649. Resume with IDs 3650-3699.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
