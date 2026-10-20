# D-21888: Apothecary Rhewani Name Spelling

Date: 2026-10-20

## Finding

At `default:8178`, English `Have Apothecary Rhewani inspect the poisoned
wine`, Japanese `薬剤師レワニに、毒が盛られたワインを調べさせて`,
and Chinese `让药剂师瑞瓦尼检查被投毒的酒` identify the same name as the
other direct source labels. The complete English name `Rhudlyn Rhewani` at
`default:15723` is `루들린 르와니(Rhudlyn Rhewani)`. Two identical
`Apothecary Rhewani` objective labels at `default:19684` and `default:51679`
also use `르와니`; the latter explicitly pairs the English name. Change only
`레와니` to `르와니` at `8178`, retaining the sentence and its existing
English parenthetical.

This exact name-span correction does not resolve the separate
`R. Rhewani`, store, affiliation, or poisoning-story uncertainties at other
keys. No glossary alias or identity registration is made. There was no
occurrence-index entry at the edited key.

## Focused Verification

The dedicated cell editor and independent manifest verifier passed: one
`Texto` cell, 65,135 ordered records, unchanged BOM, line endings, tokens,
and non-target bytes, with exact inverse reconstruction. The exact aligned
English, Japanese, Chinese, previous Korean and final Korean rows were read.
No occurrence-index refresh was needed.

- Manifest: `proper-name-edits-D21888.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21888/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `1619c1c0e825e63ec10b6d4ddb8e7fa8f8bf09f88ae5bc24b8212b716a9f5751`.
- Default SHA-256 after: `83c6c8e091a0d2faf3ccad2695ff24e3c8a291923215ad3a23d4468793916db7`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.

No glossary, index, other resource, release artifact, or prior disposition
changed. No full audit, inventory rebuild, package build, or in-game
validation was run.
