# Consolidated Context Review: 200 Default Keys, D-19659

Reviewed `uncertain-200-D8936-D9399-20261012.jsonl`: all 200
source-keyed `Texto` cells matched English, Japanese, Chinese, and the
pre-edit Korean exactly in each locale. English anchors meaning,
Japanese supplies voice/register, Chinese supports the reading. The
official Korean manual's PDF p. 7 establishes `워스원`, `트래블러`,
`스콜리아 아르카나`, and weapon-class `셉터`. No PAK was used.

| ID | Approved change | Reason |
| ---: | --- | --- |
| 28622 | `도슨트(Docent)` -> `강사(Docent)` | Scholia academic office, accepted at IDs 22699/23131; Japanese `導師`, Chinese `讲师`. |
| 28654, 28836, 28919, 29109, 29517 | Faction member `여행자` -> `트래블러` in the relevant inflections | Official manual p. 7 and capitalized English Traveler(s); at 28919 both faction name and camp changed. |
| 28827 | `긍지의 가문` -> `교만의 집` | Accepted House of Pride proper name. |
| 28878 | `메스그라` -> `미스그라` | Meathgra's established Korean name in adjacent Midden records. |
| 28883 | Two `보기트` -> `보가트` | Boggart already rendered `보가트` in the active corpus. |
| 29014, 29205 | `워스워른` -> `워스원`; 29014 `선서자들의 전당` -> `첫서약자 전당` | Official manual Warsworn form and established Hall of the Firstsworn label at ID 22398. |
| 29182, 29540 | `아가씨` -> `친구` | `dove` does not establish a female addressee; Japanese leaves out the gender and D-19432 establishes a neutral familiar vocative. |
| 29243 | `용맹의 가문` -> `용맹의 집` | Accepted House of Valor proper name (D-148/D-650). |
| 29432 | Weapon-class `홀` -> `셉터` | The official manual distinguishes Staff and Sceptre, as does English/Japanese/Chinese. |
| 29481 | `내 휘하 사람과` -> `내 지위의 사람과` | English `one of my station` refers to the warlord's own rank; Japanese and Chinese confirm, not a subordinate. |
| 29529 | `슈올리아` -> `스콜리아` | Official Scholia Arcana spelling. |
| 29635, 29660 | `불려온 자` -> `부름받은 자` | Accepted Beckoned title. |

The other 181 keys in this exact snapshot are `not an issue`; source-faithful
Korean is retained even where locale paraphrases diverge. No new hold
was created. Pre-edit SHA-256:
`7f1e86457949512a4f368232ab0ba6973882a3c95eea77235d4b3c8cff9ec162`;
byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19659/locatexts_zh_cn.koalocatext_default.csv`;
post-edit SHA-256:
`2a095c21414ea7ed74897d93b5a97ec3ebb10fa0b3ec966d728e4249798e411a`.
Inverse reconstruction, BOM, mixed record endings, row keys/order,
and all untouched record bytes passed. Totals: **2,919 accepted /
28,903 not an issue / 6,702 uncertain** (38,524). The 55 separate
Chinese-only affix holds closed at D-19565; default review is incomplete.
