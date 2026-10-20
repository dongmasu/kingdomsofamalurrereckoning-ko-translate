# D-21859: Reviewed Proper-Name Batch

Date: 2026-10-20

## Scope

Latest verified proper-name batch: D-21859 (2026-10-20).
Reviewed 8 distinct resource/ID/variant keys: {"accepted"=>8}.
Groups: {"person:desiderus"=>2, "person:trav"=>2, "person:talibor"=>6, "person:eriad"=>1}. Last reviewed key: default:59790: / person:talibor.
Follow-up: continue bounded proper-name checks until the user explicitly asks to stop.
Indexed matches: 48476; accepted=32646, excluded=3217, not-an-issue=12502, uncertain=111.
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
- default: `dd0b44eb441b104212f017b331504859aea9cdf32fb99b1b83bb93a76323c442`.
Last batch pre-edit backups and byte validation:
- default: 8 cells; pre `5d115b7766decf7c0f168a8ace9c15a2b2a5b5a50f00c99014b48af70bc3a7d6`; post `dd0b44eb441b104212f017b331504859aea9cdf32fb99b1b83bb93a76323c442`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21859/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 8 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 dd0b44eb441b104212f017b331504859aea9cdf32fb99b1b83bb93a76323c442
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 6 cells; pre `d626613abec04cf818602ed9c627490a9668a65783e9619e50e84fb97bdfc2dd`; post `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`; backup `/private/tmp/ko-translate-backups/20261019/before-proper-name-D21835/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 1 cells; pre `88973d6ff68e812ef9685c7aaf0c77dfab45f0ed9395214f5665928bf5e10ce2`; post `010da0cd8d9888e050b63ae73f5beb5a5a963e294dd575df7d33075822fdbc21`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21856/locatexts_zh_cn.koalocatext_base.csv`.
- default: 8 cells; pre `5d115b7766decf7c0f168a8ace9c15a2b2a5b5a50f00c99014b48af70bc3a7d6`; post `dd0b44eb441b104212f017b331504859aea9cdf32fb99b1b83bb93a76323c442`; backup `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21859/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `91ec7f65b1ac44d56c2c335b64bf1dfb1cdc80db9476ed70f3e49eeaeb07edf3`.
Occurrence index: 48476 rows; SHA-256 `48b22037274cf0f042390a367e50933b2ac9ec8efc6b03ea2a786ac56a00d6df`.
Proper-name glossary: 2348 entries; SHA-256 `c9a2eb5f07b8ae6128cd174a2707c766c4ff4b2f18afa5cbcd15b6dba8a0e387`.
Report: `work/zh_cn/audit/named-scope-review-D21859-20261020.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21859-20261020.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21859.tsv`.


## Evidence

English is the identity/meaning anchor. The manifest records the aligned
Japanese and Chinese evidence and each exact reviewed old/new Korean cell.
Canonical forms reuse the English-indexed glossary; full-name, family,
title, and homonym exceptions are recorded per row, not inferred from
capitalization alone. Official-manual setting/terminology context is used
where relevant; omission from its non-exhaustive list is not a judgment.
No PAK, PAK-derived resource, or historical global tally was consulted.

## Independent Review And Disposition

Read-only independent review accepted the military/watch-command distinctions
and required two attached grammatical changes before application:
default:30951 uses 대장(Captain Talibor)과, and default:56507 uses
대장(Captain Talibor)이었다고. Both were incorporated into the manifest.

Two full Captain Desiderus Trav labels now reuse the existing Captain Trav
대위 rendering, supported by the Ariad land-force context and the Chinese
上尉 in the short-title rows. Six Talibor rows now use the established
watch-command 대장. His involvement in ship-based slave sales is not
evidence that his City Watch office is a ship command. Existing component
owners person:desiderus/person:trav and person:eriad/person:talibor remain
separate index handles; no alias or identity metadata was added.

Captain Mys at default:15747 and 20348 was not edited: Japanese 隊長 alone
does not supply sufficient English role/identity context, and the separate
Beg Mys in default:63688 must not be assumed to be the same person.
Generic Captain's equipment labels and actual nautical captains were also
outside this eight-row scope. No global Captain translation rule is implied.
The local official-manual extraction has no direct entry for these names.
