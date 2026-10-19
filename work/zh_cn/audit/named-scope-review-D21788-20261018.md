# D-21788: Reviewed Proper-Name Batch

Date: 2026-10-18

## Scope

Latest verified proper-name batch: D-21788 (2026-10-18).
Reviewed 50 distinct resource/ID/variant keys: {"accepted"=>37, "excluded"=>10, "not-an-issue"=>3}.
Groups: {"skill:sagecraft"=>50}. Last reviewed key: default:29299: / skill:sagecraft.
Next batch: D-21789; first unreviewed indexed key: skill:sagecraft / default:29542:.
Indexed matches: 48094; accepted=32318, excluded=3171, needs-context=50, not-an-issue=12444, uncertain=111.
Remaining unreviewed indexed matches: 50, in 50 distinct CSV row keys.
Reviewed unresolved indexed holds: 111, in 106 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`.
- base: `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`.
- default: `94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a`.
Last batch pre-edit backups and byte validation:
- base: 2 cells; pre `7e0ed846cf3f66cc0362531be4c52816b3c16e3b0caf62606d951706cf9419f9`; post `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21788/locatexts_zh_cn.koalocatext_base.csv`.
- default: 35 cells; pre `8e3ce89d8a65fb62c4dcffb9d1780bbe85979625eca963900bea479934921aef`; post `94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21788/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 2 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80
default: PASS 35 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 12 cells; pre `6c493c8da944fcfd510290a66a512d5cbba2fc848f33de80927ba976f4c6ac8b`; post `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21762/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 2 cells; pre `7e0ed846cf3f66cc0362531be4c52816b3c16e3b0caf62606d951706cf9419f9`; post `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21788/locatexts_zh_cn.koalocatext_base.csv`.
- default: 35 cells; pre `8e3ce89d8a65fb62c4dcffb9d1780bbe85979625eca963900bea479934921aef`; post `94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21788/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `fea755f507941c468e8e0e930276bc7207112a802f2c2e4d154fea5b247ae949`.
Occurrence index: 48094 rows; SHA-256 `37b37b5e7bbf326c924dc8ca14031c9fa66a39a9399d0c086c0363cc9c9ee857`.
Proper-name glossary: 2306 entries; SHA-256 `1d5c4b8de1674dbdd29d5af0df607244780ff41b67fb08273d794bbd9d5f7241`.
Report: `work/zh_cn/audit/named-scope-review-D21788-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21788-20261018.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21788.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Focused Findings

The 50 source keys cover the first Sagecraft skill batch, not a blanket
rewrite of every occurrence of `Sagecraft`. The official Korean manual
identifies the non-combat skill as `마법물품 제작(Sagecraft)` (PDF p. 4);
its extraction also lists `Sagecrafting` as an English variation. English
context separates direct skill references from generic workstations,
objects, and ordinary crafting descriptions. Japanese `宝石術` /
`セージクラフト` and Chinese `附魔` corroborate the system but do not
override English scope.

Direct skill references use the manual-backed Korean name with the
source-attested English form. Generic altar/table and object-description
uses are excluded from `skill:sagecraft`; their prior translations and
other entity decisions remain intact. The row-level decisions, including
the exact mixed-sentence spans and all exclusions, are in
`proper-name-edits-D21788.tsv`.

`base:4438` (`Hall of Sagecrafting`) is excluded from the skill entity only.
Its title could identify a venue, but the isolated English label and
Japanese `セージクラフトの間` / Chinese `附魔大厅` do not establish a
distinct place or canonical place name. Keep `마법물품 제작의 전당`
unchanged and carry this as a separate place-discovery hold; do not count
it as a confirmed place or reopen it without new contextual evidence.
