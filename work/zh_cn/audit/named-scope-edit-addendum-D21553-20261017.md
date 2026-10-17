# D-21553 Edit Addendum

Latest verified proper-name batch: D-21553 (2026-10-17).
Reviewed 41 distinct resource/ID/variant keys: {"accepted"=>25, "not-an-issue"=>15, "excluded"=>1}.
Groups: {"faction:summer-court"=>28, "faction:winter-court"=>11, "monster:rat-queen"=>2}. Last reviewed key: default:64424: / faction:summer-court.
Next batch: D-21554; continue source discovery/residual checks; no unreviewed indexed keys.
Indexed matches: 43561; accepted=29058, excluded=2839, not-an-issue=11569, uncertain=95.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 95, in 92 distinct CSV row keys.
If only reviewed holds remain, continue discovery/residual checks; do not reopen them without new evidence.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `5589b8336f3e5368fd4bc2ad11c184675184374fd3fbe7fc4d5fa08107587228`.
- default: `a9189d1caddd5a2ecca03c6d16ab0c0cd454f634281cf920870443473e008f60`.
Last batch pre-edit backups and byte validation:
- default: 25 cells; pre `e2cc17debb85a199ce8af3dbed72c066f776e6ed17a3eab9f7f5449fdaf0fe29`; post `a9189d1caddd5a2ecca03c6d16ab0c0cd454f634281cf920870443473e008f60`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21553/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 25 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 a9189d1caddd5a2ecca03c6d16ab0c0cd454f634281cf920870443473e008f60
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 3 cells; pre `1c5b7cfe9fc2021dd82cef0b1e658fda4db36c45ade91b578a58f53d76c57dd4`; post `5589b8336f3e5368fd4bc2ad11c184675184374fd3fbe7fc4d5fa08107587228`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21549/locatexts_zh_cn.koalocatext_base.csv`.
- default: 25 cells; pre `e2cc17debb85a199ce8af3dbed72c066f776e6ed17a3eab9f7f5449fdaf0fe29`; post `a9189d1caddd5a2ecca03c6d16ab0c0cd454f634281cf920870443473e008f60`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21553/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `b69c6452d733bb73dba05bfc46fac8a1840609a68d23f23318d09e119c7ba0a8`.
Occurrence index: 43561 rows; SHA-256 `3247a8ae1da08f35a1a5c6f3ec47e3c626355e1150df4d69ef7e17449d650227`.
Proper-name glossary: 1816 entries; SHA-256 `e5fd026a5ed73598978d8e6519fbfd730d06225918f9c50c11aeac8273d9951a`.
Report: `work/zh_cn/audit/named-scope-review-D21553-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21553-20261017.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21553.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.


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
