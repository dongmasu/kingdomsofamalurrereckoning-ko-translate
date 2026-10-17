# D-21084 Edit Addendum

Latest verified proper-name batch: D-21084 (2026-10-16).
Reviewed 23 distinct resource/ID/variant keys: {"accepted"=>14, "not-an-issue"=>9}.
Groups: {"faction:scholia-arcana"=>9, "place:shieldring-keep"=>14}. Last reviewed key: default:58558: / place:shieldring-keep.
Next batch: D-21085; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 31822; accepted=21092, excluded=2102, not-an-issue=8608, uncertain=20.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`.
- default: `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`.
Last batch pre-edit backups and byte validation:
- default: 14 cells; pre `5e1b5ef837a72803482ce93f0c2607be1e5423114ad8b0c5fc6b790c02d92239`; post `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21084/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 14 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994
Last actual CSV-edit backups (retained across no-edit batches):
- base: 5 cells; pre `f0c7ce23cc13c949e4e83ee6aba5b839bb3a310a9d3d1a1b16b3b9ea673bdbd0`; post `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21082/locatexts_zh_cn.koalocatext_base.csv`.
- default: 14 cells; pre `5e1b5ef837a72803482ce93f0c2607be1e5423114ad8b0c5fc6b790c02d92239`; post `88edd78f8c96ecb54e83285f53ddf37c35155749760a449d6331e1f03d4f7994`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21084/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `55b19df566de54c4b58a3cef5f6e8c3276e873737b98a2e36423aa93acfa3d2f`.
Occurrence index: 31822 rows; SHA-256 `a37f068e367aabc2bd40dc4a1754ef49a9d655313f81a5dae1275066040146bd`.
Proper-name glossary: 815 entries; SHA-256 `bba5b47ab65f3f2aae7160d3e19bc4cb7f480322b423130870d2d85cbe1f1543`.
Report: `work/zh_cn/audit/named-scope-review-D21084-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21084-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21084.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.

## Follow-up Verification (2026-10-16)

The D-21084 test fixture now reconstructs the pre-edit input from the exact
manifest and checks that generated old/new cells and dispositions match it;
the active inventory is independently required to match every post-edit
manifest value. The regression test passes.

Residual source/index reconciliation passes with one previously documented
source exclusion (`person:phasmer-humm`, `default:13525`), 202 documented
contextual extras, zero undocumented extras, zero terminal rows missing a
bilingual English label, and one documented idiomatic non-label. The four
legacy pending-discovery packages reconcile all 1,661 distinct
entity/resource/ID/variant keys to active index entries and
entity-specific dispositions. These checks do not reopen or recount prior
decisions.
