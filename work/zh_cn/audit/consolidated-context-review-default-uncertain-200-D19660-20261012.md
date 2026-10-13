# Consolidated Context Review: 200 Default Keys, D-19660

Reviewed the 200 distinct rows of
`uncertain-200-D9400-D9820-20261012.jsonl` against the exact
English, Japanese, Chinese, and pre-edit Korean `Texto` cells
(200/200 matches per locale). English anchors meaning, Japanese
voice/register, and Chinese supports the reading. The official Korean
manual's PDF p. 7 establishes `트래블러` and `셉터`;
previous accepted decisions establish the other proper names and ranks.
No PAK materials were used.

| ID | Approved correction | Basis |
| ---: | --- | --- |
| 29685, 30123 | `갤로스 엔드` -> `갤로우즈 엔드` | English/Japanese Gallows End; established island form in active Korean. |
| 29767, 29774 | `여행자` -> `트래블러` (29774 twice) | Capitalized faction Travelers; official manual p. 7. |
| 29798 | `불려온 자` -> `부름받은 자` | Beckoned formal title, accepted earlier. |
| 29888 | Weapon `홀` -> `셉터` | English `sceptre`, Japanese `笏`, Chinese `权杖`; official manual p. 7. |
| 29923 | Rank `맹세검` -> `맹세의 칼날` | Warsworn Oathblade rank approved at D-18254; keep Pledgeshield address. |
| 30058 | `씨플랙스` -> `시 플랙스` | Same Seaflax ingredient spelling as active recipe ID 22942. |
| 30105 | `프리즈미어 성소` -> `프리즈미어 예배당` | Chantries are the established named Prismere worship sites; distinguishes shrine from chantry. |
| 30111 | `콜로세는` -> `콜로사이족은` | Established Kollossae people name. |
| 30146 | `발러 가문` -> `용맹의 집` | House of Valor proper name accepted at D-148/D-650. |
| 30216 | `비탄` -> `비탄의 힘` | Standalone `Sorrows` power; Japanese and Chinese explicitly identify the power. |
| 30233 | `고문(Counsel)` -> `조언자(Counsel)` | Counsel denotes a person; Japanese/Chinese use advisor, and D-18290 establishes the distinction from council. |

The other 187 keys in the snapshot close as `not an issue`. Do not
reinterpret source-faithful Korean on the strength of conflicting locale
paraphrases alone. No new hold was created.

Pre-edit default SHA-256:
`2a095c21414ea7ed74897d93b5a97ec3ebb10fa0b3ec966d728e4249798e411a`;
byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19660/locatexts_zh_cn.koalocatext_default.csv`;
post-edit SHA-256:
`ef0c3928aef7a95149887a0d49e4caba009a96d5656a5367c6586cf1da525ab2`.
Inverse/BOM/mixed endings/row order/keys/untouched bytes verified.
Totals: **2,932 accepted / 29,090 not an issue / 6,502 uncertain**
(38,524). The separate 55 Chinese-only affix holds were already
closed by D-19565; default review remains incomplete.
