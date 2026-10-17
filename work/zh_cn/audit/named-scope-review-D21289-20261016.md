# D-21289: Reviewed Proper-Name Batch

Date: 2026-10-16

## Scope

Latest verified proper-name batch: D-21289 (2026-10-16).
Reviewed 45 distinct resource/ID/variant keys: {"accepted"=>34, "not-an-issue"=>11}.
Groups: {"place:yolvan"=>26, "source-form:yolvan"=>19}. Last reviewed key: default:62490: / source-form:yolvan.
Next batch: D-21290; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 37593; accepted=25066, excluded=2274, not-an-issue=10224, uncertain=29.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 29, in 27 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`.
- base: `93b552fb7e3b46aaa0a5dc1986710463acc42905ba4b6132b76d2420bda43af4`.
- default: `cc195092d726efb50c0a0fcc8fb2d8b0b10c516c01eaf32ff4df69458e557f2e`.
Last batch pre-edit backups and byte validation:
- base: 1 cells; pre `ebf3487ce247529a483cca8132813e40440a87e103b8eb8e5a731c2d59a0b2f6`; post `93b552fb7e3b46aaa0a5dc1986710463acc42905ba4b6132b76d2420bda43af4`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21289/locatexts_zh_cn.koalocatext_base.csv`.
- default: 33 cells; pre `59ce22dbf783b4e564ebf7c137bd71a5499cb7e58a0c1b837ec81709aea69c2a`; post `cc195092d726efb50c0a0fcc8fb2d8b0b10c516c01eaf32ff4df69458e557f2e`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21289/locatexts_zh_cn.koalocatext_default.csv`.
base: PASS 1 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 93b552fb7e3b46aaa0a5dc1986710463acc42905ba4b6132b76d2420bda43af4
default: PASS 33 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 cc195092d726efb50c0a0fcc8fb2d8b0b10c516c01eaf32ff4df69458e557f2e
Last actual CSV-edit backups (retained across no-edit batches):
- base: 1 cells; pre `ebf3487ce247529a483cca8132813e40440a87e103b8eb8e5a731c2d59a0b2f6`; post `93b552fb7e3b46aaa0a5dc1986710463acc42905ba4b6132b76d2420bda43af4`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21289/locatexts_zh_cn.koalocatext_base.csv`.
- default: 33 cells; pre `59ce22dbf783b4e564ebf7c137bd71a5499cb7e58a0c1b837ec81709aea69c2a`; post `cc195092d726efb50c0a0fcc8fb2d8b0b10c516c01eaf32ff4df69458e557f2e`; backup `/private/tmp/ko-translate-backups/20261016/before-proper-name-D21289/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `3f6e93513fba81f2cd91efc9a61b13787f3690e71d602b8928836e57d7b48612`.
Occurrence index: 37593 rows; SHA-256 `9133f86c788ead1709e8c800638558705e0bce61327e2ac5ea0b0368439cd669`.
Proper-name glossary: 1249 entries; SHA-256 `d5e314af628760662cd6a862e57715272d54ea0262e0a71b33156a8b8b5fac4c`.
Report: `work/zh_cn/audit/named-scope-review-D21289-20261016.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21289-20261016.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21289.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Yolvan: Region Versus Unresolved Source Forms

Reviewed 45 explicitly scoped keys, correcting 34 cells and retaining 11.
The confirmed region `place:yolvan` covers base:2999:11 and 25 geographic
prose rows: 19 accepted and seven not-an-issue. English default:39632
describes a region bordered by Odarath, Webwood and Glendara; its meadows,
forests, roads, inhabitants and southern Warsworn keep corroborate that
regional scope. Japanese ヨルヴァン and Chinese 尤凡 support localized
rows. The official manual PDF p. 1 gives Faelands/forest context and
PDF p. 7 gives faction/quest context, not the toponym.

The other 19 keys are deliberately provisional `source-form:yolvan`,
not region or castle identity decisions: seven standalone labels, seven
castle-associated short forms, and five generic news/question/poem uses.
Their 15 accepted and four not-an-issue dispositions concern only spelling
and bilingual annotation. The glossary record remains `unresolved`.
Neither identity merge nor identity distinction is established. Its
entity-level English canonical is blank and aliases are empty, preventing
generic matching for the provisional record; each occurrence retains the
literal source `Yolvan` in `matched_english`. The ordinary region matcher
can still produce broader unreviewed candidates, never terminal identity
decisions. The explicit 26/19 allowlists in the preparation script are
the reviewed scopes; no shared registration guard was weakened.

Use `요르반(Yolvan)` consistently with the spelling already established
for Castle Yolvan, without inserting 성 into bare source references.
All 32 previously indexed explicit Castle Yolvan rows, including the
atomic book title The Fall of Castle Yolvan, remain untouched. The four
complete new titles were independently reviewed at D-21288. Annotate all
repeated mentions (39632 x4, 49093 x2, 53473 x2) without changing paragraphs,
verse breaks, particles or other names.

At 20486, preserve the existing 마지막 후손 wording: English the last
of Yolvan, Japanese annihilation, and Chinese last bloodline do not prove
a dynasty/person identity. At 57873, Japanese and Chinese are literal
English fallback, not independent localized corroboration. The 19
provisional identity questions are separate from the 29 indexed occurrence
holds and do not resolve or enlarge those hold counts. All old holds,
Dolve/Hreid questions, sequential findings and global totals remain.
