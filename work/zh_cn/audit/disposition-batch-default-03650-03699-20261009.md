# Disposition and Edit Batch: `default` IDs 3650-3699

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions for
  `default` IDs 3650-3699.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Seventeen findings were dispositioned: four accepted, five `not an issue`,
  and eight uncertain. Four accepted `Texto` corrections were applied to
  four rows.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3652 | Malformed English `However ... get inside` | Unchanged; Japanese/Chinese support the Korean's intended “no matter how” reading. | D-768: not an issue |
| 3653 | `longlegs` taunt | Unchanged; target and force remain contextual. | D-769: uncertain |
| 3655 | Unnamed magical item / Fateless One | Unchanged; Korean preserves the source's implicit referent. | D-770: not an issue |
| 3661 | War collection, purse/box, village Sanctuary | Unchanged; the object and institutional terms differ across the references. | D-771: uncertain |
| 3662 | `fall into infamy` | `내가 악명에 빠지는 꼴` -> `내가 치욕을 당하는 꼴`. | D-772: accepted |
| 3670 | Capitalized `Court` | Unchanged; palace versus named Fae Court is unresolved. | D-773: uncertain |
| 3671 | Widow poem: `brood` and final coordination | `새끼들` -> `아이들`; `그들의 희생과, 그들이 어디서 왔는지도` -> `그들의 희생과 그들이 온 곳`. All five lines remain. | D-774: accepted |
| 3672 | `Praetorians` | Unchanged; formal unit name is not established. | D-775: uncertain |
| 3678 | `success with the Almain` | Unchanged; English is broad and Japanese/Chinese differ on treatment versus combat. | D-776: uncertain |
| 3681 | `Seelie` | Unchanged; Korean transliteration preserves the same retained name used by the references. | D-777: not an issue |
| 3683 | Waterhall Down / Wild Fae | Unchanged; place and group labels need corpus-wide terminology decisions. | D-778: uncertain |
| 3684 | Offer to attend | `함께하겠다는 네 제안` -> `네가 참석하겠다는 제안`; no event or accompanying person is inferred. | D-779: accepted |
| 3686 | `Almere` | Unchanged; locale phonetic spellings conflict and the Korean form is unsettled. | D-780: uncertain |
| 3688 | `Maid` | Unchanged; `시녀` matches the related Korean title rendering. | D-781: not an issue |
| 3691 | Softscrabble Powder / Leechwood Bark recipe | Unchanged; English names, both `(2)` quantities, order, and layout are preserved. | D-782: not an issue |
| 3695 | Maid's true Champion | Unchanged; formal rank/title and canonical Korean term remain open. | D-783: uncertain |
| 3697 | Interrupted alchemist line | Terminal `...` -> `—` to match the source interruption. | D-784: accepted |

Historical questions for IDs 3652-3655, 3661-3662, 3670-3672, 3678, 3681,
3683-3684, 3686, 3691, and 3695 were reconciled. Same-numbered equipment and
other-resource questions, including items at IDs 3652, 3654, 3658, 3661,
3663-3665, 3670-3673, 3677, 3679, 3684, 3687, 3691, and 3696, were kept
separate from these `default` dialogue/UI rows.

## Structural Verification

- All four `default` locale CSVs parse to 65,135 rows with identical ordered
  IDs; IDs 3650-3699 are present once.
- Newline counts match across this range. ID 3671 retains all five poem
  lines, and ID 3691 retains its blank line, two ingredient lines, quantities,
  and order.
- ID 3666 retains `{1}` and `{2}`; Japanese uses the reverse marker order
  from English/Chinese/Korean. This pre-existing marker-order difference was
  not changed. ID 3679 retains `{LINE_SPACE}` and the indexed game-title
  marker; ID 3696 retains `#NAMED_ICON_360_A#`.
- No key, row, variant, or sidecar changed. The Korean CSV retains its UTF-8
  BOM, semicolon delimiter, and CRLF record endings with no bare LF.
- Current Korean `default` SHA-256:
  `300947c8807fb8a08697d3047118a3c79f073e8f91502b20b18d77c729fe1d14`

## Checkpoint

- Decisions recorded: D-768-D-784.
- Cumulative dispositions: 181 accepted, 129 `not an issue`, and 474
  uncertain.
- Direct findings and carried historical questions in `default` now cover
  IDs 0-3699. Resume with IDs 3700-3749.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
