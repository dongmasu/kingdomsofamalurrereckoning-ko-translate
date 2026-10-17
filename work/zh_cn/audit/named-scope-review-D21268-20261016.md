# D-21268: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21268 (2026-10-16).
Reviewed 2 distinct resource/ID/variant keys: {"accepted"=>2}.
Groups: {"faction:great-house-abergawein"=>1, "place:abergawein-residence"=>1}. Last reviewed key: default:13598: / place:abergawein-residence.
Next batch: D-21269; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 36962; accepted=24614, excluded=2252, not-an-issue=10068, uncertain=28.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 28, in 26 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `eb6c511d52041a6b2fa3dd7d2fda560dbecd30cd882f4171656ce33401ab58a5`.
- default: `48e14535c837d39edef1f6dc90a330b155e402f46db59b42b44e386dd583a431`.
Last batch pre-edit backups and byte validation:
- base: 1 cells; pre `07d2a2f469521ea7798aec83edadd94a84c6703418b789841dd699fdf2fc0136`; post `eb6c511d52041a6b2fa3dd7d2fda560dbecd30cd882f4171656ce33401ab58a5`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21268/locatexts_zh_cn.koalocatext_base.csv`.
- default: 1 cells; pre `b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446`; post `48e14535c837d39edef1f6dc90a330b155e402f46db59b42b44e386dd583a431`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21268/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 1 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 eb6c511d52041a6b2fa3dd7d2fda560dbecd30cd882f4171656ce33401ab58a5
default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 48e14535c837d39edef1f6dc90a330b155e402f46db59b42b44e386dd583a431
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `07d2a2f469521ea7798aec83edadd94a84c6703418b789841dd699fdf2fc0136`; post `eb6c511d52041a6b2fa3dd7d2fda560dbecd30cd882f4171656ce33401ab58a5`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21268/locatexts_zh_cn.koalocatext_base.csv`.
- default: 1 cells; pre `b2e0d95632c82982e585470e23820f70eb23074a106f5f99b8354d4241fd0446`; post `48e14535c837d39edef1f6dc90a330b155e402f46db59b42b44e386dd583a431`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21268/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `181b827bb9da8ef95cb3fbbb96b5f2fc8c2ca6ae0efd5232b84e19721d296aab`.
Occurrence index: 36962 rows; SHA-256 `1b64af2e7edf42648c99b67692d1d8283a7489b86f508d0acf3a004fd527029b`.
Proper-name glossary: 1194 entries; SHA-256 `15a3f818d451c6927e4bf47c6f7f619c23537d9fc2301b559bffabd725b21f47`.
Report: `work/zh_cn/audit/named-scope-review-D21268-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21268-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21268.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Focused Context and Prior Decisions

- `base:4236:11`: English `Great House Abergawein`, Japanese
  `有力一族・アバーガウェイン`, and Chinese `高等阿贝加文家族`
  establish the named family. Pair the complete compound as
  `아베르가웨인 대가문(Great House Abergawein)`.
- `default:13598`: English `Abergawein Residence`, Japanese
  `アバーガウェイン居住地`, and Chinese `阿贝加文居所` support
  `아베르가웨인 거주지(Abergawein Residence)`. The narrower mansion
  interpretation is not established. This supersedes the D-4036 uncertainty
  for this exact name, without changing historical global totals.
- The official manual's faction/quest context (PDF page 7, printed pages
  13-14), read via both extraction and reference, distinguishes factions
  from destinations. It has no direct Abergawein entry; the local source
  labels supply the specific identity.
- `default:36549` (`Great House - Abergawein`) was already retained by
  D-19840. It was inspected as history only, not edited, rejudged, indexed
  as a fresh finding, or counted in this batch.

## Discovery Triage, Not Additional Batch Counts

- `default:4738` is exactly `Dolve` in English, Japanese, Chinese, and the
  active Korean cell. The source corpus contains both `Dolve Arne` and
  `Dolve Wayle`. This isolated label does not establish which place it
  denotes. Keep it unchanged and retain this identity question as an
  unindexed discovery hold; it is not included in the 28 indexed holds.
  Do not merge it into either place without new evidence.
- D-21084 already reviewed `default:9360` (Aglir, uncertain) and
  `default:27686` (Senshir, retained). Their appearance in the residual
  scout is not a new finding and does not reopen or recount either key.
