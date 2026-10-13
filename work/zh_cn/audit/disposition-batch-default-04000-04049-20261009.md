# Disposition and Edit Batch: `default` IDs 4000-4049

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 4000-4049.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Seventeen findings were dispositioned: two accepted, nine `not an issue`,
  and six uncertain. Two accepted corrections were applied to two `Texto`
  cells.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4001 | `Altar of Betrayal` name | Keep the English-led distinction from the Altar of Doubt. | D-908: not an issue. |
| 4002 | `Aodh` transliteration | Defer the canonical Korean spelling because locale phonetics conflict. | D-909: uncertain. |
| 4008 | `grand armory` rendering | Keep the conversational Korean wording; meaning and register are supported. | D-910: not an issue. |
| 4009 | `Worth Fighting For` title | Keep the English-led Korean title despite the Japanese divergence. | D-911: not an issue. |
| 4010 | Vreakor pronoun in companion relation | Remove the unsupported masculine possessive; English identifies Vreakor as `she`. | D-912: accepted. |
| 4012 | `Crying Eyes` puzzle reference | Preserve the wording pending the missing puzzle referent. | D-913: uncertain. |
| 4015 | Capitalized `the Order` | Defer whether this is a religious organization; Korean `교단` may over-specify. | D-914: uncertain. |
| 4017 | Withering War lore passage | Defer the compressed chronology, factions, and proper-name alignment. | D-915: uncertain. |
| 4019 | Connovar bounty/roles | Keep the supported slaver, bandit-lord, bounty, and stronghold facts. | D-916: not an issue. |
| 4020 | Required Skill variables | Preserve `{1}-{2}` exactly and in order. | D-917: not an issue. |
| 4037 | Answer residents' petitions | Change `청원을 해결하다` to `청원에 답하다`; leave the institution name open. | D-918: accepted. |
| 4038 | Anwon bloodline count | Keep the supported two-to-one conditional and honorific. | D-919: not an issue. |
| 4042 | Capitalized `House` | Defer whether it is a formal faction or household. | D-920: uncertain. |
| 4044 | Lyria and the woman's sacrifice | Keep the Korean paraphrase; it preserves presence and meaningful sacrifice. | D-921: not an issue. |
| 4045 | Crows forced into the Arena with trolls | Keep the forceful action and urgency. | D-922: not an issue. |
| 4047 | `stale poison` metaphor | Defer the conflicting poison/old-conflict readings and possible image repetition. | D-923: uncertain. |
| 4049 | Fae Relic acquisition objective | Keep the supported objective wording. | D-924: not an issue. |

Historical questions for same-numbered `base` items remain separate and were
not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4010 | `...처단할 때 그의 절친한 동료가 들고 있었다고 한다.` | `...처단할 때 절친한 동료가 들고 있었다고 한다.` | D-912 |
| 4037 | `...주민들의 청원을 해결해 달라고 부탁했다.` | `...주민들이 제출한 청원에 답변해 달라고 부탁했다.` | D-918 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  4000-4049 once and in identical order.
- The multiline account at ID 4017 retains its source line breaks.
- Both runtime variables at ID 4020 remain ordered as `{1}-{2}`.
- The two accepted edits do not alter keys, row order, line breaks, or
  runtime markers.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256:
  `5d0ebd8c2cbd389b4bd4a29b99d3a7606e567352168299172abe88b1306604ef`
- Cumulative dispositions: 210 accepted, 174 `not an issue`, and 540
  uncertain. Resume at `default` ID 4050.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
