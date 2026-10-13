# Disposition Batch: `default` IDs 59901-59950

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, preliminary
  findings, source-keyed historical questions, terminology, structure,
  runtime markers, and numeric values. These are working dispositions,
  not independent final linguistic approval.
- One accepted correction, 37 `not an issue` IDs, and 12 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17874 | 59934 | `이 전쟁으로 비탄의 왕이 살아 움직이던 시절을 알던 겨울 페이는 거의 모두 사라진 것 같아.` | `이 전쟁으로 비탄의 왕이 살아 움직이던 시절을 알던 다른 겨울 페이들은 모두 지친 것 같아.` | English says the war exhausted the other Winter Fae; Chinese explicitly says their energy was exhausted. The current Korean instead says nearly all disappeared, adding absence/death not established by the source. Preserve the speaker's uncertainty and the following memory clause. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17875 | 59903 | The announcement's `fallen of the House of Valor` may mean former/defeated members; Korean's `집에서 추락한` is awkward, but the group identity and preferred Korean wording remain unresolved. |
| D-17875 | 59908 | Dark Sliver's proper-name status and English spelling/sense differ across locales; retain the current form pending item/glossary context. |
| D-17875 | 59909 | Hope of the Fatesworn may be named armor or an item; align the title with established Fatesworn terminology. |
| D-17875 | 59912 | Lords of Valor may be a formal team/faction; canonical Korean naming remains a corpus-level question. |
| D-17875 | 59921 | Private Cornall's exact Korean rank mapping and canonical name spelling require glossary consistency. |
| D-17875 | 59924 | “Represent us in battle alone” may mean sole representative or a one-on-one fight; Japanese alone adds explicit `1`. |
| D-17875 | 59925 | The repeated Motus Mining headquarters and branch-office geography is internally confusing in English; retain locations and objective pending map/organization context. |
| D-17875 | 59928 | Sprites may be a named species/faction or generic creatures; the locales do not establish proper-name status. |
| D-17875 | 59935 | Beckoned may be a setting-specific vocative/title; Korean's `선택받은 자` needs glossary alignment. |
| D-17875 | 59939 | Midden's “putrid mortal death” is metaphorical in English; Korean's explicit corpses are supported by Chinese but may over-resolve the image. |
| D-17875 | 59947 | A Tangled Web may be a quest/title name; determine whether the web image should remain metaphorical and align title treatment. |
| D-17875 | 59948 | Captain Trav's spelling/identity differs across locales; keep the current name and behavior description pending canonical-name review. |

## Not an Issue

Decision D-17876 records these 37 IDs: 59901-59902, 59904-59907,
59910-59911, 59913-59920, 59922-59923, 59926-59927, 59929-59933,
59936-59938, 59940-59946, and 59949-59950. The contract wording at 59904
supports `당사자`; the Ysa cost variable and gold label remain intact; the
ore/refuse ratio, paragraph break, and double-shift remedy at 59926 are
preserved. Other rows retain the source's evident meaning and register.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain the 50 target IDs
  exactly once and in ascending order. All four full resources contain
  65,135 records with matching key order.
- Rechecked historical prompts for House of Valor/fallen/Giant Killers,
  contract parties, the Lyria spire sermon, Dark Sliver, Hope of the
  Fatesworn, Lords of Valor, Ysa's title variable, the paid-help line,
  Private Cornall, Magnus's solo fight, Motus Mining locations, ore/refuse
  output, Sprites, Winter Fae/Weeping King, Beckoned, Midden, A Tangled Web,
  and Captain Trav.
- Embedded newline counts match, including the separated announcement at
  59903 and two-paragraph report at 59926. The Ysa variable at 59913 is
  identical across locales. The Japanese-only numeral at 59924 does not
  change Korean's “alone”; the 1:30 ratio and `2교대` at 59926 are retained.
- Pre-edit CSV SHA-256:
  `4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`.
- Post-edit CSV SHA-256:
  `f58f8637f8b0a3969fd095cff62216dc2b168011f8eabbad6748e6fc6827e92b`.
  Byte comparison against the backup confirms only ID 59934's `Texto`
  cell changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59901/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `4d0c818192353a4179a6057e8d0eb4d576d0cbea62faae92a5caf536c99abe72`).

D-17874 records one accepted correction, D-17875 records 12 uncertain
findings, and D-17876 records 37 `not an issue` IDs. Direct register
totals: 1,742 accepted, 13,551 `not an issue`, and 11,437 uncertain
(26,730 dispositions total); next D-17877.

Resume at `default` ID 59951; 5,184 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
