# Preliminary Language Scan: `default` IDs 37051-37100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 37051-37100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 37057 | Bera Grastar / Thirsty Birch / animal meat | Preserve that the speaker has already secured meat to sell when they get a chance, without implying a completed sale. | English/Japanese say the speaker has plenty of meat to sell; Chinese shifts to a completed past sale. Korean correctly keeps the future opportunity and inventory sense flagged in the historical log. | Medium |
| 37058 | Master Hugues / `대사부` | Standardize Hugues's name and whether `Master` is a scholarly honorific, title, or rank. | English/Chinese explicitly say Master Hugues; Japanese says Hugues. Korean chooses `대사부`, which is more specific than a generic master/scholar. | Medium |
| 37060 | Gnome planners | Preserve the generalization that Gnomes plan cities, days, and lives with no room for error; standardize Gnome. | All locales retain the planning metaphor. Korean makes the species collective explicit and interprets the city's planning as meticulous design. | Low |
| 37061 | Sagecraft / +1 skill | Use the official Korean manual's `마법물품 제작` term and preserve the +1 temporary skill increase. | English says Sagecraft; Japanese reads gemcraft and Chinese reads enchantment. Korean follows the project's manual glossary and retains +1. | Medium |
| 37063 | pulsating gelatinous orb / rescuers | Preserve the eerie object description and avoid adding an action absent from the English. | English says rescuers heard it calling for help. Korean adds that rescuers were trying to retrieve it when they heard the call; Chinese/Japanese do not make this added retrieval action explicit. | High |
| 37064 | red leaves / Saturnyn | Resolve the red-leaved object from context and standardize Saturnyn. | Chinese explicitly identifies the leaves as Gallows Tree; English leaves the pronoun's antecedent unstated. Korean preserves the red leaves, bodies of mortal soldiers, and question about Saturnyn. | Medium |
| 37067 | no grasp of morality, honor, or death | Preserve the triad without narrowing “death” to an abstract meaning unless context supports it. | English says the entity has no grasp of death; Korean says it does not know the meaning of death. Japanese reads it as lacking a lifespan, and Chinese literally says “no death.” | Medium |
| 37069 | inventory audited twice | Preserve the twice-repeated inventory audit and the speaker's worry that nothing is missing. | All four locales retain the count of two and the concern about missing inventory. | Low |
| 37072 | `Sorcery ({1})` | Preserve `{1}` exactly once and in place. | All locales retain the same runtime variable identity and position. | Low |
| 37076 | offering to Mitharu / shrine | Confirm whether this is the named Mission's shrine or another shrine; preserve the instruction to set the offering in front. | English says shrine; Japanese says church, Chinese temple, and Korean sanctuary. Korean retains the Mitharu offering and placement instruction. | Medium |
| 37077 | piracy / `setting` / retrieval | Preserve the speaker's wish to retrieve the target and depart, plus the agitated, sinister assessment of the environment. | English/Japanese/Chinese/Korean retain the desire to leave after retrieval. Korean interprets `setting` as the place/environment and keeps both agitation and sinister tone. | Low |
| 37082 | Mission / scarce suppers | Confirm `Mission` as a formal religious institution and preserve the repeated crisis list and rhetorical appeal for unity. | All locales retain lies, war, hunger, mutual fear, and the Mission's expected unifying role. Korean's “barely get one meal a day” is more specific than English's “scrabble for every supper,” which describes struggling for each meal. | High |
| 37085 | `These Halls are Wise` / `이 전당은 지혜롭다` | Confirm whether this is a formal name/title and retain capitalization consistently. | English presents a capitalized phrase; Japanese renders a wisdom/revelation title, Chinese reads a literal description, and Korean follows the literal meaning. | High |
| 37088 | House of Ballads / mantle of leadership | Preserve the return to the House, assumption of leadership, and “our time” declaration. | English/Japanese/Chinese/Korean keep the succession image and political claim. Korean renders the mantle as taking over the leadership position. | Medium |
| 37091 | Asker's Alley / Ysa's only tavern | Preserve the flirtatious address and the joke that it is Ysa's best and only tavern; standardize the place spelling. | All locales retain the joke. Chinese calls the location a valley/mountain; English/Japanese/Korean call it an alley. | Medium |
| 37093 | Maid's old keep / vermin / Sagrell | Confirm `Maid` as a formal character/title and preserve the vermin insult leading into the threat to exterminate Sagrell. | English and Korean use vermin/pests; Japanese and Chinese identify a specific old fort/keep but diverge on the Maid epithet. Korean retains the taunt and direct question. | Medium |
| 37094 | Tenders / Delvers / Weeping King | Standardize the two formal roles and retain that Caelrod and the speaker were the first to serve the King. | English/Japanese/Chinese all present the roles as a paired order/group. Korean calls them guardians and seekers, a semantic rendering whose official status remains open. | High |
| 37097 | +75% Magic Damage | Follow English for meaning and retain the source discrepancy in the audit. | English, Chinese, and Korean say +75%; Japanese alone says +70%. Korean follows the English primary meaning source. All locales preserve the two blank line breaks and stat label. | High |
| 37099 | Throne / Master of Gravehal / “take my place” | Preserve the instruction to take a place in the hall without assuming more than the throne context establishes. | English says to take “my place” in the great hall after hearing the throne rule; Korean makes the position the Master's seat (`주인 자리`), a plausible context-based reading but more specific. | Medium |
| 37100 | `You're standing in it.` | Retain the concise reveal and verify the antecedent of “it” from dialogue context. | All four locales preserve the short response; the object/location is not named in the isolated row. | Medium |

IDs 37051-37056, 37058-37059, 37062, 37065-37066, 37068, 37070-37071,
37073-37075, 37078-37081, 37083-37084, 37086-37087, 37089-37090,
37092, 37095-37096, and 37098 generally retain the English meaning on
this first reading. Names, lore, register, and institutional terminology
remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 37000-37199 was checked against
  this batch. Questions at 37057, 37061-37062, 37075, 37078-37080, 37082,
  37085, 37088, 37093-37094, and 37097 were compared directly with all
  four locale rows.
- ID 37097's +75% English/Chinese versus +70% Japanese conflict was
  confirmed; Korean follows English.
- Historical questions are evidence only and do not authorize CSV edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 37051-37100 once
  and in identical order.
- Embedded line-break counts match across all four locales, including the
  two blank breaks around the +75% stat at 37097.
- Detected runtime-marker identities/order match; `{1}` at ID 37072 is
  preserved. The 37097 value discrepancy is explicitly documented above.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 37051-37100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 37101.
