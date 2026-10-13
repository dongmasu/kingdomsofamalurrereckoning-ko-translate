# Consolidated Context Review: `default` IDs 26251-26300

- Review date: 2026-10-11.
- Scope: re-review the seventeen unique prior uncertain IDs in D-8563-D-8565.
  Overlaps at IDs 26268 and 26293 were counted once. The accepted edit at
  26274 and prior not-an-issue checks are linked, not recounted.
- Result: two accepted corrections and fifteen `not an issue`; no reviewed
  finding remains uncertain.
- English controls meaning; Japanese and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19294-D-19297

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19294 | `default` 26251-26252 | not an issue | ID 26251 preserves the uncertain, qualified key to the Sorrows and the Hollow/Sinsear/Weeping King relation. At 26252, current `로포쿠` follows the established Korean manual form despite English's `Lupoku` source spelling; the discrepancy is already documented at D-9280 and is not silently changed. |
| D-19295 | `default` 26255, 26265, 26267-26268, 26275, 26278, 26283, 26286, 26293, 26295-26296 | mixed | Accept two targeted corrections: at 26255, “lock us out” means refuse entry, not expel people already admitted; at 26283, reuse accepted Kollossae `콜로사이` (D-18878/D-18933). The Niskaru attack, wards, Grim Onwig, Vagabond bandits, Farrara/Horrinox tale, Great Houses, Fae/mortal hammer history, Crudok, Midden/Meathgra, and Lerkara Fel/Mel Aglir account otherwise remain source-traceable. ID 26268 is counted once despite its overlap with D-8565; D-18937 supplies related Vagabond context. |
| D-19296 | `default` 26261, 26271, 26291 | not an issue | `Ballad` is identified as a story, `all seasons` is retained, and Mitharu's prayer/bead-strength result remains intact. The intentionally awkward English “great and greater strength” is not replaced with an invented mechanic. |
| D-19297 | `default` 26294 | not an issue | Korean `교단` preserves the capitalized Order as an organization; Japanese and Chinese support an association/sect reading. Its exact identity is unspecified in the source, not omitted by Korean. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26255 | `미타란에게 쫓겨난 데 이어, 이번엔 캠프가 무작위 습격을 받고 있어.` | `미타란이 우리를 받아주지 않더니, 이제는 캠프가 무작위 습격을 받고 있어.` | English `lock us out`, Japanese `閉め出された`, and Chinese `拒之门外` describe being denied entry, not being expelled after entry. |
| 26283 | `콜로새는 자신들이 극복한 악의 유혹을 뱀의 형상으로 표현하기 시작했다.` | `콜로사이는 자신들이 극복한 악의 유혹을 뱀의 형상으로 표현하기 시작했다.` | Reuse the later accepted Kollossae form `콜로사이` at D-18878/D-18933; retain the serpent image and stone-skin contrast. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain 65,135 unique ascending IDs in identical order.
- IDs 26251-26300 were compared by ID across all five files. Embedded
  line-break counts match. At ID 26277, both `{*1...}` wrappers retain their
  identity and order; their payloads are intentionally localized. Recipe
  quantities and ID 26263's `+25%` remain intact.
- Only active Korean `Texto` cells at IDs 26255 and 26283 changed. Reversing
  both exact substitutions reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26251-26300-D19294/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `db79b0974c2883e009f6d1daca4f6ff9683b93daf5140d624b8a48560cb34ee5`.
- Post-edit SHA-256:
  `799c0009b7158403e3d88827c9aa2f740b6c177d3f64695931e77ebad3dac434`.
- Seventeen prior uncertain IDs were reclassified: two accepted and fifteen
  `not an issue`. Totals: 2,197 accepted / 24,356 `not an issue` /
  11,971 uncertain (38,524). Resume at D-19298, ID 26301.
- The D-19162-D-19238 and D-18422-D-18452 register-detail gaps remain open.
