# Preliminary Language Scan: `default` IDs 28051-28100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 28051-28100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 28051-28055, 28057-28061, 28063-28067, 28071-28072, 28075, 28078, 28083-28087, 28089, 28091-28096, 28099-28100 | Tutorial, dialogue, terms, names, and objectives | Recheck terminology, register, and the source context in the integrated pass. | Korean generally follows the English meaning and preserves the control marker at 28051 and the gameplay values at 28054/28086. Recurring Fae, faction, and proper-name forms remain glossary candidates. | Medium |
| 28056 | `주변을 정리해` for “Clear the area.” | Determine whether this is an order to evacuate/clear people or to tidy/clear physical objects; avoid locking in the wrong action without context. | English is context-free. Chinese reads “evacuate the crowd,” Japanese says “keep away,” while Korean can mean clean up or organize the area. | Low |
| 28058, 28062, 28066, 28068, 28070, 28073-28077, 28079-28082, 28088, 28090, 28096-28098 | Hireling / Testament / Savant / Midden / Jottun armor / Gwynedds and scavs / Sparrows / Widow / Irminsul and Aesir Dannin / Garaner / wage-rent shirt / journal / harvest metaphor / Sagecraft / Kandrian High Lords / Weeping King and Esharra / Preordained | Align roles, factions, item/effect terms, and mythic names with related rows; retain the historical context questions. | Korean preserves the named people and lore relationships. The source-keyed audit specifically groups these terms, and the corpus has known variation in their Korean forms. | Medium |
| 28068 | `미든(The Midden)` / Venris “perished” | Preserve the source's uncertainty about how Venris died. | English says Venris “perished”; Korean says he died, without specifying a cause. Chinese says he was murdered, while Japanese says he disappeared. Korean follows the less specific English source. | Medium |
| 28073 | Gwynedds / deadly scavs | Confirm whether `the Gwynedds` is a couple/family and standardize the creature term `scav`. | English uses plural family-name form; Korean calls them a couple and retains `scav` phonetically. Japanese also reads them as a couple; Chinese does not resolve the relationship. | Medium |
| 28082 | Warrior who saved Aedran Tyr / “He will probably want to read this.” | Clarify whether “he” refers to Aedran or the unnamed warrior; preserve the tentative ownership of the journal. | English says the journal “might belong” to the warrior, then says “He” will want to read it. Korean keeps the ownership tentative but leaves the pronoun unresolved; Japanese identifies Aedran as the likely reader. | Low |
| 28097 | `where the House of Sorrows is located` for “where the Sorrows are housed” | Confirm whether `the Sorrows` means the House/faction, a magical force, or another entity before making the location relationship explicit. | English says the Sorrows are housed at Esharra; Japanese describes a sorrowful force/power and Chinese uses a “home of Sorrows” reading. Korean makes it the House of Sorrows, an interpretive choice also implicated in earlier terminology questions. | Medium |
| 28100 | Beckoned / “light of the gods” | Preserve the title and the speaker's reverent greeting; reconcile with the recurring Beckoned form. | Korean conveys the addressee's arrival and the dark-hall image. The historical range beginning at 28100 includes Beckoned and other Fate/title forms. | Medium |

## Historical Audit Reconciliation

- The 28000-28099 source-keyed inventory flags Akara essence, Deda/Nanne,
  Hireling, Sweetspot, Testament, Savant, Venris/Midden, hunters, Jottun
  armor, Gwynedds/scavs, Sparrows, the Widow's knowledge, Irminsul/Aesir
  Dannin, Garaner, the wage-rent shirt, journal, harvest metaphor,
  Sagecraft, Kandrian High Lords, Weeping King/Esharra, and Preordained
  poachers.
- The next historical range starts at 28100 and includes Beckoned and
  recurring race/faction/title terminology. Historical notes remain
  unresolved inputs, not approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 28051-28100 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales.
- The Shift control marker at 28051 remains wrapped and in source order.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 28051-28100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28101.

## Correction Note (2026-10-10)

The preliminary `Other Checks` statement about gameplay values at IDs 28054
and 28086 was incorrect. ID 28054 is the `Melee Damage Reduction` label,
and ID 28086 is the gate question “Can you open the gate yet?” Neither row
contains a numeric gameplay value. The Shift control marker at ID 28051
remains preserved.
