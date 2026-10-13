# Preliminary Language Scan: `default` IDs 24551-24600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 24551-24600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 24551 | Quay | Determine whether this is a named district or a generic dock; preserve the place-name if proper. | Korean translates it as `부두`; Japanese transliterates the name. Context is needed. | Medium |
| 24552 | Motus Mining | Standardize the company name and distinguish the company from a mine site. | Korean says `모투스 광산` (“Motus mine”), while English/Japanese/Chinese present an organization name. | High |
| 24556 | House of Valor / Victory Games | Align faction and tournament/event naming; preserve the criticism that the Games should be safe entertainment. | Korean retains both ideas as `용맹의 집` and `승리의 경기들`; compare with established forms elsewhere. | Medium |
| 24557 | The Maid | Verify the title/name and avoid an unintended generic “maid” reading. | Korean uses `시녀`; Japanese gives a named epithet, while English capitalization and Chinese “少女” suggest a specific figure. | High |
| 24558 | Cowl of the Maiden / Maire Ganan / Moon Camp | Standardize item, person, and faction/place forms. | Korean retains the competing thief and former affiliation; proper-name and item-name forms need corpus review. | Medium |
| 24560 | Templars / Scholars | Preserve the commissioning relationship and distinguish the scholars from the Templars. | Korean says the Templars assigned varied research topics to the scholars, consistent with the source sense; the English syntax is awkward. | Medium |
| 24562-24563 | Witchknight / The Slumber has Ended | Standardize the enemy title and determine whether Slumber is a named rite, state, or event. | Korean renders the title as `마녀기사` and the heading as `잠의 끝`; Japanese explicitly calls it a Slumber ritual. | High |
| 24565 | Glianal / balladeer / loremaster / Ysa | Verify name forms and distinguish balladeer from a lorekeeper role. | Korean uses `글리아날`, `발라드 가수`, and `이야기꾼`; several proper-name and role forms vary across locales. | Medium |
| 24567 | closeness with the gods | Preserve the claim of privilege and the duty to share that relationship with all Amalur. | Korean retains both the benefit and obligation without adding a specific religious doctrine. | Low |
| 24568 | war-front / opportunity | Preserve the sequence: the front had already arrived by the time they heard, yet the speaker smiled at the opportunity. | Korean retains the late realization and foolish optimism. | High |
| 24570-24571 | Warsworn / Hirelings | Standardize the faction title and determine whether Hirelings is a formal rank or ordinary mercenaries. | Korean uses `워스원` and `고용병`; Japanese calls them third-class mercenaries and Chinese uses mercenaries. | High |
| 24575 | repeated “You” stutter | Preserve the repetition and determine whether it signals fear, injury, or magical compulsion. | Korean retains four repetitions and “enemy of Fate”; Japanese stutters only the opening syllables. | Medium |
| 24578 | Gravehal Keep evacuation letter | Preserve the five-paragraph sequence, the Keep's feminine personification, ward, escape plan, and conflicted duty; review malformed source wording. | Korean retains all 26 embedded line breaks and the complete sequence. The English has awkward phrases including “nary of drop” and the final “when ere”; the feminine “her entrances” is neutralized in Korean. | High |
| 24580 | Ether / captured essence / charm | Confirm the game's metaphysical meaning of Ether and whether essence means soul, life-force, or another substance. | Korean retains the extraction, capture, and binding sequence; terminology is unresolved. | Medium |
| 24583 | Kollossae priest / wall decoration / shield | Verify the people-name and preserve that a meditation wall decoration is repurposed as a sturdy shield. | Korean retains both uses and the calming surface pattern; the source itself says “mediations,” likely a typo for “meditations.” | Medium |
| 24585 | “Steel for steel” / scrapper | Preserve the challenge and the speaker's former fighting ability without over-specifying boxing. | Korean keeps the reciprocal fight challenge and renders scrapper as `싸움꾼`; Chinese narrows it to a boxer. | Medium |
| 24589 | Anokatos' lash / Counsel | Determine whether Counsel is a person, council, or destination; preserve the time constraint while helping the victims. | Korean says `의회`, Japanese says adviser, and Chinese says strategist, indicating unresolved identity. | High |
| 24590 | Testament water supply / poisoning | Confirm Testament's identity and preserve the threat, poisoning, bodies, and revenge motive. | Korean retains the violent plan and revenge; the faction/institution identity remains open. | High |
| 24592 | “I owe them that much” | Clarify the referent and what the speaker owes, while retaining the low chance of return. | Korean preserves the low odds and debt framing; context is needed to identify “them” and the obligation. | Medium |
| 24594 | Barufakir / Naglfar seven-day diary | Standardize both ship names and review the seven entries as a connected narrative. | Korean preserves all seven day headings and all 26 embedded breaks. The Korean `나그플라르` form for Naglfar should be reconciled with recurring spelling. | High |
| 24597 | Chaos god armor | Verify the established deity title and preserve that the armor was made specifically to withstand its power. | Korean retains the protection purpose; `혼돈의 신` and armor terminology remain consistency candidates. | Medium |
| 24600 | Flawless Mitharan Infected Rivets | Confirm the item category and standard forms for Mitharan and Infected. | Korean renders the item as `완벽한 미타란 감염된 리벳`; its modifier order and equipment context merit terminology review. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 24551-24552, 24556-24558,
  24562-24563, 24565-24568, 24570-24571, 24575, 24578, 24580, 24583,
  24589-24590, 24594, and 24597 against active rows. The Quay/company
  distinction, House and Maid terms, Witchknight/Slumber, Glianal and war
  context, Warsworn/Hirelings, stutter, evacuation letter, Ether, Kollossae
  item, Counsel, Testament, diary, and armor remain preliminary candidates.
- Cross-checked recurring forms for Motus Mining, House of Valor, Victory
  Games, Maid, Moon Camp, Witchknight, Warsworn, Gravehal Keep, Scolia
  Arcana, Ether, Kollossae, Testament, Barufakir, Naglfar, and Mitharan.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 24551-24600 exactly
  once and in identical order.
- Embedded line-break counts match. ID 24578 has 26 breaks and ID 24594 has
  26 breaks in each locale.
- Runtime-token signatures match; no runtime marker was found in this range.
- Numeric content is retained. Japanese uses `1` and `3`, `2` digits in short
  text at IDs 24558 and 24562 where other locales use words; the seven diary
  day numbers are spelled out in Chinese and numeric in the other locales.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 24551-24600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
24601.
