# D-21554 Edit Addendum

Latest verified proper-name batch: D-21554 (2026-10-17).
Reviewed 1 distinct resource/ID/variant keys: {"accepted"=>1}.
Groups: {"people:winter-fae"=>1}. Last reviewed key: default:55140: / people:winter-fae.
Next batch: D-21555; continue source discovery/residual checks; no unreviewed indexed keys.
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
- default: `e30581e35cdb65939c2207cd0b9f24b44ff2514cef59bdaa6312c5343be7dcbb`.
Last batch pre-edit backups and byte validation:
- default: 1 cells; pre `a9189d1caddd5a2ecca03c6d16ab0c0cd454f634281cf920870443473e008f60`; post `e30581e35cdb65939c2207cd0b9f24b44ff2514cef59bdaa6312c5343be7dcbb`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21554/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 e30581e35cdb65939c2207cd0b9f24b44ff2514cef59bdaa6312c5343be7dcbb
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 3 cells; pre `1c5b7cfe9fc2021dd82cef0b1e658fda4db36c45ade91b578a58f53d76c57dd4`; post `5589b8336f3e5368fd4bc2ad11c184675184374fd3fbe7fc4d5fa08107587228`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21549/locatexts_zh_cn.koalocatext_base.csv`.
- default: 1 cells; pre `a9189d1caddd5a2ecca03c6d16ab0c0cd454f634281cf920870443473e008f60`; post `e30581e35cdb65939c2207cd0b9f24b44ff2514cef59bdaa6312c5343be7dcbb`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21554/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `84e2064e638178bd01460220d3f1f4068a0897ccae9e26ea7ef9c2b06ed565d8`.
Occurrence index: 43561 rows; SHA-256 `d88e65a7227d5c2bdaf1a765bfb17149f94da646e91e785cfa1fff661f5a3783`.
Proper-name glossary: 1816 entries; SHA-256 `e5fd026a5ed73598978d8e6519fbfd730d06225918f9c50c11aeac8273d9951a`.
Report: `work/zh_cn/audit/named-scope-review-D21554-20261017.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21554-20261017.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21554.tsv`.


The byte-preserving editor and separate verifier checked BOM, the exact
mixed line-ending sequence, headers, row count/order, keys/variants,
target Texto values, unchanged non-target cells/bytes, and inverse
reconstruction against byte-identical pre-edit backups.


### D-21554: Generic Court Annotation Correction

Resolved the default:55140 follow-up from D-21549-D-21553.
English says `a court of Winter Fae`, not a complete `Court of Winter`
name. Japanese explicitly refers to the House of Sorrows; Chinese
renders it as Winter Court and does not override the English syntax.
Removed only the unsupported `(Court of Winter)` after `궁정`.
Retained `겨울 페이(Winter Fae)`, Tuatha and all surrounding text.

This is a new, exact-span counterexample to an inherited annotation,
not a repeat of the earlier Winter Fae translation review. Update the
existing `people:winter-fae` occurrence in place, retaining its previous
accepted status/evidence in the manifest. No entity/occurrence was
added; the excluded court occurrence and every unrelated disposition
remain unchanged. The separate base:2353 Imperial title remains deferred.
