# D-21900: The Road Patrol Title

Date: 2026-10-20

## Finding

The exact standalone English label `The Road Patrol` appears at
`default:8289` and `default:33098`. Both rows have the same Japanese
`巡回部隊` and Chinese `道路巡逻`. Korean already translated
`default:33098` as `도로 순찰대`, but `default:8289` used only `순찰대`.

English and Chinese preserve the distinguishing road modifier in both
labels. In the Korean title at `default:8289`, omitting `도로` removes that
distinction and conflicts with the exact duplicate's established Korean
rendering. Change only this cell to `도로 순찰대`. Japanese's more general
wording is consistent across both rows but does not establish that the
English modifier should be omitted in Korean.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for one
`Texto` cell across 65,135 ordered rows. BOM, mixed line endings, row order,
non-target bytes, and inverse reconstruction against the byte-identical
backup were preserved.

- Manifest: `proper-name-edits-D21900.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21900/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `55042218b4282fb372c0f5fd4674934f81028472883cba141a545f7415eaa461`.
- Default SHA-256 after: `f8b4a7d0a1515a24df58274ec7991cc081f4458f8da9ab564810783d6889570d`.

No glossary, occurrence-index, other resource, or release artifact changed.
No full residual/format audit, package build, or in-game validation was run.
