# Preliminary Language Scan: `default` IDs 17000-17049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 17000-17049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 17000 | chestpiece / mantle | Verify whether the mantle is a separate garment or an attached armor element. | Korean says the chestpiece has a loosely hanging cape and hidden pockets; the source describes a mantle attached to the armor. | Low |
| 17001 | Keep / Pledgeshields | Confirm the Keep's training/dispatch function and the formal rank/name for Pledgeshields. | Korean retains both the training and departure to Klurikon; faction terminology remains open. | Medium |
| 17003 | `Kollossae Peasant F` -> `콜로세 농민(여성)` | Determine whether this is an internal gendered actor label and whether `F` should be exposed/localized. | Korean renders the gender as “female”; this may be developer/test data rather than player-facing text. | High |
| 17005 | northern hero poem | Preserve the archaic heroic register, four-line structure, and any recoverable rhyme. | Korean retains the hero, kingdom, bards, and crowning; it does not recreate the end-rhyme. Japanese/Chinese also vary in line/rhyme handling. | Medium |
| 17011-17012 | Guardian card / Relentless Assault | Standardize the card/archetype and skill names while retaining `+20%` and `26 Health`. | Korean translates both names descriptively and preserves the health-steal values and two-line layout. | Medium |
| 17013 | Klurikon sickness | Preserve that an unspecified airborne factor affects only some people in their first days there. | Korean keeps the uncertainty and limited onset; no cause or disease is asserted. | Low |
| 17014 | `Flawless Mitharan Frosted Shaft` | Verify the item-quality/material compound and whether `Shaft` is a weapon component. | Korean renders “perfect Mitharan frosted shaft” as `완벽한 미타란 서리 자루`; the compound is terminology-dependent. | Medium |
| 17020 | “Spire fire higher tire crier dyer waters ‒ dead” | Preserve the disjointed/rhyming fragment without inventing a sentence meaning. | Korean renders a sequence of nouns/phrases with commas; the source's rhyme, punctuation, and several words are unclear. Japanese takes a more connected image. | High |
| 17024 | Penri Kell / Fae Ballad / antelope “trophies” | Clarify what trophies are and retain the four-animal requirement. | Korean says to kill four antelopes and take loot from the bodies, while English says “trophies”; Japanese specifies beheading and Chinese says loot. | High |
| 17026, 17030 | Freemen / Quarterlings | Verify whether these are named factions/people/statuses rather than generic terms. | Korean preserves both as group terms; `Quarterlings` is transliterated, while Freemen is translated descriptively. | Medium |
| 17031-17034 | Anokatos / Fateweavers / destiny | Preserve the succession and the speaker's failed effort to conquer destiny; align name/group terms. | Korean retains the acting-leader role and Fateweaver membership, with the Fate/destiny distinction left open. | Medium |
| 17036 | general's inspection / stains | Identify whether soldiers, equipment, or something else must be laid out for inspection. | Korean says to line up soldiers and leave no stain; the source's `them` lacks an antecedent in this row. | Medium |
| 17042 | “relieving myself” during ship sinking | Preserve the blunt comic confession without over-explaining it. | Korean's `볼일을 보고 있었어` is a euphemistic but natural rendering; all locales retain the comic reveal. | Low |
| 17046 | Benwick Athelm / Gravehal / Dead Kel | Verify names/location and do not carry the obvious English typos into Korean. | Korean gives a coherent rumor/retrieval quest; English contains apparent typos (`heard t a rumor hat`). | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 17001, 17003, 17005, 17011-17013,
  17020-17021, 17024, 17026, 17028, 17031-17034, 17036-17037, 17042, and
  17046 against the active four-locale rows. They remain open; no historical
  note authorizes a translation edit.
- Cross-batch terminology candidates include Keep/Pledgeshield, Kollossae,
  Guardian, Klurikon, Wreath of Absolution, Freemen/Quarterlings, Fateweavers,
  Winter Court, and Gravehal.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales, including the four-line poem at ID 17005,
  the two-line effect at ID 17012, and recipe/stat formatting. No structural
  exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 17000-17049 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 17050-17099.
