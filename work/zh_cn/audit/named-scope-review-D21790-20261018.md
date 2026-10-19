# D-21790: Reckoning And Ring Short-Label Review

Date: 2026-10-18

## Scope

Latest verified proper-name batch: D-21790 (2026-10-18).
Reviewed 7 short-label candidate memberships in 7 distinct source keys: {"uncertain"=>2, "not-an-issue"=>5}.
Candidate groups: {"Reckoning"=>3, "Ring"=>4}. Last reviewed candidate: Ring / default:1029.
Next batch: D-21791; continue the refreshed short-label candidate snapshot `proper-name-short-label-discovery-D21790.tsv` (57 bounded groups; first `Savant`; not exhaustive or a completion estimate).
Indexed matches: 48094; accepted=32352, excluded=3183, not-an-issue=12448, uncertain=111 (unchanged in this candidate-only batch).
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 111, in 106 distinct CSV row keys.
Candidate classifications do not alter occurrence-index statuses or cumulative indexed counts. D-760 at default:3621 remains uncertain; D-20388 at default:1029 is retained without recount.
These focused index states are not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive and establishes no overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D21790.tsv`.
Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D21790.tsv`.
Active CSV SHA-256:
- affix: `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`.
- base: `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`.
- default: `3589fdc139cf0d115846633bd20eca95e2fa649efec25432ec89d279fdec5e7d`.
No CSV edits; no new backup required. Retain last actual pre-edit backups:
- affix: 12 cells; pre `6c493c8da944fcfd510290a66a512d5cbba2fc848f33de80927ba976f4c6ac8b`; post `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21762/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 2 cells; pre `7e0ed846cf3f66cc0362531be4c52816b3c16e3b0caf62606d951706cf9419f9`; post `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21788/locatexts_zh_cn.koalocatext_base.csv`.
- default: 34 cells; pre `94be8727d8d8c9b4d8b318d550d10cb1ad88783aa5941414866cca303c13764a`; post `3589fdc139cf0d115846633bd20eca95e2fa649efec25432ec89d279fdec5e7d`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21789/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `2454db5b41f78f6679d4925817049e5bfda56a9d68c195cc77bf748d6e0a1b48`.
Occurrence index: 48094 rows; SHA-256 `1b85a3f4ab62698375f79a6d169123fe0a38b6e32baf9d67834e1e5061b7440d`.
Proper-name glossary: 2306 entries; SHA-256 `1d5c4b8de1674dbdd29d5af0df607244780ff41b67fb08273d794bbd9d5f7241`.
Report: `work/zh_cn/audit/named-scope-review-D21790-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21790-20261018.md`.
Candidate disposition manifest: `work/zh_cn/audit/proper-name-short-label-dispositions-D21790.tsv`.
Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D21790.tsv`.


## Findings

- `Reckoning` / `default:3621:`: uncertain. Retain historical D-760. English says the in-game manual covers the major systems "in Reckoning"; Chinese renders the phrase as 《惩罚》, while Japanese omits the name. This does not decide whether the source means the original game title or the game/system generally. Existing Korean 레코닝(Reckoning) is preserved.
- `Reckoning` / `default:39728:`: not-an-issue. This is a direct gameplay-mode reference: English says "enter Reckoning", Chinese specifies 惩罚模式, and the official Korean manual defines Reckoning mode as 레코닝 모드 (PDF pp. 1, 3, 5). Existing 레코닝(Reckoning) 상태 preserves the mode meaning and English identity; no edit is needed.
- `Reckoning` / `default:63328:`: uncertain. The standalone English label has no local UI/context string to distinguish the original game title from the named Reckoning gameplay mode. Japanese 審判 and Chinese 惩罚 are localized renderings, not independent proof of which entity the label denotes. Preserve 레코닝 and defer bilingual/title styling; do not supersede D-760 by inference.
- `Ring` / `base:3711:11`: not-an-issue. English Ring is a generic equipment label; Japanese リング, Chinese 戒指, and the Korean 반지 agree. It is not an individually named ring.
- `Ring` / `base:4365:11`: not-an-issue. English Ring is a generic equipment label; Japanese リング, Chinese 戒指, and the Korean 반지 agree. It is not an individually named ring.
- `Ring` / `default:53416:`: not-an-issue. English Ring is the generic equipment category; Japanese 指輪, Chinese 戒指, and the Korean 반지 agree. No specific named item is identified.
- `Ring` / `default:1029:`: not-an-issue. This is the Ring collective associated with Vilaghru’s Twelve, not jewelry. Preserve the historical D-20388 identification and its exact Korean 고리(Ring); the candidate row already has a bilingual label. Do not reopen or recount the Ring of Keozai decision.

The English source determines meaning and identity. Japanese provides
tone/usage evidence; Chinese is corroborative only. The official Korean
manual identifies Reckoning mode as `레코닝 모드` (PDF pp. 1, 3, 5).
Existing D-760 remains unresolved because it concerns whether
`default:3621` uses the original product title or the game/system
generally; the standalone `default:63328` has no resolving context.
`default:39728` independently identifies the gameplay mode and already
carries `레코닝(Reckoning)`.

The three equipment labels use generic `반지`, while `default:1029`
uses the collective `Ring` in the Twelve/Vilaghru passage and retains
the earlier D-20388 `고리(Ring)` finding. These senses are not merged.
Existing terminal decisions and historical counts were not reopened.
No CSV, occurrence-index, or glossary bytes changed.

## D-21790: Reckoning And Ring Short-Label Review

Reviewed seven short-label memberships in seven distinct source keys:
`Reckoning` (3) and `Ring` (4). Two `Reckoning` labels remain uncertain;
the explicit mode use is already correctly paired. Generic equipment
rings remain `반지`; `default:1029` retains the separate collective
`고리(Ring)` disposition from D-20388. No indexed status, cumulative
count, or CSV cell changed. Exact aligned locale text and prior index
decisions are in `proper-name-short-label-dispositions-D21790.tsv`.
D-760 at `default:3621` is not superseded. The refreshed candidate
snapshot is bounded, not exhaustive; full proper-name discovery and
residual validation remain incomplete.

## Validation

No-edit validation and residual bilingual/index audit passed. The
refreshed bounded short-label snapshot was rebuilt from the current
aligned inventory after excluding prior candidate dispositions.

Validation: PASS 2306 unique entities; 48094 unique active-aligned occurrences
{"accepted"=>32352, "uncertain"=>111, "excluded"=>3183, "not-an-issue"=>12448}
Residual bilingual/index audit: PASS; Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; Source/occurrence comparison: 47030 source matches, 48094 indexed matches, 73430 CSV rows; Terminal matches without a covering bilingual English label: 0
No-edit CSV check: all three active SHA-256 values match the pre-review values.
