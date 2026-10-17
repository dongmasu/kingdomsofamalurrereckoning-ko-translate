# D-20927: Reviewed Proper-Name Batch

Date: 2026-10-15

## Scope

Latest verified proper-name batch: D-20927 (2026-10-15).
Reviewed 24 distinct resource/ID/variant keys: {"accepted"=>12, "not-an-issue"=>12}.
Groups: {"person:janis"=>1, "title:vox-victorium"=>12, "place:mithros-arena"=>4, "place:erathell-arena"=>5, "person:voss-deviant"=>3}. Last reviewed key: default:64706: / person:voss-deviant.
Next batch: D-20928; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 26166; accepted=17377, excluded=1579, not-an-issue=7192, uncertain=18.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 18, in 16 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `fc287bf4ced197d3c8372d251e681ca66a759e2a8197668fe8c6cd0c16ac94dc`.
- default: `263034ddd6901444e9112ed356f44ed63299092315fc33dd8f864d46c624660f`.
Last batch pre-edit backups and byte validation:
- default: 12 cells; pre `56c204a50cb2dd717796687fbc03234adb33cef1f209a140f284fdf10df2c803`; post `263034ddd6901444e9112ed356f44ed63299092315fc33dd8f864d46c624660f`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20927/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 12 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 263034ddd6901444e9112ed356f44ed63299092315fc33dd8f864d46c624660f
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `ad579e00bae956442e66bd4580e4b0eaa2c52752ddbf76c7768c8a4c22a4d92e`; post `fc287bf4ced197d3c8372d251e681ca66a759e2a8197668fe8c6cd0c16ac94dc`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20926/locatexts_zh_cn.koalocatext_base.csv`.
- default: 12 cells; pre `56c204a50cb2dd717796687fbc03234adb33cef1f209a140f284fdf10df2c803`; post `263034ddd6901444e9112ed356f44ed63299092315fc33dd8f864d46c624660f`; backup `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20927/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `b255601f0180b2f34a60886e3ad16e1a892bfac091bfb8d8f5cf0e3293da7c98`.
Occurrence index: 26166 rows; SHA-256 `43ee04b1d35a5013d43d63db6b02b23a25ddc7623b6dce631d5f42b249ca17ab`.
Proper-name glossary: 668 entries; SHA-256 `a76dfabf094ebc85f47a6dfd0e4c5217c728cc2deac4ac6f0ff26951fbda13ae`.
Report: `work/zh_cn/audit/named-scope-review-D20927-20261015.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D20927-20261015.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D20927.tsv`.


## Source-Identified Names

Registered `복스 빅토리움(Vox Victorium)` as the host's title, distinct
from the person `재니스(Janis)`. Standardized
`보스 디비언트(Voss Deviant)` and retained its source-shortened surname
as `디비언트(Deviant)` in default 58557. Registered the complete venue
names `미스로스 투기장(Mithros Arena)` and
`에라셀 투기장(Erathell Arena)` separately from the existing region
entities. Twelve cells changed and twelve were retained across 24
distinct rows; the Janis row contains two entity occurrences.

The independent read-only reviewer compared all 73,430 aligned source
rows, confirmed all 25 entity occurrences and the per-cell proposals,
and found no semantic, particle, repeated-label, or scope defects.

## Checkpoint Recovery

The first checkpoint writer failed after CSV application, independent
byte verification, and index update because Ruby 2.6.10 lacks
`Array#filter_map`. Replaced it with `map.compact`, reproduced the
compatibility issue, and added checkpoint tests for resource-specific
backup retention and non-reopening of held keys. Regenerated records
from the existing manifest and verified backup without reapplying CSV
edits or adding duplicate occurrences. The recorded post-edit hash is
the same before and after record recovery.

## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.
