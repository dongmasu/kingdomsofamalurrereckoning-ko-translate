# Preliminary Language Scan: `default` IDs 30251-30300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30251-30300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30252, 30165 | `코일즈베인` / `코일스베인` for `Coilsbain` / `Coilsbane` | Resolve the English spelling conflict and standardize the location name only after confirming whether `Coilsbane` is a source typo or distinct term. | `Coilsbain` is repeated across the source corpus; `Coilsbane` also appears as an English variant. Korean forms vary (`코일즈베인`, `코일스베인`). Historical notes explicitly flag the conflict. | Medium |
| 30254 | `적 방어력 30% 감소`, `10% 확률로 공황 상태 유발` | Preserve the two-line effect, 30% Armor reduction, and separate 10% Panic chance; confirm canonical combat terms. | Korean retains both values and line break. All four locale records have matching structure and values. | High |
| 30258-30259 | `명예의 집(House of Accolades)`, `프라이드 가문` / `긍지의 수호자` | Keep House of Accolades distinct from House of Pride and standardize the latter's name and the Guardian of Pride title. | Korean distinguishes the places, but renders Accolades semantically and Pride phonetically while translating “Guardian of Pride.” English capitalization indicates named houses/titles. Historical notes ask whether the two houses are distinct. | Medium |
| 30263 | `Senior Director of Advertising & Media` | Confirm whether this credits/UI label should remain English or be localized for Korean. | English and Japanese retain the English title; Chinese translates it, while Korean leaves it unchanged. It may be a credit rather than player-facing dialogue, so no correction is assumed. | Medium |
| 30265 | Nera Red-Hand / Tine Delfric / Garreth Rill | Standardize the names and preserve the chronology: Nera was driven from the caves years ago; earlier, Tine pursued Garreth inside. | Korean retains the sequence and pursuit. The other locales use different spellings; Chinese diverges more substantially on Nera and Garreth. | Medium |
| 30268 | `겨울 페이`, `투아사`, `프리즈미어의 표식`, “힘은 커졌지만 오히려 쇠퇴했다” | Clarify whether “they are diminished” refers to the Tuatha's numbers, nature, or strength while preserving the contrast with their growing power. | Korean says their power grew but they declined. Chinese explicitly says they are perishing; Japanese says they are declining. The English intentionally contrasts increased power with diminishment, but leaves the dimension unstated. | Medium |
| 30269 | `스콜리아 아르카나(Scholia Arcana)` | Confirm the canonical Korean organization name and bilingual display convention. | Korean transliterates the academy/order; Japanese and Chinese translate the institution name. Historical context flags institutional terminology. | Medium |
| 30278 | `발라드 가문` for `House of Ballads` | Standardize the faction/place name and distinguish a House from a family where the setting uses the formal institution. | Korean semantically renders the proper name; Japanese transliterates and Chinese uses a literal “Ballad House.” | Medium |
| 30279 | `나무에서 씨앗이 날려 오듯` for `like the seedlings from the trees` | Preserve the image of magic drifting away and clarify the intended seedling/seed relation without replacing the source metaphor with an unrelated one. | Korean turns the image into seeds blowing from trees. English and Chinese refer to seedlings; Japanese instead describes a parasitic plant drawing life from its host. The source image itself is unusual. | Medium |
| 30282 | `우리 조직` for `our order` | Confirm the named organization's canonical label and retain the formal invitation to join it. | Korean conveys the observation period and invitation. The capitalized English `order` may be a specific organization; Japanese says companions and Chinese says academy. | Medium |
| 30283 | `시종` for `The Page` | Confirm whether Page is a rank/card title or a servant role; retain the project glossary form once the sense is established. | Korean uses the conventional “page”/attendant sense. Chinese and Japanese use a generic page label. Historical notes explicitly ask whether this is a card/rank title. | Medium |
| 30289 | `Gsrh rh mlg Zwvhhz.` | Decide how to localize the encoded puzzle while preserving its gameplay function; do not silently decode or leave untranslated without a convention. | Atbash decoding yields “This is not Adessa.” English keeps the cipher, Japanese substitutes a different encoded string, Chinese renders a garbled/semantic text, and Korean copies the English cipher unchanged. This is a puzzle-localization question, not an ordinary sentence comparison. | Medium |
| 30292 | `그 배불뚝이는` for `Bloated fool` | Check whether the insult is figurative (“puffed-up/arrogant fool”) rather than a comment on body size; preserve the speaker's contempt. | Korean chooses a literal potbelly reading. Japanese calls the person arrogant, and Chinese says conceited fool, supporting a figurative reading. | Medium |
| 30294 | malformed English `every few moments my a mortal` | Preserve the intended meaning of repeatedly being pestered by a mortal who wants to become Fae, using Japanese as clarification rather than copying the typo. | Korean's “시도 때도 없이 ... 들쑤시는” conveys repeated pestering. Japanese confirms the intended relation; English is grammatically malformed. Historical notes flag the source error. | High |
| 30298 | `코널 일병(Private Cornall)`, `케일드 해안`, `시워치` | Standardize the soldier's rank and the people/place names; preserve the condition that another soldier must take command before Erion returns to Seawatch. | Korean retains the condition and role. Other locale spellings differ; historical notes explicitly flag Phasmer Humm/Private Cornall and related terms. | Medium |
| 30300 | Alchemy Workbench recipe / Scarab Salts (3), Star Thistle (2), Scarwood Bark (1) | Standardize reagent names and preserve the magic-critical-hit effect, all three values, and blank-line layout. | Korean retains the recipe meaning and quantities 3/2/1. The English/Japanese/Chinese ingredient renderings differ. | Medium |

Rows 30251, 30253, 30255-30257, 30260-30262, 30264, 30266-30267,
30270-30277, 30280-30281, 30284-30288, 30290-30291, 30293,
30295-30297, and 30299 generally retain the English meaning. Their names,
register, fragments, terminology, and game context remain for the integrated
pass; no separate high-confidence wording candidate was identified in this
first reading.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30200-30299 flags Arena rewards,
  Aether Splinter, Sagecraft Altars, Sorrows, Felltown, Canneroc, the Houses
  of Accolades and Pride, Coilsbane, Niskaru, Phasmer Humm, Caeled Coast,
  and Seawatch. These were checked against this batch where present.
- The narrower historical set flags Simonides, Sorrows, Counsel, Coilsbane,
  House titles, Phasmer Humm, and Private Cornall. The Coilsbane spelling,
  House distinction, Page title, and soldier/place names remain open; no
  prior question was treated as an approved correction.
- The source-keyed historical entry for IDs 30300-30399 covers the Alchemy
  Workbench recipe at 30300. The Korean recipe values and layout were checked
  against the other three locales.
- The source grammar error at 30294 and encoded puzzle at 30289 are recorded
  as source/localization questions, not confirmed Korean defects.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30251-30300 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales.
- The combat effect at 30254 retains 30% and 10%; the recipe at 30300
  retains quantities 3, 2, and 1 and matching blank-line structure.
- No Korean structural exception or unexpected Unicode format-character
  discrepancy was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30251-30300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30301.
