# Preliminary Language Scan: `default` IDs 6100-6149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6100-6149.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6100 | `Scholia Arcana` → `스콜리아 아르카나` | Preserve the organization name, but decide consistently whether its first occurrence should carry `(Scholia Arcana)` and whether the established Korean form is a faction, academy, or both. | English calls it an organization of mages; Japanese uses “Arcana University,” while Chinese uses “Arcane Academy.” The Korean name is already widely used in the active corpus. | Medium |
| 6107 | `love of King Wencen` → `연인` | Confirm whether Belmaid is a lover, consort, or spouse; keep the House of Ballads title consistent. | English, Japanese, and Chinese all indicate a romantic relationship but do not establish a formal marital status. | Medium |
| 6109 | `No questions asked` → `출처는 묻지 않아` | Check whether the source specifically means not asking where goods came from, or more generally not asking questions. | English and Japanese are general; Chinese says not to ask more. Korean narrows this to asking about provenance, plausibly inferred from the buying/selling context. | Medium |
| 6119 | `You could not be overlooked` → `누구도 널 못 보고 지나치진 못할 거야` | Keep the addressee/tower relation open; clarify whether the tower makes the addressee conspicuous or the line shifts from the tower to the listener. | English moves from a visible tower to “you”; Japanese and Chinese also address the listener, but the logical relation remains unclear. | Medium |
| 6122 | `Forum` → `광장` | Recheck against the project's `포럼(Forum)` usage and whether this Adessa landmark is a civic/council center rather than an open plaza. | English calls it Adessa's center; Japanese says `評議院` (council) and Chinese says `议事堂` (assembly hall). `광장` selects a narrower physical-plaza sense not established by the references. | Medium |
| 6125 | `uncle's footlocker` → `삼촌의 발밑 궤짝` | Candidate correction: remove `발밑`; `footlocker` is a personal storage trunk, not a box located at someone's feet. Also avoid fixing the speaker's gender through `형` unless dialogue context confirms it. | English means the older brother taught a sleight-of-hand trick to steal ale from their uncle's footlocker. Japanese interprets the skill as lockpicking; Chinese uses a generic cabinet. Korean's `발밑 궤짝` is a literal misparse and reads unnaturally. | High |
| 6132 | `Century Flowers` → `세기꽃` | Confirm whether this is a named flower/species or a descriptive “century flower”; the current compound is unnatural Korean and may be a mistranslation of a proper name. | English/Japanese/Chinese agree on the flower name and blooming objective, but do not settle the Korean naming convention. | Medium |
| 6137 | `Moon Camp` → `달 캠프` | Standardize with the established in-corpus forms `달 야영지`, `달빛 야영지`, and transliterated `문 캠프`; do not normalize until the project name convention is decided. | This UI label uses `달 캠프`, while multiple active rows call the same place `달 야영지` or `문 캠프(Moon Camp)`. This is a clear cross-row consistency issue. | High |
| 6146 | `Traveler` → `여행자(Traveler)` | Confirm whether this is the named Travelers organization and retain the evidence that Lina is implicated in a cover-up, not necessarily personally shown to have poisoned anyone. | English says the document appears to implicate her in a cover-up involving poisoning. Japanese says she was involved in concealment; Chinese also uses a Traveler title. Korean preserves the uncertainty with `연루된 듯하다`. | Medium |
| 6148 | `beneath the finery and heavy pockets` → `화려한 옷차림과 두둑한 주머니 밑바닥을 보면` | Rephrase during a later approved edit to express that beneath his finery and wealth he is an ordinary criminal; the current Korean image is awkward and difficult to parse. | English and the Japanese/Chinese references contrast an outwardly wealthy appearance with his criminal nature. Korean's `주머니 밑바닥` creates an unintended physical image. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6100, 6104, 6107-6108,
  6117, 6119, 6122, 6125, 6127, 6129-6131, 6143, and 6146 against active
  Korean and matching source rows.
- The nested runtime marker at ID 6104 is unchanged in all four locales.
- Existing name, organization, and venue questions remain candidates; the
  historical notes do not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts, brace-delimited runtime-marker identities, and
  numeric sequences match across all four locales in this range.
- The nested `{*2{1} {2}}` marker at ID 6104 is identical in every locale.
- No active CSV structure or text was changed.

## Batch Status

IDs 6100-6149 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
