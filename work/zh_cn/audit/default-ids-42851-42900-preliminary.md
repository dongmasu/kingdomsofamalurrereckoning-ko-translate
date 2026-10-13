# Preliminary Language Scan: `default` IDs 42851-42900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 42851-42900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 42851 | Minor Alchemist's Art Potion / `하급 연금술사의 기술 물약` | Confirm whether `Minor` is a potion tier and standardize the item name, recipient, and location spellings. | English/Japanese identify a Minor version of the Alchemist's Art Potion; Chinese shortens it to a small alchemist potion. Korean retains the tier and “art/skill” reading. | Medium |
| 42857 | Hierophant / Rithen / `대사제`, `리든` | Standardize the leader title and Rithen place/name form. | Korean retains the dispatch instruction; Japanese says the party is going under the guide's orders. Historical notes leave Hierophant's exact role/title open. | Medium |
| 42859 | Victory Games / Power-Up / `승리의 경기`, `파워업` | Confirm the official event name and UI term for the selectable Power-Up advantage. | The player receives a right to choose an advantage in the next round; locales translate or retain the two labels differently. | Medium |
| 42863 | Seasteel / crates / `시스틸` | Standardize the material name and preserve the distinction between the metal and its storage crates. | Korean transliterates Seasteel; all sources retain that it is usually found on coasts and map locations will be marked. | Medium |
| 42866 | four cardinal directions / Hreid's crew / `네 개 방위`, `흐레이드` | Confirm the canonical name and preserve the lever/knob mechanism and sequence clue without implying an additional step. | Korean retains the locked lever, base knob, four directions, and bodies-as-clue relation. Japanese writes the count explicitly as `4`; the other locales spell it out. | Medium |
| 42869 | Consistorium / `콘시스토리움` | Confirm whether this is the formal name of an institution and use its established Korean form. | English names the Consistorium in Adessa; Chinese reads it as an alliance, while Japanese describes a council chamber. | Medium |
| 42870 | Scholia / Wyvyrn-Gifre / `스콜리아`, `와이번-기프르` | Standardize the institution and compound place/house name. | English calls Scholia an institution; Japanese calls it a university and identifies Wyvyrn-Gifre as a house/family. Korean follows English while preserving the hyphenated name. | Medium |
| 42874 | ranks stretch thin / `병력은 줄어들고 있다` | Check whether this means the forces are spread too thin/understaffed rather than that troop numbers are actively decreasing. | English contrasts filling coffers with stretched-thin ranks; Japanese says the army is overextended, while Korean says the troop count is falling. | High |
| 42879 | Korrinna letter / living with Jottun / `조툰들과 함께 살 때` | Preserve the first-person longing and the explicit invitation while standardizing Jottun spelling. | Korean retains the plan to live with the Jottun and asks Korrinna to join; all locales preserve the relationship and appeal. | Medium |
| 42881 | purse / Sanctuary / `돈주머니`, `성소` | Confirm whether the destination is a religious sanctuary, church, or named location. | English/Chinese say Sanctuary; Japanese interprets it as a church and Korean uses the generic sacred-site term. | Medium |
| 42882 | Alfar / ravens / hanged soldiers / fear poem | Review the four-line riddle/poem and preserve its images without resolving its questions. | Korean retains all four lines, raven food, soldiers hanging “like tears,” and Tuatha craving fear; the exact image in line three remains unusual. | Medium |
| 42887 | song in our canon / “The Hero and the Maid” / `우리 전승` | Confirm whether `canon` means the setting's accepted lore corpus or a formal song collection. | Korean reads it as tradition/lore; other locales use a canon/collection sense. The warning that changing the story puts everyone at risk is retained. | Medium |
| 42889 | intimate with the ways of magic / waning current / `마법에 익숙한`, `약해지는 마력의 흐름` | Preserve the familiarity and weakening-flow imagery, and verify the honorific `your grace`. | Korean describes those familiar with magic sensing its waning flow and addresses the listener as `전하`; Chinese mistranslates the current as a literal flow/quantity. | Medium |
| 42894 | Gems added, gems removed / `보석 장착과 제거` | Confirm whether this is a gem-service/UI label or a statement of completed actions. | Korean creates a concise nominal UI label; Japanese instead says the speaker handles gems. Context is absent in the row. | Medium |
| 42895 | malformed `I've that to be grateful for` / `그 점은 감사해야겠지` | Treat the English as a likely grammatical error and avoid inventing a missing noun or referent. | Korean produces a coherent “I should be grateful for that” reading; Japanese/Chinese also normalize the awkward source. | Medium |
| 42897 | SpellAmmoSlow / `주문 탄약(저속)` | Determine whether this is an internal/test identifier or player-facing status label. | The English camel-case label looks like an implementation string; Korean translates it literally. No context in the row confirms its display role. | Medium |
| 42898, 42900 | great Houses / House of Valor / `위대한 하우스`, `용맹의 하우스` | Standardize named House terminology and distinguish generic “House” from the formal faction. | Korean translates Valor but retains “House”; the earlier House of Ballads/Sorrows forms retain the English-derived label. | Medium |
| 42899 | Maid of Windemere / `윈더미어의 시녀` | Confirm the formal title/name rendering and align it with other Maid of Windemere references. | Korean uses the generic “maid” form; Japanese uses a more heroic/warrior-like title and Chinese uses “maiden.” | Medium |

IDs 42852-42856, 42858, 42860-42862, 42864-42865, 42867-42868, 42871-42873,
42875-42878, 42880, 42883-42886, 42888, 42890-42893, and 42896 generally
retain the English meaning on this first reading. Proper names, register,
and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The archived source-keyed `open-questions.md` contains no ID-specific
  entries for 42851-42900. This span falls within the previously documented
  historical coverage gap 42850-42949; this batch was therefore checked
  against general terminology and adjacent historical notes, not treated as
  previously reconciled.
- Adjacent historical questions flag Hierophant, names/factions, and the
  House terminology; those issues remain candidates rather than approvals.
- No unrecorded historical finding was inferred for this batch.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 42851-42900 once
  and in identical ascending order.
- Embedded line-break counts, normalized runtime marker IDs/order, and
  numeric-token sequences match.
- ID 42866's four cardinal directions and ID 42887's single most important
  song are written as explicit digits in Japanese (`4`, `1`); the other
  locales express equivalent quantities in words.
- The four-line poem at 42882 retains all three embedded line breaks.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 42851-42900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 42901.
