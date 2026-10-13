# Edit Addendum D-20107

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 51603 | `교수대 끝(Gallows End)` | `갤로우스 엔드(Gallows End)` | English names the island; apply accepted Gallows End terminology from D-10903/D-11264 and subsequent named-place corrections. D-19680's exact-key sentence disposition remains terminal; no recount. |
| 51610 | `보너스 도전: 적 {2}명을 처치하세요. 사용: {3} ({1}/{2})` | `보너스 도전: {3}을(를) 사용해 적 {2}명 처치 ({1}/{2})` | English/Japanese action order and adjacent Korean bonus-challenge UI support a concise, grammatical instruction. Preserve all marker identities; Chinese alone reorders `{3}` and `{2}`. D-15726 remains terminal; no recount. |
| 51628 | `조형가(Shaper)는 이야기를 엮었다.` | `조형가(Shaper)는 창작했다.` | English `composed` and Japanese `創作した` support creating/composing, not the added object “story.” |

Pre-edit SHA-256:
`d20dc4369584a7d462119a5c3c656fe89a017567415f5ac172e0930c2b1449ef`

Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20107/locatexts_zh_cn.koalocatext_default.csv`

Post-edit SHA-256:
`35faadbfdd255808739225181044cfa4e228a6563a66b7e558a1a4a4f35a9f94`

Only the three target `Texto` cells changed. Exact inverse reconstruction,
BOM, mixed endings, ordered IDs, four-locale alignment, and all 50
line-break/runtime-marker identity checks passed. Marker identity was
compared without requiring identical order because Chinese localizes
`{3}` before `{2}` at 51610.
