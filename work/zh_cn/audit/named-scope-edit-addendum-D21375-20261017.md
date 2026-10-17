# D-21375 Edit Addendum

## Postflight Recovery

The 32-cell edit passed exact non-target byte and inverse-backup validation.
An alias-script postflight assertion incorrectly treated refreshed Korean
snapshots for overlapping entities as historical changes; no reapplication or
CSV rollback was performed. The checker now preserves status/evidence while
requiring active-aligned snapshots. Two tests/four assertions pass, and
`verify-jakin-history-D21375.rb` exactly reconstructs the prior glossary and
index hashes. Source/index residuals: missing=0, undocumented extras=0,
terminal bilingual label omissions=0.

Latest verified proper-name batch: D-21375 (2026-10-17).
Reviewed 41 distinct resource/ID/variant keys: {"not-an-issue"=>9, "accepted"=>32}.
Groups: {"person:jakin-madsen"=>41}. Last reviewed key: default:64638: / person:jakin-madsen.
Next batch: D-21376; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 39763; accepted=26525, excluded=2422, not-an-issue=10786, uncertain=30.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 30, in 28 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `e5facefeee7fd1b23dfaf46ac99f0b4738e6e444444724681f143c4330505ac3`.
- base: `d325a0811dab9d2c01602433e0c89021983262e9a113e6e018c0feec51f1aa28`.
- default: `7427be5febffacdded73e9766e917b2908a823ae60132681cec28d2ee491b3f0`.
Last batch pre-edit backups and byte validation:
- default: 32 cells; pre `6beb163683f74075dfc36974014428918938adac647908f5e4f1ed3d054f9550`; post `7427be5febffacdded73e9766e917b2908a823ae60132681cec28d2ee491b3f0`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21375/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 32 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 7427be5febffacdded73e9766e917b2908a823ae60132681cec28d2ee491b3f0
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`; post `e5facefeee7fd1b23dfaf46ac99f0b4738e6e444444724681f143c4330505ac3`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21335/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 2 cells; pre `d13949bdf7505a03a90b94113688f4de40c67ceed337d84853b19886af13a2df`; post `d325a0811dab9d2c01602433e0c89021983262e9a113e6e018c0feec51f1aa28`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21373/locatexts_zh_cn.koalocatext_base.csv`.
- default: 32 cells; pre `6beb163683f74075dfc36974014428918938adac647908f5e4f1ed3d054f9550`; post `7427be5febffacdded73e9766e917b2908a823ae60132681cec28d2ee491b3f0`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21375/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `a1e722b0dab92a493d814f65933031f034ffa5198427bebe8a8c78daf96a91b1`.
Occurrence index: 39763 rows; SHA-256 `07c9480b14090cda1789f0a02d2367b16485484d159afc388845c895346f9f7e`.
Proper-name glossary: 1578 entries; SHA-256 `b30043f3a2c79c852b09832558e7de56667d87ca970c4ba36a22aa7a829c358c`.
Report: `work/zh_cn/audit/named-scope-review-D21375-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21375-20261017.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21375.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.
