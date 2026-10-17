# D-21550: Reviewed Proper-Name Batch

Date: 2026-10-17

## Scope

Latest verified proper-name batch: D-21550 (2026-10-17).
Reviewed 50 distinct resource/ID/variant keys: {"accepted"=>43, "not-an-issue"=>7}.
Groups: {"faction:summer-court"=>32, "faction:winter-court"=>19, "monster:rat-queen"=>2}. Last reviewed key: default:23978: / faction:summer-court.
Next batch: D-21551; first unreviewed indexed key: faction:summer-court / default:24268:.
Indexed matches: 43561; accepted=28932, excluded=2838, needs-context=145, not-an-issue=11551, uncertain=95.
Remaining unreviewed indexed matches: 145, in 141 distinct CSV row keys.
Reviewed unresolved indexed holds: 95, in 92 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `5589b8336f3e5368fd4bc2ad11c184675184374fd3fbe7fc4d5fa08107587228`.
- default: `2048404051c3dc492cf500d5079830d6769122be58c77331bbd1314e24a02660`.
Last batch pre-edit backups and byte validation:
- default: 43 cells; pre `10701a25f70366864f523d3c9f58d5e65b0b5968048e072140f2ba604faf1a04`; post `2048404051c3dc492cf500d5079830d6769122be58c77331bbd1314e24a02660`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21550/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 43 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 2048404051c3dc492cf500d5079830d6769122be58c77331bbd1314e24a02660
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 3 cells; pre `1c5b7cfe9fc2021dd82cef0b1e658fda4db36c45ade91b578a58f53d76c57dd4`; post `5589b8336f3e5368fd4bc2ad11c184675184374fd3fbe7fc4d5fa08107587228`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21549/locatexts_zh_cn.koalocatext_base.csv`.
- default: 43 cells; pre `10701a25f70366864f523d3c9f58d5e65b0b5968048e072140f2ba604faf1a04`; post `2048404051c3dc492cf500d5079830d6769122be58c77331bbd1314e24a02660`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21550/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `f186f2cc500f0a2bd29cfd5ce3ef730e49c87648dee87e9ae42dc48137a2fb98`.
Occurrence index: 43561 rows; SHA-256 `2154c6fb3f7cc2601b1f6b6bbb806c302357e4c391e1fbc2c706bb3aeaad7d52`.
Proper-name glossary: 1816 entries; SHA-256 `e5fd026a5ed73598978d8e6519fbfd730d06225918f9c50c11aeac8273d9951a`.
Report: `work/zh_cn/audit/named-scope-review-D21550-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21550-20261017.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21550.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.


### D-21549-D-21553: Seasonal Courts And Rat Queen

Registered the English-led court designations `여름 궁정(Summer Court)`
and `겨울 궁정(Winter Court)` with their complete source aliases.
Checked 241 distinct row keys / 250 entity matches across all three
resources in 50/50/50/50/41-key batches; affix has no lexical matches.
Preserve the difference between court organizations, their metonymic
seats and seasonal Fae peoples; this is not a physical-location merger.
Source-local English orders and the hyphenated `Court-of-Winter` are
retained in annotations, and existing unrelated entity decisions remain
unchanged.

The complete `Winter Court Necklace` is paired atomically as
`겨울 궁정 목걸이(Winter Court Necklace)`. The nested court occurrence
is excluded from organization edits. `Summer Court Imperial` at
base:2353 is likewise excluded from nested court edits; the isolated
English label and Japanese court-purveyor wording do not justify its
existing Korean `제국 기사` reading. Its complete item-name translation
remains a documented follow-up, not an approved semantic correction.
The qualified `High Court of Winter` at default:7155 is excluded and
preserved, not asserted to be an alias for the entire Winter Court.

At default:55140, English `a court of Winter Fae` is not a complete
`Court of Winter` name. Exclude this lexical false positive. The
pre-existing `궁정(Court of Winter)` annotation is not endorsed; its
removal needs a separate corrective manifest rather than silently
changing an excluded row in this discovery pass.

Registered the monster designation `쥐 여왕(Rat Queen)` across seven
exact default keys, without inferring that every specimen is one
individual. At default:54505 the second Korean name expands English
`her`; it is paired locally but adds no English occurrence key.
Full proper-name discovery remains incomplete.
