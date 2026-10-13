# Consolidated Context Review: 200 Default Keys, D-19665

Reviewed `uncertain-200-D11253-D11741-20261012.jsonl`. The active English,
Japanese, Chinese, and Korean `Texto` values matched all 200 source keys.
English anchors meaning, Japanese informs voice/register, and Chinese is a
supporting cross-check. The extracted official Korean manual was consulted
for deity and faction terminology; accepted decisions were reused for
Hierophant, Delvers, Sorrows, Warsworn, Crow, Beckoned, Praetorian,
Kollossae, and Gallows End. No PAK material was consulted.

| ID | Approved correction | Basis |
| ---: | --- | --- |
| 34718 | `귀빈을 소개합니다! 운명의 뮤즈, 각하께서 오셨습니다!` -> `존귀한 손님, 운명의 뮤즈님을 소개합니다!` | Japanese and Chinese retain an honorific introduction but do not identify a civil office; avoid the unsupported `각하` rank. |
| 34790 | `연금술사는 거의 한 달 전에 떠났어.` -> `연금술사를 잃은 지도 거의 한 달 됐어.` | English `lost our alchemist` is neutral about departure versus death; Japanese and Chinese specify death. Keep the English ambiguity rather than selecting either event. |
| 34817 | `그 성스러운 성소` -> `그 성스러운 곳` | English `hollow`, Japanese cave, and Chinese void disagree on the landform; retain the sacred-place meaning without inventing a sanctuary. |
| 34843, 35011 | `히에로펀트` -> `대사제` | Reuse the established Hierophant title from D-19641 and related accepted decisions. |
| 34928 | `대부분의 탐험꾼은` -> `대부분의 탐구자들은` | Delvers in this lore passage use the established House of Sorrows role term `탐구자` (D-19632). |
| 34957 | `소로우즈는` -> `비탄의 힘은` | Japanese explicitly identifies the Sorrows as a power; distinguish it from the House of Sorrows. |
| 35006 | `워스워른 견습 용병으로서` -> `워스원 용병으로서` | Official Korean manual p. 7 establishes `워스원`; English/Chinese do not say the hireling is an apprentice. |
| 35027 | `썩 꺼져, 이방인.` -> `이방인, 저리 가.` | English is a dismissive instruction to leave, not the stronger insult `썩 꺼져`; Japanese supports dismissal and Chinese is literal. |
| 35179 | `까마귀가 돼` -> `크로우가 돼` | Arena context makes Crow a named status; reuse source-traceable `크로우` from D-18569. |
| 35219 | `정해진 자와의 만남` -> `정해진 만남` | English and Japanese predicate predestination of the encounter, not of a person. |
| 35373 | `검 메리` -> `검객 메리` | Japanese identifies a swordswoman and Chinese names her sword association; Korean's current compound is not a natural epithet. |
| 35553 | `미타루께서` -> `미사루께서` (2 occurrences) | The official Korean manual p. 2 and accepted D-152 establish `Mitharu = 미사루`. |
| 35567 | `비일반` -> `흔하지 않음` | Preserve the distinct `Infrequent` rarity tier without the unnatural literal category label. |
| 35752 | `해질녘` -> `이븐타이드(Eventide)` | Standalone capitalized Eventide is a name here; reuse the source-traceable form accepted in D-19586. |
| 35764 | `불멸자여` -> `늙지 않는 이여` | `Ageless` establishes not aging, not immortality; Japanese and Chinese support the age-based reading. |
| 35843 | `긍지의 잭` -> `교만의 시종` | `Knave of Pride` is the House of Pride attendant title; reuse the accepted form at ID 34133 (D-19664). |
| 36143 | `갤로우스 엔드` -> `갤로우즈 엔드` | Align the named island to the established active-corpus spelling. |
| 36188 | `근위병` -> `프레토리안` | Reuse the accepted formal Praetorian rank spelling from D-19656. |
| 36347 | `콜로세` -> `콜로사이` | Align the named Kollossae people to the accepted form used in recent batches. |
| 36380 | `선택받은 자여` -> `부름받은 자여`; `콜로세` -> `콜로사이` | Reuse the accepted Beckoned title (D-692) and Kollossae name. |

The other 179 exact keys close as `not an issue`: the Korean preserves the
English-led meaning or a source-supported name; unresolved lore categories
and locale differences alone did not justify another hold.

Pre-edit SHA-256:
`04949e3c45bae1c2ff46a2de6a4831394053af0124c1f9de5f89ca756aba8024`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19665/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`ae73f0a6c47cb64564f71fed8fb2d0efc9d2521db99d2d24f864c351f149c232`.
All 200 source keys matched in English, Japanese, Chinese, and pre-edit
Korean. The edit script verified exact inverse reconstruction, BOM, mixed
record endings, ordered IDs, and unchanged bytes outside the approved
`Texto` cells.

Totals: **3,038 accepted / 29,984 not an issue / 5,502 uncertain**
(38,524). The separate 55 Chinese-only affix holds remain closed by
D-19565. Default review is incomplete.

## Later Correction

D-19836 reconciled ID 36143 against the earlier D-10903 and D-11264
accepted spelling `갤로우스 엔드`. The D-19665 edit recorded above
(`갤로우스 엔드` to `갤로우즈 엔드`) was superseded; the active cell is
restored to `갤로우스 엔드`. See
`named-scope-review-D19839-20261013.md` for the exact-key reconciliation.
