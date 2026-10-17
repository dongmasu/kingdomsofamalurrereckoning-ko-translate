# D-21054: Reviewed Proper-Name Batch

Date: 2026-10-15

## Scope

Latest verified proper-name batch: D-21054 (2026-10-15).
Reviewed 19 distinct resource/ID/variant keys: {"accepted"=>8, "not-an-issue"=>10, "excluded"=>1}.
Groups: {"person:ciara-sydanus"=>19}. Last reviewed key: default:8046: / person:ciara-sydanus.
Next batch: D-21055; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 30812; accepted=20477, excluded=1991, not-an-issue=8326, uncertain=18.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 18, in 16 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `f8d4853777f84b560faa59b2df4004a271be58065ea0e78c12d5a0845c9efed4`.
- default: `bc15addf6e1a40d479848c7f72652837a434fc4c2c5ac7ea24476bfa08799aec`.
Last batch pre-edit backups and byte validation:
- default: 8 cells; pre `04c80d5a24adb8ac14b9917879bd8cbee818970df4c82536023a959e5db0dc0f`; post `bc15addf6e1a40d479848c7f72652837a434fc4c2c5ac7ea24476bfa08799aec`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D21054/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 8 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 bc15addf6e1a40d479848c7f72652837a434fc4c2c5ac7ea24476bfa08799aec
Last actual CSV-edit backups (retained across no-edit batches):
- base: 3 cells; pre `a9781ba73796fc435790dcc6412be10b9c83ea449195ebe9192d1be75451d224`; post `f8d4853777f84b560faa59b2df4004a271be58065ea0e78c12d5a0845c9efed4`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D21050/locatexts_zh_cn.koalocatext_base.csv`.
- default: 8 cells; pre `04c80d5a24adb8ac14b9917879bd8cbee818970df4c82536023a959e5db0dc0f`; post `bc15addf6e1a40d479848c7f72652837a434fc4c2c5ac7ea24476bfa08799aec`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D21054/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `b5d5f29b1644b35998269e83201da82ee85adfb0d5ede867bc17d110de43afb5`.
Occurrence index: 30812 rows; SHA-256 `d6dcbdbed90344a328958a89f9650a71050776003fdf27709cffb1c999ad4905`.
Proper-name glossary: 771 entries; SHA-256 `9ce1e3fc8dc773342464cfd77827b7816fa5566309c18e5867e0913681608d1f`.
Report: `work/zh_cn/audit/named-scope-review-D21054-20261015.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21054-20261015.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21054.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Post-Batch Verification

- `verify-proper-name-batch-chain.rb 21050 21054`: PASS; 158 edited cells reconstructed to the pre-D-21050 hashes.
- `validate-proper-name-data.rb`: PASS; 771 unique entities and 30,812 active-aligned occurrences.
- `audit-proper-name-residual-final.rb`: PASS; 30,639 source matches, 173 documented contextual extras, zero missing or undocumented keys, zero terminal bilingual-label misses, and one intentional Crudok idiom.
- Proper-name occurrence, reconciliation, byte-preserving editor, and checkpoint fixture tests passed.
