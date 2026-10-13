# Consolidated Context Review: 100 Default Keys (D-19731)

All exact keys in `uncertain-100-D19731-20261012.jsonl` (61424-61734)
were independently reviewed against English, Japanese and Chinese source
cells, existing Korean rulings, and relevant official Korean manual terms.
No PAK material was used. Ten accepted corrections:

| ID | Before -> After | Basis |
| ---: | --- | --- |
| 61446, 61665 | `워스워른` -> `워스원` | Warsworn faction, official Korean manual p. 7. |
| 61515 | `대현자 신비술사` -> `신비술의 대가` | Master Mystic is a title of mastery, not the distinct Archsage office; English and Japanese agree. |
| 61604 | `교수대 끝` -> `갤로스 엔드` | Named Gallows End, D-5672/D-19714. |
| 61607 | `트래블러스` -> `트래블러` | Named Traveler member, manual p. 7. |
| 61619, 61677 | `완벽한 미사란` -> `흠 없는 미타란` | Flawless Mitharan item modifiers, D-19551 and manual p. 2 distinction from Mitharu. |
| 61655, 61728 | `슬픔의 집` -> `비탄의 힘` | Explicit `the Sorrows`, magical force (D-18322/D-19627); not House of Sorrows. Japanese/Chinese support its magical role. |
| 61673 | `시녀` -> `윈더미어의 시녀` | Full named title Maid of Windemere, D-19615/ID 3570. |

The other 90 are `not an issue`:
61424, 61428, 61429, 61430, 61434, 61436, 61439, 61440, 61444,
61447, 61455, 61456, 61458, 61461, 61467, 61471, 61479, 61486,
61490, 61492, 61495, 61498, 61499, 61502, 61505, 61506, 61511,
61517, 61525, 61528, 61531, 61532, 61534, 61538, 61540, 61549,
61550, 61555, 61558, 61559, 61561, 61563, 61568, 61569, 61573,
61578, 61580, 61582, 61586, 61589, 61590, 61591, 61598, 61600,
61603, 61609, 61611, 61613, 61614, 61617, 61624, 61630, 61631,
61632, 61641, 61644, 61646, 61658, 61659, 61662, 61664, 61668,
61672, 61684, 61685, 61687, 61688, 61691, 61695, 61697, 61700,
61701, 61704, 61708, 61711, 61713, 61718, 61721, 61732, 61734.

ID 61578 follows English/Chinese despite an unrelated Japanese source row.
ID 61701's `creation chaos` is a source typo for creating chaos; Korean
retains the actual meaning. Runtime tokens at 61434, 61582, 61668 and 61691
were not edited. The source's unresolved ellipsis at 61424 is preserved;
it is not an error requiring another hold.

Pre-edit SHA-256 `24ce7c236635add6f0c2f38c8b7273c174f398c31813839a46bc74367c57cd2b`.
Post-edit SHA-256 `1bb3e7edb4a7972fa0f5c88bd8158802f11e223d0ab6f18c240ca202de6003f4`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19731/locatexts_zh_cn.koalocatext_default.csv`.
`apply-uncertain-100-D19729.rb 19731` validated all Korean snapshot cells,
BOM, mixed line endings, order, non-target records, other cells and inverse
restoration. Reconstructed candidate-open count 605; historical operational
3,419 / 34,118 / 987 tally remains unreconciled.
