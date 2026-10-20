# D-21884: Scaith Curse Name Spelling

Date: 2026-10-20

## Findings

A fresh unindexed standalone-label screen found `Scaith Curse` at
`default:7544` and `default:17166`, both currently `스카이스의 저주`.
English labels the same curse at both keys. Japanese
`スケイス家の呪い` explicitly associates the curse with the Scaith family;
Chinese `斯卡斯诅咒` independently supports the name.

The confirmed forms `First Scaith` (`최초의 스케이스`) and
`Codex Scaith` (`스케이스의 서`) establish the family's Korean spelling.
Correct only `스카이스` to `스케이스` in these two cells. Keep the existing
Korean title structure and infer no curse mechanics. `default:1822` was
already closed by D-19597 as source-paired and was not reopened or edited.
Neither edited key had an occurrence-index entry.

## Focused Verification

The dedicated cell editor and separate manifest verifier passed: two
`Texto` cells, 65,135 ordered records, unchanged BOM, line endings, tokens,
and non-target bytes, with exact inverse reconstruction. Direct rereading
confirmed the four locale cells at both exact keys. The occurrence index
was unchanged.

- Manifest: `proper-name-edits-D21884.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21884/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `a3283aa1dff13af5c5aa8b8c57e7836f2ab75cc18a7f7d20c3ab6a9e79bd25f0`.
- Default SHA-256 after: `e8e5dfa8a8a2c81d7e2c2777a910b42f41f6055221cccb55c69a56c1582123a8`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.

No glossary, index, other resource, release artifact, or historical
disposition changed. No full audit, inventory rebuild, package build, or
in-game validation was run.
