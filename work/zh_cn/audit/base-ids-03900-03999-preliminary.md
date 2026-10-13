# Preliminary Language Scan: `base` IDs 3900-3999

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 3900-3999.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for disputed terms and reconciled historical
  `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3900 | 장인의 곡괭이 | Confirm whether `Pick` is a mining pick and whether `Master` should be the same crafting tier used elsewhere. | English and Japanese support a pick/pickaxe reading; the historical audit notes possible tool ambiguity. Chinese does not clarify it. Korean is plausible, but tier consistency remains open. | Medium |
| 3918 | 농부의 머리 | Determine whether this is a literal item label or an abbreviated clothing/asset label before treating it as a body part. | This repeats the historical question. English, Japanese, and Chinese all literally say a peasant/farmer's head, but no inventory context establishes whether that is intended. | Medium |
| 3924 | 척추(The Spine) | Confirm whether `The Spine` is a named location/object or a literal anatomical spine. | The capitalized English and Japanese transliteration support a proper-name possibility; Chinese translates it literally. The current Korean preserves the English in parentheses but commits to the anatomical meaning. | Medium |
| 3930, 3937 | 세이블(Sable)의 서신(봉인됨) / 세이블(Sable)의 서신 | Resolve whether `Sable` is a person/faction/name or a descriptive color/seal reference. | These repeat the historical paired question. Japanese/Chinese describe a black-seal book/scroll, while English says missives of Sable. Korean assumes Sable is a name and `Missives` are letters. | Medium |
| 3957 | 백금 수호자 | Identify whether `Guard` means armor, shield, crafting blank, or a defensive effect; translate rather than leave the item label in English. | English and Japanese leave the phrase untranslated, but Chinese and European locales translate it as platinum guard/protection; Russian identifies a shield blank. The current Korean transliterates neither term and remains exactly `Platinum Guard`. | High |
| 3960 | 비탄의 책 | Confirm whether `Sorrows` names the House/faction and whether the book title refers to that institution. | This repeats the historical question. English capitalization and the in-world House of Sorrows support a proper-name reading; Japanese/Chinese quote or literalize “Sorrows.” Korean chooses the generic emotional reading. | Medium |
| 3967 | 아르카나 학회 대현자에게 보내는 편지 | Check the established Korean institution and rank terms for `Scholia Arcana` and `Archsage`. | Japanese identifies the same named order/university and senior title. Korean is understandable, but the institution and rank should follow the eventual corpus glossary rather than vary by row. | Medium |
| 3977 | 개량된 번영의 끈 | Preserve the likely intended sense while retaining the source typo in the audit. | English misspells `Prosperous` as `Properous`; Japanese transliterates the source form. Korean follows the apparent intended meaning, which is plausible but should remain documented as a source correction. | Medium |
| 3980 | 후계자의 길 | Decide whether `Scion` is the formal Cape Solace office/title or a generic heir/descendant in this item name. | Japanese transliterates `Scion`, while English/Chinese can be read generically. Korean `후계자` is plausible but adds another rendering to the corpus-wide `Scion` inconsistency. | Medium |
| 3988 | 숨겨진 상자 | Check whether `Hidden Well Cache` refers to a cache at a named “Hidden Well” or simply a hidden cache. | Japanese and Chinese shorten this to “hidden box,” while English contains `Well`. Korean follows those supporting locales and may omit a location element from the English label. | Medium |
| 3997 | 아주라이트 증식 | Determine whether `Growth` means a mineral deposit/formation or growth itself. | Japanese describes an accumulation/deposit; Chinese and English retain a growth reading. Korean `증식` can imply multiplication and may not describe a mineral resource naturally. | Medium |
| 3998 | Overturned Wagon | Translate this player-facing label or confirm that leaving it in English is intentional. | English and Japanese both retain the source phrase, but Chinese and every checked European/Russian sibling locale translate “overturned wagon/cart.” The active Korean is untranslated and the meaning is clear. | High |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 3900, 3905, 3918, 3924,
  3930/3937, 3935, 3957-3958, 3960, 3966-3967, 3972, 3974, 3976-3977,
  3983, 3989, and 3996-3997 against the active Korean and source locales.
  The item-type, proper-name, rank, and source-typo questions remain open or
  provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` item/location rows.

## Other Checks

- ID 3931 is translated into Korean even though English and Japanese leave
  `Dverga map - Northern Coast` in English; sibling locales also translate
  the label, so it is not counted as an untranslated Korean row.
- Several proper names still alternate between a Hangul-only form and
  `한글(English)`; this remains a corpus-wide display-convention question.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 3900-3999 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
