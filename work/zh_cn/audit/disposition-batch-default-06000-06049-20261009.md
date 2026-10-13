# Disposition and Edit Batch: `default` IDs 6000-6049

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 6000-6049.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Fifteen findings were dispositioned: one accepted, three `not an issue`,
  and eleven uncertain. One accepted `Texto` cell was changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 6001 | `Shieldbrother` | Defer formal-title/rank versus generic-address meaning. | D-1601: uncertain. |
| 6002 | `{*1[Passive]}` | Localize the visible payload using the established Korean form; retain marker ID. | D-1602: accepted. |
| 6004 | `Preordained` | Defer named-group versus Fate-related descriptive meaning. | D-1603: uncertain. |
| 6007 | Oleyn / Maid verse | Keep the quest/test relation; defer verse shaping and title normalization. | D-1604: uncertain. |
| 6009 | `Flawless Mitharan Prosperous String` | Defer item component/modifier meaning. | D-1605: uncertain. |
| 6013 | Magnus / pit / Arena | Keep the supported sequence; defer the pit and forced-entry context. | D-1606: uncertain. |
| 6014 | Great Father / Reverie / General Masterson epitaph | Defer the apposition and lore relation. | D-1607: uncertain. |
| 6016 | `seal on the Sorrows` / new vessel | Defer the identity of the plural entity. | D-1608: uncertain. |
| 6020 | `The Font` / `Lyceum Grove` | Defer canonical names and the Font's exact type. | D-1609: uncertain. |
| 6026 | `with Bows` | Keep the isolated UI/category fragment. | D-1610: not an issue. |
| 6032 | Ahnrun / Draug / Solsvard poem | Keep English lineation; defer the opaque pursuit image and lore spellings. | D-1611: uncertain. |
| 6036 | `Great Scale` / `reverie` | Defer proper-concept and formal-state readings. | D-1612: uncertain. |
| 6038 | `Shocking damage` | Keep the shock-damage type and nearby-enemy effect. | D-1613: not an issue. |
| 6044 | `Argine, Queen of Staves` | Defer staff versus card-suit/title reading. | D-1614: uncertain. |
| 6048 | Boots urge the wearer to hunt | Keep the boots' agency and the predatory conclusion. | D-1615: not an issue. |

## Applied Correction

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6002 | `{*1[Passive]}` | `{*1[지속 효과]}` | D-1602: localize the displayed passive label using the established Korean UI term. |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6001-6002, 6004, 6007,
  6009, 6013-6014, 6016, 6020, 6026, 6032, 6036, 6038, 6044, and 6048
  against active Korean and matching source rows.
- D-794 at ID 3731 already establishes `{*1[지속 효과]}` as the Korean
  passive-marker label; this batch applies that exact label to the same
  marker class at ID 6002.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence and does not authorize any
  correction beyond the accepted edit at ID 6002.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 6000-6049 are present in matching order.
- The `*1` marker wrapper at ID 6002 remains first, followed by one explicit
  line break and the description; only its localized payload changed.
- ID 6032 retains seven explicit line breaks in English, Chinese, and Korean;
  Japanese has six. Korean retains the English/Chinese eight-line structure.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF/CR bytes.
- Only the approved `Texto` cell at ID 6002 changed.
- Active Korean `default` CSV SHA-256:
  `b5bc4b32cedd078baaad6fae44728a5fd28c73e67c29c12e5f3ab9c2567a5be1`
- Cumulative dispositions: 294 accepted, 447 `not an issue`, and 874
  uncertain. Resume at `default` ID 6050; 58,085 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology, combined-name consistency, and integrated voice
review remain open.
