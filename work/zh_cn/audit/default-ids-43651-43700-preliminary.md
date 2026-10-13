# Preliminary Language Scan: `default` IDs 43651-43700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43651-43700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43657 | `{3}% chance for -{1}% {2}` / `{3}% 확률로 {1}%만큼 {2} 감소` | Preserve the chance/value/stat identities and correct reduction direction; accept locale-specific marker order where grammar requires it. | English, Chinese, and Korean order markers 3,1,2; Japanese uses 3,2,1. The Japanese order is a grammatical localization and the same variables/meaning are retained. | High |
| 43658 | Vulnerable / `취약` | Confirm the game's established Korean status-effect label and retain the style marker. | English/Japanese retain `Vulnerable`; Korean translates it as “vulnerable,” while Chinese uses a resistance/intolerance term. The `{*5}` style marker is preserved. | Medium |
| 43659, 43675 | Dokkalfar / `도크알브` | Retain the established faction spelling and keep the gendered pronoun in the Dokkalfar-agent line. | Korean follows the source: the agent concealed some truth but did not betray him. Japanese/Chinese use generic “dark elf” forms. | Medium |
| 43663 | Damage Mitigation while blocking / `방어 중 피해 감소` | Confirm the official UI term for blocking and keep the effect distinct from parrying. | English/Japanese/Korean say blocking; Chinese says parrying. The +20% value is preserved in all locales. | High |
| 43667 | alchemy bench; honor / `연금술 작업대`; `큰 영광` | Preserve the polite compliment and the speaker's invitation to use the bench. | Korean communicates that use of the bench would honor the speaker; Japanese is similar, while Chinese preserves the “compliment to me” aside more literally. | Medium |
| 43671 | Chief Protector / `최고 수호관` | Standardize the formal civic title and preserve the city's comprehensive guardianship responsibility. | All locales make this a city-protection title; wording varies. Korean retains the proclamation and responsibility. | Medium |
| 43674 | Einar Abergast / `에이나르 애버개스트` | Verify the canonical Korean phonetic spelling against other occurrences. | Proper-name spellings vary across locales; no context in this row resolves pronunciation. | Low |
| 43676 | “I am ... err... I was an architect” | Preserve the self-correction and hesitation without obscuring that the speaker was an architect in the prior world. | Korean retains the false start and the past-tense correction. Japanese/Chinese differ in how explicitly they show the hesitation. | Medium |
| 43680 | “some going on about Lyria” / `리리아 얘기가 좀 오가도` | Keep the dismissive aside about Lyria and the separate condition that the listener not be a refugee. | The English is colloquial/elliptical; Korean preserves both conditions without adding a specific activity or referent. | Medium |
| 43681 | Soulbind / `영혼 결속` | Confirm this capitalized curse's canonical Korean name and distinguish it from generic soul-binding. | English capitalizes Soulbind as the curse's name; Korean translates it literally. Other locales use equivalent named terms. | Medium |
| 43682 | dustling; “your grace” / `먼지 자식`; `폐하` | Confirm whether Dustling is a species/slur and whether the sarcastic honorific should be “Your Grace” rather than the more imperial “Your Majesty” (`폐하`). | English addresses the player as “your grace”; Japanese/Chinese use a high-status address, while Korean's `폐하` can imply an emperor. | High |
| 43683 | “salvation and creation of Chaos Weapons” / `혼돈 무기를 회수하고 제작` | Preserve the intended recovery/salvage/repair sense and standardize the Chaos Flames/Chaos Weapons terms. | The English `salvation` is unusual; historical notes identify the intended sense as salvaging/reclaiming. Japanese says repair, Chinese says recycling, and Korean says recover. | High |
| 43684-43685 | Argine, Queen of Staves; Mystic Hammer; emanations | Standardize the character/title and weapon terms while preserving that only the Mystic Hammer can injure the emanations. | Korean retains Argine's name/title and the exclusive weapon condition; the localized proper-name forms differ. | Medium |
| 43689 | Mana Regeneration recipe / four ingredients | Preserve the six source line breaks, ingredient order, and quantities 3/2/1/1; standardize item names. | The English, Japanese, Chinese, and Korean recipe retain the same four ingredients and quantities. Historical notes explicitly call for checking this recipe. | High |
| 43691 | Chaos Weapons / `혼돈 무기` | Keep the in-game item class consistent with the 43683 crafting/salvage tutorial. | The source and Korean refer to the same named weapon class; the verb at 43683 remains contextually uncertain. | Medium |
| 43693 | Sorrows / `비탄` | Confirm whether capitalized Sorrows names a force/entity and preserve the claim that it could be unleashed on Alfar armies. | Korean conveys release of sorrow onto the armies but does not distinguish a named force from generic grief; Chinese/Japanese also interpret it as a force. | High |
| 43697 | Deadeye; brethren / `데드아이`; `동족` | Standardize Deadeye as a creature/name and retain the scale and danger of the losses. | Korean preserves the hundreds of fallen brethren and the speaker's fear of entering alone. | Medium |
| 43700 | “submit to the trial” / `시련에 임해` | Preserve that entering the circle enables the trial and confrontation with one's potential. | All locales retain the two-step instruction; Korean is concise and semantically aligned. | High |

IDs 43651-43656, 43660-43662, 43664-43666, 43668-43670, 43672-43673,
43677-43679, 43686-43688, 43690, 43692, 43694-43696, and 43698-43699
generally retain the English meaning on this first reading. Names, item/UI
terms, and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43656-43685 was checked for
  Walen, Dokkalfar, Rithen, Saramer, Chief Protector, Warsworn,
  Einar Abergast, Soulbind, Chaos Flames, the unusual Chaos Weapons
  “salvation” wording, Argine, and Mystic Hammer.
- Historical entries for 43687-43690 and 43693-43697 were checked for
  proper names, reagent names/quantities, Sorrows, Deadeye, and related
  creature/faction terms. The recipe values are retained; context remains
  open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43651-43700 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales. ID 43689's
  multiline recipe structure is retained.
- Runtime marker IDs and counts match. At 43657, Japanese alone reorders
  the `{3}`, `{2}`, `{1}` variables to fit its sentence; Korean retains
  source order and all variable identities. The `{*5}` marker at 43658 is
  retained.
- The +20% effect at 43663, +30% effect at 43695, and recipe quantities
  3/2/1/1 at 43689 match. No hidden formatting characters were found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43651-43700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43701.
