# D-21890: Three English-Annotation Candidates

Date: 2026-10-20

## Findings

- `default:2842`, `Sandstone Villa`: English refers to “the Villa” rather than
  repeating its name, but Japanese explicitly says サンドストーン邸 and
  the confirmed `place:sandstone-villa` glossary entry supports
  `샌드스톤 저택(Sandstone Villa)`. The current Korean name is supported;
  no change.
- `default:27802`, `Hospitalis Quarters`: English says “the Quarters”;
  Japanese uses 救護区域, and the confirmed `place:hospitalis-quarters`
  entry supports `병원 구역(Hospitalis Quarters)`. The current Korean name
  is supported; no change.
- `default:55416`, `Return to the Scale`: English uses the short form “the
  Scale”; aligned Japanese explicitly names `偉大なる天秤` (Great Scale),
  while Chinese uses 天平. The exact Korean parenthetical already says
  `The Great Scale`, but its Korean name was `대저울`, unlike the confirmed
  `lore:great-scale` canonical `위대한 저울`. Replace only `대저울` with
  `위대한 저울`; preserve the existing English parenthetical and objective.
  Other historical Great Scale context dispositions remain untouched.

## Focused Verification

The dedicated editor and independent manifest verifier passed: one
`Texto` cell, 65,135 ordered records, unchanged BOM, line endings, tokens,
and non-target bytes, with exact inverse reconstruction. No occurrence-index
entry existed at the edited key, so none was changed.

- Manifest: `proper-name-edits-D21890.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21890/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `f193f066e622e9652d61ab6888ce03390ae1ee4dad94104e5f97833d5bab6001`.
- Default SHA-256 after: `caad8066240e3e088096767c7819ab3460b6be49cf86afa8c81f1e6d823ecc04`.
- Occurrence-index SHA-256 remains `dab14c16869fe2677f9510e60ad9ab435b012332edfcdd1c5811bb9f2c116420`.

No glossary, index, other resource, release artifact, or other historical
disposition changed. No full audit, inventory rebuild, package build, or
in-game validation was run.
