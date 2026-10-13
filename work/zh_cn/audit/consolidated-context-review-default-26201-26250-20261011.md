# Consolidated Context Review: `default` IDs 26201-26250

- Review date: 2026-10-11.
- Scope: re-review the prior uncertain findings D-8554-D-8558 in IDs
  26201-26250. ID 26250 is linked to D-18255 and excluded from recounting.
- Result: one accepted correction and thirteen `not an issue`; no newly
  reviewed finding remains uncertain.
- English controls meaning; Japanese and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19288-D-19293

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19288 | `default` 26203 | not an issue | English literally calls the speakers “the principles of Adessa,” while Japanese gives its foundation and Chinese its code of conduct. Korean `아데사의 원칙 그 자체` preserves the English metaphor without assigning an unsupported institution or role. |
| D-19289 | `default` 26201, 26206, 26208, 26215, 26245 | not an issue | `알라본`, `바레스`, `시아라 시다누스`, `아이텐`, and `올그혼 요새` are traceable to the English names and supported by Japanese phonetics and/or Chinese forms. No row-level name or meaning error is established. ID 26250 is linked to D-18255 (`그윈 안웨이`) and is not recounted or edited here. |
| D-19290 | `default` 26222, 26231-26232, 26234, 26248 | not an issue | The Hierophant's role, the Delvers' described practice, Togh Farm, Leanashe's attraction to death/decay, and the shrine/job relation remain clear in Korean. Locale terminology differs, but this does not establish a local meaning defect. Canonical cross-corpus title/creature terminology remains a separate glossary concern. |
| D-19291 | `default` 26233 | accepted | English `mineral-mining interest` describes a powerful mining concern; Japanese `有力鉱山会社` and Chinese `矿业公司` explicitly support a mining company. Replace the imprecise `광물 채굴 세력` with `영향력 있는 광산업체`. |
| D-19292 | `default` 26224 | not an issue | The Korean verse retains the rising figure, passionate throes, chosen witness, and shroud image. Preserve the stored `\\\"` sequence unchanged; its runtime appearance is not inferred from the CSV. |
| D-19293 | `default` 26246 | not an issue | All five quoted blocks and the stanza break match the source structure; the claims about the ancient ones, cycle, seasons, storm, and lack of a home are preserved. Quote escapes remain unchanged; no speaker attribution is invented. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26233 | `그 이름은 들어 봤겠지. 아데사에서 가장 큰 광물 채굴 세력이잖아.` | `그 이름은 들어 봤겠지. 아데사에서 가장 영향력 있는 광산업체잖아.` | Align the entity with the English mining concern and the Japanese/Chinese company readings; render “most powerful” as business influence rather than physical size. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain 65,135 unique ascending IDs in identical order.
- IDs 26201-26250 were checked by ID across all five files. Embedded
  line-break and runtime-marker counts match in the range. The hammer values
  at 26207, `#NAMED_ICON_360_A#` at 26240, quote escapes at 26224/26246,
  and Chinese-only trailing U+FEFF at 26209 were not changed.
- Only the active Korean `Texto` cell at ID 26233 changed. Reversing that
  exact substitution reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26201-26250-D19288/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `2b46d9e070def1062d970ec44efb50fa28f1a0c636b707f6a85be7a92f39e504`.
- Post-edit SHA-256:
  `db79b0974c2883e009f6d1daca4f6ff9683b93daf5140d624b8a48560cb34ee5`.
- Fourteen prior uncertain keys were reclassified: one accepted and thirteen
  `not an issue`. ID 26250 links to D-18255 without recounting. Totals:
  2,195 accepted / 24,341 `not an issue` / 11,988 uncertain (38,524).
  Resume at D-19294, ID 26251.
- The D-19162-D-19238 and D-18422-D-18452 register-detail gaps remain open.
