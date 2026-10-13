# Preliminary Language Scan: `default` IDs 23601-23650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 23601-23650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 23602 | “You, get from my sight” | Preserve the abrupt, hostile command while recognizing that the English is malformed. | Korean renders the intended “get out of my sight” naturally; the source lacks `out`. | Low |
| 23603 | crisp/soft seasoned side dish | Identify the food only if context supports it; preserve the texture and use as a seasoned side dish. | Korean keeps all three properties without inventing an ingredient. | Low |
| 23604 | Great Scale / re-balance | Determine whether Great Scale is a named device/place and preserve the rebalancing mechanic. | Korean retains both sides and the need to rebalance; English omits the name of the person (“him”), while Chinese supplies Kaelrod. | Medium |
| 23605 | Resist Arrest | Determine whether this is a quest/objective, status, or interaction label and align the UI form. | Korean uses `체포 저항`; Japanese explicitly says resist arrest, while Chinese is less specific. Historical UI question remains open. | Medium |
| 23609 | Domus Politica / scrivener / writing books | Verify the institution and whether scrivener means copyist, clerk, or author. | Korean says the speaker did transcription work and later sold books; the English says they stopped writing books, leaving the exact former role uncertain. | Medium |
| 23611 | De Groot / trained soldier / special unit | Standardize the name and clarify whether Special Unit is a formal organization or descriptive assignment. | Korean preserves the surprise that a trained soldier/special-unit member was ambushed and killed. | Medium |
| 23614 | two vagrants / other refugees | Preserve the distinction between the two current vagrants and future refugees who may follow. | Korean retains both groups and the fear that more arrivals would be impossible to stop. | Medium |
| 23618 | Hyperian raised / Festival of Ethene | Clarify whether “raised” refers to physically lifting the Hyperian or restoring/raising it ceremonially; standardize the festival title. | Korean says `일으켜 세웠으니`; Chinese explicitly says raised into the air, and all locales preserve the celebration. | Medium |
| 23619 | “It's you” / “fascinated to be here” | Preserve the visitor's fascination/curiosity and intended warm greeting; note the source's unusual phrasing. | Korean retains the pleasure and many questions but omits the explicit “you” in the first clause. English uses a curly apostrophe and has an awkward `fascinated to be here` construction. | Medium |
| 23622 | “hiding in a bottle” / last action | Preserve the speaker's alcohol-related metaphor and possible finality without asserting literal confinement. | Korean says the speaker was holed up in a liquor bottle for years; the phrase is idiomatic/ambiguous and is flagged historically. | Medium |
| 23626-23627 | Mitharan / Ebony Guard / Mitharan ruins | Align the people/place and unit names. | Korean uses `미타란` and `흑단 경비대`; canonical Mitharan form and whether Ebony Guard is a formal unit remain open. | Medium |
| 23628 | Burn enemies when Attacked | Align trigger/effect labels with the combat UI glossary and identify whether the fragment is a passive. | Korean retains the attacked trigger and burn effect in concise UI-style wording. | Medium |
| 23631 | Ulliam Toal / spellbinding / green and purple gems | Align the crafting term and retain the full cautionary tale's causal progression and paragraph structure. | Korean preserves all five narrative sections, progression from mild sickness to death, trial, and lesson. All locales have eight embedded line breaks. Historical term question remains open. | Medium |
| 23635 | Fates' wisdom / abrupt recognition | Preserve the ceremonial opening and sharp switch to a familiar, impatient question. | Korean keeps both voices and the transition; the source's em dash is an interruption, not missing dialogue. | Low |
| 23637 | Ironfast “open to you” | Clarify whether this grants unrestricted access to the whole settlement/region or is a welcome formula. | Korean says the visitor may freely go anywhere in Ironfast; Japanese instead reads as a welcome. | Medium |
| 23640 | Ember Eyes / “smoke 'em” / Preordained | Determine whether Ember Eyes are a plant/drug and preserve the theft and intended smoking. | Korean retains the named item and smoking implication; the source's colloquial fragment remains intentionally rough. | Medium |
| 23641 | `{*1gem}` / `{*1socketed}` / `{*1equipment}` / `{*1socket}` | Align the UI terms and ensure all four wrappers remain in the exact order. | All locales preserve four wrappers in the source order. Korean retains the English labels inside the wrappers; Chinese adds an explicit “1” to the unused-socket phrase. | High |
| 23643 | Hex / winnings | Resolve the card/game term consistently with ID 23400, where Chinese reads it as six and English/Japanese use Hex. | Korean transliterates Hex and preserves the win/payout; historical question remains open. | High |
| 23644 | Ugnar Odgray / “truly gone” | Preserve the distinction between telling someone the speaker is dead and saying the person they knew is gone. | Korean retains both statements without deciding whether the change is death, departure, or identity. | Medium |
| 23648 | Gardens of Ysa / “which one will it be?” | Clarify what “which one” refers to: which side starts war, which war occurs, or another conflict choice. | Korean interprets it as which side will start the war; English is malformed, and Japanese/Chinese differ. Historical question remains open. | High |
| 23649 | Church of the Unbound / Lyenna | Standardize the church and character names and preserve the raid, members' dispersal, hidden temple, and urgent search. | Korean retains the full event sequence; historical group/name questions remain open. | Medium |
| 23650 | Besin | Preserve the fragment as the final step in its larger objective rather than making it a complete independent sentence. | Korean retains the leading ellipsis and defeat objective. | Low |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 23603-23605, 23609, 23611, 23614,
  23618-23619, 23622, 23626, 23628, 23631, 23635, 23637, 23640-23641,
  23643-23644, and 23648-23649 against the active rows. Lore, item, UI,
  source, and context questions remain preliminary.
- Cross-checked recurring names and terms for Domus Politica, De Groot,
  Balor, Mithros, Hyperian, Ethene, Aodh, Mitharan, Alyn Shir, Ulliam Toal,
  Glimwood, spellbinding, Adessa, Midden, Fates, Ironfast, Eswin,
  Preordained, Ember Eyes, Niskaru, Hex, Ugnar Odgray, Ysa, Church of the
  Unbound, Lyenna, and Besin.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 23601-23650 exactly
  once and in identical order.
- ID 23631 preserves eight embedded line breaks in all four locales.
- ID 23641 preserves all four UI wrappers in the same order and identity;
  the marker labels are localized in Japanese/Chinese but remain English in
  Korean. All four are present.
- No other line-break or runtime-marker discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 23601-23650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
23651.
