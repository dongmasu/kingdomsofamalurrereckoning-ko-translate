# Consolidated Context Review: `default` IDs 27951-28000

- Review date: 2026-10-12.
- Scope: open findings D-8809-D-8810 for IDs 27951-28000, checked against
  English, Japanese source and preserved Japanese-derived Korean draft,
  Chinese, active Korean, and related audit decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: one accepted `Texto` correction, eight `not an issue` resolutions,
  and one specific uncertainty at ID 27985.

## Decisions D-19414-D-19417

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19414 | `default` 27959 | accepted | Change `소로스 가문(House of Sorrows)` to `비탄의 집(House of Sorrows)`. English identifies the named House as the organization that forged a path to the coast; the Korean sentence preserves that agency and the living-shadow route. Reuse the accepted named-House form from D-17985 and D-19400. |
| D-19415 | `default` 27961-27962, 27969, 27973, 27984, 27999-28000 | not an issue | Five-resource comparison preserves the corporate-document attribution, Beckoned address, Basilica Gnostra position, natural-order insult, Maire's title, Narca affliction, and nearby Murghan threat. Existing Korean forms are source-traceable; unresolved global spelling preferences do not require row-local holds. |
| D-19416 | `default` 27990 | not an issue | English `from Stealth`, Chinese `从潜行中`, Japanese `(隠密時)`, and both Korean drafts are the same incomplete state fragment. `은신 상태에서` preserves the fragment without inventing its missing clause. |
| D-19417 | `default` 27985 | uncertain | English `Coveted Drink for Tester`, Japanese `テスターが重宝する飲み物`, and Chinese `测试者梦寐以求的饮料` agree on a tester-associated drink. The row alone does not establish whether `Tester` is an internal label or player-facing wording; preserve the translation pending runtime/context evidence. |

Previously accepted IDs 27952 and 27954, and previously resolved findings
from D-8806 and D-8808, are linked without recounting.

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27959 | `소로스 가문(House of Sorrows)` | `비탄의 집(House of Sorrows)` | Reuse the approved named-House form in an explicit organization context; preserve the English parenthetical and all surrounding text. |

## Structural and Context Notes

- English, Japanese source, Chinese, active Korean, and the preserved
  Japanese-derived Korean draft contain IDs 27951-28000 once in ascending
  order. Default rows have `ID_Linha` and `Texto`; there is no variant
  column.
- The previously verified line-break and runtime-token checks for this
  batch remain valid. The edit changes no marker, number, line break, or
  source resource.
- The sentence at 27959 retains exile on Dannestar, the recovery of freedom,
  and the path through living shadow to the coast.
- ID 27985 remains the only unresolved finding in this batch; the uncertainty
  is specifically about the runtime audience of `Tester`, not the drink's
  meaning.

## Verification

- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27951-28000-D19414/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `b18de76b4bb0e564b0e68a2c4e0a22f002c2755bf89a4a432d6b313998200c6f`.
- Post-edit SHA-256:
  `d20a5a3975b34218f38abb3a3cb7e048a5955df94c87a2d55502a3d0f4cbb367`.
- Reversing the exact substitution reproduces the backup byte-for-byte.
  Only Korean `Texto` at ID 27959 changed; all other bytes, including the
  UTF-8 BOM, row order, existing line endings, and CSV structure, are
  preserved. Source CSVs were not edited.

Totals: 2,258 accepted / 24,894 `not an issue` / 11,372 uncertain (38,524).
Resume D-19418 at ID 28001; sequentially unreviewed interval is 28001-65134
(37,134 IDs), besides older specific holds and register reconciliation.

These are working dispositions, not independent final linguistic approval.
