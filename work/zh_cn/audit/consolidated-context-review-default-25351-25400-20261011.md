# Consolidated Context Review: `default` IDs 25351-25400

- Date: 2026-10-11.
- Scope: re-review the prior uncertain keys in IDs 25351-25400 against
  English meaning, Japanese source and draft/register, Chinese supporting
  evidence, active Korean, and existing terminology decisions.
- The original contiguous `default` disposition pass is already complete
  through ID 65134 (D-18164). This is the separate targeted context-review
  pass, now complete through ID 25400.
- Of 34 still-uncertain unique keys in this interval, 32 were resolved:
  four accepted corrections and 28 `not an issue`. IDs 25368 and 25375
  remain on specific proper-name holds.
- ID 25400 was already reclassified `not an issue` by D-18238 and is linked
  without recounting. IDs 25353 and 25388 were also already `not an issue`
  and are linked without recounting.

## Decisions D-19149-D-19161

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19149 | 25351-25352, 25354 | not an issue | The offer to remain in Adessa and help as able, the rescue from water beside the wreck, and the Idylla label are preserved. Adessa uses the established `아데사`; differing Idylla phonetics do not establish a row-local meaning error. |
| D-19150 | 25356-25358 | not an issue | Sir Creth, Health/Fate/Mana, the Wulflacs, Gizela, and Camden remain identifiable. Japanese and Chinese support the couple relation, and the loss of the opportunity to learn Camden's fate is preserved. |
| D-19151 | 25361 | accepted | Change `워스워른` to the accepted faction form `워스원` from D-2857; preserve the self-deprecating joke and sentence meaning. |
| D-19152 | 25362-25365 | not an issue | Hesitation, the request to restore balance, the explicitly male pronoun, the claim that the outcome was his wish, and both country labels are retained. The antecedent is not required to translate these source fragments accurately. |
| D-19153 | 25366-25368 | mixed | Accept two local meaning corrections: render `Note` as a handwritten memo at 25366, and replace the unsupported “lost heart” reading at 25367 with the residents being dispersed. Keep 25368 uncertain because no canonical Korean spelling for Hollowlands is established across the corpus. |
| D-19154 | 25371-25374 | not an issue | The Great Library, the unraveling and repair of the Telling, St. Eadric, natural order, and the Authority's designs remain. Japanese supports `창조주`; the Korean does not add a conflicting lore claim. |
| D-19155 | 25375 | uncertain | Corialia Scathe is identifiable, but English, Japanese, and Chinese do not establish a canonical Korean character spelling. Keep the current cell unchanged. |
| D-19156 | 25378-25380 | not an issue | The Fate Shrine request, the Mairu/Apotharni poem, its stanza layout, and the Tuatha's taking and corrupting Midden remain. `빼앗아` is supported by English “have taken”; no unsupported theft method is added. |
| D-19157 | 25383-25385 | not an issue | The Font is marked with its English source form, the western Faelands/Summer Court relation and Webwood history remain, and Hollow is retained as a name. No unsupported global spelling choice is needed. |
| D-19158 | 25386 | not an issue | English explicitly describes a tour of the gladiator pit and sitting in it to pretend to be a fighter; `검투사 경기장` preserves that venue reading. |
| D-19159 | 25389-25393 | not an issue | Sir Creth, House of Ballads armor, Canneroc's refuge, Warden Adwold's security arrangement, and the speaker's future Castellan role are preserved. The current `성주` matches accepted Castellan decisions; the malformed English plural does not require inventing another role. |
| D-19160 | 25395-25396 | not an issue | The Sun Camp grave entrance remains. Japanese `調教` and Chinese `训练一只` support the animal-training reading of “train one,” matching Korean `한 마리`. |
| D-19161 | 25399-25400 | mixed/link | Accept 25399: use the established deity form `미사루` from D-152 and render “make yourself at home” as `편하게 지내세요`. Link 25400 to existing `not an issue` D-18238; do not recount it. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25361 | `워스워른` | `워스원` | Reuse the accepted Warsworn form D-2857. |
| 25366 | `알린 시르가 쓴 손편지` | `알린 시르가 보낸 손글씨 메모` | English `Note`, Japanese `手書きのメモ`, and Chinese `手写字条` identify a handwritten note, not specifically a letter. |
| 25367 | `... 그곳에 사는 이들은 이미 마음을 잃었지요.` | `... 그곳에 사는 이들은 이미 흩어졌지요.` | English “tenants are already lost,” Japanese `既に失われている`, and Chinese `子民也纷纷流失` describe the House's people as lost/dispersed, not demoralized. |
| 25399 | `편히 쉬세요. 미타루의 축복은 ...` | `편하게 지내세요. 미사루의 축복은 ...` | Japanese and Chinese confirm a welcoming “make yourself at home” formula; D-152 and the official Korean manual establish `Mitharu = 미사루`. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active Korean
  each contain 65,135 unique ascending IDs. IDs 25351-25400 occur once and
  in the same order in all five files.
- ID 25353 preserves `$DLC1_Diplomacy.trade_cost_medium$` followed by
  `#NAMED_ICON_GOLD#` in all five files. ID 25379 retains six embedded line
  feeds (seven poem lines), and ID 25388 retains five embedded line feeds
  (six poem lines), matching all five resources.
- The default resource has no `Tipo_Variante` field. BOM, row order, all
  non-approved cell values, and the original mixed record endings are
  preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25351-25400-D19149/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `8d2e6059835827766674e67527c5f6a6441cd84d0c6e8d7244e517891b76fca8`.
- Post-edit SHA-256:
  `356d3b553daac30877f5557d49e1d9b7f48cfff1cff7ed2b42348e76ac65de5a`.
- Reconstructing the active file from the backup with only the four approved
  `Texto` substitutions reproduces every byte. The file retains its UTF-8
  BOM, 65,135 IDs, 72,011 CRLF endings, and 73 existing bare-LF endings.
- Totals: 2,162 accepted / 24,079 `not an issue` / 12,283 uncertain
  (38,524 counted keys). Resume D-19162 at ID 25401. Sequential context
  review remains for IDs 25401-65134 (39,734 IDs), along with earlier
  specific holds and the D-18422-D-18452 register backfill.
