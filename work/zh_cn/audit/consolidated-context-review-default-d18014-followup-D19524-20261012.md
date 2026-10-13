# Consolidated Context Review: D-18014 Follow-Up

- Date: 2026-10-12; decision D-19524.
- Scope: all 12 open `default` keys in grouped hold D-18014.
- Compared English meaning, Japanese voice/context, Chinese supporting
  evidence, active Korean, and accepted Castellan terminology.

## Decisions

| ID | Disposition | Evidence and rationale |
| ---: | --- | --- |
| 62601 | not an issue | The standalone English people/name label `Dverga` is retained as `드베르가`; adjective/noun and wider spelling policy are not row-level errors here. |
| 62604 | uncertain; retain D-18014 | English identifies a black Prismere weapon called a `Sorrow` associated with the House of Sorrows. Locale renderings differ on item name and form; current Korean preserves both the pun and source label. |
| 62609 | uncertain; retain D-18014 | English's fragment `agents in every shadow, and whisper` is ambiguous. Korean preserves its shadow/whisper image; Chinese makes the whisper-listening relation more explicit. |
| 62611 | accepted | English `Any time she was not on duty` and Japanese `任務外の時間` support `근무 중이 아닐 때면` rather than Korean's narrower `근무가 없는 날이면`. Her identity is not required to understand the source's learning relation. |
| 62613 | not an issue | Japanese and Chinese confirm Ironfast as the addressed location; Korean preserves the name, Warsworn address, dusty helms/scored blades, and action-over-finery contrast. |
| 62616 | partial accepted; remain uncertain under D-18014 | D-18374/D-18383 establish `Castellan = 성주`; correct `성채장` to `성주(Castellan)`. Keep the independent formal `Hall of the Firstsworn` rendering question open. |
| 62619 | not an issue | Korean preserves the place's importance in the Faelands and its role as a repository/summary of Gnomish knowledge, culture, and progress without inventing a proper name. |
| 62620 | not an issue | English/Japanese/Chinese identify Thresh as the attacker; Korean retains the source name and the normally fatal encounter. |
| 62633 | not an issue | Korean identifies the Bursar as the expedition funder and preserves the private operation's integration with municipal services. It does not add an unsupported identity. |
| 62645 | uncertain; retain D-18014 | `Thresh - RapidFire - Ammo` may be an internal/debug key or a player-facing label; the intended audience and component semantics are not established. |
| 62648 | uncertain; retain D-18014 | Capitalized `Marches` may be a named region, while Korean `황무지` is generic. No canonical Korean place rendering is established by these sources. |
| 62650 | not an issue | Korean preserves the Fae Adar, Burren Cove jail, gate unbarring, binding-spell removal, and next action. Its `behind the jail` location follows primary English despite locale paraphrases. |

## Applied Text

| ID | Previous Korean | Applied Korean | Disposition |
| ---: | --- | --- | --- |
| 62611 | `근무가 없는 날이면` | `근무 중이 아닐 때면` | accepted |
| 62616 | `모든 워스원 성채장이` | `모든 워스원 성주(Castellan)가` | partial; Hall of the Firstsworn remains uncertain |

## Verification

- Results: one accepted correction, six `not an issue`, and five remain
  uncertain (including the partial correction at ID 62616).
- Pre-edit SHA-256: `50b48de31781d923f022aed21cccca7f40174157b1f35c3722b0879545697348`.
- Post-edit SHA-256: `ba6f4fc7f1f3cfe91d9e00eaa7669c828fff04c1631cda6005c84e821417b9bf`.
- Byte-identical pre-edit backup: `/private/tmp/ko-translate-backups/20261012/before-d18014-followup-D19524/locatexts_zh_cn.koalocatext_default.csv`.
- The UTF-8 BOM, 65,135 CSV records and ID order, 72,011 CRLF endings, and 73 bare-LF endings are preserved. Reversing the two exact substitutions reconstructs the backup byte-for-byte.
- Totals after D-19524: **2,444 accepted / 25,302 not an issue / 10,778 uncertain** (38,524).
- Resume D-19525 with the residual D-18014 terminology questions, beginning at ID 62604; do not repeat the six closed keys.
- The 55 provisional Chinese-only `affix` uncertainties remain separate and open.

These are working dispositions, not independent final linguistic approval.
