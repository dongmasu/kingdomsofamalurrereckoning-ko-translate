# Preliminary Language Scan: `default` IDs 46951-47000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46951-47000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46951 | Needs a Status / `상태 효과 필요` | Determine what “status” denotes in this gameplay/UI context and retain it without inventing a specific effect. | Korean makes the status read as a status effect; English leaves the required status unspecified. The historical log explicitly asks which status is required. | Medium |
| 46952 | them / `그들이` | Preserve the unresolved plural referent rather than guessing who or what must be held longer. | Korean retains the pronoun and the request for help; English, Japanese, and Chinese do not identify its antecedent in this row. | Medium |
| 46955 | follow the saga / `이야기가 어떻게 흘러가는지 지켜볼래` | Confirm whether `saga` is an established lore/story term or simply the unfolding story, while keeping the speaker's reluctance to act. | Korean naturally conveys passive interest in how events unfold. Japanese reads more specifically as listening to a heroic tale; the exact sense needs scene context. | Medium |
| 46958 | Faeblade bonuses / `+6`, `+25%` | Preserve the two separate effects and verify the Korean UI term for Faeblades. | All locales retain +6 Physical Damage and +25% Damage on separate lines; Korean keeps both values and the weapon association. | High |
| 46961 | “puts a man off his ale” / `술맛 떨어지게` | Keep the disparaging joke that the lover's preference for dances and plays over thievery spoils the speaker's drink. | Korean idiomatically retains the complaint and the ale-related punch line; no literal alcohol wording is required for the meaning. | Medium |
| 46963 | Dren invulnerability / Ventrinio workaround / Alabastra | Preserve Dren's invulnerability, the proposed way past him, the prior successful infiltration, and why an entire army cannot use that approach. | Korean retains the workaround and tactical limitation. Names and the precise mechanism remain unresolved in the historical notes. | High |
| 46966 | Cthongeny: Phoebas / `크톤게니: 포이바스` | Verify the creature/type and proper-name spellings without adopting another locale's apparent species interpretation. | Korean transliterates both source terms; Chinese translates Cthongeny as a high titan, while English/Japanese retain phonetic forms. | Medium |
| 46968 | “give me a reason to” / `그럴 이유를 주지 않을` | Keep the deliberately omitted target/action unresolved until adjacent dialogue establishes what reason is meant. | Korean preserves the ellipsis of context rather than adding a verb; the historical audit explicitly flags the implied target/reason. | Medium |
| 46969 | Gavroche Valle / Efyr Dynnwel / Haldebier's Blade | Preserve that a masterless apprentice had a broken sword he could mend, and that the Hermit Smith arrives and begins repairs; verify the names and item. | Korean retains the broken sword, prayer, smith's arrival at Ironfast Keep, and repair work. The proper-name forms are provisional; no event or repair action is omitted. | Medium |
| 46972 | The Maid / minions / `시녀의 부하들` | Confirm `Maid` as the named figure/title and retain the warning that her forces are present in strength. | Korean preserves the advance imperative and numerous minions; the capitalized source title and historical references warrant a terminology check. | Medium |
| 46974 | bribe-cost variable | Preserve `$KV05.bribe_cost$` exactly and in context as the gold amount offered to ask. | All locales retain the exact variable identifier; Korean also retains the gold label and bribery/asking intent. | High |
| 46975 | The Gnome Brigade / `노움 여단` | Verify whether this is a formal organization and standardize the race/faction form. | The isolated label is translated literally; the historical audit lists the group name as unresolved. | Medium |
| 46981 | blazing Summer / brooding Winter | Preserve the paired seasonal/Fae identities, mutual pursuit, and unchanging balance. | Korean retains the personified contrast and “no more, no less” conclusion; official forms for the paired Courts remain a terminology question. | Medium |
| 46983 | Blink / Block Dodge | Confirm that `Block Dodge` is a named ability and use a consistent gameplay term while preserving replacement behavior. | Korean says Blink unlocks and replaces `막기 회피`; Chinese and Japanese also use locale-specific ability descriptions, so the intended mechanic cannot be fixed from this row alone. | Medium |
| 46986 | The Beckoned / `초대받은 자`, deliverer | Verify the established title and preserve the repeated claim that the Beckoned speaks for the gods and acts as their messenger/conduit. | Korean retains the emphatic repetition and all three roles. `구원자` is a plausible contextual reading of deliverer, but the title and role remain lore questions. | Medium |
| 46991 | Florian / collections / `모금함의 돈` | Confirm whether `collections` means donations/contributions rather than collected objects. | Korean supplies the donation-box reading. The historical log connects this line to the “collections box” at 47010, where surrounding context supports but does not conclusively prove the donation interpretation. | Medium |
| 46992 | the Cycle / `대순환` | Verify that this is the named Great Cycle and preserve the imperative sacrifice metaphor. | Korean retains feeding/nourishing the Cycle; capitalization and the recurring lore term support treating it as a name, but the canonical Korean label is not settled here. | Medium |
| 46995 | Kollossae / `콜로사이` | Align the people-name with the project glossary without silently normalizing it in this preliminary pass. | Korean uses one of several active spellings inventoried in earlier reports; the single-word row does not determine the canonical form. | Medium |
| 46996 | requests / `청원` | Check whether requests means petitions, jobs, or requests for help, while preserving the speaker's refusal to hear any more. | Korean selects the formal “petition” sense. Japanese uses a general favor/request term; context is needed to choose a UI-specific label. | Medium |
| 46998 | cistern / Tomb of Fyragnos | Preserve that the group's water flows from a nearby cistern and that the route to it passes through the tomb before meeting at the ruins. | Korean retains the source, route, tomb, and meeting point. The tomb spelling and the group's antecedent remain contextual questions. | Medium |

IDs 46953-46954, 46956-46957, 46959-46960, 46962,
46964-46965, 46967, 46970-46971, 46973, 46976-46980,
46982, 46984-46990, 46993-46994, 46997, and 46999-47000 generally
retain the English meaning on this first reading. Proper names, faction
terms, and gameplay/UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46950-47049. It
  specifically asks about the status at 46951, the referent of `them` at
  46952, the implied reason at 46968, The Maid, Block Dodge, the Cycle,
  Kollossae, and the collection/donation context linking 46991 with 47010.
- The entry also flags the Dren/Ventrinio/Alabastra sequence, the
  Cthongeny/Phoebas and Haldebier's Blade names, and the Gnome Brigade.
- IDs 46958 and 46974 retain the two combat values and exact
  `$KV05.bribe_cost$` token respectively. No historical candidate was
  treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46951-47000 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 46958 retains
  its two-line layout and +6/+25% values; ID 46974 retains the exact
  bribe-cost token.
- No material numeric-value, special-whitespace, or runtime-token
  discrepancy was found.
- Name, faction, and bilingual-parenthetical conventions remain
  inconsistent across occurrences; this batch authorizes no global changes.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 46951-47000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47001.
