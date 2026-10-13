# Preliminary Language Scan: `default` IDs 14350-14399

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 14350-14399.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 14350 | `Blacksmithing` -> `대장기술` | Align the skill name and repair/crafting terms with the project's UI glossary. | English/Japanese/Chinese describe repairing worn or damaged equipment and forging new gear. Korean preserves both actions; the exact skill name remains a historical question. | Medium |
| 14352 | Grim / Jottun / missing incident | Preserve the uncertainty about what happened to Grim and the request to investigate. | All sources say Grim should be able to handle Jottun and imply another event may have occurred; Korean retains the uncertainty. Historical question remains open. | Low |
| 14353 | `Destroy the Urns` -> `단지 파괴하기` | Verify whether the object is a general urn/pot and align the quest objective's term. | English and Japanese use urn/jar, Chinese says pottery urn, and Korean chooses `단지`. Historical question remains open. | Medium |
| 14355 | King / Court of Enchantments / the Maid | Clarify what the Maid took and align the capitalized Maid title with its recurring character reference. | English says the Maid “has taken them,” referring to the King and Court; Korean preserves the pronoun ambiguity but uses generic `시녀`. Historical question remains open. | High |
| 14358 | `Captain at Arms` -> `무기 담당 대장` | Determine whether this is a military rank or an officer in charge of weapons. | English is ambiguous; Japanese says squad leader and Chinese says weapons-department head. Korean combines a weapons role with a captain-like title. Historical question remains open. | High |
| 14360 | `Enemies in High Places` -> `고위층의 적들` | Confirm whether the phrase is an idiom for powerful enemies or a literal high-altitude location. | English, Japanese, and Korean support the “high-ranking people” idiom, while Chinese reads it as enemies at a high place. Historical question remains open. | Medium |
| 14361 | old god / Gallows End / “thicker than the heat” | Preserve the heat-versus-lies wordplay and align Gallows End's established Korean form. | Korean retains the old god's non-divinity and the “thicker” image; its place-name form is consistent with the project spelling. Historical question remains open. | Low |
| 14365 | `Unbound` -> `해방된 자들` | Align the capitalized faction/group name with the project glossary. | English capitalizes the group term; Korean includes the source form in parentheses. Historical question remains open. | Medium |
| 14366 | “Sure as the Elund's hat” | Verify Elund's name and whether this in-world oath should remain literal. | Korean preserves the image and uses it to express certainty; Japanese/Chinese paraphrase or omit the oath. Historical question remains open. | Medium |
| 14367 | tribute variable / `#NAMED_ICON_GOLD#` | Preserve both runtime markers byte-for-byte. | All four locales contain the same variable and named-icon marker in the same order. Historical question remains open. | Low |
| 14368 | `'calamity'` | Determine whether this is a disaster description or the name of a ship/object called Calamity. | English quotes the word; Japanese transliterates it as a ship name, while Chinese and Korean read it as “calamity/disaster.” Historical question remains open. | High |
| 14374 | Nuala Ignas / Aodh / Sun Stone / Savant Engar | Verify the names and item title, and align the Savant rank with other Korean occurrences. | Korean renders `Savant Engar` as `사반트 엔가르`, whereas the isolated address `Savant` at ID 14170 is `학자님`; English/Japanese/Chinese also differ on the title's specificity. Historical question remains open. | Medium |
| 14375 | 600 Fire / 85 Burning / 270 Mana | Preserve all values, target-area wording, and the line break. | English, Japanese, Chinese, and Korean agree on 600 fire damage, 85 burning damage, 270 mana, and one embedded line break. Historical question remains open. | Low |
| 14376 | Lord of Kandrian | Verify the region and title forms while retaining the inclusive promise of safety. | Korean preserves the commitment to everyone living in the land; the regional name remains a historical consistency question. | Medium |
| 14377 | Primos' Sanctum / mural | Determine whether Primos is a character, role, or named group and standardize Sanctum. | English/Japanese/Korean use Primos; Chinese interprets the name as a chief/leader. Korean's `성소` is plausible but provisional. Historical question remains open. | Medium |
| 14381 | `passed` / cloud around the mind | Confirm that “passed” means died and retain the mental-fog metaphor. | English, Chinese, and Korean connect the cloud's lifting to her death; Japanese makes the same reading explicit. Historical question remains open. | Low |
| 14382 | no cure or antidote | Preserve the resigned correction and clarify “Though it matters little.” | Korean says the situation is of little use/importance, while English says it matters little; the lack of an effective cure/antidote is clear across sources. Historical question remains open. | Medium |
| 14384 | slave pens / Counsel / Beckoned | Verify the location and institutional/role terms while retaining the time-sensitive route choice. | Korean preserves the warning that continuing may prevent reaching the Counsel in time; source locales use varying terms for the destination. Historical question remains open. | Medium |
| 14388 | Lady Oleyn | Align the character spelling and honorific with other occurrences. | Korean uses `올레인 부인(Lady Oleyn)`; source locales have different phonetic forms. Historical question remains open. | Medium |
| 14390 | bolgan / Castle Gastyr | Verify the creature/faction and place-name spellings and preserve the rebuilding plan. | Korean retains the occupation, ruined castle, and postwar rebuilding; the names remain provisional. Historical question remains open. | Medium |
| 14393 | Detyre / closed mine | Align the regional name and retain the speaker's doubt about the miner's account. | Korean preserves both the claimed job loss and the speaker's skepticism. Historical question remains open. | Low |
| 14398 | Myfa Rhonwen / envoy / Gallows End | Verify the character/place spellings and preserve the diplomatic role and prosperity goal. | Korean retains the tower-as-embassy proposal, Myfa as envoy, and the intended benefit to Gallows End. Historical question remains open. | Medium |
| 14399 | hammer damage / two-line item effect | Verify the established weapon-category term and preserve both bonuses and the line break. | English/Japanese/Chinese identify hammers or warhammers; Korean uses `망치`. All locales preserve the two effect lines. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 14350, 14352, 14355, 14358, 14360-14361,
  14365-14368, 14374-14377, 14381-14382, 14384, 14388, 14390, 14393, and
  14398 against the active Korean and all three source locales. They remain
  preliminary questions; no historical disposition was treated as approval.
- IDs 14367 and 14375 received explicit runtime-marker/value and line-break
  checks; all matched.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed embedded line-break counts match across the batch, including IDs
  14375 and 14399.
- Brace, dollar, and hash-token signatures match. The variable and icon marker
  at ID 14367 are present in the same order in all four locales.
- Active Korean CSV hash matches the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 14350-14399 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 14400-14449.
