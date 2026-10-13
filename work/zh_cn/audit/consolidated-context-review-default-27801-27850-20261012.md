# Consolidated Context Review: `default` IDs 27801-27850

- Review date: 2026-10-12.
- Scope: the prior open findings at IDs 27801-27850, checked against the
  English source, Japanese source and preserved Japanese-derived Korean
  draft, Chinese source, active Korean, and existing audit decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: five accepted `Texto` corrections, thirty-seven `not an issue`
  resolutions, and one specific uncertainty at ID 27831.

## Decisions D-19399-D-19405

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19399 | `default` 27815 | accepted | Restore the partial-degree meaning in English “We know, in part, what is wrong with this Fae” as `어느 정도는 알겠군`. Preserve the ten-line stanza, names, sequence, and quotation boundaries. |
| D-19400 | `default` 27817, 27840 | accepted | Both lines explicitly return to the House of Sorrows as an organization/base; use the previously accepted named-House form `비탄의 집` (D-17985), retaining the existing English parenthetical at 27817. |
| D-19401 | `default` 27820 | accepted | Replace `미사란` with the accepted Mitharan form `미타란` from D-18158; keep the item category and modifier unchanged. |
| D-19402 | `default` 27827 | accepted | Replace `발라드 가문` with the established `발라드의 집(House of Ballads)` form (D-711, D-18683, D-18892, D-19328). |
| D-19403 | `default` 27801-27802, 27804-27808, 27810-27814, 27816, 27818-27819, 27821-27826, 27828, 27832-27833, 27835, 27837, 27839, 27841, 27843-27850 | not an issue | The five-resource comparison supports the local meaning, relationships, labels, and register. Existing English names or the already established Korean form make a broader unresolved glossary preference insufficient grounds for a row-local hold. Prior findings at 27803, 27809, 27829-27830, 27834, and 27836 were already counted and are linked, not recounted. |
| D-19404 | `default` 27842 | not an issue | English identifies the audible soft murmurs of pilgrims praying and the deity's suddenly silent voice. Korean preserves that contrast without supplying an unsupported cause; Chinese compresses the silence differently. |
| D-19405 | `default` 27831 | uncertain | English and Chinese retain the broad “brought me back” wording while Japanese explicitly says resurrection. Korean `되살렸다고` narrows the English; without the scene context, neither a broader Korean replacement nor the resurrection reading can be confirmed confidently. Leave unchanged. |

The previous sibling-age correction at ID 27838 (D-8787) remains accepted
and is linked without recounting. Previous not-an-issue findings D-8788 and
D-8789 are likewise linked without recounting.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27815 | `'이 페이에게 무엇이 잘못됐는지 알겠군.'` | `'이 페이에게 무슨 문제가 있는지 어느 정도는 알겠군.'` | Restore “in part” while retaining the quoted verse line and stanza structure. |
| 27817 | `소로스 가문(House of Sorrows)` | `비탄의 집(House of Sorrows)` | Reuse the accepted named-House form in an explicit return-to-base context. |
| 27820 | `미사란(Mitharan)` | `미타란(Mitharan)` | Reuse accepted D-18158 terminology. |
| 27827 | `발라드 가문(House of Ballads)` | `발라드의 집(House of Ballads)` | Reuse the established House of Ballads form. |
| 27840 | `소로스 가문으로 돌아가` | `비탄의 집으로 돌아가` | Reuse the accepted named-House form in the same explicit return-to-base context. |

## Structural and Context Notes

- English, Japanese source, Chinese, active Korean, and the preserved
  Japanese-derived Korean draft each contain IDs 27801-27850 once and in
  identical ascending order. Default rows use `ID_Linha` and `Texto`; there
  is no variant column.
- Logical line-break counts agree across all five resources for the 50 IDs.
  The ten-line troll stanza at 27815 is retained. At ID 27803, English,
  Chinese, and both Korean drafts put the localized control label before
  `{1}` and `{2}`; Japanese alone orders the button placeholders first.
  Korean marker identities and order remain unchanged.
- Localized ability wrappers at ID 27843 retain both source identities and
  order. No runtime marker, placeholder, or source row was edited.
- The English wording at ID 27831 is broader than the explicit Japanese
  resurrection reading; that sole context-dependent question remains open.

## Verification

- The active Korean CSV was backed up byte-for-byte before editing:
  `/private/tmp/ko-translate-backups/20261012/before-context-27801-27850-D19399/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `eabf47f8fb078df2d43f0ce05200c6152fae3623d5867797a0a3a0d0538ca09a`.
- Post-edit SHA-256:
  `ce9f700249394ec8f4418dcbe40e040002593bd7cb6845e52c6e16b9a486e4bc`.
- Reversing the five exact substitutions reproduces the backup byte-for-byte.
  Only the five approved `Texto` cells changed. The UTF-8 BOM, all 65,135
  rows, ascending unique ID order, 72,011 CRLF endings, and 73 pre-existing
  bare-LF endings are preserved.
- Source CSVs were read-only and their SHA-256 hashes were unchanged during
  this batch.

Totals: 2,254 accepted / 24,852 `not an issue` / 11,418 uncertain (38,524).
Resume D-19406 at ID 27851; sequentially unreviewed interval is 27851-65134
(37,284 IDs), in addition to older specific holds and register reconciliation.

These are working dispositions, not independent final linguistic approval.
