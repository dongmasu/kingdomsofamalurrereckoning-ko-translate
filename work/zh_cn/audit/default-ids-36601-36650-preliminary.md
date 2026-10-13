# Preliminary Language Scan: `default` IDs 36601-36650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 36601-36650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 36605 | `프라이빗 스털링` / `스털링 이병` | Confirm the Korean military-rank mapping for `Private` and standardize the character's name. | English, Japanese, and Chinese identify Sterling as a private-soldier rank. Korean uses `이병`; its equivalence to the game's rank system remains a corpus-wide terminology choice. | Medium |
| 36609 | `슐리아 아르카나` for `Scholia Arcana` | Standardize the named order/library and Idris Theonen's spelling. | English names the Scholia Arcana libraries; Japanese/Chinese use semantic “arcane academy” forms, while Korean transliterates the organization. The centuries-long librarian role and special lesson are retained. | Medium |
| 36616 | `드라우그의 이쑤시개` for `Draug's Toothpicks` | Preserve the humorous item name while checking whether it is a proper weapon title or a literal joke. | All locales retain the toothpick image, though Chinese says toothpick knives. Korean keeps the possessive name and quest intent. | Low |
| 36618 | Fae duty / Great Cycle / `온전히 썩어 흙으로 돌아가도록` | Carry forward whether the Fae must oversee undisturbed decay or perform a specific rite; check the added return-to-soil image. | English says their charge is to see the dead safely “decay and rot” in reverence of the Great Cycle. Korean adds “return to soil”; Japanese/Chinese emphasize decay/rotting without that explicit image. | High |
| 36620 | `로스트 웬즈`; `로포쿠` | Carry forward the Lost Wends place-name and possible Lopoku/Lupoku spelling/pun. | English/Japanese use Lost Wends as a place and the idiom “Lupoku knows what else”; Chinese reads the address differently. Korean preserves the name and renders Lupoku as a deity reference. | High |
| 36623 | `코라 꽃잎`; `알마인` | Confirm the named regenerative item and whether “the Almain” means a specific person or the people. | All locales describe the petal's regenerative properties as curing an Almain. Korean preserves the individual-style article's ambiguity rather than specifying a proper name. | High |
| 36625 | localized `{*1...}` labels; `{LINE_SPACE}` / `{1}` | Record localized marker placement/order differences without treating matching marker counts as exact structural identity. | All locales retain two `{LINE_SPACE}`, three `{*1...}` spans, and `{1}`. Japanese moves the emphasized `effects` label into the first sentence; Chinese orders the second-sentence spans as pause menu/status/effects, while English and Korean order effects/status/pause menu. The Korean follows English order. | High |
| 36628 | `440타래` for `440 hands` of rope | Carry forward the unusual unit and company-name questions; preserve every amount and list break. | Korean interprets `hands` as skeins/coils (`타래`). English uses the unusual unit `hands`; Japanese/Chinese use rope-counting units. All six listed quantities, including 440, are retained. | High |
| 36630 | `고맙지만, 그건 내가 가져갈게` for `I'll take that, thank you` | Review the added concessive “but”; preserve the speaker's acceptance and thanks. | English, Japanese, and Chinese say the speaker will take/accept it and thanks the other person. Korean adds `고맙지만` (“thanks, but”), introducing a contrast not explicit in the references. | Medium |
| 36634 | Dokkalfar / Ljosalfar | Standardize both named Fae groups and preserve the “like and unlike” contrast with northern sisters. | English uses the lore names; Korean transliterates both and retains the comparison. Japanese/Chinese use alternate transliteration/semantic readings. | Medium |
| 36635 | 35 Ice / 30 Piercing DPS; 15 seconds; 220 Mana | Preserve all effect values and stat labels. | All four locales retain 35 Ice and 30 Piercing damage per second, 15-second duration, and 220 Mana cost. | Low |
| 36638 | `역병 방패` for `Plagueshield` | Confirm whether Plagueshield is a named protective effect/item and align its Korean form with prior occurrences. | English capitalizes the term; Japanese transliterates it and Chinese translates it as a plague barrier. Korean uses a descriptive shield phrase. | Medium |
| 36639 | `#NAMED_ICON_360_B#` | Preserve the named button icon exactly and keep the localized “Press” instruction. | The exact icon token is present in English, Japanese, Chinese, and Korean; Korean retains its identity and position. | Low |
| 36647 | Court of Winter / Prismere Chantries / Tirnoch | Carry forward terminology and check whether the Chantries themselves are “new idols” or buildings constructed for new idols. | Korean preserves the four-line account and the Court, Alfar, Tuatha, Prismere, and Tirnoch terms. The English says the Chantries were built “as new idols”; Korean can read as building them in order to establish Tirnoch as an idol, shifting the grammatical relation. | High |
| 36648 | `시녀` for `the Maid` | Carry forward the formal-title question and preserve the choice between remaining at the House of Ballads and surrendering the seat. | English capitalizes Maid; Japanese uses a title-like epithet and Chinese a generic young-woman term. Korean keeps the unprecedented voluntary abdication and change-of-era claim. | High |

IDs 36601-36604, 36606-36608, 36610-36615, 36617, 36619,
36621-36622, 36624, 36626-36627, 36629, 36631-36633, 36636-36637,
36640-36646, and 36649-36650 generally retain the English meaning on
this first reading. Names, rank, lore, and tone remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 36600-36799 was checked against
  this batch. Its questions at 36618, 36620, 36623, 36628, and 36647 were
  compared directly with all four locale texts.
- ID 36625's localized marker-order exception and the extra concessive at
  36630 were identified in this pass.
- Historical questions are evidence only and do not authorize CSV edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 36601-36650 once
  and in identical order.
- Embedded line-break counts match across all four locales. The marker
  sequence at 36625 is a documented localized-placement exception:
  identities/counts match, exact placement/order does not.
- ID 36628 preserves the inventory values 8,803 gold, 500 arrows,
  90 bowstrings, 12 gem shards, 440 rope units, and 3 hats, with all list
  lines and paragraph breaks. ID 36635 preserves its three combat values.
- ID 36639 preserves `#NAMED_ICON_360_B#` exactly.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 36601-36650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 36651.
