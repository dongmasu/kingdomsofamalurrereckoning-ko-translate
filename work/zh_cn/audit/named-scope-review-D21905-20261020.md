# D-21905: Olin Name-Form Consistency

Date: 2026-10-20

## Finding

At `default:11328`, the standalone English label `Olin` was translated as
`오린(Olin)`. This is the only Korean occurrence found with that spelling.
The same character is named `Olin` at `default:5078`, `default:18354`
(`Olin Risberg`), `default:23204`, and `default:30910`; each Korean
reference uses `올린`. Japanese uses `オーリン`, and Chinese uses
`欧林`/`奥林`, including the exact `default:11328` label.

Correct only `default:11328` to `올린(Olin)`, matching the established
source-local Korean spelling while preserving the exact English
parenthetical. This does not register a global alias or a new glossary/
occurrence-index entity.

## Candidates Excluded

- `Warlord Whenery` (`default:18373`) and `Sorli` (`default:18385`) already
  have confirmed glossary forms matching their Korean labels; no re-review
  was needed.
- `Agarth / Blade of Avgrunn / Kollossus priestess` (`default:18368`) remains
  under D-5816's unresolved lore question. The current locale row adds no
  new evidence to resolve that hold.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for one
cell across 65,135 ordered rows. BOM, line endings, row order, non-target
bytes, and inverse reconstruction against the byte-identical backup were
preserved.

- Manifest: `proper-name-edits-D21905.tsv`.
- Backup:
  `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21905/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256:
  `353f28f3890edb1feac645e4282af345faf3a7d0e0a90e6632175a8e09b953aa` →
  `7bdeeddf87d8f0f56a9b077f519968b97a4d473f44a137abbab426d4e3ae91d5`.

No glossary, occurrence-index, other resource, or release artifact changed.
No full residual/format audit, package build, or in-game validation was run.
