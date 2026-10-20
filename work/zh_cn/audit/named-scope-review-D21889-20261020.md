# D-21889: Sorrogweth Fungus English-Name Typo

Date: 2026-10-20

## Finding

At `default:52861`, the English source says `Sorrogweth Fungus`;
the aligned Japanese says `ソログウェスのキノコ` and Chinese says
`索格维斯菌类`. The Korean transliteration `소로그웨스` is consistent
with the other corpus references, but the parenthetical English name was
mistyped as `Sorrogeweth Fungus`. Six other English source rows use the
canonical `Sorrogweth` spelling; other Korean English parentheticals for
the name use `Sorrogweth` as well.

Correct only `Sorrogeweth` to `Sorrogweth`. This resolves the exact
parenthetical typo only. D-16046's broader uncertainty about the entity's
classification as a fungus or material remains open; no new glossary or
identity registration is made. No occurrence-index row exists at the
edited key.

## Focused Verification

The dedicated cell editor and independent manifest verifier passed: one
`Texto` cell, 65,135 ordered records, unchanged BOM, line endings, tokens,
and non-target bytes, with exact inverse reconstruction. Exact aligned
source and current Korean cells were verified.

- Manifest: `proper-name-edits-D21889.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21889/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `83c6c8e091a0d2faf3ccad2695ff24e3c8a291923215ad3a23d4468793916db7`.
- Default SHA-256 after: `f193f066e622e9652d61ab6888ce03390ae1ee4dad94104e5f97833d5bab6001`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.

No glossary, index, other resource, release artifact, or other historical
disposition changed. No full audit, inventory rebuild, package build, or
in-game validation was run.
