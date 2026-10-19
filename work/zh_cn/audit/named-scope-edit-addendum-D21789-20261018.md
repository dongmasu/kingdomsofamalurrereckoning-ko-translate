# D-21789 Edit Addendum

Latest verified proper-name batch: D-21789 (2026-10-18).
Reviewed 50 distinct resource/ID/variant keys: {"accepted"=>34, "excluded"=>12, "not-an-issue"=>4}.
Groups: {"skill:sagecraft"=>50}. Last reviewed key: default:64079: / skill:sagecraft.
Next batch: D-21790; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 48094; accepted=32352, excluded=3183, not-an-issue=12448, uncertain=111.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 111, in 106 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`.
- base: `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`.
- default: `3589fdc139cf0d115846633bd20eca95e2fa649efec25432ec89d279fdec5e7d`.
Last batch pre-edit backups and byte validation:
- default: 34 cells; pre `94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a`; post `3589fdc139cf0d115846633bd20eca95e2fa649efec25432ec89d279fdec5e7d`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21789/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 34 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 3589fdc139cf0d115846633bd20eca95e2fa649efec25432ec89d279fdec5e7d
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 12 cells; pre `6c493c8da944fcfd510290a66a512d5cbba2fc848f33de80927ba976f4c6ac8b`; post `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21762/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 2 cells; pre `7e0ed846cf3f66cc0362531be4c52816b3c16e3b0caf62606d951706cf9419f9`; post `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21788/locatexts_zh_cn.koalocatext_base.csv`.
- default: 34 cells; pre `94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a`; post `3589fdc139cf0d115846633bd20eca95e2fa649efec25432ec89d279fdec5e7d`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21789/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `2454db5b41f78f6679d4925817049e5bfda56a9d68c195cc77bf748d6e0a1b48`.
Occurrence index: 48094 rows; SHA-256 `1b85a3f4ab62698375f79a6d169123fe0a38b6e32baf9d67834e1e5061b7440d`.
Proper-name glossary: 2306 entries; SHA-256 `1d5c4b8de1674dbdd29d5af0df607244780ff41b67fb08273d794bbd9d5f7241`.
Report: `work/zh_cn/audit/named-scope-review-D21789-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21789-20261018.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21789.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.

## Review Rationale

This batch completes the 100-key Sagecraft skill review begun in D-21788.
The official Korean manual supplies `마법물품 제작(Sagecraft)` (PDF p. 4)
and identifies `Sagecrafting` as an English variation. English context
separates the named skill from generic workstations and ordinary object
descriptions; Japanese and Chinese are supporting checks only. No generic
altar/table or item text was changed as a consequence of the skill-name
decision.

`base:4438` remains excluded from the skill and unresolved as a possible
place. This review does not establish that a named hall exists, and it
does not alter the existing Korean label or any previous translation
finding. See the per-key manifest for all decisions and exact source rows.
