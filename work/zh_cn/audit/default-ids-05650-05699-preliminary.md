# Preliminary Language Scan: `default` IDs 5650-5699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 5650-5699.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 5655 | `Activity - Carcass` → `활동 - 사체` | Confirm whether this is a generic category or an action such as harvesting/butchering a carcass. | Japanese and Chinese suggest an action; Korean follows the English label literally. UI context is needed. | Medium |
| 5657 | Goyen Reen / Church of the Unbound | Preserve the deduction as probable rather than confirmed and standardize the faction/church name. | English says “I can deduce”; Korean uses `것 같아`, retaining that inference. | Medium |
| 5658 | `Faer Gorta` | Verify canonical creature spelling and whether “sneak past” implies avoiding detection. | English/Japanese refer to the creature; Chinese substitutes a generic skeleton. Korean retains the proper name and stealth objective. | Medium |
| 5661 | `Wrath` / `Impulse` | Confirm ability/category terms; preserve 80 Physical Damage, 660 final-hit damage, 170 Mana, and +10 per Impulse. | All versions retain the same values and two-line effect. Korean has `격노(Wrath)` / `파동`; names remain glossary-dependent. | Medium |
| 5662 | corpses from Mel Senshir | Retain the speaker's loss of desire to fight and the westbound carts; avoid implying all corpses came from Mel Senshir. | English says “some” corpses came from there. Korean preserves that qualifier and the lasting loss of motivation. | High |
| 5665 | `raise us up` / Mairu | Clarify whether the gods sought to elevate the Mairu socially, physically, or into a different state of being. | English is metaphorical; Korean chooses “make us higher beings.” Japanese is less specific and Chinese also describes being raised. | Medium |
| 5668 | `House Oratory` | Confirm the location's identity; do not import House of Ballads unless another source establishes it. | English says `House Oratory`; Japanese specifically adds a House of Ballads prayer hall, absent from English. Korean follows the English name provisionally. | Medium |
| 5670 | “make history” / gamblers | Preserve the boast and the effect on gamblers; keep the casual arena voice. | All sources say winning the next match will make history and upset gamblers. Korean conveys both, though “그동안” may sound temporal rather than consequential. | Medium |
| 5672 | `Draug's Toothpicks` | Preserve the likely weapon-name joke while checking whether it is a formal item name. | English/Japanese/Chinese retain the odd name; Korean renders the wordplay and keeps the English spelling. | Medium |
| 5678 | `Walls` / `Arcadium` | Decide whether `Walls` is a named district/venue and what `sites` denotes; standardize Arcadium. | English is ambiguous; Japanese transliterates Walls and Chinese reads it as “high walls.” Korean treats Walls as a place and `sites` as attractions. | Low |
| 5680 | `Kollossae` / `Ethene` | Compare `콜로새` and `에테네` with the official manual and established corpus spellings. | Japanese/Chinese transliterations differ. Korean consistently names the people and goddess, but official forms remain to be confirmed. | Medium |
| 5681 | `Murghan-at-Arms` → `무장한 머건` | Determine whether this is a creature class/title or simply an armed Murghan. | English's capitalization suggests a named type; Japanese and Chinese also differ in taxonomy. Korean describes the creature as armed. | Medium |
| 5683 | `Ljosalfar` → `료스알브` | Retain the historical project glossary spelling and keep the hostile speaker's contemptuous tone. | Korean uses the recorded `료스알브`; all sources identify the speaker's nephew's Ljosalfar trader spouse. | High |
| 5687 | `Trellis` / “institutions reside” | Check whether `institutions` refers to buildings/sanctuaries rather than organizations, and standardize House names. | English uses both a place (`Trellis`) and institutions that “reside” there. Korean preserves that spatial metaphor and translates the named Houses. | Medium |
| 5691 | `Silkfarmer` → `실크파머` | Verify whether the term is an occupation, group, or established setting name before translating or normalizing it. | The row describes a person being bitten and an anti-venom stock; the exact in-world role remains unclear. | Medium |
| 5692 | `I've fought bigger than you` → `너보다 더 큰 상대` | Consider a figurative rendering such as tougher/more formidable opponents rather than physical size. | Japanese explicitly says “tougher opponents”; English commonly uses “bigger” figuratively in a taunt. Korean's literal size reading may misstate the boast. | High |
| 5699 | `Be my second` → `내 결투 조수(second)` | Confirm the Korean term for a second/assistant in a duel and preserve the promise of compensation. | The context is a duel challenge; Japanese uses a second/attendant sense. Korean points to the role but leaves `second` in English. | Medium |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 5655, 5661, 5665, 5668,
  5672, 5678, 5680-5681, 5683, 5687, 5691-5692, and 5699 against active
  Korean and matching source rows.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts and brace-delimited runtime-marker identities
  match across all four locales. Numeric values at ID 5661 are unchanged.
- No active CSV structure or text was changed.

## Batch Status

IDs 5650-5699 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
