# Preliminary Language Scan: `default` IDs 45151-45200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45151-45200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45155 | shepherd/ram/flock of tomes / `책이라는 양 떼` | Preserve the self-deprecating shepherd/ram wordplay and clarify that the “flock” is the speaker's books. | Korean retains the poet-to-shepherd contrast and book-flock metaphor; it makes “ram” explicit as `숫양`. Japanese similarly foregrounds the sheep/ram contrast. | Low |
| 45160 | Orieator; allied shield emblems | Standardize the commander, Dokkalfar, Almain Gold Order, Ljosalfar Lyrian Grace, and Varani Crooked Balance names; retain the alliance relationships. | Korean preserves all three peoples/groups and their decorative emblems. Proper-name transliterations and whether each is an order, grace, or balance group remain open. | Medium |
| 45166 | Apotyre Families / `아포타이어 가문들` | Confirm whether this is a formal menu/category title and standardize Apotyre. | Korean retains the plural family grouping; Japanese interprets it as mining families, while English is simply “Apotyre Families.” | Medium |
| 45167 | House of Sorrows / Court of Winter / `비탄의 가문` / `겨울 궁정` | Preserve the male pronoun “he,” the founding/witness distinction, and the choice-or-fate ambiguity; standardize the institutional names. | Korean retains that he founded the House of Sorrows, saw the Court of Winter's birth, then left for Esharra and never returned. The source-keyed log specifically says not to infer the person's identity beyond `he`. | Medium |
| 45168 | spidersac ichor / Fennwrac leaf / Jottun grist | Confirm the crafting sense of `grist` and canonical ingredient names without losing the speaker's exasperated repetition. | Korean preserves all three ingredients and identifies grist as coarse grain flour. The English source is terse; Japanese/Chinese also use grain/powder senses. | Medium |
| 45170 | Unarmed Peasant Parent / `무장하지 않은 농민 부모` | Check singular/plural implication in the Korean UI label; the English is singular “Parent.” | Korean `부모` can be read as parents (plural) although Korean may use it generically. Japanese and Chinese also use plural/collective forms, so the intended UI referent remains uncertain. | Medium |
| 45173 | Crossing / `교차로` | Confirm whether capitalized `Crossing` names a site/structure, and preserve the sequence of finding it and placing Fellfire Bloom on the altar at its center. | Korean translates it as a generic crossroads. Japanese calls it a power crossing, Chinese a pass/gateway; the source-keyed history leaves the proper-name status open. | Medium |
| 45176 | inn-cost variable | Preserve the exact variable identity and order and the request to rent a bed. | Korean retains `$Emaire_NQD.m_inn_cost$` and the Gold unit exactly; all four locale values have the same marker and order. | Low |
| 45181 | Mitharu gender statement / `미사루` | Preserve the deliberate contradiction that Mitharu is called a god and then referred to as “She”; confirm Korean terminology without flattening the source's tension. | Korean says Mitharu is a god and not mortal, then uses honorific gender-neutral `그분`, losing the explicit feminine pronoun present in English/Japanese/Chinese. The underlying contradiction is intentional in the historical notes. | High |
| 45187 | Bareth / Cryamor / enchantment / `바레스` / `크라이아모어` | Confirm name spellings and retain that Cryamor led the Tuatha and coveted Bareth's enchantment knowledge, especially his ability to charm Alabastra's beasts. | Korean preserves the target, leader, and knowledge sought; the exact name forms and “charm” sense remain glossary/context questions. | Medium |
| 45195 | dustling / `먼지의 자식` | Confirm and standardize the setting's address for `dustling`. | Korean uses the recurring “Child of Dust” form rather than a literal “dustling”; the threatening prophecy is preserved. | Medium |
| 45197 | Scavs / `스캐브` | Confirm whether this is a named creature/group or generic scavengers and standardize capitalization/transliteration. | Korean transliterates the capitalized group term; Japanese and Chinese choose different generic/creature forms. Historical notes call out Scavs as an open term. | Medium |
| 45198 | Templar / `템플러` | Confirm the formal order/title and preserve that Octienne occupies a position of highest authority. | Korean retains the title and highest-authority statement; Japanese/Chinese also support the Templar sense but use localized terms. | Medium |
| 45200 | pull/range/damage/cost description | Preserve 14 meters, 35 Physical Damage, 20 Piercing Damage, and 30 Mana. | Korean retains all four values and their mechanics, with the source line break before the mana cost. | Low |

IDs 45151-45154, 45156-45159, 45161-45165, 45168-45169, 45171-45172,
45174-45175, 45177-45180, 45182-45186, 45188-45196, 45199 generally retain
the English meaning on this first reading. Names, setting terms, and UI
labels remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 45150-45249 were checked for
  Gunnar Frode, the shepherd/ram metaphor, allied shield emblems, Apotyre
  Families, Fennwrac/Jottun ingredients, the Crossing, Mitharu's gender,
  Cryamor/Bareth, dustling, Scavs, Khamazandu, and the 45200 combat values.
- The historical log explicitly requests preserving the pronoun `he` at
  45167, the god/feminine tension at 45181, the distinct terms `dustling` and
  `Scavs`, and the exact variable and values at 45176/45200.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45151-45200 once
  and in identical ascending order.
- ID 45176 preserves `$Emaire_NQD.m_inn_cost$` identity/order in every
  locale.
- ID 45200 has one embedded line break in every locale. The values 14 meters,
  35 Physical Damage, 20 Piercing Damage, and 30 Mana match.
- ID 45165's `5` agrees with “Chapter 5”; no other numeric-value discrepancy,
  runtime-token difference, or hidden formatting character was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45151-45200 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45151-45200-20261010.md`](disposition-batch-default-45151-45200-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45201.
