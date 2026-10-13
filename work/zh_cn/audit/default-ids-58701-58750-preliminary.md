# Preliminary Language Scan: `default` IDs 58701-58750

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 58701-58750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 58704 | Tuatha hate mortals / Fae actions / `절반은 대체 왜 하는지도 알 수 없지` | Preserve both rhetorical questions and distinguish them from the claim that Fae “only do half” of something. | English asks why the Fae do half the things they do, an idiom expressing bafflement at their actions. Korean retains this rhetorical meaning; Chinese appears to read it literally as the Fae doing only half of their actions. | Medium |
| 58708 | inn not fit / no rooms to rent / `빈 바닥이라도 ... 자고 가도 돼` | Preserve the innkeeper's informal offer to sleep on any spare floor despite there being no rentable rooms. | English uses colloquial speech; Japanese, Chinese, and Korean agree there are no rooms and the traveler may sleep on an empty patch of floor. Korean preserves the pragmatic offer. | Medium |
| 58710 | Bonus Challenge / `{2}` seconds / `{1}/{2}` | Preserve all three variable references and their order; confirm whether the ratio denotes round progress. | All locales retain the timer variable before the progress pair and preserve the challenge condition. Korean matches English/Chinese order and keeps the space before `({1}/{2})`. | High |
| 58711 | The Understyle / `언더스타일` | Preserve the candidate proper name; do not translate it as a generic “lower garden” without setting evidence. | English capitalizes `Understyle`, Japanese transliterates it, Chinese reads it as a lower garden, and Korean uses a transliteration. Prior audits flag it as a likely named location and specifically caution against unsupported literal translation. | High |
| 58712 | Damalroc / the Eldest / `다말록`, `엘더스트` | Align both names/titles with the established inventory and preserve the instruction to contact the Eldest. | English says “contact the Eldest”; Chinese is explicit about contact, while Japanese and Korean use meeting language. The intended means of contact and the Eldest's title/name form remain open. | Medium |
| 58713 | mission bunkhouse / second floor / `선교단 숙소 2층` | Preserve the second-floor location and identify whether “mission” means a religious mission or a military/organizational outpost. | All locales preserve the second floor, research, and the speaker's lack of understanding. English spells out “second”; Korean renders it as `2층`, retaining the value. Locale terms for the bunkhouse differ. | Medium |
| 58716 | Architect creation verse / five lines | Preserve all five lines and clarify capitalization, the three Majestics, the Cradle, and the abstract “form of growth” before any literary normalization. | English, Japanese, Chinese, and Korean each have four embedded line breaks. Korean preserves the Shaper/Carver sequence, third creator rising from the Cradle, Architect, growth design, and harmonious abundance. The final image and lore terminology remain open. | High |
| 58720 | Travelers / `트래블러스` | Align the faction/group form with the corpus convention and distinguish it from generic travelers. | English capitalizes the group name. Japanese transliterates it, Chinese translates “travelers,” and Korean uses the established transliterated form. The formal faction treatment remains a corpus-wide consistency question. | Medium |
| 58722 | Tuatha Deohn / Unseelie / Lord Ohn / `투아사 데온`, `언실리`, `오언 경` | Preserve the asserted name derivation and align faction/person spellings. | All locales say the Tuatha Deohn are named for Lord Ohn, the Unseelie counterpart of King Ysa. Korean keeps the relationship and title without adding further lore. | Medium |
| 58723 | “You've killed one” / burn the forest / `한 놈은 죽였군` | Preserve the unspecified antecedent of “one” until quest context identifies the creature/group; retain the speaker's retaliatory intent. | English, Japanese, Chinese, and Korean keep the referent broad or implicit. Korean does not insert “witch” or another specific target, and retains the conditional forest-burning threat. | Medium |
| 58726 | Beckoned / `부름받은 자여` | Preserve the formal farewell and align the player-title rendering with other occurrences. | English and Chinese explicitly address the addressee as Beckoned; Japanese omits the title. Korean uses `부름받은 자`, consistent with the current provisional title choice but not globally standardized. | Medium |
| 58736 | First leg / `첫 번째 구간` | Determine whether this is a race/rally stage, a round, or a general segment before fixing the UI label. | English is terse; Japanese says first point, Chinese first round, and Korean first segment. The label has no surrounding UI context. | Medium |
| 58737 | Cowl of the Maiden / Temple of Lyria / `처녀의 두건`, `리리아 사원` | Verify the named item and place forms; preserve the instruction to steal it and the blessing tied to the treasures. | English, Chinese, and Korean agree on the item, temple, theft objective, and blessing. Japanese similarly names the item but says the treasures are given to the camp, a recipient detail absent from English/Korean. | Medium |
| 58738 | Praetorian Garrison memoir / Laboratories / `프레토리아 수비대` | Preserve that the memoir says its next chapter covers the Laboratories; align the garrison/title form. | English's `waxing on` means speaking at length; Korean renders this as `장황하게 늘어놓은`. The next-chapter claim is preserved, while Japanese is less explicit about the memoir's wording. | Medium |
| 58742 | Oathblade / `맹세의 검` | Determine whether Oathblade is a named weapon, a title/rank, or both; align its Korean form with prior occurrences. | English and Chinese give a blade-like label, while Japanese reads it as a senior mercenary rank. Earlier audit reports repeatedly flag this same weapon/title ambiguity; Korean currently chooses the literal blade reading. | High |
| 58749 | Minor Alchemist's Art potion / `하급 연금술사의 기예` | Confirm whether this is a named potion and preserve the lower-tier meaning and purpose of maintaining alchemy skill. | English capitalizes the potion name. Japanese calls it a small alchemy-skill potion, Chinese a minor alchemy potion, and Korean renders it as a named “art/skill” potion. The historical audit requests an item-name decision. | Medium |
| 58750 | “your grace?” / `전하` | Verify the speaker's rank/register and distinguish “Your Grace” from “Your Majesty” or “Excellency.” | English says “your grace”; Japanese uses an Excellency-like address, Chinese uses Your Majesty, and Korean uses the royal `전하`. The speaker/addressee context is needed to select a formal Korean title. | Medium |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Provisional names and terms include Cadeth Orson,
Ysa, Lorestones, Chariot, Understyle, Damalroc, the Eldest, Revival,
Frama Aedic, Travelers, Unseelie, Lord Ohn, Crudok, Niskaru, Erathi,
Irena, First leg, the Cowl of the Maiden, Lyria, the Praetorian Garrison,
Oathblade, and Minor Alchemist's Art.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `58650-58749`.
  Applicable prompts include Tenders/Delvers and the Gnome Templar code
  (58651-58652), the Rattlesnake/Desert Runner fable (58664), salvage UI
  markers (58669), the Jottun charge (58671), Rathir's sendoff (58682),
  tree boughs (58686), the Ansilla defense and Dead Kel clue (58689-58690),
  the Tuatha/Fae question (58704), Understyle (58711), Damalroc/Eldest and
  the mission bunkhouse (58712-58713), Revival (58715), the five-line
  creation verse (58716), Lord Ohn/Unseelie (58722), the antecedent at
  58723, Beckoned (58726), First leg, the Cowl, and the Praetorian memoir
  (58736-58738), plus Oathblade and Minor Alchemist's Art (58742, 58749).
  These remain open prompts, not accepted corrections.
- Earlier reports identify `Understyle` as a likely proper place name and
  repeatedly leave Oathblade's weapon/title sense unresolved. No global
  terminology decision is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 58701-58750 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Newline counts match throughout the batch. The five-line creation verse
  at 58716 has four embedded line breaks in every locale.
- `{2}` and `{1}/{2}` at 58710 retain their identities and order. The
  `#NAMED_ICON_360_SELECT#` token at 58744 is present in all locales.
- The second-floor value at 58713 is preserved as `2층`; no mismatched
  marker sequence or numeric modifier was found.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368b856a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 58701-58750 received a preliminary scan and were dispositioned in
[`disposition-batch-default-58701-58750-20261011.md`](disposition-batch-default-58701-58750-20261011.md).
No correction was accepted; the report records uncertain and `not an issue`
findings. This preliminary scan is not independent final linguistic
approval. Continue at `default` ID 58751.
