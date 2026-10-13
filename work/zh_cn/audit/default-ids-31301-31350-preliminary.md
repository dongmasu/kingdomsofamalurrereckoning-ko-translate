# Preliminary Language Scan: `default` IDs 31301-31350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31301-31350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31301 | `네 동족` for `one of your kind` | Confirm whether this means the same species/people or simply someone like the addressee; retain the welcoming-but-suspicious tone. | English leaves `your kind` broad. Japanese says a person like the addressee, Chinese specifies humans, while Korean says kin/people of the same kind. The next sentence accuses the addressee of targeting Ametair. | Medium |
| 31306 | `바실리카 노스트라` for `Basilica Gnostra` | Resolve the cross-locale source conflict and verify the proper-name spelling before standardizing the Korean form. | English names a basilica; Korean follows that content with a transliteration. Japanese says a Nostra church/building, while Chinese contains an unrelated “Babelos potion” string. The source disagreement prevents treating any localized form as settled. | High |
| 31314 | `웬딩에서 쥐를 잔뜩 제공` for `rats provided by the Wending` | Confirm whether Wending is the supplier/organization and keep it distinct from a generic “way forward.” | English capitalizes Wending as the source of research rats. Japanese also treats it as a proper supplier; Chinese appears to misread it as a common phrase. Korean retains it as a name. | Medium |
| 31318 | `스카이스 법전에서 자신의 이름을 바꾸었다` for `altered his name in the Codex Scaith` | Preserve “altered/changed” rather than silently strengthening it to deletion; standardize the Codex and ritual-item terms. | English says Faitir altered his name; Korean follows this. Chinese says he erased it, while Japanese similarly says the name was changed. The line also names the Solemn Bell and Birth Candle ritual objects. | Medium |
| 31322 | `그월크마이` and `가게를 내가 물려받을 거야` | Align Gwalchmai's spelling with the historical provisional `그월흐마이`; check whether “I'll own Gwalchmai's” means his shop/business and avoid adding inheritance unless context supports it. | English leaves the possessed business/object implicit. Japanese and Chinese clarify it as a store/business; Korean supplies `가게` but further specifies inheriting it. The spelling differs from earlier Korean rows and historical notes. | High |
| 31323 | `그래, 뭐... 신들이 널 용서하시겠지` for `So, uh, the gods forgive you` | Keep the uncertain tone open: this could be hesitant reassurance, absolution, or sarcasm. | English hesitation (`So, uh`) and Japanese phrasing do not settle whether forgiveness is sincere. Korean retains hesitation but selects the future/predictive “will forgive.” Historical notes flag this line's tone. | Medium |
| 31327 | `초대받은 자` for `Beckoned` | Confirm whether this is a formal title/faction term and standardize it with other capitalized uses. | The source presents a standalone capitalized label. Korean reads it as a generic “invited person”; Japanese uses a title-like “the summoned,” and Chinese says “summoned.” | Medium |
| 31330 | Bleeding-resistance potion; Scarlet Flowstone (2), Ysa's Breath (2), Seaflax (1), Essence of Fate (1) | Retain the exact reagent identities, order, Alchemy Workbench, and quantities; standardize names against the recipe corpus. | Korean preserves all four ingredients and the 2/2/1/1 quantities, as well as the blank line and list structure. Localized reagent names differ across locales, so terminology remains a consistency question. | High |
| 31336 | `교차점` for `The Crossing` | Confirm whether this is the formal place/faction name or the ordinary noun “crossing”; standardize capitalization and rendering. | English capitalizes the term. Japanese reads it as a crossroads, Chinese uses an ordinary intersection, and Korean gives the same generic sense. | Medium |
| 31343 | `프로스트브레이크` for `the Frostbreak` | Confirm this as the named sea and align the Korean form with earlier `Frostbreak Sea` occurrences. | The line directly contrasts Frostbreak's tides with plains and hills. Historical entries treat `Frostbreak Sea` as a proper geographic name; Korean transliterates Frostbreak but omits an explicit Korean word for sea. | Medium |
| 31344 | `완벽한 미타란 확대 리벳` for `Flawless Mitharan Magnifying Rivets` | Confirm the named crafting-component category and standardize the Mitharan/Magnifying terms. | The source is a capitalized component name. Korean is a literal compound; the historical audit has not established a canonical item-category rendering. | Medium |
| 31347 | `운명의 결` for `the pattern` | Confirm whether `Pattern` is a formal fate/cosmology concept and preserve it consistently across this lore passage. | English says all mortal creatures have a place in the pattern. Korean interprets it as the weave of fate, a natural setting-based reading; Japanese/Chinese use more literal pattern terms. | Medium |

Rows 31302-31305, 31307-31313, 31315-31317, 31319-31321,
31324-31326, 31328-31329, 31331-31335, 31337-31342, 31345-31346,
31348-31350 generally retain the English meaning on this first reading.
Their names, register, fragments, and lore terms remain for the integrated
pass; no separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The historical source-keyed entry for IDs 31300-31399 was checked against
  this batch, including Basilica Gnostra, Wending, Solemn Bell/Codex
  Scaith/Birth Candle, Gwalchmai, Bloodbane/Crudok, reagent names, The
  Crossing, Scion, Frostbreak, Mitharan, and Pattern.
- At 31306, English is the meaning anchor but the Japanese/Chinese rows
  materially diverge; the active Korean follows English without claiming
  that its transliteration is canonical.
- The Gwalchmai spelling at 31322 is inconsistent with the earlier
  provisional Korean form. The report flags consistency without changing
  the active CSV or deciding whether the implied business is inherited.
- IDs 31318 and 31330 retain the English sense and item counts; the
  historical terminology questions remain open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31301-31350 once and in identical order.
- Embedded line-break counts, detected runtime-marker identities/order, and
  Unicode format-character signatures match across the four locales.
- ID 31330 preserves the recipe layout and values 2/2/1/1. ID 31329's
  five-year duration is retained.
- No CSV text or other source file was edited.

## Batch Status

IDs 31301-31350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31351.
