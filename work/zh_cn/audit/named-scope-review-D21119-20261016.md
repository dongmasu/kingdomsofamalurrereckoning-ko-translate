# D-21119: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21119 (2026-10-16).
Reviewed 29 distinct resource/ID/variant keys: {"accepted"=>29}.
Groups: {"faction:house-ansilla"=>15, "faction:house-gastyr"=>18}. Last reviewed key: default:64791: / faction:house-ansilla.
Next batch: D-21120; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 33110; accepted=21845, excluded=2218, not-an-issue=9026, uncertain=21.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 21, in 19 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `8def31acc821bd3b74ae76873906072e98085916af4a402d53cd9440dad76345`.
- default: `eb6094afa9c2f95b664255d27a71b76993c621c07ef0478712c66588ec0d46ab`.
Last batch pre-edit backups and byte validation:
- base: 1 cells; pre `9686c297843c485adb0f26967c4f4a2e92ffdc05e9b9a82fe36b4e3371edd616`; post `8def31acc821bd3b74ae76873906072e98085916af4a402d53cd9440dad76345`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21119/locatexts_zh_cn.koalocatext_base.csv`.
- default: 28 cells; pre `f5850cbeed73385e87e60c063c27fed684d91385dd8dbb79ebaadf8183a45163`; post `eb6094afa9c2f95b664255d27a71b76993c621c07ef0478712c66588ec0d46ab`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21119/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 1 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 8def31acc821bd3b74ae76873906072e98085916af4a402d53cd9440dad76345
default: PASS 28 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 eb6094afa9c2f95b664255d27a71b76993c621c07ef0478712c66588ec0d46ab
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `9686c297843c485adb0f26967c4f4a2e92ffdc05e9b9a82fe36b4e3371edd616`; post `8def31acc821bd3b74ae76873906072e98085916af4a402d53cd9440dad76345`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21119/locatexts_zh_cn.koalocatext_base.csv`.
- default: 28 cells; pre `f5850cbeed73385e87e60c063c27fed684d91385dd8dbb79ebaadf8183a45163`; post `eb6094afa9c2f95b664255d27a71b76993c621c07ef0478712c66588ec0d46ab`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21119/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `28798a6c1f4a8e411d8ef98cf8f20e9845a760b8dccfdba9c77601a43e44392f`.
Occurrence index: 33110 rows; SHA-256 `537c9fed6815385deabc9a3753816557636bdcd2543ae84b7b08760b843e450e`.
Proper-name glossary: 871 entries; SHA-256 `3fc9e60dbea2a7c591bdbecfc2e6ece1fe99eb75e785d32a3bb353d33f9deeb9`.
Report: `work/zh_cn/audit/named-scope-review-D21119-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21119-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21119.tsv`.


## Decisions

| Entity | Reviewed keys | Canonical form | Decision |
|---|---:|---|---|
| `faction:house-ansilla` | 15 | `안실라 가문(House Ansilla)` | Applied to family-line references; kept individual Ansillas and Castle Ansilla separate. |
| `faction:house-gastyr` | 18 | `가스티르 가문(House Gastyr)` | Applied to family-line references; kept Hillared Gastyr and Castle Gastyr separate. |

The 29 distinct reviewed row keys comprise one `base` cell and 28
`default` cells. Two `default` rows refer to both families and were updated
for both entities. Earlier sequential decisions and global tallies were not
reopened or recounted.

## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
