# Grouped Default Uncertain Review: D-19676

Reviewed 200 exact English/Japanese/Chinese/pre-edit Korean keys from
`uncertain-200-D14604-D14882-20261012.jsonl`, grouped by named
place, faction, title and quest item. English anchors meaning;
Japanese informs register, Chinese corroborates; compared previous
accepted Korean terms and official manual setting. No PAKs used.

| IDs | Approved corrections | Basis |
| --- | --- | --- |
| 48025, 48667 | `라시르` -> `라시어` | Rathir established spelling. |
| 48040, 48521, 48529, 48592 | `선택받은 자` -> `부름받은 자` | Beckoned formal title in stage/quest dialogue. |
| 48047, 48400 | `교수대 끝` / `갤로스 엔드` -> `갤로우즈 엔드` | Gallows End proper-name precedent. |
| 48054, 48628 | `여행자` -> `트래블러` | Capitalized Travelers thieves' faction; Japanese names same group. |
| 48069 | `콜로세` -> `콜로사이족` | Kollossae people and their artifacts. |
| 48313 | `교차로` -> `크로싱` | Named Crossing site. |
| 48330 | `첫 서약자들의 전당` -> `첫서약자 전당` | Formal Hall of the Firstsworn. |
| 48511 | `고대 미사루어` -> `고대 미타란어` | Old Mitharan is a cultural/language name, distinct from Mitharu deity (D-19670/71). |
| 48690 | `명인의 곡괭이` -> `명인의 자물쇠따개` | The same Master's Pick is trapped in a locked chest at ID 42782; same-item wording adopted at ID 46887. |

**15 accepted / 185 not an issue / 0 newly retained**. Other rows
preserve source-led meaning; e.g. 48233 already correctly renders
Adept as `숙련자`, and not every generic Traveler without group
context was converted.

Pre-edit SHA-256:
`71486bee8158b2a50522eb3561cf9e06c68575f80a33f3e196c7b4cddc1b9f78`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19676/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`efd24ede4ad31e6359d333ff06739c974febd229b3d8b281e3019fabacc97837`.
Applicator `REVIEW_BATCH=D19676 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified 200/200 exact locale keys each, inverse byte
reconstruction, BOM, mixed record endings, ordered IDs and
other unchanged bytes.

Totals **3,163 accepted / 31,659 not an issue / 3,702 uncertain**
(38,524); separate affix 55 closed D-19565. Default incomplete.
