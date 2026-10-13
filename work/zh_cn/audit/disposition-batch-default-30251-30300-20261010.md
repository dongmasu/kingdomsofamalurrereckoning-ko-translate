# Disposition and Edit Batch: `default` IDs 30251-30300

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  30251-30300, checked against English, Japanese, Chinese, active Korean,
  recurring project terminology, and the source-keyed historical audit.
- Decisions: one accepted, fourteen `not an issue`, and sixteen uncertain.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 30292 | `그 배불뚝이는 그래도 싸.` | `그 잘난 척하는 바보는 그래도 싸.` | English `Bloated fool` is a figurative insult for an arrogant/puffed-up person, supported by Japanese and Chinese. `배불뚝이` instead insults body shape. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30251, 30253, 30255-30257, 30260-30262, 30264, 30266-30267, 30270-30277, 30280-30281, 30284-30288, 30290-30291, 30293, 30295-30297, 30299 | Remaining dialogue, objectives, labels, and ordinary text | Not an issue: Korean preserves the evident English meaning and register at preliminary level. Names and lore terms are tracked separately where applicable. |
| 30254 | Armor reduction / Panic effect | Not an issue: both lines, the 30% Armor reduction, and separate 10% Panic chance are preserved. |
| 30258-30259 | House of Accolades / House of Pride sequence | Not an issue: the woman remains at the House of Accolades; Dren's fall, liberation of the House of Pride, and the path to Gadflow are retained as distinct places/events. |
| 30263 | Senior Director of Advertising & Media | Not an issue: the English corporate title is localized naturally; its credit/UI audience remains uncertain separately. |
| 30265 | Nera driven from caves / earlier pursuit of Garreth | Not an issue: the sequence and time relation are retained. Proper-name spellings remain open separately. |
| 30268 | Tuatha identity / growing power / diminution | Not an issue: the name, Prismere mark, increased power, and countervailing diminishment are all preserved. |
| 30273 | Kollossae martial history and traditional weapons | Not an issue: pride in martial feats, continued physical prowess, and declining use of traditional weapons are conveyed. |
| 30274 | Trial of Initiation / chapterhouse visit | Not an issue: the invitation to join and direction to the Ysa chapterhouse are retained. |
| 30279 | Cradle of Summer barrier and drifting magic | Not an issue: the weakening barrier, magic drifting away, seed/tree image, and speaker's question are retained. Exact seedling imagery remains open separately. |
| 30282 | Observation period and invitation to join | Not an issue: the organization has watched the addressee and would be pleased if they joined; the identity of the `order` remains open separately. |
| 30289 | Encoded puzzle string | Not an issue for text preservation: Korean retains the exact English cipher rather than silently decoding or corrupting the puzzle. A localization convention for the encoded message remains open separately. |
| 30294 | Mortal repeatedly pestering speaker who wishes to become Fae | Not an issue: Korean conveys the intended repeated disturbance, supported by Japanese; the English source grammar error does not create a Korean meaning error. |
| 30298 | Erion's return conditional on a subordinate taking command | Not an issue: the condition, camp, return destination, and suggested contact are preserved. Name and rank forms remain open separately. |
| 30300 | Magic critical-hit recipe | Not an issue: the effect, Alchemy Workbench, reagent sequence, 3/2/1 quantities, and blank-line layout are preserved. Ingredient names remain uncertain separately. |

## Uncertain

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 30252 / 30165 | Coilsbain / Coilsbane | Uncertain: the English corpus contains both spellings for a likely shared location; Korean forms also vary. Do not normalize without source confirmation. |
| 30254 | Armor / Panic terminology | Uncertain: the values and structure are exact, but official Korean combat-stat and status-effect terminology needs glossary alignment. |
| 30258-30259 | House of Accolades / House of Pride / Guardian of Pride | Uncertain: the two houses remain distinct, but Korean alternates semantic translation and transliteration; the Guardian title convention is unresolved. |
| 30263 | Corporate credit audience | Uncertain: it may be a developer/credit label rather than player-facing text; whether to keep or localize titles consistently needs context. |
| 30265 | Nera Red-Hand / Tine Delfric / Garreth Rill | Uncertain: event sequence is retained, but locale spellings diverge, especially for Nera and Garreth. |
| 30268 | `they are diminished` | Uncertain: Korean says they have declined, while Chinese specifies that they are perishing; English leaves the dimension of diminishment unstated. |
| 30269 | Scholia Arcana | Uncertain: Korean transliterates the organization while Japanese and Chinese translate it; canonical institution naming is unresolved. |
| 30278 | House of Ballads | Uncertain: the formal institution/place name is rendered semantically in Korean, while other locales transliterate or use a literal house form. |
| 30279 | `seedlings from the trees` | Uncertain: Korean shifts seedlings to seeds blowing from trees; English/Chinese retain seedlings and Japanese uses a different parasitic-plant metaphor. |
| 30282 | `our order` | Uncertain: capitalization may identify a named organization; Japanese and Chinese interpret it as companions/academy, while Korean uses generic `조직`. |
| 30283 | The Page | Uncertain: it may be a servant, formal rank, or card title; the isolated label does not establish the intended sense. |
| 30289 | Atbash puzzle localization | Uncertain: decoding yields “This is not Adessa,” but locales preserve or transform the cipher differently. Do not decode or replace it without a deliberate puzzle-localization rule. |
| 30292 | `Bloated fool` | Uncertain: the accepted correction captures the figurative arrogance supported by Japanese/Chinese, but the ideal Korean insult strength/register may need broader voice review. |
| 30298 | Private Cornall / Erion Odi / Caeled Coast / Seawatch | Uncertain: names, military-rank rendering, and place spellings require corpus alignment. |
| 30300 | Scarab Salts / Star Thistle / Scarwood Bark | Uncertain: recipe mechanics and quantities match, but canonical reagent names vary across locales. |
| Other named terms in IDs 30251-30300 | Ragna Senn / Davril / Simonides / Sorrows / Felltown / Nera / Scholia Arcana / House titles / Phasmer Humm / Fyragnos and related terms | Uncertain: canonical names, factions, places, status labels, and lore terms need integrated glossary review. |

## Verification

- IDs 30251-30300 occur once and in the same ascending order in English,
  Japanese, Chinese, and Korean. Embedded line-break counts and normalized
  runtime-token identities/order match across all four locales.
- The 30254 two-line effect and 30%/10% values match. The 30300 recipe keeps
  quantities 3/2/1 and matching blank-line structure.
- No Korean structural exception or unexpected Unicode format-character
  discrepancy was found.
- Only the accepted Korean `Texto` cell at ID 30292 changed. UTF-8 BOM and
  the established 72,046 CRLF / 39 bare-LF distribution remain intact.
- Active default CSV SHA-256:
  `4c2d2998e2eb3d11d8093bfaf7c0808d26ee2589a9e38dede47330d9b66c6ade`.
- Register totals after this batch: 913 accepted, 3,414 `not an issue`, and
  5,475 uncertain (9,802 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 30301; 34,834 `default` IDs remain.

These working dispositions are not independent linguistic approval.
