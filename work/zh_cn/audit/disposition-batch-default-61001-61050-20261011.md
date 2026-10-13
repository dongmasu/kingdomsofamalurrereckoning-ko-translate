# Disposition Batch: `default` IDs 61001-61050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structural markers.
- One accepted correction, 41 `not an issue` IDs, and eight uncertain IDs.
  These are working dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17930 | 61021 | `산은 위험한 곳이야. 마차 행렬 습격을 봐! 돈이 된다면 누구나 보호를 받아야 해.` | `산은 위험한 곳이야. 마차 행렬 습격을 봐! 호위 비용을 감당할 수 있다면 누구나 호위를 받아야 해.` | English `if they can afford it` means financial ability, not profitability. Japanese specifies hiring an escort and Chinese confirms affordability; clarify the intended condition and protection. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17931 | 61003 | `Mitharan Prismere Guard` is a capitalized compound label; the entity/category and canonical Korean name forms need glossary/context review. |
| D-17931 | 61013 | English/Japanese/Chinese/Korean have 11/18/14/18 embedded line breaks. Korean follows the Japanese-derived layout, but this source conflict remains an explicit structural exception; do not normalize automatically. |
| D-17931 | 61019 | The `Rathir Battlefield` simile and the exact historical reference remain context-dependent. |
| D-17931 | 61026 | Preserve the fragmentary continuation and “final cowardice” contrast pending surrounding quest context. |
| D-17931 | 61028 | The flame/frost/storm riddle preserves all clues, but its intended answer is not available in this row. |
| D-17931 | 61036 | The water-gates and exact route mechanics need quest context; retain the current description. |
| D-17931 | 61038 | Explicit healing and Mana values match, but the exact charge/sustain mechanics need gameplay-context verification. |
| D-17931 | 61040 | `greatest of Vengeance` may identify members/champions of the House of Vengeance rather than generic avengers. |

## Not an Issue

Decision D-17932 records these 41 IDs: 61001-61002, 61004-61012, 61014-61018,
61020, 61022-61025, 61027, 61029-61035, 61037, 61039, and 61041-61050.
The prayer-poem at ID 61013 is excluded because its line-break discrepancy
remains open.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 61001-61050 once
  and in identical ascending order.
- Embedded line breaks match except at ID 61013: English 11, Japanese 18,
  Chinese 14, and Korean 18. This is recorded as unresolved, not approved.
- Runtime-token sequences and explicit numeric values match. The 45% Elemental
  Damage and all healing/Mana percentages are preserved.
- Source-keyed historical questions were reconciled. Unresolved lore,
  terminology, gameplay, and structure questions remain open; no speculative
  global normalization was applied.
- The byte-identical pre-edit CSV backup is
  `/private/tmp/ko-translate-backups/20261011/before-61001/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `6e7a50bdb14c95e64de1d53289b321ded8c74b956f585686525cee59bc78f4b3`).
- Only the `Texto` cell at ID 61021 differs from that backup. The active CSV
  SHA-256 is
  `e5e66ddbda54055c0197021698b1c0f72f65fe2575b873d5acce0f0e14c3b121`.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.

D-17930 records one accepted correction, D-17931 records eight uncertain
findings, and D-17932 records 41 `not an issue` IDs. Direct register totals:
1,756 accepted, 14,404 `not an issue`, and 11,672 uncertain (27,832
dispositions total); next D-17933.

Resume at `default` ID 61051; 4,084 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
