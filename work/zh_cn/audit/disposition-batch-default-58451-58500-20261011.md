# Disposition Batch: `default` IDs 58451-58500

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 32 `not an issue` IDs, and 16 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Corrections

Decisions D-17670 and D-17671 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58451 | `전장에서 어느 정도 지위가 있는 투아사 마법사들이 흔히 입는 예복.` | `전장에서 어느 정도 지위가 있는 투아사 마법사들이 흔히 입는 평범한 로브.` | English `common robes`, Japanese `一般的なローブ`, and Chinese `普通长袍` describe ordinary robes, not ceremonial dress implied by `예복`. |
| 58474 | `네 친구와 어울려 주지. 마음에 들지는 모르겠군.` | `네 친구와 연주해 주지. 마음에 들지는 모르겠군.` | English `play` is ambiguous in isolation, but Japanese and Chinese explicitly say to perform music with the friend's companion. |

The byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58451/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `b2d5ab3cf5c926b254ada54d7444f60ce14f1953ae023bc0e024b54b0ab3cc9d`).
Post-edit active default CSV SHA-256:
`a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
Only the `Texto` cells at IDs 58451 and 58474 differ from the backup.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17654 | 58452 | The leadership's credulity and mangy-dog/food image are retained; `Hierophant`'s canonical Korean title remains open. |
| D-17655 | 58455 | Standalone Bhaile name; Japanese phonetics differ, and active Korean spellings vary. |
| D-17656 | 58457 | The lining and fortification are retained; Mitharan's Korean form and canonical component terminology remain unresolved. |
| D-17657 | 58462 | English/Chinese say the note was to be thrown in the Quarry, while Japanese says it was to be delivered there. Korean follows English/Chinese; location/name context is unavailable. |
| D-17658 | 58466 | The statue-wife qualification, wife's death, and Kurn's role are preserved; Galataea and Kurn spellings remain provisional. |
| D-17659 | 58470 | The new warrior arena and House of Valor comparison are retained; the canonical House/faction form remains unsettled. |
| D-17660 | 58472 | `Apprentice Regalia` is retained descriptively; the row does not establish whether it is a named item/set or a generic clothing label. |
| D-17661 | 58478 | The divine inherited skill is retained; Korean says only the gifted can learn it, a plausible inference but an explicit restriction absent from English. |
| D-17662 | 58480 | The save warning is contradictory in English, Japanese, and Chinese. Korean preserves both instructions; gameplay/UI context is needed before any repair. |
| D-17663 | 58482 | The first King and Winter burden are retained; capitalized `Delve` may name a practice/role, while Japanese reads it as bearing sorrow. |
| D-17664 | 58487 | The instruction in the Idylla Concourse is retained; `Beckoned` title/address terminology varies across the corpus. |
| D-17665 | 58490 | The speaker's literary expertise and Andronikos apprenticeship are preserved; English `tragedian` can denote actor or playwright, and Chinese/Japanese differ. |
| D-17666 | 58494 | The spell and next-match context are preserved; the drink sentence can be an instruction or a report that a drink is prepared. |
| D-17667 | 58495 | The adversary's broad knowledge and claim that he is toying with the group are retained; the English fragment is compressed and the syntax connecting “me and my House” is uncertain. |
| D-17668 | 58497 | The investigation and blessing are retained; English/Japanese say the Windstones were played, while Chinese says touched, and the exact interaction needs context. |
| D-17669 | 58499 | All eight line breaks, letter/signature/postscript layout, invitation, and copper-ring promotion are retained; `Docent`, `Savant`, `Adept`, and Creathnach Thintri forms need glossary/context review. |

## Not an Issue

Decision D-17672 records these 32 IDs: 58453-58454, 58456, 58458-58461,
58463-58465, 58467-58469, 58471, 58473, 58475-58477, 58479, 58481,
58483-58486, 58488-58489, 58491-58493, 58496, 58498, and 58500. They
preserve evident meaning, voice/register, structure, markers, and values.
Accepted and uncertain IDs are not included.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58451-58500 once
  and in identical ascending order; each full default resource contains
  65,135 records.
- ID 58499 retains eight embedded newline characters in all four locales.
  The `{1}`-`{9}` marker order at 58489 and `+5% Health` at 58488 are
  preserved.
- Reconciled the source-keyed historical prompts for IDs 58450-58549.
  Applicable questions remain documented above; later prompts remain for
  their own batches.
- The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.

D-17654-D-17669 record 16 uncertain findings; D-17670-D-17671 record two
accepted corrections; D-17672 records the remaining 32 `not an issue` IDs.
Direct register totals: 1,713 accepted, 12,482 `not an issue`, and 11,081
uncertain (25,276 total); next D-17673.

Resume at `default` ID 58501; 6,634 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
