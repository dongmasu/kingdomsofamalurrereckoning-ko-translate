# D-21089: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21089 (2026-10-16).
Reviewed 2 distinct resource/ID/variant keys: {"accepted"=>2}.
Groups: {"place:hall-of-the-firstsworn"=>2}. Last reviewed key: default:44231: / place:hall-of-the-firstsworn.
Next batch: D-21090; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 31956; accepted=21162, excluded=2145, not-an-issue=8629, uncertain=20.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 20, in 18 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`.
- default: `a030a10090e451145390c105a022cdb7c3d7cace4390f62ec88314a3c556dded`.
Last batch pre-edit backups and byte validation:
- default: 2 cells; pre `2767f8fc3947c42460ea089f9bbc03815aea91cad11dd6aa4f0fda95873daeb5`; post `a030a10090e451145390c105a022cdb7c3d7cace4390f62ec88314a3c556dded`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21089/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 a030a10090e451145390c105a022cdb7c3d7cace4390f62ec88314a3c556dded
Last actual CSV-edit backups (retained across no-edit batches):
- base: 5 cells; pre `f0c7ce23cc13c949e4e83ee6aba5b839bb3a310a9d3d1a1b16b3b9ea673bdbd0`; post `1e5b76298e6a75257aa35dc805602c715ba4ea11c63d4d88f889d9550e5045ed`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21082/locatexts_zh_cn.koalocatext_base.csv`.
- default: 2 cells; pre `2767f8fc3947c42460ea089f9bbc03815aea91cad11dd6aa4f0fda95873daeb5`; post `a030a10090e451145390c105a022cdb7c3d7cace4390f62ec88314a3c556dded`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21089/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `3e278f09c2c6a3e164b2df46a727c68898ecdc11a8012fbf496f5797adbf0dcf`.
Occurrence index: 31956 rows; SHA-256 `f6189cf3bd668e5868554a3d9624dc61a49ae00a6204f35e13c0182a3b3d1c4b`.
Proper-name glossary: 818 entries; SHA-256 `01d7e2e711eb515182bdb6c22246dbf5b0dc339725dbdffb573172719081e76e`.
Report: `work/zh_cn/audit/named-scope-review-D21089-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21089-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21089.tsv`.


## Evidence

This adds exactly two previously unindexed references to the existing
`place:hall-of-the-firstsworn` entity. At `default:40118`, English
`Halls of the Firstsworn`, Japanese `ファーストスウォーンの広間`, and
Chinese `首誓者大厅` identify the same place. Use
`첫서약자 전당(Halls of the Firstsworn)` and preserve the source plural
in the English parenthetical.

At `default:44231`, English `Firstworn` is an omitted-letter typo within
the exact Hall travel objective. Japanese and Chinese name the established
Hall; use `첫서약자 전당(Hall of the Firstsworn)` without altering the
immutable source CSV. This does not register a global plural/typo alias
or reopen any prior Hall-place decision.

The two rows were explicitly excluded from group-component changes in
D-21087/D-21088 and are now accepted under their separate existing-place
identity. Byte validation and the pre/post regression test passed.

Source/index reconciliation after D-21089 found 31,694 source matches,
31,956 indexed matches, one documented exclusion, 263 documented contextual
extras, and zero undocumented extras. No terminal index row lacks a
covering bilingual label, with the one already documented Crudok idiom.
Unregistered-name discovery remains incomplete; these counts are not
global translation totals.

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
