# D-21021: Reviewed Proper-Name Batch

Date: 2026-10-15

## Scope

Latest verified proper-name batch: D-21021 (2026-10-15).
Reviewed 1 distinct resource/ID/variant keys: {"accepted"=>1}.
Groups: {"person:magwyr"=>1, "lore:the-telling"=>1}. Last reviewed key: default:610: / person:magwyr|lore:the-telling.
Next batch: D-21022; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 29787; accepted=19812, excluded=1978, not-an-issue=7979, uncertain=18.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 18, in 16 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `680b270ab15b2cb729e36be2c0e44dd931e90babe5699ced7fe8e4a45b6c7ae7`.
- default: `a29037b029ef597f40680b7451ad0a59dd7e361b923f6dc347bd7920ca795303`.
Last batch pre-edit backups and byte validation:
- default: 1 cells; pre `a4b8fe31fad7cd9e09d4a480611f1e5f8d1724b90c61d6cd56be5d7f1b2c1fa0`; post `a29037b029ef597f40680b7451ad0a59dd7e361b923f6dc347bd7920ca795303`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D21021/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 a29037b029ef597f40680b7451ad0a59dd7e361b923f6dc347bd7920ca795303
Last actual CSV-edit backups (retained across no-edit batches):
- base: 2 cells; pre `2a81c5521259768a3bf1a9e98b171cbb7cd292fb74deec2de864e4dcc6a118b7`; post `680b270ab15b2cb729e36be2c0e44dd931e90babe5699ced7fe8e4a45b6c7ae7`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D21012/locatexts_zh_cn.koalocatext_base.csv`.
- default: 1 cells; pre `a4b8fe31fad7cd9e09d4a480611f1e5f8d1724b90c61d6cd56be5d7f1b2c1fa0`; post `a29037b029ef597f40680b7451ad0a59dd7e361b923f6dc347bd7920ca795303`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D21021/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `c48746b6bcb0dab76ea5365d4903edcb9421ea8ced641bee008da38cee72591d`.
Occurrence index: 29787 rows; SHA-256 `c79ba042275b0ad1f2b9791554d8d87a3d562bffe56672a4855a9045385d087e`.
Proper-name glossary: 745 entries; SHA-256 `343a79310864a54bfc9697db78e2f46444aeaa32612b36ed0b4e0cdd4840ee4c`.
Report: `work/zh_cn/audit/named-scope-review-D21021-20261015.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21021-20261015.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21021.tsv`.


## Evidence

This is a corrective, not a new entity disposition. `default:610` already had
accepted index entries for `person:magwyr` (D-20978) and `lore:the-telling`
(D-21017). D-21020's The Telling normalization removed the existing
`시녀(The Maid)` annotation from the same sentence. Restored that annotation
only; both prior statuses and their evidence are retained in the manifest's
`previous_status` and `previous_evidence` fields. The two existing index
entries were updated in place, with no new occurrence and no tally increase.

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
