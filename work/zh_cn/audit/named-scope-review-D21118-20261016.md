# D-21118: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21118 (2026-10-16).
Reviewed 22 distinct resource/ID/variant keys: {"accepted"=>16, "not-an-issue"=>6}.
Groups: {"faction:house-ansilla"=>17, "faction:house-gastyr"=>5}. Last reviewed key: default:61795: / faction:house-ansilla.
Next batch: D-21119; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 33077; accepted=21812, excluded=2218, not-an-issue=9026, uncertain=21.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 21, in 19 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `9686c297843c485adb0f26967c4f4a2e92ffdc05e9b9a82fe36b4e3371edd616`.
- default: `f5850cbeed73385e87e60c063c27fed684d91385dd8dbb79ebaadf8183a45163`.
Last batch pre-edit backups and byte validation:
- default: 16 cells; pre `d9d6eb8948556b2addc97f212c67586a744c3defe043c064628d4c98b21a6f77`; post `f5850cbeed73385e87e60c063c27fed684d91385dd8dbb79ebaadf8183a45163`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21118/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 16 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 f5850cbeed73385e87e60c063c27fed684d91385dd8dbb79ebaadf8183a45163
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `aafafe22c00282aba039eab721444f5a614d502b1d1b337d33c4a719061ddaaa`; post `9686c297843c485adb0f26967c4f4a2e92ffdc05e9b9a82fe36b4e3371edd616`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21108/locatexts_zh_cn.koalocatext_base.csv`.
- default: 16 cells; pre `d9d6eb8948556b2addc97f212c67586a744c3defe043c064628d4c98b21a6f77`; post `f5850cbeed73385e87e60c063c27fed684d91385dd8dbb79ebaadf8183a45163`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21118/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `5a460f0abbd85245ece675967a1cf5560989e6956a4c028d8e0f5604e127ccbe`.
Occurrence index: 33077 rows; SHA-256 `7827dff8a9226a23cb11309da1d5664a0beb3640f715ae8d1294027d84d8249b`.
Proper-name glossary: 871 entries; SHA-256 `c5694478fe36779fa820754709fd9895cf9f03dde4c75c1b8883d2212c6963a2`.
Report: `work/zh_cn/audit/named-scope-review-D21118-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21118-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21118.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Decisions

Registered `House Ansilla` and `House Gastyr` as separate `faction` family
entities. English identifies the Ansillas as an Alfar royal/noble family line
and the Gastyrs as Hillared's Alfar family line; aligned Japanese
`アンシラ家` / `ガスティア家` and Chinese `安西拉家族` / `加斯提尔家族`
corroborate those readings. The official Korean manual does not establish
forms for these two houses; its omission is not contrary evidence.

Reviewed all 22 exact English phrase occurrences: 17 Ansilla and five
Gastyr. Standard forms are `안실라 가문(House Ansilla)` and
`가스티르 가문(House Gastyr)`. Preserved `왕가` in the royal-house item
description, pairing it with the canonical English name. Corrected 16
`default` cells and retained six cells already matching the standard.
Distinguished both family entities from the personal names Lady/Captain
Ansilla and Hillared Gastyr, and from Castle Ansilla/Castle Gastyr.
Earlier sequential findings were neither reopened nor recounted.

The discovery manifest records each row's English, Japanese, Chinese, old
Korean, and new Korean text. The definitions and review manifest are
`proper-name-discovery-definitions-D21118.tsv` and
`proper-name-discovery-D21118.tsv`.
