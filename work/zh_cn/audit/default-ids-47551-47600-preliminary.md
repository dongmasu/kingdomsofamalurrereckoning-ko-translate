# Preliminary Language Scan: `default` IDs 47551-47600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47551-47600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47551 | incomplete `{*3` marker | Preserve the intentionally incomplete marker exactly; do not “repair” it as a translation or CSV error. | English, Japanese, Chinese, and Korean all contain the standalone `{*3` fragment. The historical note explicitly identifies it as intentional and retained. | High |
| 47555 | Boggart / `브라운트` | Align the creature name with the established in-corpus Korean form, subject to terminology review. | This row uses `브라운트`, while numerous other active rows render Boggart as `보가트` (and a small number use `보기트`). The current form appears to be an isolated inconsistency; no CSV edit is authorized. | High |
| 47557 | knight hand / `기사 동료`; Airmer/Creth/Rhyderk | Verify the unusual `knight hand` relationship and canonical spellings while preserving that the pair returned the Flaming Sword. | Korean describes Creth as a knight companion, a plausible reading. The exact role/relationship and artifact/name forms remain open in the historical audit. | Medium |
| 47565 | Champion of Windemere / `윈더미어의 챔피언` | Confirm the title and retain that defeating Sir Elswin enables passage across the Weeping Gorge to the Maid's village and castle. | Korean preserves the action and destination sequence; the title and related proper names remain terminology candidates. | Medium |
| 47572 | Keepers of the Crossing / `크로싱의 수호자들` | Verify the faction/place name and whether `Crossing` should remain a named location. | Korean preserves the greeting and group identity with a literal name rendering; the historical log flags the formal name. | Medium |
| 47577 | Bitter Frost / Prismere chantries | Confirm the faction and sacred-structure terms while preserving the communication/preaching function and the weakening of Tuatha control. | Korean retains both functions of the chantries and the consequences of destroying them. `Bitter Frost`, `chantry`, and related names remain terminology candidates. | Medium |
| 47579 | Blood Rite / Red; two people in Gorhart | Verify whether `Red` is the speaker/name or a faction sign-off and preserve the two-break sign-off layout. | Korean retains the accusation, ancient sacrament, command to perform the Blood Rite, Gorhart location, and final `- 레드` sign-off. The identity of Red remains open. | Medium |
| 47588 | The Widow Loves / `위도우의 사랑` | Confirm whether this is a named title and whether the possessive wording is appropriate. | English capitalizes the phrase as a label; Korean renders it literally. The historical note flags the formal title. | Medium |
| 47591 | Fae Lands / `페이의 땅` | Check the established rendering of this named region against other corpus uses. | Korean preserves the plural lands concept; the historical notes identify the term for terminology review. | Medium |
| 47595 | Blackened Hall / Aisle of Flame / Buru's Boots | Verify the formal trial/place names and preserve the requirement to use the boots plus the warning that their enchantments may not last. | Korean retains the trap, item-bag source, and short-duration warning. English uses dash interruptions where Korean uses sentence breaks; names remain open. | Medium |
| 47596 | “Everyone will. I assure you.” / `모두 그럴 거야` | Retain the affirmative promise while leaving the missing object/referent unresolved. | The English fragment omits what everyone will do; Korean likewise leaves it implicit. The historical log flags this context gap. | Medium |
| 47600 | The Crossing / `크로싱`; Caer Elatha | Confirm the capitalized location name and reuse its established form. | Korean preserves the route from the deepest part of Caer Elatha and the Sun Amulet's access function. The historical log asks whether The Crossing is a formal place name. | Medium |

Other names in this range, including Nyralim, Tak Edstar, Ariel, Caeled
Coast, Tilera, Ayten, and Myrna, remain subject to corpus-wide terminology
reconciliation. Their current spellings were preserved.

IDs 47552-47554, 47556, 47558-47564, 47566-47571, 47573-47576,
47578, 47580-47587, 47589-47590, 47592-47594, and 47597-47599 generally
retain the English meaning on this first reading. Names, register, and
gameplay terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47550-47649. It flags
  `knight hand` and the Airmer/Creth/Rhyderk names (47557), Keepers of the
  Crossing, Bitter Frost, Blood Rite/Red, murghan, the Widow Loves label,
  Aisle of Flame/Blackened Hall/Buru's Boots, The Crossing/Caer Elatha, and
  the incomplete `{*3` marker.
- ID 47596's omitted referent is retained as an open context question; no
  antecedent was invented.
- The Boggart spelling difference at 47555 was checked against other active
  `default` rows. It is recorded as a preliminary consistency candidate,
  not applied as a global normalization.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47551-47600 once
  and in identical ascending order.
- ID 47551's standalone `{*3` fragment is identical in all four locales.
  ID 47579 preserves two embedded line breaks and the sign-off in all four.
- No other runtime markers, numeric gameplay values, or special hidden
  whitespace discrepancies were found.
- ID 47550's historical note about singular `crypt` versus plural halls was
  rechecked; its Korean text preserves the likely single-complex reading.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 47551-47600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47601.
