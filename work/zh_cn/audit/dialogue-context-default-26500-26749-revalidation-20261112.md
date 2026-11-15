# Sequential `default` Revalidation: IDs `26500`-`26749`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, names, terminology, and format.
- Rechecked 66 existing ledger entries and added 184 unrecorded IDs. Ten
  correction candidates were recorded: seven newly flagged and three
  reclassified from `not-issue`. One existing `not-issue` row was reclassified
  as an evidence-limited hold. Four prior candidates and one prior hold were
  retained after rechecking.
- The translation CSV, source files, and extracted game assets were unchanged.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26531` | Meaning / name / format | `Sparrow` is a member of the named Rathir group, not a literal bird. IDs `39724`, `28074`, and `56507` identify the victims as the `Sparrows` and use `참새단(Sparrows)`. Consider `실종된 참새단(Sparrows) 일원` rather than `실종된 '참새'`. | High |
| `26541` | Name / format | `Effie Cruikshank` is an identified character, but the objective has no English pairing. Other IDs confirm the character, though her Korean surname spelling varies. Pair the exact full English name with the selected Korean spelling; do not infer a globally settled transliteration from this row. | Medium-high |
| `26551` | Name / format | `the Scaith's` refers to the named Scaith family, rendered `스케이스 가문` without English. Consider `스케이스(Scaith) 가문`; retain the current family interpretation. | Medium-high |
| `26552` | Meaning / naturalness | `There are things you simply cannot do with ordinary blades. Beautiful, exquisite things.` ends by describing beautiful, exquisite things, not actions. Korean `아름답고 정교한 일` changes the referent to work or deeds. Consider `아름답고 정교한 것들이지`, preserving the suggestive tone without specifying what the things are. | High |
| `26556` | Name / format | `Bux` is Hugo Bux, whose name is paired at nearby related IDs including `14041`. This line uses only `벅스`; consider `벅스(Bux)` without expanding the source's short form to his full name. | High |
| `26572` | Name / format | `Cranwyn` is the named family already paired as `크랜윈(Cranwyn)` at IDs `21805`, `36911`, and `37137`. Pair this occurrence as `크랜윈(Cranwyn)의 분노`. | High |
| `26595` | Name / format | The merchants' first names `Mallory` and `Nina` are unpaired. Other rows pair these names, including `Mallory` at `62251` and `Nina` at `11352` and `11954`. Pair both names while preserving that the speaker is uncertain about Mallory's identity. | Medium-high |
| `26717` | Meaning / naturalness | `broken` is rendered literally as `부서진 나`, which is unnatural for a person; Japanese says the speaker was near death and Chinese describes a badly wounded body. Consider `만신창이가 된 나를 ... 생사의 경계에 붙들어 두었어`, preserving the torment and purpose of learning the Primos' wisdom. | High |
| `26725` | Name / format | `the Watchers` names the guardian group, but Korean only says `감시자`. Other occurrences pair the group with its English name at IDs `14521`, `52425`, and `55061`. Consider `감시자(Watchers)` here, adjusting the Korean sentence naturally. | High |
| `26743` | Name / format | `Castor Redhand` is unpaired in this quest journal. The same character's name is paired at IDs `3569`, `4896`, `8067`, `30658`, and `39295`. Add `(Castor Redhand)` to the existing Korean name. | High |

## Evidence-Limited Hold

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26689` | Meaning / source conflict | English `never earning what I enjoyed` can mean the speaker enjoyed things without earning them, while Japanese and Chinese instead say the speaker never obtained or enjoyed what they wanted. Korean `누린 것에 걸맞은 대가도 치르지 않았어` follows a third, payment-like reading. Hold until the source discrepancy or context is resolved; do not silently choose one meaning. |

## Rechecked Existing Findings

- `26554`: retain the Myrinne/Myrrine name-consistency and source-local English-pairing candidate from the prior five-asset review.
- `26562`: retain the objective-form candidate to use `거미 처치하기`.
- `26577`: retain the `Master Kiftal` title/name consistency candidate.
- `26614`: retain the `will` / `遺志` meaning hold; English and Chinese do not settle whether the caretaker's `will` means a testament or a wish.
- `26672`: retain the `Lady's Children` name/title consistency candidate; prior source comparison supports the established `안실라 부인의 아이들` form.

No speaker or playback order was assigned from asset membership, numeric ID order, or co-occurring names. The range contains mixed dialogue, quest-journal, objective, item, and UI text.

## Duplicate And Structural Checks

- The range contains one repeated-English group: `.` at IDs `26649` and
  `26658`; all four translations are identical within the group.
- Embedded line-break counts match across English, Japanese, Chinese, and
  Korean for all 250 IDs.
- ID `26693` localizes the payload inside `{*1[...]}` in each language; the
  wrapper and its position are preserved.
- The existing source fingerprints were rechecked; new ledger fingerprints
  cover all four language rows.

After recording this range, the ledger contains 36,806 of 65,135 IDs (56.51%),
leaving 28,329. Sequential coverage reaches ID `26749`; the next range is
`26750`-`26999`.
