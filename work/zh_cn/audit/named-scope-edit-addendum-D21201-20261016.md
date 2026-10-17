# D-21201 Edit Addendum

Latest verified proper-name batch: D-21201 (2026-10-16).
Reviewed 2 distinct resource/ID/variant keys: {"not-an-issue"=>1, "accepted"=>1}.
Groups: {"person:zoef"=>2}. Last reviewed key: default:55618: / person:zoef.
Next batch: D-21202; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 35678; accepted=23621, excluded=2247, not-an-issue=9785, uncertain=25.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 25, in 23 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=213, heuristic-not-reviewed=92. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `2f43bc60a43c6f69bb67b15b314227418aae9e7d95faa2ca9943d6a409f09112`.
- default: `14647cefd148b050e0fc36ee81564b38b9f83a3c197e39b7bbbc6a837038d372`.
Last batch pre-edit backups and byte validation:
- default: 1 cells; pre `005680b0ad0f8d5c8f2194ddca60e81daf71d87b546d953afea126370177a8bf`; post `14647cefd148b050e0fc36ee81564b38b9f83a3c197e39b7bbbc6a837038d372`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21201/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 14647cefd148b050e0fc36ee81564b38b9f83a3c197e39b7bbbc6a837038d372
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `2eb3e7421d0695209ff45ce2aa6c32cbf67263f97052d6ea14d4b3d0ae741dcb`; post `2f43bc60a43c6f69bb67b15b314227418aae9e7d95faa2ca9943d6a409f09112`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21200/locatexts_zh_cn.koalocatext_base.csv`.
- default: 1 cells; pre `005680b0ad0f8d5c8f2194ddca60e81daf71d87b546d953afea126370177a8bf`; post `14647cefd148b050e0fc36ee81564b38b9f83a3c197e39b7bbbc6a837038d372`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21201/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `3a68c7866a4aad36a9e3cd9e3200dd241f07e31be6fade88d8855d08494ee553`.
Occurrence index: 35678 rows; SHA-256 `75888065da83267579606482ab50a7809c680403114a8de49c2c7b88d6ed7f4f`.
Proper-name glossary: 1030 entries; SHA-256 `126893925ed862365c4ca127ebd1be3634b1a871580152a44bf949816d70bed3`.
Report: `work/zh_cn/audit/named-scope-review-D21201-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21201-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21201.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.

## Cross-Row Re-review

This batch updates the existing `person:zoef` entry; it does not create
another entity or append duplicate occurrence keys. D-20565 and D-20570 had
retained each complete bilingual full-name cell independently. Comparing the
two exact rows together revealed inconsistent Korean transliteration despite
identical English, Japanese, and Chinese names. The established `조프` form
from default ID 63838 is retained; only default ID 55618 changes to
`앨버트 조프(Albert Zoef)`. The prior decisions are superseded only for these
two full-name rows, and the index entries are updated in place.
