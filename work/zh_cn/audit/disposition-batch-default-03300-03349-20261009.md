# Disposition and Edit Batch: `default` IDs 3300-3349

- Decision date: 2026-10-09.
- Scope: preliminary findings and all source-keyed historical questions for
  `default` IDs 3300-3349.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Seventeen candidates were dispositioned: three accepted, one `not an
  issue`, and thirteen uncertain. Only the three accepted `Texto` cells
  below were edited.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3306 | `I don't know why it came to me.` | Unchanged; the antecedent of `it` is absent. | D-670: uncertain |
| 3307 | Argine, Queen of Staves | Unchanged; tarot suit versus staff-title interpretation needs setting context. | D-671: uncertain |
| 3312 | `Your team's already waiting` | `우리 팀은 벌써 검투장에 와서 기다리고 있어.` -> `네 팀은 벌써 검투장에 와서 기다리고 있어.` | D-672: accepted |
| 3314 | Flawless Mitharan Restoring Grip | Unchanged; item/component type and modifier meaning remain unclear. | D-673: uncertain |
| 3318 | Source typo `servces` / Korean `서비스` | Unchanged; Korean correctly renders the intended `services` rather than copying the source typo. | D-674: not an issue |
| 3320 | Indexed `Very Hard` difficulty label | `난이도: {*3Very Hard}` -> `난이도: {*3매우 어려움}` | D-675: accepted |
| 3322 | `Luminary Leaf` proper-name/status | Unchanged; bookstore, place, and collection readings remain open. | D-676: uncertain |
| 3325 | `Bookseller, extraordinaire` fragment | Unchanged; speaker versus shop description is not settled by the isolated lines. | D-677: uncertain |
| 3328 | Maire / counterpart / foil | Unchanged; the relationship terms and canonical name form remain lore-dependent. | D-678: uncertain |
| 3329 | `Sidhe` | Unchanged; people, individual, and realm readings remain possible. | D-679: uncertain |
| 3330 | Hyperian forced to the sky | Unchanged; the source passage is grammatically unclear about the event and its purpose. | D-680: uncertain |
| 3332 | Beckoned / `my play` | Unchanged; the title's canonical form remains open, though audience context supports a theatrical play. | D-681: uncertain |
| 3334 | Being named `Ancient of War` | `그것만으로는 부족했는지, 그들은 내게 전쟁의 장로라는 이름까지 주고 교단의 관리자로 삼았어.` -> `그것만으로는 부족했는지, 그들은 내게 전쟁의 장로라는 칭호를 주고 교단의 관리자로 삼았어.` | D-682: accepted |
| 3337 | `We... are finished, here.` | Unchanged; conversation-ending versus doomed-group readings conflict across sources. | D-683: uncertain |
| 3340 | `Teers' Corpse` | Unchanged; `Teers` as a name or source issue is unresolved. | D-684: uncertain |
| 3341 | `Great Cycle` | Unchanged; generic versus named cosmological term and corpus-wide Korean form remain open. | D-685: uncertain |
| 3345 | `fallen member of the Court of Summer` | Unchanged; corrupted, disgraced, and expelled readings are not equivalent. | D-686: uncertain |

Historical `base` questions for Phasewalk, Gossamer End, Benign Amulet, and
crafting components were kept separate from same-numbered `default` rows.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical ID order;
  IDs 3300-3349 are present once.
- The three edits change only Korean `Texto`; the `{*3...}` identity/order at
  ID 3320, paragraph structure, UTF-8 BOM, and CRLF record endings are
  preserved.
- ID 3330's source paragraph breaks and all uncertain cells are unchanged.

## Checkpoint

- Decisions recorded: D-670-D-686.
- Cumulative dispositions: 159 accepted, 105 `not an issue`, and 422
  uncertain.
- The `default` disposition cursor now covers IDs 0-3349. Resume with IDs
  3350-3399 and their preliminary report.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
