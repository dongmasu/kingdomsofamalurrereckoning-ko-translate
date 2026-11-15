# Sequential `default` Revalidation: IDs `26350`-`26499`

- Date: 2026-11-12.
- Compared all 150 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, names, terminology, and format.
- Rechecked 38 existing ledger entries and added 112 unrecorded IDs. Ten new
  correction candidates and one new hold were recorded. Two existing entries
  were reclassified as evidence-limited holds; three candidates were retained.
- The translation CSV, source files, and extracted game assets were unchanged.

## Correction Candidates

These findings are not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26350` | Name / format | The merchant `Dramil` is unpaired in `드라밀`. Consider `드라밀(Dramil)` without changing the polite sales greeting. ID `50779` already pairs this short form. | High |
| `26357` | Name / format | `The Scaith` is the named family, but `스케이스 가문` has no English pairing. Consider `스케이스(Scaith) 가문`, preserving the appreciative dialogue. | Medium-high |
| `26361` | Name / format | The objective `Isak` is `이삭` without pairing. Existing character entries `39233` and `43085` use `아이작 손(Isak Thorn)`. Check quest context and consider `아이작(Isak)의 질문에 답하기`, without assuming the full name from this short label alone. | Medium-high |
| `26391` | Terminology | `standard long swords` is `표준 장검`; the user chose `롱소드` for the weapon class. Consider `표준 롱소드` while retaining the explanation that smaller Dverga swords serve as elongated daggers for humans. | High |
| `26395` | Text type / register | This first-person quest log uses spoken `떨어졌어`, `없지`, and `찾아봐야겠어`. Japanese is narrative. Consider consistent quest-log endings such as `굴러떨어졌다`, `이용할 수 없다`, and `찾아봐야겠다`. | High |
| `26400` | Name / format | The named merchant `Dramil` is unpaired. Consider `드라밀(Dramil)이라는 캠프 상인`; retain the necklace's owner and the request to return it. | High |
| `26424` | Name / format | `Krunk the Immortal` is rendered `불멸자 크렁크` without the full English name and epithet. Consider `불멸자 크렁크(Krunk the Immortal)`. | High |
| `26431` | Meaning | English and Japanese say the boy might have died; Korean `큰일 날 뻔했어` weakens that consequence. Consider `안 그랬으면 죽을 수도 있었어.` | High |
| `26477` | Name / format | The named location `Sewers Henge` is rendered `하수도 헨지` without its English form. Consider `하수도 헨지(Sewers Henge)`, separately from directional henge names. | Medium-high |
| `26491` | Meaning / name | The English `Sparrow Murders` likely concerns the named Sparrow group rather than literal birds: IDs `23859`, `39724`, and `49154` describe the group's members being murdered. Check the note context and consider `쪽지: 스패로우(Sparrow) 살인 사건`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26399` | Tone / source conflict | English and Chinese thank the addressee for breaking the barrier, while Japanese `お前のせいで` blames them. Korean follows the English positive sense. Do not reverse the relationship without scene evidence; this earlier unflagged entry is now held. |
| `26406` | Meaning | `with the proper enchantment` can attach to the key or the lock; Japanese describes a suitably enchanted lock. Korean allows a different attachment. Hold pending item-context evidence instead of selecting an interpretation. |
| `26481` | Meaning | English says the wreath's laurels are `earned`; Korean adds `공적을 세워`, while Japanese says they must be obtained. The nearby task concerns acquiring feathers. Hold the precise sense of `earned` until ritual context supports it; the earlier unflagged entry is now held. |

## Rechecked Existing Findings

- `26369`: retain the Master Makers count/parenthetical candidate.
- `26414`: retain the proposal to pair both Krast brothers' complete names.
- `26475`: retain the Font pairing and sentence-specific meaning candidate.

## Duplicate And Structural Checks

- The range touches 38 exact-English duplicate groups comprising 669 corpus
  rows; Korean is identical within each group.
- Embedded line-break counts match across all four languages. At `26352`,
  each language retains the `{LINE_CENTER}` marker; NBSP characters in the
  English, Japanese, and Korean credits are not normalized.
- Asset association and numeric ID order do not establish an individual
  speaker or playback order.

After recording this range, the ledger contains 36,622 of 65,135 IDs
(56.22%), leaving 28,513. Sequential coverage reaches ID `26499`; the next
range is `26500`-`26749`.
