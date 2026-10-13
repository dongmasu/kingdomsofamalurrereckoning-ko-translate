# Preliminary Language Scan: `base` IDs 3000-3099

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 3000-3099.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked related proper-name and terminology candidates.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3019 | 대현자 칼레두스(Archsage Caledus)의 편지 | Confirm the established Korean form and spelling of `Caledus`. | English supplies the name `Caledus`; Japanese and Chinese use materially different phonetic forms. Korean follows a plausible English-based transliteration but should be checked against other appearances and the project naming convention. | Low |
| 3025, 3035 | 드베르간(Dvergan) 에메랄드 / 드베르간 정강이받이 | Reconcile the `Dverga`/`Dvergan` forms and decide when to retain the English spelling in parentheses. | These are the same language/people-derived name in an adjective and noun form. Korean transliteration is compatible, but bilingual marking is inconsistent between the two entries. | Medium |
| 3066 | 죽음갓 | Recheck the item name `Death Cap` as a named mushroom/item rather than a literal compound. | English uses the established name of a poisonous mushroom; Japanese transliterates it and Chinese uses a literal death/hat compound. Korean `죽음갓` can be misread as “death god” and is not a natural Korean item name. Confirm the in-game object before choosing a Korean form. | High |
| 3068 | 교수대 끝자락(Gallows End)의 돌 | Treat `Gallows End` as a proper place name and reconcile this literal rendering with the corpus-wide naming decision. | This adds another form to the documented mix of transliterations and literal translations. English, Japanese, and Chinese identify the same named location; do not normalize the row in isolation. | High |
| 3075, 3081 | 하급 보석 장식 곤봉 | Confirm the canonical item term and source/reference alignment for `Minor Jeweled Shilelagh` / `Minor Jeweled Shillelagh`. | English has a one-letter spelling difference between the two IDs; Chinese describes a club-like object, while Japanese calls it a wand/staff of guidance. Korean gives both IDs the same generic club rendering. The object and source-text relationship remain uncertain. | Medium |
| 3092 | 하우스 오브 발라드(House of Ballads) 반지 | Align the display of `House of Ballads` with the competing `발라드 가문` form. | The current transliteration-plus-English form differs from semantic forms used elsewhere in the active corpus. This is a terminology/display consistency issue, not a row-local correction. | Medium |

## Other Checks

- The historical source-keyed audit questions for IDs 3001, 3009, 3028, 3032,
  3041, 3043, 3044, 3056, 3061, 3064, 3075/3081, 3080, 3083, 3088, 3089,
  and 3095 were checked against these active rows. They remain open; the
  relevant `Steeled Curtain`, shillelagh, `Court of Enchantments`, `Lowest
  Stone`, and `Disintigrated` questions are reiterated above or below.
- ID 3007's `Tormenting Bindings` and IDs 3020/3023's `Energizing` and
  `Sustaining Bindings` retain distinct modifier meanings.
- ID 3032's English `Greater Steeled Curtain` differs from Japanese's
  medium-grade steel-curtain label; Korean follows the English/Chinese
  high-grade reading.
- IDs 3049 and 3083 preserve the English/Chinese references for `Gardens of
  Ysa` and `Court of Enchantments`; Japanese renders the latter as a palace
  of blessing, so retain that source difference for context.
- ID 3071 `Sceptre` is rendered as `홀`; IDs 3037-3038 retain the bow-string
  equipment sense.
- The remaining inspected rows preserve their principal item, location, and
  name meanings. No structure or target keys were changed.

## Batch Status

IDs 3000-3099 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
