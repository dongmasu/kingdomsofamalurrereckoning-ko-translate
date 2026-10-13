# Preliminary Language Scan: `default` IDs 11950-11999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11950-11999.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11950 | City Watch / Quays → `도시 경비대` / `부두` | Check whether City Watch and Quays are formal institution/district names and align their Korean forms with corpus usage. | Korean conveys the immediate meaning. Japanese uses a generic guard term and “wharf,” while Chinese diverges on City Watch; the English capitalization may indicate established proper names. Historical notes already flag both terms. | Medium |
| 11954 | `we had our beloved Nina` → `사랑하는 니나를 얻었어` | Clarify that Nina was born to the couple, rather than merely acquired or encountered. | English idiom `had our ... Nina` is compatible with having a child; Japanese explicitly says Nina was born, and the life-history context supports that reading. Korean's `얻었어` obscures it. | High |
| 11958 | `Are you Sworn to War?` → `전쟁맹세단(War Sworn)에 서약할 텐가?` | Determine whether this asks about membership in the Warsworn faction or a literal oath to battle; align the established faction/title form. | English capitalizes the phrase and Japanese directly asks whether the addressee will become Warsworn. Chinese and Korean use oath wording. Historical notes already flag the faction/title question. | Medium |
| 11964 | `Understyle` → `언더스타일(Understyle)` | Confirm whether this is a named region or a generic description of an underground garden/location. | English capitalization and Korean transliteration support a proper-name reading; Chinese translates it descriptively and does not resolve the referent. Historical notes already flag it. | Medium |
| 11971 | `Encyclopedia Magicka` / lesser and greater categories | Verify the book/title form and clarify the dense comparison between superficial differences and the items' practical category. | Korean retains the three paragraphs and the stated lesser/greater/cursed structure. The source itself describes the category distinction awkwardly; Japanese and Chinese do not fully resolve its logic. Historical notes already flag this passage. | Medium |
| 11978 | `FAILURE LINE` → `실패 문구` | Determine whether this is an internal developer/test placeholder or visible content before deciding whether to translate it. | English and Japanese preserve the exact English label, Chinese translates it as a fault line, and Korean renders “failure text.” The row has no player-facing context. Historical notes already flag it. | Low |
| 11980 | `make it as a Hireling` → `고용병으로 두각을 나타내면` | Clarify whether the condition means becoming/qualifying as a Hireling or distinguishing oneself after joining. | Korean chooses “distinguish oneself”; Japanese gives a specific mercenary-rank reading, while Chinese reads it as becoming a Hireling. The short sentence lacks context to settle the recruitment progression. | Medium |
| 11986 | `The Hierophant` → `대사제` | Align this title with the project's unresolved Hierophant terminology and determine whether it denotes an office, person, or UI label here. | The isolated capitalized title supports a proper office/name reading but does not establish the canonical Korean form. | Medium |
| 11990 | `All of this was lost on the Fae` → `페이들은 그 제안을 전혀 받아들이지 않았지` | Avoid asserting that the Fae rejected the proposal unless context confirms it; clarify whether “lost on” means they failed to understand or did not care about the shared-shop idea. | English implies the proposal did not register with the Fae, but does not explicitly say they rejected it. Korean states that they did not accept it; Japanese/Chinese likewise offer interpretive paraphrases. | Medium |
| 11992 | `Place the Bloom Atop the Altar` → `블룸(Bloom)을 제단 위에 올려놓아라` | Determine whether Bloom is a flower, artifact, named object, or the item indicated by the Chinese reference's “Bloom ring” reading. | English capitalization suggests a named object but supplies no type. Chinese explicitly adds “ring”; Korean transliterates the name without a type. Historical notes already flag the referent. | Medium |
| 11996 | `A likely story` → `참 그럴듯한 이야기네` | Confirm the sarcastic force and whether “games” names a particular tournament. | Korean reads naturally as skeptical sarcasm and retains the escaped-Barghest explanation. Japanese uses a similar skeptical phrase; the source context does not identify the event more precisely. Historical notes already flag it. | Medium |
| 11999 | Six-day diary: Seelie/Unseelie, Maid, House of Ballads, pronouns | Align recurring faction/title/place names and preserve the day sequence; verify the singular `it` in Day 5 and the shifting `they` references. | Korean retains all six day entries and the five source line breaks. Some forms are selectively bilingual; Day 5 renders singular `it` as plural `놈들이`, and the long passage contains corpus-wide Maid/Court/House terms. Historical notes already flag these questions. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11950, 11958, 11964, 11971, 11978,
  11992, 11996, and 11999 against the active Korean and all three source
  locales. They remain open; historical notes were treated as evidence, not
  approval.
- ID 11954 and ID 11990 are additional candidates found in the current
  English/Japanese/Korean comparison.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and runtime-token sequences match
  across all four locales in this range. No structural exception was found.
- Proper-name parenthetical use in the long diary is selective; this remains
  a consistency question, not a request for global normalization.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 11950-11999 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12000-12049.
