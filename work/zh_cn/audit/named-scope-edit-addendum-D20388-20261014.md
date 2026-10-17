# D-20388 Edit Addendum

Date: 2026-10-14

Implemented the source-supported jewelry and non-jewelry-ring corrections
in [the report](named-scope-review-D20388-20261014.md).
Exactly 34 distinct `Texto` cells differ from the pre-review state:
`base` 3132, 3509 and `default` 500, 1029,
1452, 8140, 8739, 9405, 9734, 12925, 13271, 15489, 17938, 19255,
19289, 19820, 24316, 29952, 30467, 38975, 39286, 40705, 43446,
30334, 45543, 46307, 46825, 48552, 51870, 53479, 57945, 57985, 58371,
61434. There were 38 edit events across all passes because four cells were
refined after their first-pass correction. `default` 500 and 43446 received
the grammatically correct object particle `을` after `관`; 13271 now uses
`부적을` rather than `부적를`; 51870 reads `펜던트의 반응`.
Chinese explicitly identifies Loop of Meditation as a ring, so `base`
3509 and `default` 30334 are `반지`.
See the edit-event manifest
[`jewelry-terminology-edits-D20388.tsv`](jewelry-terminology-edits-D20388.tsv)
for exact before/after text and all three source locales. It has 38 edit
events and 34 distinct resource/ID cells. No `affix` edit.

Byte-identical pre-edit backups:

- `/private/tmp/ko-translate-backups/20261014/before-jewelry-D20388/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261014/before-jewelry-D20388/locatexts_zh_cn.koalocatext_default.csv`

Byte-identical pre-follow-up backups:

- `/private/tmp/ko-translate-backups/20261014/jewelry-followup-D20388/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261014/jewelry-followup-D20388/locatexts_zh_cn.koalocatext_default.csv`

Byte-identical backup before the final particle correction:

- `/private/tmp/ko-translate-backups/20261014/jewelry-particle-followup-D20388/locatexts_zh_cn.koalocatext_default.csv`

Pre-edit `base` SHA-256:
`437986dea9000fca2fa96fee0dd98b71c678bc12db0c3e11ff45a7904e22cd70`.
First-pass post-edit `base` SHA-256:
`260c9de0491285cdba527cd2b9d8ccc35f2587860a4dad9e3f24187fd1ec7752`.
Final `base` SHA-256:
`b5cd7ece89e1039a9bc7bc870bb7aa81eb61fd72f4e454dc3ec41651a5f968ac`.
Pre-edit `default` SHA-256:
`e6112db6ec6ea420d689526caf5aef6c93065e8e9639aa64adda2f9d588a849a`.
First-pass post-edit `default` SHA-256:
`a442787f5d5996ba32d23858e9e5b93e79817a3b494a2ee0f1e8419668fa02ec`.
Final `default` SHA-256:
`f17ee0aee19bd5c1bd9a9681f235dcd8b6da3a063a40326af54ed73ed0926234`.
Unchanged `affix` SHA-256:
`516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.

Inverse byte reconstruction, BOM, exact newline sequence, target text,
non-`Texto` columns, row counts/order, and byte preservation passed.
No previous disposition or global tally changed. The sequential review
endpoint remains D-20377 / ID 65134; no sequential rows remain.
Next available focused-review number: D-20389. Chinese explicitly identifies
the Loop of Meditation as a ring.
Release assets were not rebuilt or modified.
