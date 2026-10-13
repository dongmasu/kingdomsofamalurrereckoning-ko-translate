# Disposition and Edit Batch: `default` IDs 4050-4099

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 4050-4099.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Sixteen findings were dispositioned: one accepted, five `not an issue`,
  and ten uncertain. One accepted correction was applied to one `Texto`
  cell.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4051 | Cipher/Kollossae/Hyperian lore account | Keep the event sequence and lineation; defer global lore-name reconciliation. | D-925: uncertain. |
| 4053 | Treachery and eternal languishing invitation | Keep the supported threatening meaning and tone. | D-926: not an issue. |
| 4058 | Promise to try, then refusal to entrust lives | Keep the clear concession/contrast. | D-927: not an issue. |
| 4060 | Manual `Lopoku` versus English `Lupoku` | Retain the manual-based Korean and document the English spelling discrepancy without silent normalization. | D-928: uncertain. |
| 4064 | Bridgette possession and Scion role | Defer the fragment's agent and office terminology. | D-929: uncertain. |
| 4065 | `mission` institution type | Defer the conflicting site/institution readings. | D-930: uncertain. |
| 4068 | `wastrel` rendered as `탕아` | Defer whether this is too specific without speaker context or a supported replacement. | D-931: uncertain. |
| 4071 | Gentle-breeze idiom and Kellis Cen introduction | Keep the natural Korean idiom and supported name/place correction. | D-932: not an issue. |
| 4077 | `Warden` office | Defer the settlement role and canonical Korean title. | D-933: uncertain. |
| 4079 | `I have not` / `it stays that way` | Defer the missing antecedent; retain the source ambiguity. | D-934: uncertain. |
| 4081 | Formal item name `Mystic Hammer` | Add its English name parenthetical while retaining the Korean item name and quest sequence. | D-935: accepted. |
| 4084 | `dove` endearment / Missives of Sable | Defer the address register and document-title convention. | D-936: uncertain. |
| 4086 | `Oathblade` weapon or rank | Defer the item/rank conflict and canonical Korean form. | D-937: uncertain. |
| 4090 | Fae rite and elevated speaker voice | Keep the supported content and coherent otherworldly Korean register. | D-938: not an issue. |
| 4094 | Eolfwyn's star-fire soul | Keep the source-supported heart/soul metaphor. | D-939: not an issue. |
| 4099 | Standalone `House` | Defer whether it means a noble House, family, or building. | D-940: uncertain. |

Historical questions for same-numbered `base` items remain separate and were
not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4081 | `이곤(Eagonn)의 신비한 망치` | `이곤(Eagonn)의 신비한 망치(Mystic Hammer)` | D-935 |

The official Korean manual supports `로포쿠(Lopoku)` at ID 4060; the English
source spells it `Lupoku`. That cross-locale/source discrepancy remains
documented and no change was made to the Korean cell.

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  4050-4099 once and in identical order.
- The long account at ID 4051 retains its source lineation.
- The single accepted edit adds only the item-name parenthetical; keys,
  order, line breaks, and runtime markers are unchanged.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `5d0ebd8c2cbd389b4bd4a29b99d3a7606e567352168299172abe88b1306604ef`
- Cumulative dispositions: 211 accepted, 179 `not an issue`, and 550
  uncertain. Resume at `default` ID 4100.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
