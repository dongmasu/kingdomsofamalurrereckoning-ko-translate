# Disposition and Edit Batch: `default` IDs 7250-7299

- Decision date: 2026-10-09.
- Scope: preliminary findings and applicable historical questions for
  `default` IDs 7250-7299.
- English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Twenty findings were dispositioned: five accepted, seven `not an issue`,
  and eight uncertain. This remains an in-progress disposition pass, not
  independent final linguistic approval.

## Accepted Edits

The following exact `Texto` edits were applied to the active Korean CSV:

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 7266 | `연금술에 쓸 수 있는 특별한 원소` | `연금술에 쓸 특별한 재료` | D-1970: use the supported alchemical-material sense. |
| 7284 | `불탄 땅` | `번(The Burn)` | D-1976: align the established source-linked place name at `base` ID 2561. |
| 7286 | `($DLC2_SQ09.key_cost$ Gold)` | `($DLC2_SQ09.key_cost$ 골드)` | D-1978: localize only the visible currency label and retain the variable. |
| 7291 | `이딜라(Idylla)가 잘 지내길 바라` | `이딜라(Idylla)에서 잘 지내길 바라` | D-1980: make the well-wishing idiomatic in Korean. |
| 7298 | `진노의 충격 한 번마다` | `진노의 각 파동은` | D-1982: align the repeated Wrath pulse with Japanese and related Korean ability text. |

## Other Dispositions

- IDs 7254, 7255, 7257, 7263, 7265, 7276, and 7278 are `not an issue`.
  The elemental inversion, entry prerequisite, English-led poem layout,
  divine-spark sequence, atonement witness, lore chronology, and unidentified
  bottle contents are preserved.
- IDs 7253, 7269, 7280, 7281, 7285, 7289, 7293, and 7299 remain uncertain.
  Faction/name spellings, location identity, a development placeholder,
  ambiguous warning language, proper names, and the Motus Mining organization
  name lack sufficient evidence for safe edits.
- At ID 7257, English, Chinese, and Korean have three embedded breaks while
  Japanese has two; the Korean follows English. Runtime tokens, displayed
  currency variable, and all numeric values remain unchanged.

## Verification

- The four locale CSVs contain the same 65,135 `default` IDs in identical
  order.
- Preliminary structural comparison found matching line-break counts and
  runtime-marker identities/order except the documented Japanese lineation
  difference at 7257.
- The `$DLC2_SQ09.key_cost$` variable is unchanged; ID 7298 retains 55 and
  360 Physical Damage, 130 Mana, and the per-impulse cost increment.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF
  record endings.
- Active Korean `default` CSV SHA-256:
  `413ba915d1361afdea0690191169fcdbb94223002bf8762b394cba1968ca0244`.
- Cumulative dispositions: 353 accepted, 592 `not an issue`, and 1,038
  uncertain. Resume at `default` ID 7300; 57,835 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
