# Preliminary Language Scan: `default` IDs 60901-60950

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 60901-60950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 60905 | `the heavens` / `하늘의 신들` | Confirm whether the source means gods specifically or a broader divine/heavenly power. | Korean specifies gods; Japanese also uses gods, but English says “the heavens” and Chinese says “上天.” The source-keyed audit notes this distinction. | Medium |
| 60914 | Ametair's Boots | Confirm whether “the Boots” names a specific item and preserve the stealth effect without implying more than undetectability. | Korean says the boots hide the wearer and allow an unseen/unheard approach and attack. English and Japanese describe the effect, but the item's formal-name status remains open. | Medium |
| 60915 | “we” as an answer to Summer Fae and their Court | Identify the group represented by “we” and retain the source's claim without adding an unsupported origin. | Korean says the group was “born” to oppose the Summer Fae and Court; English says it is “a thing of necessity” and an answer to them. Japanese/Chinese frame this as a counterpart/response. | Medium |
| 60917 | “We require aid” / `우리의 도움이 필요하오` | Recheck grammatical roles: the English group needs the player's aid, while Korean can read as “our aid is needed” by the player. | Japanese explicitly says the group needs help; Korean's wording reverses the likely giver/recipient. This is a high-confidence meaning-direction candidate, not an applied correction. | High |
| 60924 | `Oathblade` / `맹세의 칼` | Confirm whether this is a formal title, weapon, or organization/rank before fixing a literal Korean form. | English presents a standalone capitalized label; Korean translates it literally, while Japanese uses a mercenary-rank-like phrase and Chinese uses a vow-blade term. | Medium |
| 60925 | `Second Oath` / `두 번째 맹세` | Establish whether this is a formal title/term and keep its treatment consistent with `Oathblade`. | Korean translates the phrase; Japanese transliterates it and Chinese uses a literal “second oath.” The historical prompt leaves the formal sense open. | Medium |
| 60927 | `Tender` / `텐더` | Confirm whether Tender is a formal House role/rank and use the project's canonical Korean treatment. | English capitalizes the role; Korean transliterates it, while Japanese uses “guardian/protector.” The character's House affiliation is clear but the title's exact function is not. | Medium |
| 60931 | “venom of the chantries” / `예배당들의 독기` | Determine whether this is literal poison or metaphorical religious/cultural corruption. | Korean follows a literal poison image; English says venom is seeping into Klurikon's heart, while Japanese/Chinese also preserve poison imagery. The historical audit specifically leaves literal versus metaphorical sense open. | Medium |
| 60933 | `Final Words` / `마지막 말` | Check whether this is a section heading, a character's final utterance, or another label. | Korean translates the heading literally; Japanese identifies it as a note and Chinese as last words. The source-keyed audit says the UI/dialogue context is needed. | Medium |
| 60935 | “I will send them” / `그들을 보내겠다` | Preserve the ambiguity about where or to whom the people will be sent; resolve only with quest context. | English does not state a destination, and Korean also leaves it unstated. Do not infer a missing object/destination from the neighboring promise to find them. | Medium |
| 60941 | Relentless Assault / `끈질긴 맹공` | Verify the skill term against the glossary while preserving the 30-second duration, armor effect, 50 Mana cost, and line break. | Korean retains all explicit mechanics and formatting; the remaining question is the exact skill-name convention. | Medium |
| 60945 | “area is favored by our enemies” / `적들이 장악하고 있지` | Check whether Korean `장악` overstates enemy control/occupation compared with the source's “favored by” phrasing. | English only says the area is favored by enemies; Korean says they control it. Japanese says it is the enemy's favorite area, while Chinese is also close to “favored.” | Medium |
| 60946 | `House of Pride` / `긍지의 집` | Confirm whether this is a formal House name and align it with established faction-name treatment. | Korean translates the name literally; the historical audit asks whether it is formal. Avoid global normalization before terminology review. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register, including the crop/business complaint, the storage
of wind, the 30-second/50-Mana skill description, and the wolf-in-the-home
metaphor. Provisional names and terms include Florion, House of Valor,
Apotyre, Tuatha, Warsworn, Mithros, Ametair, Summer Fae, Summer Court,
Logan Darrow, Saturnyn, the Crows, Cadoroc, Mitharu, Klurikon, Rathir,
Hospitalis Quarters, Crinneus, Herc Adwold, House of Pride, and
Sagecraft. Existing Korean bilingual-name formatting is retained as found;
this pass does not impose a global parenthetical-name rule.

## Historical Audit Reconciliation

- Rechecked the applicable prompts in the archived source-keyed range
  `60850-60949`: the `heavens` distinction (60905), Ametair's Boots and
  Summer Fae group (60914-60917), Oathblade/Second Oath/Tender
  (60924-60927), chantry “venom” (60931), the “send them” destination
  (60935), Hospitalis Quarters (60937), Relentless Assault (60941),
  enemy-favored area (60945), and House of Pride (60946).
- These remain unresolved historical questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 60901-60950 once
  and in identical ascending order.
- Embedded newline counts match throughout the batch.
- Runtime-token sequences match; no marker exception was found.
- ID 60941 retains the 30-second duration, 50 Mana cost, armor mechanic,
  and source line break.
- No translation CSV edit was made.

## Batch Status

IDs 60901-60950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 60951.
