# D-21885: Visit Apothecary Rhewani Spelling

Date: 2026-10-20

## Finding

The exact English objective `Visit Apothecary Rhewani` occurs at
`default:19684` and `default:51679`; Japanese
`薬剤師レワニを訪ねる` and Chinese `造访药剂师瑞瓦尼` are identical
at both keys. The Korean at `51679` is `약제사 르와니(Rhewani)를 찾아가기`,
while `19684` alone had `약제사 레와니를 찾아가기`. The full name
`Rhudlyn Rhewani` at `default:15723` is `루들린 르와니(Rhudlyn Rhewani)`.
Align only the name syllable at `19684`, preserving the objective wording
and its existing omission of an English parenthetical.

This is an exact-label spelling refinement only. Do not infer additional
identity relationships, register a glossary alias, or resolve the separate
Rhewani / `R. Rhewani` uncertainties recorded at other keys. No occurrence
index row exists at the edited key.

## Focused Verification

The dedicated cell editor and independent manifest verifier passed: one
`Texto` cell, 65,135 ordered records, unchanged BOM, line endings, tokens,
and non-target bytes, with exact inverse reconstruction. The source labels
at `19684` and `51679`, full-name row `15723`, and final active Korean target
were read directly. The occurrence index was unchanged.

- Manifest: `proper-name-edits-D21885.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21885/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `e8e5dfa8a8a2c81d7e2c2777a910b42f41f6055221cccb55c69a56c1582123a8`.
- Default SHA-256 after: `1619c1c0e825e63ec10b6d4ddb8e7fa8f8bf09f88ae5bc24b8212b716a9f5751`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.

No glossary, index, other resource, release artifact, or historical
disposition changed. No full audit, inventory rebuild, package build, or
in-game validation was run.
