# Preliminary Language Scan: `default` IDs 9500-9549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9500-9549.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9500 | `Felltown` → `펠타운` | Align the place-name spelling with recurring occurrences and check it against the official Korean name list. | The references use similar sound-based forms, but the project does not yet have a confirmed canonical spelling. | Medium |
| 9501 | `Irion` → `이리온(Irion)` | Align the name spelling and selective English-parenthetical treatment with other occurrences and the project's eventual proper-name convention. | Japanese/Chinese transliterations differ; Korean retains the source spelling for traceability. | Medium |
| 9503 | `Lou Winfreigh` → `루 윈프레이` | Confirm the name spelling and keep the quest facts intact: the Troll is dead, Lou can fish safely, and the reward is promised at the pond. | All three references retain the same sequence. Korean preserves the cause, safety, reward, and meeting place. | Medium |
| 9504 | Lyria / `{*1 (Available to Dokkalfar)}` | Confirm the goddess and Dokkalfar spellings and the established Korean UI wording for the localized availability label; retain the marker and its contents. | All four resources retain the `*1` marker. Korean preserves the condition, while spellings/UI wording vary. | Medium |
| 9505 | `most dangerous things are` → `위험한 것들은 대개 그렇지만` | Preserve the speaker's wry, conversational observation without changing the referent from dangerous things to dangerous places. | English and Japanese speak generally of dangerous things; Chinese makes “place” explicit. Korean keeps the general form. | Medium |
| 9506 | Creathnach Thintri / Skycrown | Verify both proper names and whether Creathnach Thintri is the Fae name for the mountain; retain the speaker's admiring rhetorical question. | Japanese and Chinese spell the Fae name differently; Korean preserves it parenthetically and retains Skycrown as a mountain name. | Medium |
| 9510 | `war-lover's battle spirit` → `전투를 사랑하는 자의 투지` | Preserve the gut-versus-head/chest metaphor and check whether `gut` is meant literally or as courage/instinct. | English and Japanese locate the battle spirit in the abdomen; Chinese uses a courage term. Korean retains the bodily contrast and renders the spirit as fighting will. | Medium |
| 9517 | `my fleshy friend` → `살덩이 친구` | Preserve the nonhuman speaker's teasing/dismissive address; check whether the intentionally strange “fleshy” image should remain literal. | English and Japanese retain the flesh/mortal contrast; Chinese softens it to “friend.” Korean keeps the unusual image and the refusal to help cause trouble. | Medium |
| 9526 | `Descend the Mission well` → `선교회 우물 아래로 내려가라` | Determine whether `Mission` is a named religious site and `well` a location, and verify the site's established Korean term. | Japanese says monastery well, Chinese uses a mission/preaching-place well, and Korean chooses “mission.” | Medium |
| 9529 | `Corpsman` → `의무병` | Determine whether this is a military medical role or a named corpse-related entity/UI label; do not settle the English polysemy without game context. | English commonly supports the medical-role reading, but Japanese and Chinese both say “corpse.” The historical question remains unresolved. | Medium |
| 9530 | `Scholia Arcana` → `알카나 대학` | Align the institution spelling and whether it is an academy/university with the project's glossary. | Japanese uses a university term, Chinese an arcane academy, and Korean a university form. The proper name remains a consistency concern. | Medium |
| 9533 | `staff of Seawatch` → `씨워치의 신하들` | Check whether `staff` means employees/household staff or subjects/retainers; preserve the return to their old home and the Head Steward's title. | English says staff; Japanese says retainers and Chinese says the people of Seawatch. Korean chooses “subjects/retainers,” which may imply a different social role. | Medium |
| 9535 | `This fire seems to have bee built...` | Treat `bee` as an English source typo for `been`; retain the likely intended observation that the fire was built within Galette's sight and recently extinguished. | Korean follows the apparent intended meaning and does not reproduce the typo. | High |
| 9536 | `{*1[Active - Sustained]}` / `edged weapons` → `양날 무기` | Preserve the localized marker and first line break; align the active/sustained UI labels, and check whether `edged weapons` should include more than double-edged weapons. | Marker and line-break structures match. English/Japanese refer broadly to edged/bladed weapons; Korean's `양날 무기` narrows the category to double-edged weapons. | High |
| 9537 | `The Midden` → `미든(The Midden)` | Determine whether this is a named place or common noun and align its Korean form with any contextual references. | Japanese transliterates it and Chinese translates a midden/mound term; neither resolves the referent. Korean preserves the English spelling. | Medium |
| 9539 | `a place left to the ages` → `시간에 버려진 곳` | Preserve the idea that the place has been left behind by time and the warning not to be persuaded otherwise; check the metaphor's naturalness. | Korean retains the abandoned-by-time image and the negative persuasion clause. | Medium |
| 9545 | `The Century Flowers` → `세기의 꽃` | Determine whether capitalization marks a named quest, object, or species rather than generic flowers. | English capitalization and the parallel Japanese/Chinese titles support treating this as a title/name pending context. | Medium |
| 9546 | `her final words` → `그녀의 마지막 말` | Preserve that the letter brings comfort as her last words; confirm whether “hearing” those words is implied by the quest context. | English and all references retain the comfort and last-words meaning. Korean says the words were conveyed/heard and preserves the gratitude. | Medium |
| 9548 | `There is still another challenge to overcome` → `아직 넘어야 할 시련이 하나 더 있습니다` | Preserve the respectful, encouraging register and that exactly one challenge remains. | Japanese and Chinese use formal speech; Korean also uses polite endings and retains the singular remaining challenge. | High |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9504, 9506, 9526, 9529, 9536-9537,
  and 9545 against the active rows.
- Added active-row checks for IDs 9500-9501, 9503, 9505, 9510, 9517,
  9530, 9533, 9535, 9539, 9546, and 9548.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales,
  including the two-line ability description at ID 9536.
- Runtime-marker IDs/order and other brace tokens match throughout this
  range; ID 9504 and ID 9536 retain their `{*1...}` markers.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name and term questions above as
  settled.

## Batch Status

IDs 9500-9549 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
