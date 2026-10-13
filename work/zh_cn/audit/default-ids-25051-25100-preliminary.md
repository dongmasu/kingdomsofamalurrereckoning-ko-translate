# Preliminary Language Scan: `default` IDs 25051-25100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25051-25100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25051 | `$TRSQ01.bribe_value$ Gold` | Preserve the exact substitution variable, its position, and the bribery-cost meaning. | All four locales retain the same variable and gold label; the amount remains runtime-supplied. | High |
| 25055-25057 | Mitharan item terms / charged ability values | Standardize equipment terminology and verify the two-stage charge wording while retaining all health and mana percentages. | Korean preserves 20%, 60%, 10%, 30%, and up-to-20% values. The two-line ability description retains its break; English has the typo “upto.” | High |
| 25058 | Bristletongue / Font / Jakasen | Confirm the plant/material and the setting-specific meaning of Font; standardize the apothecary's name. | Korean retains the Fae's control, the water-source relation, and the request to Jakasen; the locale plant and place terms vary. | Medium |
| 25060-25064 | madness / Solstice / Doctor Skull / “your grace” | Verify the Solstice's setting-specific name and keep the respectful address consistent with established honorifics. | Korean uses `하지` for Solstice and `전하` for “your grace”; Japanese transliterates Solstice and Chinese uses a generic “solstice” term. | Medium |
| 25065 | `Helm`, product title, `Special Deliveries`, `{*1...}`, `{LINE_SPACE}` | Preserve all four markup wrappers and the line-space marker; verify whether the unlocked item and chest labels should be localized consistently. | Every locale has the same wrapper count/order and marker placement. EN links `Special Deliveries` before the game title in the second sentence, while JA/ZH/KO place the game title before the delivery-chest label; Korean leaves `Special Deliveries` in English. | High |
| 25066-25067 | Examine Lore / “Yours. Alyn Shir.” | Confirm the intended UI action for “Examine Lore” and the letter's clipped sign-off punctuation/register. | Korean uses `설화 살펴보기` and preserves the brief Alyn Shir signature as `그대의, 앨린 시어`; exact UI and letter context is absent. | Medium |
| 25069-25070 | Alabastra / Brogan Adair / troops moving through the gate | Standardize names and preserve the conditional timing: other troops move once the gate opens. | Korean keeps both the immediate aid and the later movement condition. | Medium |
| 25071 | broken “respo... respons...” denial | Preserve the interrupted self-correction and final uncertainty without completing the thought. | EN/JA/ZH/KO all retain a broken speech sequence; the precise stutter differs by language but the hesitation and reversal remain. | High |
| 25077 | Sinsear / “the House” | Verify the identity of “the House” and preserve the choice between two companions. | Korean resolves the destination as the House of Sorrows, while English only says “the House”; Japanese is less specific and Chinese says family/house. | High |
| 25078-25079 | Erathi Ruin / Piercing Light / General Tilera | Preserve the ruin-versus-rune distinction and the recovery/repulsion sequence; standardize names and weapon title. | English/Japanese/Korean identify a ruin at 25078; Chinese says Erathi runes. Korean retains that Tilera retrieved the weapon and drove off the Niskaru. | High |
| 25081-25083 | “one of the blessed” / “they” / Fateweavers | Resolve the speaker and plural-pronoun referents in context; preserve the claim about Fateweavers accepting limits to understanding. | Korean renders one person as blessed and keeps “they” plural; the antecedent is not recoverable from this row alone. The English source has a number-agreement error (“reason ... were”), which Korean reflects as plural “reasons.” | Medium |
| 25085 | “thieving these woods” / curses | Confirm whether the speaker means stealing in the woods or stealing wood, and preserve the claimed familiarity with curses. | Korean reads it as having spent months thieving in the forest; Chinese explicitly interprets it as stealing timber, while English/Japanese leave the object less explicit. | High |
| 25090 | Alchemy Workbench recipe | Preserve all reagent names, quantities, and blank-line layout. | All locales list Black Cohosh (2) and Embereyes (1); the two-line break pattern and values match. | High |
| 25094-25095 | Octienne / vanished well / Strange Prisoner | Standardize the name and preserve the observation-to-return sequence without adding a cause beyond the Sprite's death. | Korean retains that the well seems to vanish when the Sprite dies and that the narrator should report back. | Medium |
| 25096-25098 | Teeth of Naros / Primos / +12% Critical Hit chance | Standardize DLC/faction and ability terminology; preserve the command, deferred revelation, and exact stat value. | Korean retains the destination, Primos objective, and `+12%`; Japanese/Chinese use localized or descriptive variants for Primos. | Medium |
| 25099-25100 | “rusty” / “hold my own” / waiting | Preserve the figurative confidence and the direct challenge without over-literalizing “rusty.” | Korean keeps the bodily-metaphor sense and the speaker's ability to compete; all locales retain the short question at 25100. | Low |

## Historical Audit Reconciliation

- No prior open-question row was found for IDs 25051-25099; the historical
  log's next indexed block begins at 25100 and covers IDs 25100-25149.
  Rechecked related terms and the current lines for Alyn Shir, the Font,
  Mitharan, Fateweavers, the House, Erathi, Piercing Light, Alabastra, and
  Teeth of Naros. The candidates above remain open and preliminary.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25051-25100 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales. The ability
  description at ID 25057 retains one break; the potion recipe at ID 25090
  retains its two-line blank separation and final ingredient break.
- Runtime-token signatures match, including `$TRSQ01.bribe_value$` at
  ID 25051. At ID 25065, all locales retain four `{*1...}` wrappers and one
  `{LINE_SPACE}` marker in the same structural order; localized wrapper
  contents and the placement of linked phrases differ as noted above.
- Quantities and event order are retained. The row 25065 linked-content
  ordering is a localized markup/content-order exception, not a missing
  wrapper or control marker.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25051-25100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25101.
