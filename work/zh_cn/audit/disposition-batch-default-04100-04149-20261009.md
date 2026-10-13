# Disposition and Edit Batch: `default` IDs 4100-4149

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 4100-4149.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Sixteen findings were dispositioned: one accepted, seven `not an issue`,
  and eight uncertain. One accepted correction was applied to one `Texto`
  cell.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4103 | Oathblade Kirby rank/title | Defer whether Oathblade is a weapon/title or a mercenary rank. | D-941: uncertain. |
| 4106 | Sarcastic drivel and betting joke | Keep the sarcasm and joke; Korean conveys them. | D-942: not an issue. |
| 4107 | `doting master` | Keep the natural affectionate Korean reading. | D-943: not an issue. |
| 4109 | Cape Solace and Quay names | Defer their corpus-wide Korean spelling/name-type resolution. | D-944: uncertain. |
| 4113 | Puppet King drinking flattery and lies | Keep the supported poetic metaphor. | D-945: not an issue. |
| 4115 | Diagnostic fragments and specialness pivot | Keep the sequence and turn; smoothing does not change the contrast. | D-946: not an issue. |
| 4122 | `a crew` rendered as sailors | Replace the unsupported occupation with a neutral group term. | D-947: accepted. |
| 4127 | `The Wallows` location | Defer proper-name versus literal-place interpretation. | D-948: uncertain. |
| 4129 | Repeated leagues/distance | Keep the Korean repetition of remoteness for emphasis. | D-949: not an issue. |
| 4130 | Malformed Argine/followers clause | Preserve as uncertain; the exact fate is not recoverable. | D-950: uncertain. |
| 4135 | `dove` and Dark Maze | Defer address register and proper-name status. | D-951: uncertain. |
| 4140 | Testament/Belen Covenant identity | Defer the conflicting faction/entity names. | D-952: uncertain. |
| 4141 | Relentless Assault upgrade text | Keep the English/Japanese-supported active condition and preserved markup. | D-953: not an issue. |
| 4145 | Thread/weave of fate metaphor | Keep the supported fate-thread imagery in this row. | D-954: not an issue. |
| 4146 | Martyr idiom and Warden office | Keep the plausible idiom; defer the formal office title. | D-955: uncertain. |
| 4149 | Court, Farrara, Telling, and Ballad | Defer the lore relation and performance terminology. | D-956: uncertain. |

Historical questions for same-numbered `base` items remain separate and were
not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4122 | `나와 선원 몇 명이 ... 원정을 떠날 참이야.` | `나와 일행 몇 명이 ... 원정을 떠날 참이야.` | D-947 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  4100-4149 once and in identical order.
- The multiline upgrade description at ID 4141 retains its line break and
  `{*1...}` marker. ID 4134 retains
  `$NQD_City_Adessa.investment_amount$` in place.
- The accepted edit changes only the approved Korean `Texto` cell and does
  not alter keys, row order, line breaks, or runtime markers.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `0f65eaf11b3c6eb921ad9ff96eebd9a8de07e07436848f2c048e281b8b4965d8`
- Cumulative dispositions: 212 accepted, 186 `not an issue`, and 558
  uncertain. Resume at `default` ID 4150.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
