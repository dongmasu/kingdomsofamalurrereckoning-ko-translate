# D-21873: Current Paired-Name Residual Spot Check

Date: 2026-10-20

No CSV or index edit. Checked a bounded set of current paired-name variants
against aligned English/Japanese/Chinese and existing terminal decisions.

- `Caverns of Ingress`, `Shroud of Omission`, and `Elund Carth` scout examples were stale snapshots. Current cells use the established full forms. Their scopes were already reviewed in D-21433 and D-21780; do not restart those historical candidate rows.
- `default:14553` `목마른 여인 여관(Thirsty Wench)` remains unchanged. D-21825 records the title's wording/business-suffix alternatives as unresolved; Japanese 酔いどれ娘亭 and Chinese 干渴少妇 do not justify reopening or asserting a unique Korean lexical choice.
- `default:48374` `개스티르 가문(House Gastyr)` remains unchanged. The current occurrence is already accepted under D-21119. Its pronunciation variant is not a demonstrable meaning error; Japanese ガスティア家 and Chinese 加斯提尔家族 do not distinguish Korean 가/개.
- `default:551` `웃는 민(Minn the Grinner)` remains unchanged. The exact English epithet and aligned Japanese にやにや笑いのミン / Chinese 微笑者米恩 support the current meaning; the alternate `웃음꾼 민` is not evidence of a content error.
- `Alfar`/`Alfarian`, `Mitharan`, `Bolgan Masters`, and `Preordained` variants in the narrow screen are ordinary demonym, language, number, or collective-form contexts, not clear name errors.

The 306-325 rows in `proper-name-person-scout-D21433-offset305.tsv` are a
historical queue already reviewed in D-21433, not a fresh continuation
source. Its stored Korean examples predate later accepted edits. Do not use
that snapshot as current text; consult the active CSV and occurrence index.

No active CSV/index bytes changed, so no edit-byte verification applies.
No global audit, inventory rebuild, package build or in-game test was run.
