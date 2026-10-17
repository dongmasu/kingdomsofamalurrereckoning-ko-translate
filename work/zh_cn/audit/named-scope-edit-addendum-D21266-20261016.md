# D-21266 Edit Addendum

Latest verified proper-name batch: D-21266 (2026-10-16).
Reviewed 46 distinct resource/ID/variant keys: {"not-an-issue"=>22, "accepted"=>24}.
Groups: {"place:madding-wind"=>46}. Last reviewed key: default:63958: / place:madding-wind.
Next batch: D-21267; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 36940; accepted=24612, excluded=2252, not-an-issue=10048, uncertain=28.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 28, in 26 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `07d2a2f469521ea7798aec83edadd94a84c6703418b789841dd699fdf2fc0136`.
- default: `b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446`.
Last batch pre-edit backups and byte validation:
- default: 24 cells; pre `5bbaa95e9341c504e88a550f637c140107f9fcfcaf982710a2fdae799c1c9ecc`; post `b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21266/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 24 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446
Last actual CSV-edit backups (retained across no-edit batches):
- base: 2 cells; pre `ba19888f1822c4570ae46e4ac0a4857227b2de813cd437bd6bec98f8dec8d1de`; post `07d2a2f469521ea7798aec83edadd94a84c6703418b789841dd699fdf2fc0136`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21265/locatexts_zh_cn.koalocatext_base.csv`.
- default: 24 cells; pre `5bbaa95e9341c504e88a550f637c140107f9fcfcaf982710a2fdae799c1c9ecc`; post `b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21266/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `987445f1ef3c9ce8221c311f8cc70e2f48e2cfd6b48ae236969ae3870bf53fe8`.
Occurrence index: 36940 rows; SHA-256 `02e6234257bae98d4a4f978a3e4673c250dab6680df464fc51fad832e7f787ca`.
Proper-name glossary: 1191 entries; SHA-256 `4627e7b4ad2c3588d311a29d9881efe72afaceed862fef2cd71b73ec47d640f0`.
Report: `work/zh_cn/audit/named-scope-review-D21266-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21266-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21266.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.

## D-21266: Madding Wind

The registered canonical place name is `매딩 윈드(Madding Wind)`. All 46
source-matched keys were reviewed across `base` and `default`: 24 default
`Texto` cells changed, 22 keys were already correct, and the base key was
already correct. The standalone title at default:29371 is
`매딩 윈드 감옥(Madding Wind Prison)`; lower-case sentence-level prison
descriptions use `매딩 윈드(Madding Wind) 감옥`.

The byte-identical pre-edit default backup is
`/private/tmp/ko-translate-backups/20261016/before-proper-name-D21266/locatexts_zh_cn.koalocatext_default.csv`.
The separate verifier confirmed all 65,135 ordered rows, exact target cells,
unchanged non-target cells and bytes, BOM, the complete mixed-line-ending
sequence, and inverse reconstruction to that backup. No base cell changed.
The 11 row keys also indexed for other entities and their prior dispositions
were preserved. This adds one glossary entity and 46 focused occurrence
records; it does not alter historical global translation totals.

## Post-Batch Validation

- `verify-proper-name-batch-chain.rb 21229 21266`: PASS across the recent
  chain; 504 default and 64 base edit events reconstructed to the recorded
  pre-D-21229 hashes.
- `validate-proper-name-data.rb`: PASS, 1,191 unique glossary entities and
  36,940 unique active-aligned occurrence matches.
- `audit-proper-name-residual-final.rb`: PASS, zero missing source keys,
  zero undocumented extras, and zero terminal bilingual-label omissions;
  347 contextual extras remain documented, with one documented idiomatic
  non-label.
- `verify-proper-name-full-chain.rb`: could not complete because the
  byte-identical pre-edit backup for D-21146 `default` is absent from
  `/private/tmp/ko-translate-backups/`. Reported stages D-21266 through
  D-21148 were verified
  before the script reached that gap; this does not invalidate the separately
  passing recent-chain and D-21266 byte checks.
