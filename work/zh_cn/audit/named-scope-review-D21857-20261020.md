# D-21857: Reviewed Proper-Name Batch

Date: 2026-10-20

## Scope

Latest verified proper-name batch: D-21857 (2026-10-20).
Reviewed 10 distinct resource/ID/variant keys: {"accepted"=>10}.
Groups: {"person:elswin"=>7, "person:drefan"=>3}. Last reviewed key: default:55141: / person:drefan.
Follow-up: continue bounded proper-name checks until the user explicitly asks to stop.
Indexed matches: 48476; accepted=32644, excluded=3217, not-an-issue=12504, uncertain=111.
Remaining unreviewed indexed matches: 0, in 0 distinct CSV row keys.
Reviewed unresolved indexed holds: 111, in 106 distinct CSV row keys.
Keep reviewed holds closed unless new, specific evidence appears.
These are focused entity/row index states, not global translation totals.
Sequential default review through ID 65134 remains completed and is not recounted.
Machine-generated proper-name candidate list: 305 terms; registered-reviewed=305, heuristic-not-reviewed=0. This list is not exhaustive; it does not establish an overall completion percentage.
Full proper-name discovery/residual validation remains incomplete; this does not block the user's translation-complete status.
Active CSV SHA-256:
- affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`.
- base: `010da0cd8d9888e050b63ae73f5beb5a5a963e294dd575df7d33075822fdbc21`.
- default: `89685201a2ba5533d522540b8585ac9533df033251def0fa8e528ccea91edeb5`.
Last batch pre-edit backups and byte validation:
- default: 10 cells; pre `95cb61462f7e88229fc091b6cd3b392374a2836a250fa81fc426fe146e11cca3`; post `89685201a2ba5533d522540b8585ac9533df033251def0fa8e528ccea91edeb5`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21857/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 10 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 89685201a2ba5533d522540b8585ac9533df033251def0fa8e528ccea91edeb5
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 6 cells; pre `d626613abec04cf818602ed9c627490a9668a65783e9619e50e84fb97bdfc2dd`; post `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`; backup `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21835/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 1 cells; pre `88973d6ff68e812ef9685c7aaf0c77dfab45f0ed9395214f5665928bf5e10ce2`; post `010da0cd8d9888e050b63ae73f5beb5a5a963e294dd575df7d33075822fdbc21`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21856/locatexts_zh_cn.koalocatext_base.csv`.
- default: 10 cells; pre `95cb61462f7e88229fc091b6cd3b392374a2836a250fa81fc426fe146e11cca3`; post `89685201a2ba5533d522540b8585ac9533df033251def0fa8e528ccea91edeb5`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21857/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `79ab683af78b3829d9fa1a057b6fae83a994f195213dd8250a6d0efcacaf02e0`.
Occurrence index: 48476 rows; SHA-256 `771034035b9f0f1d4bcf91bcaa3400ff3dc91e989401d5369d7d202845054493`.
Proper-name glossary: 2348 entries; SHA-256 `c9a2eb5f07b8ae6128cd174a2707c766c4ff4b2f18afa5cbcd15b6dba8a0e387`.
Report: `work/zh_cn/audit/named-scope-review-D21857-20261020.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21857-20261020.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21857.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Narrow Disposition

Removed duplicate component-level English annotations from seven Sir Elswin
and three Captain Drefan displays. Each complete title/name is paired once;
the later short reference in default:5543 is unchanged. Corrected only the
source-local Captain Drefan title at default:6800 from ship captain to
military leader, following Japanese ドレファン隊長 and the explicit Ariad
officer/advance-force context at default:14071 and default:34277.

No person identity, glossary owner, alias, relationship, or biography was
added or changed. This supersedes only the display/title judgments for the
ten manifest keys. The seven Elswin rows are not all Elswin occurrences;
this is a duplicate-annotation scope, not an exhaustive name review.
The incorrect Elswin Japanese name in the input evidence at default:55141
was corrected before application; aligned source columns remain exact.

## Row-Specific Evidence Clarification

Independent review noted that the shared batch rationale in the applied
default:6800 and 53409 records also discusses Sir Elswin. That discussion
belongs only to the seven Elswin rows, not to the aligned Drefan source.
For default:6800, the exact Japanese is ドレファン隊長の元へ戻る and
Chinese is 回去见德勒凡队长. For default:53409, the exact Japanese is
ドレファン隊長 and Chinese is 德雷凡队长. The manifest source columns
already record these exact texts. This clarification narrows the rationale
without rewriting the applied manifest or occurrence evidence history.
It does not imply an Elswin/Drefan identity or alias.
