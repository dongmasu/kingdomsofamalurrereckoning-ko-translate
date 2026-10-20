# D-21853: Reviewed Proper-Name Batch

Date: 2026-10-19

## Scope

Latest verified proper-name batch: D-21853 (2026-10-19).
Reviewed 2 distinct resource/ID/variant keys: {"accepted"=>2}.
Groups: {"event:crystal-war"=>1, "person:hugues"=>1}. Last reviewed key: default:39675: / person:hugues.
Follow-up: no automatic follow-up batch; future checks require a specific candidate and a user request.
Indexed matches: 48476; accepted=32642, excluded=3217, not-an-issue=12506, uncertain=111.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 111, in 106 distinct CSV row keys.
Keep reviewed holds closed unless new, specific evidence appears.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; this does not block the user's translation-complete status.
Active CSV SHA-256:
- affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`.
- base: `afb24dd6ca7a252173af67e593761ab622e6d615a129d97318854721b300db0c`.
- default: `0420de47e6dd043967badbe5a47f5c52f5002011222751cb14106d0eeb9e0322`.
Last batch pre-edit backups and byte validation:
- default: 2 cells; pre `d0c9475feb9a207b932a88e545d7869f76b972a3310f84094ac668011f8b9de8`; post `0420de47e6dd043967badbe5a47f5c52f5002011222751cb14106d0eeb9e0322`; backup `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21853/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 0420de47e6dd043967badbe5a47f5c52f5002011222751cb14106d0eeb9e0322
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 6 cells; pre `d626613abec04cf818602ed9c627490a9668a65783e9619e50e84fb97bdfc2dd`; post `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`; backup `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21835/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 4 cells; pre `50c11da1f94bb6bc91012d7c411267e8b57857f25e1cd6c0c862a305f210ede0`; post `afb24dd6ca7a252173af67e593761ab622e6d615a129d97318854721b300db0c`; backup `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21849/locatexts_zh_cn.koalocatext_base.csv`.
- default: 2 cells; pre `d0c9475feb9a207b932a88e545d7869f76b972a3310f84094ac668011f8b9de8`; post `0420de47e6dd043967badbe5a47f5c52f5002011222751cb14106d0eeb9e0322`; backup `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21853/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `51674dbadf64873cdec2b0a0c99b51b8ddaa3b3bfba148ab2f23e95b418042d7`.
Occurrence index: 48476 rows; SHA-256 `02b267200bca600cf0017e7110793e35b8c5d7e10c69009c9160fa1d566da6a6`.
Proper-name glossary: 2348 entries; SHA-256 `c9a2eb5f07b8ae6128cd174a2707c766c4ff4b2f18afa5cbcd15b6dba8a0e387`.
Report: `work/zh_cn/audit/named-scope-review-D21853-20261019.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21853-20261019.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21853.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Findings

- `default:65039` (`event:crystal-war`): restored `수정 전쟁(Crystal War)` and the omitted “hero of the Crystal War” phrase while retaining `공성 파괴자(Siege-breaker)`. The prior D-21847 whole-clause replacement had dropped the already-reviewed event reference. English, Japanese, and Chinese all preserve both ideas.
- `default:39675` (`person:hugues`, source-local label `Ivan`): added `(Ivan)` at both name mentions. The historical occurrence owner and `not-an-issue` entity disposition are retained as index metadata only. This does not assert that this Ivan is Ivan Hugues, add `Ivan` as a global alias, or register a new identity.

The independent linguistic review accepted both exact changes. Residual
validation now reports zero terminal matches missing a bilingual English
label. No glossary entry was added; the 2026-10-17 release ZIP is unchanged.
