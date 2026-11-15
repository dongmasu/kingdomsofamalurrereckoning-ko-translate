# Lorestone and Damage-Type Terminology

## Lorestone

The active source tables contain 58 `default` and 2 `base` rows whose English
text includes `Lorestone` or `Lorestones`. The Korean already used
`로어스톤` in 58 rows; two `default` rows used alternate terms:

- `default:12526`: `지식석` -> `로어스톤`
- `default:34364`: `전승석` -> `로어스톤`

This standardizes the generic collectible term. It does not register
`Lorestone` as a proper-name entity or require an English parenthetical in
every sentence. The existing distinction between a Lorestone and a Fae Cairn
is retained. The earlier D-21766 review excluded generic Lorestone labels
from proper-name entity discovery; it did not approve the two alternate
Korean translations.

## Damage Types

The English `default` source contains 301 rows matching the ten reviewed
damage labels. No matching rows were found in `base` or `affix`. After the
targeted edits, every row uses the following Korean term for that damage
type:

| English | Korean | Source rows |
| --- | --- | ---: |
| Physical Damage | 물리 피해 | 145 |
| Piercing Damage | 관통 피해 | 50 |
| Fire Damage | 화염 피해 | 25 |
| Ice Damage | 냉기 피해 | 30 |
| Lightning Damage | 번개 피해 | 27 |
| Poison Damage | 독 피해 | 32 |
| Bleeding Damage | 출혈 피해 | 32 |
| Burning Damage | 화상 피해 | 23 |
| Freezing Damage | 빙결 피해 | 18 |
| Shocking Damage | 감전 피해 | 24 |

The `Ice Damage` review changed `얼음 피해` / `얼음 속성 공격` to
`냉기 피해` / `냉기 속성 공격`; the `Freezing Damage` review changed
`동결 피해` to `빙결 피해`. The 20 changed keys are `905`, `7196`,
`10086`, `10499`, `16976`, `23906`, `29143`, `29252`, `29465`, `30442`,
`42742`, `48108`, `50419`, `51066`, `52037`, `52068`, `52829`, `53056`,
`56101`, and `57608`. English determines the damage category; Japanese
氷/冷気 versus 凍結 and Chinese 寒冰 versus 冰冻 corroborate the distinction.

`default:4787` says a private study was closed because of fire damage to the
building. Its `화재 피해` is ordinary fire damage, not the combat damage type
`Fire Damage`, so it remains unchanged.

The November 3, 2026 81-row audit added English parentheticals for four
damage labels; it was not a review of all ten Korean type names. Its exact
post-edit strings now differ from five current rows (`5859`, `7189`,
`14375`, `22850`, `62397`). Four still use the recorded Korean damage terms
despite unrelated sentence or label changes. `7189` retains `번개 피해` but
no longer has the English parenthetical. This terminology review did not
reapply that historical full-string edit.

Only the listed Korean `Texto` fields were changed. The 22 changed
`default` review fingerprints and 27 affected proper-name occurrence
snapshots were refreshed, preserving their dispositions. The repeated-source
index was regenerated. Validation confirmed all ten term mappings against
the current English rows, as well as the changed IDs' source fingerprints.
