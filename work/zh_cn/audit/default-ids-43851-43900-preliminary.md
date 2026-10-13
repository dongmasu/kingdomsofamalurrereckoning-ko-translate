# Preliminary Language Scan: `default` IDs 43851-43900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43851-43900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43852, 43856 | Feverleaf; Invisible Ken / `피버리프(Feverleaf)`; `투명인간 켄(Invisible Ken)` | Confirm whether these are formal item/proper names and apply the approved Korean bilingual-name convention consistently. | English/Japanese leave Feverleaf untranslated; Korean adds the English form in parentheses. Invisible Ken's name is translated and bilingual-marked in Korean. Historical audit flags both. | Medium |
| 43860 | Prismere / `프리즘어` | Standardize the source material's canonical Korean name and keep its power-source relationship clear. | All locales retain the search for Prismere's power; phonetic/localized forms differ. | Medium |
| 43864 | “subterfuge is the name of the game” / `속임수가 승부를 좌우하지` | Preserve the idiom and the speaker's uncertainty about whether the player deliberately entered the trap. | Korean conveys deception as decisive in this contest and retains the final question. | High |
| 43865 | “to Sorcery Abilities” / `마법 능력으로` | Keep as a fragmentary menu/category label until its UI context confirms the intended Korean ending. | All locales contain an incomplete prepositional fragment; Korean preserves the direction/association rather than inventing a full sentence. | Medium |
| 43869 | Search Engar's Corpse / `엥가의 시신 수색` | Standardize Engar's name and use a consistent search/loot verb for objective labels. | Korean retains the explicit search action; name forms differ across locales. | Medium |
| 43870 | Three Lamps; Gray / `세 등불 여관`; `그레이` | Confirm whether Gray is a person, pet, or another named entity and keep the speaker's concern distinct from the inn remaining open. | Korean calls Gray `우리 그레이` without inferring identity. Historical notes explicitly leave Gray's identity unresolved. | High |
| 43871 | Freeze-potion effect / `적을 얼릴 확률이 일시적으로 50% 증가` | Restore the source meaning “temporarily grants a 50% chance to freeze attackers”; do not say an existing chance increases by 50%. | English/Japanese/Chinese state a temporary 50% chance to freeze enemies when attacked. Korean instead says the chance increases by 50%. Ingredients White Flake (2) and Edelweiss (1) are preserved. | High |
| 43875 | Hallam; Storyteller / `할람`; `이야기꾼` | Confirm whether Storyteller is a formal role/title and standardize the House of Ballads and ballad terminology. | Korean preserves Hallam's role in finding whoever corrupts the House's songs; historical audit flags Storyteller as a title. | Medium |
| 43877 | Hierophant / `대사제` | Standardize this formal religious title with other active-corpus occurrences. | English, Chinese, and Korean identify the same summoning authority; Japanese uses a different “guide” title. | Medium |
| 43881 | Sorrows / `비탄` | Confirm whether capitalized Sorrows names a force/place/faction or means generic sorrow; keep the instruction's subject and obligation clear. | Korean says Bisarane must find “sorrow”; Japanese/Chinese refer more explicitly to a sorrowful power. Prior batches leave the proper referent unresolved. | High |
| 43884 | Hroth Magnus; Arena; Detyre | Preserve the continuous memoir's sequence: the narrator killed Magnus in self-defense, the Arena prospered, and the narrator gained the life/power sought since childhood. | Korean retains the source's order and causal reasoning. The long passage is a single paragraph in all four locales; prior context remains relevant to its exact tone. | Medium |
| 43886-43887 | book binding; Aster Inheritence / `아스테르의 유산(Aster Inheritance)` | Retain the corrected conventional spelling only as a flagged source typo, and verify the item's canonical display name and parenthetical policy. | English spells the title `Inheritence`; Korean's English parenthetical silently corrects it to `Inheritance`. The binding line's source typo `stlil` is naturally corrected in Korean. | Medium |
| 43888 | leggings/rigging / `레깅스`; `삭구` | Confirm the established armor-slot term for leggings and retain that these garments are designed for movement while working rigging aboard large vessels. | Korean keeps the clothing and nautical purpose. Japanese omits the rigging detail; Chinese preserves it. | Medium |
| 43890 | “it's own village” / `천막촌은 거의 마을이나 다름없어` | Treat the English apostrophe as a source typo (`its`); retain the camp's mayor, warden, and self-proclaimed prophet. | Korean correctly renders the intended meaning without copying the source typo. | High |
| 43892 | litany / `연도문` | Confirm the established Korean religious/text term and preserve that reading the litany grants a shrine-like blessing. | Korean retains the reader and Faelands shrine comparison; Japanese describes a litany book, while English says “using this litany.” | Medium |
| 43893 | Dvergan treasures; Gallows End / `드베르가`; `갈로우스 엔드` | Standardize the people/item term and Gallows End spelling against the corpus-wide name inventory. | Korean preserves that Aubrey Gilcrest and the narrator located and claimed buried treasures across the island. Gallows End has multiple active Korean forms elsewhere. | Medium |

IDs 43851, 43853-43855, 43857-43859, 43861-43863, 43866-43868,
43872-43874, 43876, 43878-43880, 43882-43883, 43885, 43889, 43891,
43894-43899, and 43900 generally retain the English meaning on this first
reading. Names, item/UI terminology, and recurring setting terms remain
subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43850-43949 was checked.
  Applicable entries flag Feverleaf, Invisible Ken, Kandrian Guard, Alarane,
  Prismere, Three Lamps/Gray, Hallam/Storyteller, Hierophant, Sorrows, and
  Lykeios.
- The section covering 43884-43896 was checked for Hroth Magnus, Detyre,
  the source spelling `Aster Inheritence`, rigging, Dvergan, litany, and
  related passage context. Historical notes remain questions, not approval.
- Gallows End's spelling variance is part of the existing corpus-wide
  consistency issue.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43851-43900 once
  and in identical ascending order; each default CSV has 65,135 records.
- Line-break counts match across all locales. ID 43871's recipe has three
  newline separators, including the blank line between the effect and
  ingredients; ID 43884's memoir remains one paragraph in each locale.
- No runtime markers or hidden formatting characters were found in this
  range.
- The 50% effect and the ingredient quantities 2/1 match numerically, though
  the Korean effect wording changes probability semantics as noted above.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43851-43900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43901.
