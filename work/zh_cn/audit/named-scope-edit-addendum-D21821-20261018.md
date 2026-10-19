# D-21821 Edit Addendum

Only default:4852 changed:
`긍지 높은 워스원(Warsworn)` ->
`긍지 높은 워스원(The Proud Warsworn)`. The already paired
base:1769:11 label was retained.

The byte-preserving editor and independent verifier used the byte-identical
pre-edit CSV backup
`/private/tmp/ko-translate-backups/20261018/before-proper-name-D21821/locatexts_zh_cn.koalocatext_default.csv`
and passed BOM, mixed line-ending, row-order/count, target-cell, non-target
byte, and inverse-reconstruction checks.

The `korean_current` cache in `proper-name-occurrences.tsv` was synchronized
for the existing `faction:warsworn` / `default:4852` row. Its
byte-identical pre-refresh backup is
`/private/tmp/ko-translate-backups/20261018/before-proper-name-D21821/proper-name-occurrences.tsv`.
Only that one field changed. Existing status `not-an-issue`, evidence,
all other index fields, row ordering/count, glossary, and cumulative status
counts are unchanged.

Latest verified proper-name batch: D-21821 (2026-10-18).
Reviewed both bounded `The Proud Warsworn` memberships: replaced the incomplete `Warsworn` component annotation at default:4852 with the complete label `The Proud Warsworn`; retained the already paired base:1769:11 display.
English, Japanese, and Chinese support the “proud Warsworn” reading. D-20771's existing `faction:warsworn` not-an-issue status at default:4852 remains unchanged; no new entity, glossary entry, indexed status/count, or cumulative total was added.
The occurrence index's `korean_current` snapshot for faction:warsworn/default:4852 was refreshed to match the active CSV; its one-field-only change was verified against the byte-identical backup.
Next batch: D-21822; continue refreshed short-label snapshot `proper-name-short-label-discovery-D21821.tsv` (14 bounded groups; first `The Travelers`; not exhaustive or a completion estimate).
Indexed matches: 48321; accepted=32523, excluded=3214, not-an-issue=12473, uncertain=111 (status counts unchanged).
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 111, in 106 distinct CSV row keys.
These focused index counts are not global translation totals. Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive and establishes no overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D21821.tsv`.
Edit manifest: `work/zh_cn/audit/proper-name-edits-D21821.tsv`.
Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D21821.tsv`.
Active CSV SHA-256:
- affix: `d626613abec04cf818602ed9c627490a9668a65783e9619e50e84fb97bdfc2dd`.
- base: `ebe01c2de0e25685024e24026492b6049dd73f0558e6b6662621e3b8809e2f69`.
- default: `d64309a2986eb2f9c23c7b7edfa45a94d712d016bd3a3295ae5fe3591bfdf391`.
Last batch pre-edit backup and byte validation:
- default: 1 cell; pre `f454c28432d22f4351037388582067a5384ace098e08ff91b85681f84c236d55`; post `d64309a2986eb2f9c23c7b7edfa45a94d712d016bd3a3295ae5fe3591bfdf391`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21821/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 1 cell; 65,135 ordered rows; masked non-target bytes and inverse equal backup; SHA-256 d64309a2986eb2f9c23c7b7edfa45a94d712d016bd3a3295ae5fe3591bfdf391
Occurrence index: 48,321 rows; pre-refresh SHA-256 `afb2218bb9d48ea31807b668219d2019d7797c0fb03386c8e5927470dfe1bae1`; post-refresh SHA-256 `cf2830cbe101c49899d2a38119c99f0046a856cb31e0bf341f01b55d6bea868a`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21821/proper-name-occurrences.tsv`.
Aligned inventory: 73,430 rows; SHA-256 `280319f67b2e0f9ff81b5ba5f75b98729a7e5092f2ad6930b64216b178c069b1`.
Proper-name glossary: 2,325 entries; SHA-256 `b4ca8217bdcd53728870453a5838a93bd1992e07cd0ed5f808daf6f406a23658` (unchanged).
Residual bilingual/index audit: PASS; missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; 47,257 source matches, 48,321 indexed matches, 73,430 CSV rows; terminal matches without bilingual coverage=0.
Data validation: PASS 2,325 unique entities; 48,321 unique active-aligned occurrences.
