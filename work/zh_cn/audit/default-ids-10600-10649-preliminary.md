# Preliminary Language Scan: `default` IDs 10600-10649

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10600-10649.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10601 | `Maid of Windemere's kingdom` / Summer Court | Confirm the Maid's title and retain the speaker's claim that they thwarted her political ambition. | English contains the typo `my the infiltration`; Korean renders the Maid as `시녀` and the Summer Court as `여름 궁정`. Similar corpus references treat Maid of Windemere as a named figure/title; align its form without removing the speaker's boast. | Medium |
| 10602 | `it` / weakens but rarely kills | Keep the condition being discussed unspecified. | The English and Korean both preserve the missing antecedent and distinguish weakening from usually not killing. | Medium |
| 10607 | bag of winds / Watcher / Hierophant's Court | Verify the named item and align the Watcher and Hierophant title with recurring UI/lore terms. | Korean conveys stealing the wind bag to pass the stone sentry and follows the English relation between the Watcher and the Hierophant's Court. | Medium |
| 10608 | `{*1secondary}` / `{1}` | Confirm the official UI term for the secondary weapon. | Korean uses `보조 무기`; both marker classes and their order are retained. | Medium |
| 10609 | St. Hadwyn's Undying Mission / Brother Fallon / Brother Udo | Verify the institution's canonical name and clarify whether the beads are returned only if Fallon is dead or otherwise missing. | Korean preserves the search request and the conditional “if the worst has happened”; the institution and honorifics remain transliteration/terminology questions. | Medium |
| 10614 | Thresh / Root Golem / Revival | Align the creature name and determine whether Revival denotes a settlement or region. | Korean renders `Thresh` as `스레시` and Revival as `리바이벌`; the latter also appears elsewhere as `부활촌(Revival)`. | Medium |
| 10616 | `Alfar lore` / shadowy wood | Preserve the choking-lore metaphor while confirming whether lore means history, magic, or cultural influence. | Korean uses `알파르 전승`, a plausible reading that does not settle the exact mechanism. | Medium |
| 10622 | `A Viper For All Seasons` → `사계절의 독사` | Confirm whether this is a title and whether it intentionally echoes “a viper for all seasons.” | Korean preserves the “all seasons” wording; the item's resource type and pun remain unknown. | Medium |
| 10625 | `the Widow` → `과부` | Determine whether Widow is a named character/title or a generic widow, and align with other active spellings. | The Korean noun makes the figure generic, while other corpus entries use `위도우(Widow)` and `과부(The Widow)`. | High |
| 10627 | Softscrabble / Leechwood / Scarwood | Verify ingredient names and established Korean spellings; preserve quantities and recipe layout. | Korean retains 3/3/1 and all four source line breaks. Transliteration and glossary alignment remain open. | Medium |
| 10634 | Saturnyn / `a millennium of sorrows` | Clarify whether the sorrows are an abstract emotional force or a named/literal power. | Korean renders them as `천년의 비탄`; Chinese treats the Sorrows more concretely. Both retain the morale-breaking and rout effect, but the ontology remains uncertain. | Medium |
| 10639 | Astor Colliane / Fridi Edstar / dagger | Verify both names and the retrieval/return condition. | Korean follows the English: Astor returns to Seawatch if the dagger held by Fridi is recovered. Chinese likewise identifies Fridi as the holder; no ownership change is indicated. | Medium |
| 10641 | Erathi artifact / Gabriel | Confirm the established form of `Erathi` and whether Gabriel is a historical proper name. | Korean preserves the artifact's ancient provenance and Gabriel attribution without adding detail. | Low |
| 10643 | `#NAMED_ICON_SKILL_BLACKSMITH#` | Preserve the UI icon token exactly; its display context remains unknown. | The marker is unchanged across locales and active Korean. | High |
| 10644 | `+2 Dispelling` → `해제 +2` | Confirm the established Korean UI name for Dispelling. | The numeric modifier is preserved; the label needs terminology review. | Medium |
| 10645 | Longsword damage modifiers | Preserve both values and the distinction between physical damage and general damage. | Korean retains +4 physical damage, +5% damage, and the source's one embedded line break. | High |
| 10647 | `Equip Spell 1` → `주문 1 장착` | Confirm the standard Korean wording for the spell-slot command. | The short UI label is understandable; consistency with other equip-slot labels remains to be checked. | Low |
| 10648 | “useful public service” / extra cash | Retain the speaker's defensive justification and mildly comic register. | Korean preserves both the public-service claim and the wish to earn extra money. | Low |
| 10649 | prison insult | Keep the pointed, casual question without adding a harsher accusation. | Korean directly asks whether the addressee learned to fight in prison, matching the English and Japanese. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 10601-10602, 10607-10609,
  10614, 10616, 10622, 10625, 10627, 10634, 10639, 10641, and 10643.
- Compared `Maid`, `Widow`, `Revival`, and the Great Cycle terminology
  against other active rows. The inconsistent forms remain audit findings,
  not approved global corrections.
- No translation change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- CSV-record line-break counts and normalized runtime-marker classes/order
  match across the four locales. ID 10627 retains four line breaks; ID
  10645 retains one.
- Recipe quantities at ID 10627 and combat modifiers at ID 10645 are
  retained. The blacksmith icon token at ID 10643 is unchanged.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10600-10649 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 10650-10699.
