# Preliminary Language Scan: `default` IDs 5700-5749

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 5700-5749.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 5700 | `my liege` → `주군` | Retain the deferential address unless character context supports a higher court title such as `폐하`. | English and Japanese both establish a subordinate addressing their liege. Korean `주군` is plausible; the exact rank is contextual. | Medium |
| 5701 | `Fateweavers` → `페이트위버` / `입단` | Standardize the group name and confirm whether `initiated` means formal initiation rather than ordinary joining. | All sources say the narrator entered the Fateweavers after heroic deeds. Korean preserves the membership event but uses a transliteration. | Medium |
| 5705 | `{*2Side Quests}{LINE_LEFT}` | Translate or confirm the visible label inside the `*2` wrapper; preserve the wrapper ID and `LINE_LEFT` token. | English/Japanese/Chinese localize the displayed “Side Quests” label, but Korean leaves it in English while translating the explanatory copy. Marker identity/order is intact. | High |
| 5707 | `Try removing the gem` → `보석을 빼내기` | Confirm whether this is an action prompt/title or a direct instruction; adjust the Korean ending to match its UI function. | English is imperative; Korean uses a noun-like `-기` form, which may be correct for an objective label but not a spoken command. | Medium |
| 5711 | `A fine city, for what it is` | Preserve faint praise, the aside “mind you,” and the speaker's complaint about the City Watch. | All sources convey a decent-but-dull, overly proper city and a humorless guard. Korean retains the dry conversational tone. | High |
| 5712 | `Aron Excavations` / `all the elements` → `아론 채굴장` / `모든 시설` | Confirm whether this is a named operation/settlement and which expansion components are upgradeable. | English/Japanese/Chinese refer to critical people required for expansion; Korean interprets “elements” as facilities, a plausible game-context reading. | Medium |
| 5714 | `Warsworn punishment` → `전쟁맹(Warsworn)의 징계` | Standardize the faction name and determine whether this is formal discipline or a specific faction punishment. | All sources say McGowan must be punished by the group for terrorizing those he protects. Korean retains the responsibility and condition. | Medium |
| 5719 | `end up in one of their swamps` → `저놈들 늪에 처박히게` | Preserve disgust without strengthening the fate of ending up in the swamp into a more violent “thrown in” image unless context supports it. | English says the speaker never dreamed they would end up in a swamp; Korean's `처박히다` adds a rougher nuance consistent with, but stronger than, the disgust. | Low |
| 5720 | `Unwritten One` → `기록되지 않은 자` | Confirm this capitalized title's established Korean form and whether it is a name/title rather than a description. | English capitalization and the standalone row suggest a proper title. Korean is a literal provisional rendering. | Medium |
| 5728 | `old Dverga fastings` → `드베르가 지하 통로` | Confirm the feature and Dverga spelling; English `fastings` is unusual and may be a source typo. | Japanese explicitly describes underground passages; Chinese transliterates the unusual term. Korean follows the Japanese-supported passage reading and preserves the route connecting both ends of Gallows End. | Medium |
| 5733 | `Greatsword Mastery` → `대검 숙련` | Keep aligned with the official Korean combat/skill terminology. | English/Japanese identify a mastery skill; Korean renders both weapon and mastery category concisely. | High |
| 5740 | `Dolan Hardy's stolen Border Permit` → `돌런 하디가 도난당한 국경 통행증` | Correct the possessive relation: the permit belonging to Dolan Hardy was stolen; the current Korean can read as if Dolan himself was stolen/robbed. | English, Japanese, and Chinese all identify a permit stolen from Dolan Hardy. Korean particle placement creates a material ambiguity. | High |
| 5745 | Potion recipe / `Sativa Fibers`, `Star Thistle`, `Scarwood Bark`, `Essence of Fate` | Keep ingredient names aligned with English pending the canonical in-game glossary; preserve quantities and paragraph layout. | English lists 4/4/3/1. Japanese differs on Sativa as leaves and the localized item names; Chinese diverges more substantially on the first two ingredients. Korean follows English's ingredient identities and keeps the listed counts. | Medium |
| 5748 | `Hall of Appointments` → `임명관` | Confirm the named institution/place and whether the role is “with” it or physically located there; preserve the ambassador-preparation function. | The language versions differ on the institution's function and rendering. Korean retains the Hall name provisionally and states the meeting-preparation duty. | Medium |
| 5749 | father / son / `rag-doll` | Preserve the contrast between the father's overwhelming strength and the son's eventual killing stroke. | All sources describe the father tossing his son around until the son lands the fatal blow. Korean preserves the agency and simile. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 5700-5701, 5705, 5712,
  5714, 5720, 5728, 5745, and 5748 against active Korean and matching source
  rows.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts and brace-delimited runtime-marker identities
  match across all four locales; localized text inside `*2` was treated as
  display text rather than as a structural marker change.
- The recipe at ID 5745 retains all four ingredient quantities in the same
  order.
- No active CSV structure or text was changed.

## Batch Status

IDs 5700-5749 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
