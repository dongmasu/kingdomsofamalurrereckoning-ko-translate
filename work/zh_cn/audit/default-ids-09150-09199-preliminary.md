# Preliminary Language Scan: `default` IDs 9150-9199

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9150-9199.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9151 | `Orison` → `기도문(Orison)` | Determine whether `Orison` is a prayer, written prayer, named item, or character/name; reconcile it with the earlier question at ID 8374. | Japanese transliterates it as a name, Chinese translates “prayer,” and Korean chooses “prayer text.” The isolated label does not settle its category. | Medium |
| 9152 | `the Sidhe` → `시드` | Verify whether `Sidhe` names a people, place, or realm here and align the form with other uses of Sidhe. | English capitalizes the ethnonym/concept, while Japanese and Chinese interpret it as a place/realm. Korean transliterates the term; the historical audit records this ambiguity elsewhere. | Medium |
| 9154 | `Vengeance soldiers` → `복수의 전당 병사들` | Confirm whether `Vengeance` is shorthand for the House/faction and align the institutional name with House of Vengeance entries. | Korean uses the faction-like `복수의 전당`; English says “Vengeance soldiers,” leaving the exact organization label implicit. | Medium |
| 9157 | `Red Legion` → `적군단` | Treat `Red Legion` as a faction name, not the generic phrase “enemy legion”; confirm the established Korean rendering. | English and Japanese retain Red Legion as a proper group name. Korean `적군단` can mean “enemy army” and loses the color/name distinction; Chinese also translates it as a name-like `雷德帮`. | High |
| 9158 | “I don't suppose you had managed to track me here...” | Preserve the speaker's implication that the player deliberately tracked her here and has an objective; keep the guarded, rhetorical tone. | English is awkwardly phrased, but Japanese and Chinese support the accusation/assumption. Korean conveys that the meeting cannot be purposeless without adding a specific goal. | Medium |
| 9163 | Capitalized `The Font` → `원천(The Font)` | Determine whether this is a named magical spring/source or location and align it with its later “drying up” reference. | Japanese calls it Ysa's spring, Chinese calls it a sacred spring, while Korean keeps `The Font` traceable as “source.” Historical audit treats it as a named entity. | Medium |
| 9169 | `buy and sell gold costs` → `더 유리한 가격으로 사고팔기` | Confirm the exact Mercantile skill effect, especially whether it changes both buying and selling prices. | Japanese says more favorable buy/sell terms; Chinese describes reduced gold cost. Korean paraphrases favorable prices without numeric values, matching the broad effect. | Medium |
| 9173 | “extra... handling” → `특별한... 대우` | Preserve the speaker's hesitation and euphemism without deciding whether the nobles expect a bribe, favor, or special service. | English and Japanese retain the pauses and vague “handling”; Chinese says special care. Korean retains the euphemism; its implication remains unresolved. | Medium |
| 9175 | `Eyebrow Intensity` → `눈썹 농도` | Check whether this character-customization control means eyebrow thickness/density or color/intensity; use the UI's established label. | Japanese says eyebrow thickness/density and Chinese says density; Korean uses `농도`, which may suggest color saturation. | Medium |
| 9179 | `another notice` → `또 사망 통지서` | Verify from dialogue context that the unspecified notice is a death notice; avoid making that inference global. | The line follows the Death Notices quest context, so Korean's explicit “death notice” is plausible, but English itself says only `notice`. This matches the historical open question. | Medium |
| 9181 | `make the stones sing their song` → `돌들이 저마다의 노래` | Preserve the repeated command and the speaker's self-doubt; check whether “their song” means a collective song rather than a separate song for each stone. | English and Chinese use a collective/plural image; Korean adds `저마다의`, implying each stone has its own song. Japanese also describes making the stones sing a poem. | Medium |
| 9184 | `QA Online Services [OTG] - EA Redwood Shores` retained | Keep this internal-looking QA label unchanged unless confirmed player-facing. | English and Japanese retain the exact string, Chinese translates it, and Korean preserves the source. This is likely metadata but classification remains unconfirmed. | Medium |
| 9193 | `Weeping King` → `우는 왕`; contemplation of death | Confirm the King of Sorrows/Weeping King title and align the named ruler with other `Sorrows` terminology. | English capitalizes the title; Japanese uses a “lamenting king” form, Chinese says “King of Wailing,” and Korean uses the generic-sounding `우는 왕`. | Medium |
| 9196 | `prismere` → `프리즈미어` | Align the material name and summoning terminology with the established project spelling/glossary. | The Korean preserves both the summoning power and Prismere material; the proper-name transliteration is the remaining issue. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9151, 9163, 9173, 9179, 9181,
  9184, 9190, and 9193 against the active rows.
- Added current-row name/term questions for IDs 9152, 9154, 9157, 9158,
  9169, 9175, and 9196.
- The QA string at ID 9184 remains unchanged in active Korean; this records
  likely internal metadata, not a localization defect or approval.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales.
- Runtime-marker IDs/order and other control tokens match in this range; no
  structural exception was found.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9150-9199 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
