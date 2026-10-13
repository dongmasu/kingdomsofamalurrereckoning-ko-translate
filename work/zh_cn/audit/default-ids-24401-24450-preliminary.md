# Preliminary Language Scan: `default` IDs 24401-24450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 24401-24450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 24403 | Crafting Hall | Determine whether this is a proper facility name, workbench area, or generic room. | Korean uses `제작 작업장`; Japanese says guild hall, Chinese manufacturing hall. | Medium |
| 24404 | Fae Memorial / blessing | Confirm the established name for the memorial and whether the blessing is passively present or actively bestowed. | Korean says the magic within the memorial bestows a blessing; the source leaves the mechanism open. | Medium |
| 24408 | stone / “these” / preserve | Clarify whether multiple stones are meant and preserve the appraisal, transfer, and conservation request. | Korean begins with singular “that stone” and says “I'll take it,” while English changes to plural “these” and says “them”; Japanese/Chinese also use singular-to-plural wording. | High |
| 24410 | Meropis / ancient island nation / pearl | Verify the name and preserve that the pearl was stolen from treasure chambers of an island nation sunk beneath the sea. | Korean retains the soaked sack, huge pearl, ancient island nation, and submerged location. | Medium |
| 24413 | curs / imbeciles | Preserve the contemptuous dismissal without narrowing “curs” to literal dogs. | Korean uses broad insults (`건달이나 멍청이`), consistent with a figurative reading. | Medium |
| 24414 | Gardens of Ysa admission | Preserve the completed admission and align the location form. | Korean retains that entry was granted; `이사` matches the current provisional Ysa rendering. | Low |
| 24415 | Griona Lachy's robe / “ungrateful recipients” | Verify the Fateweaver's name and preserve the irony that recipients resent her grim prophecies. | Korean retains both the protective purpose and ingratitude toward the predictions. | Medium |
| 24416 | beast lure / pet training | Preserve the condition that food is supplied as a lure before training a beast as a pet. | Korean keeps interest, food, lure, beast training, and pet outcome. | Medium |
| 24417 | `encounter hit` | Determine whether this is an internal combat/debug label rather than player-facing text. | Korean uses concise `조우 명중`; retain provisionally pending UI/runtime context. | Low |
| 24419 | United Merchants Delegation | Standardize the institution's Korean name. | Korean uses `상인 연합 대표단`, matching the current project form. | Medium |
| 24420 | “Why can't you get them?” | Clarify the plural referent and preserve the frustrated question. | Korean asks why the addressee cannot get it themselves, shifting plural `them` to singular; context is unavailable. | Medium |
| 24422 | charter burned / unrecoverable part of his life | Confirm whose charter and life are meant; preserve the threat that money cannot restore what is lost. | Korean retains the charter, burning threat, and irrecoverable life-event consequence; referents remain unclear. | High |
| 24425 | Hakon / blacksmith / repairs | Verify the name and preserve the speaker's self-interested recommendation to buy better gear directly. | Korean retains Hakon as blacksmith and the direct-purchase preference. | Medium |
| 24426 | `+24% Block Efficacy` | Align Block Efficacy with the established defensive-stat/UI term. | Korean says `방어 효율 +24%`; value is intact, but the label could imply general defense rather than block effectiveness. | High |
| 24428 | leaving to be among beauty | Preserve the speaker's self-reflection without specifying what “beauty” means. | Korean retains that the speaker was not useful there and needs to be where beauty is. | Medium |
| 24429 | first working Cairn / Songs of Summer | Verify Cairn and “Songs of Summer” as named lore terms; preserve the greater-than-one-season development time and temporary safety. | Korean retains the first working Cairn, more than a season, the effort's worth, and “safe... for now.” | High |
| 24431 | “beaten it out of them” | Preserve the idiom that the addressee finally forced the others to yield. | Korean renders that they were ultimately subdued; likely idiomatic rather than literal violence. | Medium |
| 24433 | Nix / Cairn / Tenhwa / Maid's imprisonment spell | Verify names and standardize Cairn as object/monument; preserve the recovery and return sequence. | Korean retains recovery from troll Nix, Tenhwa's library, and the spell words needed to release her from the Maid's imprisonment magic. | Medium |
| 24436 | Flawless Mitharan Flamed Bindings | Identify the equipment slot and standardize Mitharan/Flamed terminology. | Korean uses `화염 결속구`; the item category and modifier remain uncertain. | Medium |
| 24439 | victory to attrition | Preserve the military strategy of wearing down the enemy, not regret or surrender. | Korean explicitly chooses a war of attrition and hardening resolve through losses. | High |
| 24440 | “Dear Prickly Bear” | Determine whether this is an affectionate nickname or deliberately odd letter title; avoid normalizing without context. | Korean translates the image as `까칠곰에게`, retaining prickliness and direct address. | Medium |
| 24441 | great tree speaks to few | Preserve the blessing/congratulation implied by being addressed. | Korean retains the rarity and the listener's blessed status. | Low |
| 24443 | ornate ring / strength / heavy weapons | Preserve the causal link between wearing the ring, increased strength, and easier heavy-weapon use. | Korean retains all three points. | Medium |
| 24444 | omelet / corpses | Preserve the dark joke and determine whether “accidents” refers to a specific killing or a general excuse. | Korean retains the omelet/corpse punchline; the situation behind “accidents” remains unknown. | High |
| 24446 | Varani | Align this people-name form with the established Korean rendering. | Korean uses `바라니`, consistent with recurring forms in nearby content. | Low |
| 24447 | Blood Plague | Confirm whether this is a disease, faction, or named status and standardize it against other plague references. | Korean uses `혈역병`; context is absent. | Medium |
| 24448 | Sagrell's seat / heartvines | Verify the title/seat and standardize Heartvine naming; preserve the mortal-addressed warning. | Korean retains competition for the seat and instruction to keep searching for heartvines. | Medium |
| 24449 | agreed payment / gold | Preserve the agreed reward and gratitude. | Korean retains a payment for trouble and thanks; exact amount is unspecified. | Low |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 24404, 24415, 24417, 24422, 24439,
  24440, and 24444-24447 against the active rows. Memorial, name, debug
  status, charter referent, military strategy, nickname, dark joke, and
  plague terminology remain preliminary.
- Cross-checked recurring forms for Fae Memorial, Meropis, Gardens of Ysa,
  Fateweaver Griona Lachy, United Merchants Delegation, Hakon, Cairn,
  Songs of Summer, Nix, Maid, Tenhwa, Mitharan, Varani, Blood Plague,
  Sagrell, and heartvines.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 24401-24450 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales.
- No runtime-token, line-break, or numeric discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 24401-24450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
24451.
