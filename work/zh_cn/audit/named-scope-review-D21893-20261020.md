# D-21893: Ewa Treofor Name Variant

Date: 2026-10-20

## Finding

At `default:346`, English labels the person `Ewa Treofor`. The aligned
Japanese is `エワ・テオフリン`, exactly the same full name used at
`default:2240` for English `Docent Ewa Teofring`, Japanese
`導師エワ・テオフリン`, and Chinese `埃娃·提奥弗林讲师`. The confirmed
`person:ewa-teofring` glossary form is `에와 테오프링(Ewa Teofring)`.

Chinese at `default:346` uses `埃娃·特雷欧弗`, which follows the local
English spelling variant rather than independently confirming Teofring.
The exact matching Japanese full name and the previously reviewed person
entry nevertheless support identifying this as the same Ewa. Normalize
only the Korean name to `에와 테오프링`; retain `(Ewa Treofor)` as the
exact source-local English spelling. Do not add `Treofor` as a global alias.
No occurrence-index entry existed at `default:346`, and none was added.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for
one `Texto` cell across 65,135 ordered rows. BOM, line endings, tokens,
non-target bytes, and inverse reconstruction were preserved.

- Manifest: `proper-name-edits-D21893.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21893/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `3ed13df73e51e18f3b2364a9a7eb8c1673a741588a03c250e351a7263969a17c`.
- Default SHA-256 after: `0a0c1737e59da72651429c4667579292d9e29195c0997be803511ee9644f7ef8`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.
- Proper-name glossary SHA-256 remains `f2fa585de680c72d8f9e5478e543977c730adcb5b864fc75c92388e976d701b1`.

No glossary, occurrence-index, other resource, release artifact, or
historical disposition changed. No full residual/format audit, package
build, or in-game validation was run.
