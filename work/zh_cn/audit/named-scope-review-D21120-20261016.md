# D-21120: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21120 (2026-10-16).
Reviewed 50 distinct resource/ID/variant keys: {"accepted"=>48, "not-an-issue"=>2}.
Groups: {"person:maire-ganan"=>50}. Last reviewed key: default:37800: / person:maire-ganan.
Next batch: D-21121; first unreviewed indexed key: person:maire-ganan / default:38664:.
Indexed matches: 33177; accepted=21893, excluded=2218, needs-context=17, not-an-issue=9028, uncertain=21.
Remaining unreviewed indexed matches: 17, in 17 distinct CSV row keys.
Reviewed unresolved indexed holds: 21, in 19 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `8def31acc821bd3b74ae76873906072e98085916af4a402d53cd9440dad76345`.
- default: `19131eec9b72b81cb7b4af5f78567563921f1821e571da4f858fdd05899eea47`.
Last batch pre-edit backups and byte validation:
- default: 48 cells; pre `eb6094afa9c2f95b664255d27a71b76993c621c07ef0478712c66588ec0d46ab`; post `19131eec9b72b81cb7b4af5f78567563921f1821e571da4f858fdd05899eea47`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21120/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 48 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 19131eec9b72b81cb7b4af5f78567563921f1821e571da4f858fdd05899eea47
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `9686c297843c485adb0f26967c4f4a2e92ffdc05e9b9a82fe36b4e3371edd616`; post `8def31acc821bd3b74ae76873906072e98085916af4a402d53cd9440dad76345`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21119/locatexts_zh_cn.koalocatext_base.csv`.
- default: 48 cells; pre `eb6094afa9c2f95b664255d27a71b76993c621c07ef0478712c66588ec0d46ab`; post `19131eec9b72b81cb7b4af5f78567563921f1821e571da4f858fdd05899eea47`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21120/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `0d8f310c41184a1f6f0190919b530ca6963558d6fb049d05ca9437becdd7b782`.
Occurrence index: 33177 rows; SHA-256 `dc65bd03f93a0a0fbe733adc7a0a0e82bc73b70fa1a7796f7a86906031d6d632`.
Proper-name glossary: 871 entries; SHA-256 `76d43765197b1b58572456d58f64b85f41c06319b245e5e29c0abb429401a50a`.
Report: `work/zh_cn/audit/named-scope-review-D21120-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21120-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21120.tsv`.


## Decision

This batch reviewed the first 50 of 67 newly indexed English-short-form
references to the already registered `person:maire-ganan`. It corrected 48
cells and retained two already-canonical cells as `not-an-issue`. The
standalone bilingual form is `메어(Maire)`, reusing the confirmed
`메어 가난(Maire Ganan)` entry rather than choosing a new phonetic spelling.
The aligned English narrative identifies the same person as Irion's wife and
Moon Camp co-leader; Japanese `メイア`/`マイア` and Chinese `麦内` corroborate
identity. Six existing full-name row keys and their dispositions were
preserved. This later glossary-backed name standardization does not reopen
earlier title-meaning decisions; their dispositions are not recounted.

## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
