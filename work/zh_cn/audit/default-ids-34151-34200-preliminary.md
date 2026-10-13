# Preliminary Language Scan: `default` IDs 34151-34200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34151-34200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34151 | `+19% 치명타 확률` / `연속 공격 타수가 7회` | Preserve both exact gameplay values and determine whether “Chain attack” is a named mechanic that needs a standardized Korean UI term. | Korean retains +19% critical chance and seven hits. Japanese/Chinese preserve the same values; the historical log specifically asks to verify this two-line stat. | Low |
| 34154 | `전령이 그걸 가지고 떠났어` / `기젤라의 미래에 대한 ... 희망` | Keep the antecedent of `it` unresolved unless earlier dialogue identifies the courier's item; preserve the loss-of-hope metaphor. | English does not identify the object. Korean uses a neutral pronoun; Chinese specifies a notice/document without English evidence, while Japanese keeps the object implicit. The historical log flags this referent. | Medium |
| 34156 | `독살된 시신들` for label `Bodies Poisoned` | Verify whether this is a heading/status label or a full report about poisoned bodies; preserve any list/colon behavior required by context. | English is a terse title-like fragment, Japanese adds a colon, Chinese states that bodies were poisoned, and Korean pluralizes it as poisoned corpses. The exact UI/record function is not clear from this row. | Medium |
| 34159 | `그들을 우리와 맞서게 만들 거야` for `She will pit them against us` | Identify the Maid's intended groups and preserve the threat that she will set them against the speaker's side. | Korean keeps the agency and conflict but leaves `them` unresolved, as English does. Chinese interprets it as using them against the speaker; Japanese says she will make the groups fight. Historical notes require preceding context. | Medium |
| 34160 | `시드헤의 심장` for `Heart of the Sidhe` | Standardize this named location and retain the instruction to find Ysa there, with wisdom offered as a possible additional outcome. | Korean preserves both the location and the optional wisdom. Japanese/Chinese translate the Sidhe/place term differently; this is a recurring lore-name consistency question. | Medium |
| 34164 | `요새의 봉인 풀기` for `Unlock the Holdfast` | Determine whether `Holdfast` is a named location/structure rather than a generic fort or a seal to unlock; standardize it across the corpus. | English capitalizes `Holdfast`, supporting a named entity. Korean adds “seal” and renders a fortress, Japanese refers to a central seal, and Chinese says unlock the fortress. The historical audit flags Holdfast terminology. | High |
| 34166 | `예의, 예의 좀 지키게` / `정해진 최후` | Preserve the speaker's dry repetition of “Manners” and the assertion that this is everyone's allotted end; check whether the opening is an admonition or a deliberate verbal stumble. | Korean turns the repeated noun into a direct admonition, which is natural but more explicit. The remainder preserves the fate/Fateweaver reference. Japanese and Chinese also vary the opening tone. | Medium |
| 34168 | `낮에는 한 부셸에 스물다섯` | Confirm the implied unit/price and retain “five and twenty” (25) per bushel during the day; do not invent a currency. | Korean preserves 25 as words and the bushel unit but, like English, does not state what is being priced. Japanese specifies 25 bushels-per-unit wording differently; the historical log flags this market phrase. | Medium |
| 34171 | `남은 건 작은 관뿐이었어. 관 하나뿐이라고.` for `all that was left ... was a circlet ‒ a circlet` | Reassess `circlet` as a head ornament/circlet, not a small coffin (`관`); preserve the speaker's shocked repetition and timeline. | English repeats `circlet`, Japanese uses サークレット, and Chinese describes a gold ring. Korean's `작은 관` changes the object to a coffin, a likely lexical false-friend error. Historical notes explicitly flag the circlet contradiction. | High |
| 34174 | `생명을 조이는 덩굴` / `옥죄임에 굴복` for Saturnyn's `stranglehold` | Preserve the metaphor of Saturnyn's creeping vine choking the House's life and the contrast between acquiescence and resistance; standardize Saturnyn and House terms. | Korean retains the vine and choking imagery and the refusal to yield quietly. The historical log flags the stranglehold/faction context. | Low |
| 34175 | `우승자 시상식` for `Winner's Ceremony` | Determine whether this is a named in-game event/objective and standardize its official display name. | Korean expresses a winners' awards ceremony; Japanese says winner ceremony and Chinese a victors' ritual. The row itself does not establish capitalization convention. | Medium |
| 34181 | `예언자 할리다이트` / `신들의 보상이 있는 장소를 또 하나` | Standardize Hallidite and preserve that the Oracle has divined another location of a divine reward, which the speaker will seek in the Teeth of Naros. | Korean keeps the promise, second location, and destination. Japanese transliterates the Oracle's name differently; Chinese treats Oracle as a role/title. The historical log flags the oracle reward and name. | Medium |
| 34189 | `{1}` of `3` scouts found | Preserve the runtime count and total; standardize the scout label and keep the placeholder intact. | Korean renders “{1} of 3” as “{1} of 3 scouts,” with the same single `{1}` variable as all locales. The source count remains three; no token mismatch is detected. | Low |
| 34190 | `재가 아직도 잦아들며 연기를 낸다` for `The ashes still smolder` | Preserve that the book's center was recently burned to a cinder and that the ashes continue to smolder; avoid implying the ashes are settling if “잦아들며” is read that way. | Korean retains the location and recent timing but its verb-plus-smoke phrase is awkward and may suggest the ash is dying down. English, Japanese, and Chinese all say the embers/ashes are still smoldering. | Medium |
| 34192 | `그녀의 정의로운 분노` for title `Her Righteous Fury` | Confirm whether this capitalized phrase is a title/name or descriptive prose; preserve the feminine possessive and “righteous fury” sense. | Korean translates the phrase literally. Japanese uses a generic righteous indignation phrase and Chinese instead says “poison the pool,” showing material reference divergence. Historical notes explicitly ask if this is a title. | High |
| 34195 | `투아사에게 굽히고 있다` / `언제까지 버티다 부러질까?` | Preserve the trees-in-wind metaphor, present yielding to the Tuatha, and the speaker's fear that the group will eventually break; determine the intended nuance of `bend`. | Korean retains the full metaphor and rhetorical question. English and Chinese explicitly say bend/yield, while Japanese says the group is being distorted. The faction's precise pressure is contextual. | Medium |
| 34200 | `레벨 4 친숙자 업그레이드` for `Level 4 Familiar Upgrade` | Standardize `Familiar` as the game's summoned companion/system term rather than the ordinary adjective “familiar”; preserve level 4. | Korean's `친숙자` is a literal-looking label. Japanese keeps the parenthetical concept, Chinese uses a transliteration-like phrase, and the precise UI context is not available in this row. | Medium |

IDs 34152-34153, 34155, 34157-34158, 34161-34163, 34165, 34167-34170,
34172-34173, 34176-34180, 34182-34188, 34191, 34193-34194, and 34196-34199
generally retain the English meaning on this first reading. Proper names,
lore, voice, and display conventions remain integrated-pass candidates; no
additional distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry explicitly flags IDs 34150-34168,
  34170-34181, 34187, 34189-34192, and 34195-34198. These were checked
  against active Korean and all locale references.
- ID 34151 retains `19%` and `7` hits. ID 34179 retains the debt of ten
  coins, and ID 34189 retains the three-scout total and `{1}` placeholder.
- ID 34171's `circlet`/`작은 관` mismatch is recorded as a high-confidence
  candidate; the CSV remains unchanged.
- A later source-key reconciliation found that the historical “Bodies
  Poisoned” question is attached to stale ID 34356; the active English
  phrase “back in the thick of it” is at ID 34356 and the actual
  “Bodies Poisoned” label is ID 34156. The mismatch is documented in
  `default-ids-34351-34400-preliminary.md`.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34151-34200 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 34151
  preserves its two stat lines.
- Runtime marker identities/order match, including `{1}` at ID 34189.
- Inspected numeric values match: `+19%`, `7` chain hits, `10` coins, and
  `3` scouts. At ID 34168, “five and twenty” remains 25 without an added
  currency.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 34151-34200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34201.
