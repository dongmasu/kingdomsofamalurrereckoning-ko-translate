# Preliminary Language Scan: `default` IDs 48051-48100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 48051-48100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 48054 | Travelers / `여행자들` | Confirm whether this capitalized label names a faction or simply travelers. | Korean translates the plural directly; Japanese transliterates it. This standalone label does not establish proper-name status. | Medium |
| 48055 | Star Thistle / `별엉겅퀴` | Confirm the canonical reagent/plant name and preserve the localized `{*3...}` payload. | Korean, Japanese, and Chinese all retain the `{*3}` marker and localize its payload as Magic. The source describes a wildgrass and a possible potion effect; no marker or plant detail is omitted. | High |
| 48057 | `We didn't` / `그러지 않았지` | Recover the missing dialogue context before deciding whether this fragment is complete or meaningful as-is. | Korean preserves the bare negative past-tense fragment. Japanese and Chinese supply divergent completions, showing that they infer context not present in English. Do not expand the Korean from those references alone. | Medium |
| 48058 | Preordained / `예정된 자` | Confirm the established faction/title form and distinguish it from similar destiny terms. | Korean uses the literal “preordained” sense as a standalone title. The historical log flags this term at multiple IDs for consistency. | Medium |
| 48065 | Kreios / “reforge us” | Confirm the named figure and retain the people's renewed faith and history of being reforged. | Korean preserves the goddess's love, the community's faith, and Kreios's act of reshaping them. Chinese/Japanese differ slightly on whether the action is remaking or reforging. | Medium |
| 48067 | Giran / `기란` | Preserve the speaker's self-correction and the three clues that Giran is acting unusually. | Korean retains the hesitation, his ignoring the speaker, and the strange look in his eyes. The antecedent of “Have I...?” remains dependent on prior dialogue. | Medium |
| 48069 | Kollossae / `콜로세` | Confirm the race/craft name and retain the appraisal possibility rather than asserting a sale. | Korean keeps the damaged artifact, its Kollossae origin, and the possibility that an appraiser may pay well. | Medium |
| 48070 | “Keep your head on your shoulders” | Preserve the friendly warning/idiom without reading it as literal anatomy. | Korean renders the phrase idiomatically as keeping one's wits about oneself; Japanese instead uses a different “stay sensible” phrasing. | High |
| 48081 | Concourse / `콩코스` | Confirm whether this is a named district/location and use the chosen place-name convention consistently. | Korean transliterates the label; Chinese renders it descriptively as a plaza. The isolated UI label does not determine the proper-name reading. | Medium |
| 48091-48093 | House of Sorrows, Proving Halls, Cydan, Caeled Coast, Windemere, Maid, Court of Enchantments | Confirm canonical names and the relationships in the Winter Fae/quest descriptions. | Korean retains the instruction to undergo a trial, the Tuatha conflict, Cydan's secret-route offer, and the Maid/Windemere/Court objective. `Maid's private kingdom` remains an unusual source phrase and is explicitly open in the historical log. | Medium |
| 48092 | `sowing confusing among the Tuatha` | Treat the English wording as a likely source typo for causing confusion, while preserving the intended action. | Korean uses `혼란을 일으켜`, matching the surrounding meaning. Japanese and Chinese also interpret the phrase as confusing/disrupting the Tuatha. | High |
| 48097 | murdered lord/family / `한심하고 허영심 많은 바보들` | Confirm whether `Poor, pompous fools` refers to the rumored ghosts, the murdered household, or the people spreading the story. | Korean preserves the contemptuous description, but the English antecedent is not explicit. Retain the referent as an open context question. | Medium |
| 48100 | Winter Court poem / `겨울 궁정` | Verify the poem's established terminology and preserve its five line breaks; note the English typo `the his crown`. | Korean preserves all five breaks, the silent court, the jester, Gadflow's murder, and the Tuatha/Tirnoch origin. It renders the malformed source phrase coherently as removing the crown from the king's head rather than reproducing the duplicated possessive. | Medium |

Other names and recurring terms in this range, including Glianal,
Chrysalae, Alyn Shir, Dannestar, Ventrinio, Bisarane, Kreios, Giran,
Orwin Dunn, Alabastra, Gorhart, Titarion, Jakin, Tyr Magnus, Cydan,
Windemere, Castle Gastyr, and Gadflow, remain subject to corpus-wide
terminology review. Existing Korean forms were preserved.

IDs 48051-48053, 48056, 48059-48064, 48066, 48068, 48072-48080,
48082-48090, 48094-48096, and 48098-48099 generally retain the English
meaning on this first reading. Names, idioms, and lore terminology remain
subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the historical entry for IDs 48050-48149. It flags Travelers,
  `We didn't`, Preordained, the Concourse, the Maid's private kingdom and
  Court of Enchantments, Going Primal, and the 48100 poem/source typo.
- Boundary ID 48050 was included in the previous batch and checked against
  the start of this historical range; no row was skipped or counted twice.
- No historical question or structural note was treated as review approval.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 48051-48100 once
  and in identical ascending order.
- ID 48071 has three embedded line breaks and ID 48100 has five; all four
  locales retain the same counts at each ID.
- `{*3Magic}` at ID 48055 is present in every locale as a localized
  `{*3...}` marker.
- `$NQD_City_Adessa.borrowed_amount$` at ID 48061 is present in every
  locale. Values `+10` and `+25%` at ID 48071 are retained.
- No hidden format/control characters or structural exceptions were found.
- No translation CSV edit was made.

## Batch Status

IDs 48051-48100 received one preliminary reading. The later working
disposition is recorded in
[`disposition-batch-default-48051-48100-20261010.md`](disposition-batch-default-48051-48100-20261010.md).
That disposition does not convert this preliminary scan into independent
final linguistic approval. Continue at `default` ID 48101.
