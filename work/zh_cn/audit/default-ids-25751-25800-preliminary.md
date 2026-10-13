# Preliminary Language Scan: `default` IDs 25751-25800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25751-25800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25751-25758 | Giants / Light of Day / Plagueshield / Wystran Nol / Peace Edict / Augur | Verify names and title forms; preserve the political loophole and clarify `Light of Day` and `Plagueshield`. | Korean omits the separate “finding” step before slaying all Giants in the source question and renders Plagueshield as a protective medicine. `Light of Day` may be a title or literal phrase. | Medium |
| 25759-25767 | spare Jottun / Fate / health-and-damage effect / sky-raised city / `{1}` and `{2}` | Standardize fate/stat terms, preserve effect values and placeholders, and retain the Kollossae city's history. | The skill at 25764 retains 40% trigger chance below 25% Health, 20% Health restored, +40% damage for 10 seconds, and a 300-second cooldown. The roll message retains `{1}` before `{2}`. | High |
| 25768-25772 | Helm / magical paints / Tirnoch the Merciful | Verify labels and deity epithet; preserve the cure and wildfire imagery. | Korean keeps the cure metaphor and the threat to clear the land of the addressee's kind. | Medium |
| 25775-25780 | sticks / Hireling-to-Pledgeshield / Chrysalae / Boderill / Aodh / falling metaphor | Verify rank progression and names; preserve the “second Boderill” comparison and the realization about ground and sky. | Japanese describes Hireling/Pledgeshield as third- and second-class mercenary ranks, while Korean renders the first as `고용병` and the second literally as `서약방패`. | High |
| 25783-25790 | Alfar wreck-recovery ship / dustling / Templar Octienne / Niskaru / stone's dreaming murmurs | Standardize terms and names; clarify the stone's lore metaphor and the use of Chaos. | Korean retains the wreck-recovery background, the dustling insult, the new-Templar statement, and the waking-day/dreaming-stone contrast. | Medium |
| 25791-25799 | potion / Wencen's Love / House of Valor / House of Ballads / Hierophant / Fort Olghorn | Verify faction/location forms and preserve the update on the Hierophant's fall. | Korean retains the tournament closure/reopening context and the speaker's lack of affection or reverence for the Hierophant. | Medium |
| 25800 | Hammer weapon description | Preserve the damage/speed tradeoff and heavy-weapon category. | Korean keeps the slow-attack/high-damage comparison and crushing-blow sense. | Low |

## Historical Audit Reconciliation

- Rechecked the existing source-keyed questions for IDs 25750-25799 against
  all four locale rows. Terms and names for the Peace Edict, Hexes, Pledgeshield,
  Chrysalae, the stone, and the House of Valor remain candidates.
- Cross-checked recurring forms for Wystran Nol, Peace Edict, Augur, Jottun,
  Kollossae, Tirnoch, Hireling, Pledgeshield, Chrysalae, Boderill, Aodh,
  Alfar, dustling, Octienne, Niskaru, Wencen, House of Valor, House of
  Ballads, Hierophant, Fort Olghorn, and Hammer.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25751-25800 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales.
- Runtime-token signatures match, including `{1}` and `{2}` at ID 25766,
  `{LINE_BULLET}` and numeric values at ID 25764, and `#NAMED_ICON_ATTACK#`
  at ID 25787.
- The four effect lines at ID 25764 retain their sequence and values. No
  structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25751-25800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25801.
