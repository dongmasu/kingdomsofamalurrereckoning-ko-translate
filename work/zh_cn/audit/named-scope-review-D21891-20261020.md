# D-21891: Warren Name Spelling

Date: 2026-10-20

## Finding

At `default:61080`, English says `You left your wife in the Warren?` and
Japanese uses the phonetic `ウォーレン`. Chinese `小巷` is a semantic
translation and does not contradict the English/Japanese name reading.
The Korean `워렌(Warren)` is inconsistent with the established `워런`
rendering in the same Warren story, including `default:6575`. D-19569
previously confirmed The Warren as a named quarry/location at `default:115`.

Correct only `워렌` to `워런`, retaining the source-local `(Warren)` and
the rest of the sentence. This spelling correction does not register a new
place alias or reopen D-17413's separate uncertainty at `default:57816`.
There was no occurrence-index entry at `default:61080`.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for
one `Texto` cell across 65,135 ordered rows. BOM, line endings, tokens,
non-target bytes, and inverse reconstruction were preserved.

- Manifest: `proper-name-edits-D21891.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21891/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `caad8066240e3e088096767c7819ab3460b6be49cf86afa8c81f1e6d823ecc04`.
- Default SHA-256 after: `3ed13df73e51e18f3b2364a9a7eb8c1673a741588a03c250e351a7263969a17c`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.

No glossary, occurrence-index, other resource, release artifact, or
historical disposition changed. No full residual/format audit, package
build, or in-game validation was run.
