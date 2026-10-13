# Preliminary Language Scan: `default` IDs 44151-44200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44151-44200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44154, 44165, 44192, 44195 | Scion / `사이온` | Keep the office/title distinct from generic “descendant” and standardize it with established Korean usage. | English repeatedly uses capitalized `Scion`; the Korean consistently transliterates it here. Chinese substitutes `司祭` (“priest”) in 44154 and 44165, while English and Japanese support the Scion title. | Medium |
| 44156 | Great Cycle / `위대한 순환` | Confirm the canonical Korean form for this named cosmological cycle. | The passage describes death and rebirth and names the Great Cycle; all locales retain that return/rebirth idea but render the title differently. | Medium |
| 44157 | “My liege.” / `전하.` | Confirm the speaker's rank relationship and avoid implying royal status unless context supports it. | English and Chinese use a liege/lord address; Japanese says `我が主`. Korean `전하` is specifically royal, repeating the concern noted at 44011. | Medium |
| 44161 | “looking like a fishwife” / `생선 장수 아낙처럼` | Recheck the idiom; an insulting or unrefined appearance is more likely than resemblance to a fish seller. | English `fishwife` is an insult in this comparison. Japanese describes disrespectful/uncouth appearance and Chinese uses `泼妇` (“shrew”); Korean may be read as a literal occupation. | High |
| 44167 | Sworn to War / `전쟁의 서약자 워스원` | Confirm whether this is the formal Warsworn faction/title and standardize it. | English capitalizes `Sworn to War`; Japanese identifies Eamonn as becoming Warsworn. Korean retains both a descriptive translation and a transliteration, which may be redundant or noncanonical. | Medium |
| 44170 | Cillian / `킬리언` | Standardize the character spelling with other Cillian references. | English spells the name `Cillian`; Japanese and Chinese transliterations differ, and historical notes include Cillian among names requiring canonical forms. | Medium |
| 44180 | Idylla community board / `사소한 일`; `게시판` | Confirm whether the board's “smaller items of inquiry or aid” are minor quests/tasks and use the established UI term. | Korean conveys that residents need investigation or help and that the board enables assistance; the precise board/task category remains a terminology question. | Low |
| 44181 | Armor Salvaged / `방어구 분해 완료` | Confirm whether this UI/status means armor was dismantled for materials or recovered as salvage. | English is a compact status fragment; Korean commits to dismantling, while the exact gameplay action is not recoverable from this row alone. | Medium |
| 44189 | “fled the House” / `가문을 떠났지` | Determine whether `House` denotes a named Fae House/faction here rather than a family household. | English capitalizes `House`, and the surrounding plot concerns a conspiracy. Korean's `가문` may imply family; historical notes leave the exact House referent open. | Medium |
| 44190 | Traveler / `여행자(Traveler)` | Align this faction label with the project's display and bilingual-name convention. | Meaning is preserved, but this occurrence uses an English parenthetical while related faction references vary in form. No global normalization is implied. | Low |
| 44194 | Gallows Tree / `교수대 나무` | Confirm the canonical setting name and distinguish the named tree from a generic gallows. | The source uses a capitalized proper name. Korean is a literal form among several active variants documented in the audit; no canonical form is approved here. | Medium |
| 44195 | “take Akara's power” / `아카라의 힘을 차지하고` | Check whether the verb implies seizing power more strongly than the source's `take`. | English and Japanese say to take/carry away the power; Chinese says obtain it. Korean's `차지하다` can imply claiming or usurping it. | Medium |
| 44200 | “crimes that you've levied against Templar Octienne” / `네가 성전기사 옥티엔에게 저지른 범죄` | Recheck the agent: the likely meaning is accusations/charges you brought against Octienne, not crimes you committed against him. | Japanese says the crimes you refer to regarding Octienne; Chinese explicitly says crimes you accused him of committing. Korean instead makes the player the perpetrator against Octienne, reversing the likely source relation. | High |

IDs 44152-44153, 44155, 44158-44160, 44162-44166, 44168-44169,
44171-44179, 44182-44188, 44191-44193, and 44196-44199 generally retain
the English meaning on this first reading. Names, the Great Cycle, UI labels,
and lore terms remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 44150-44249 was checked for
  Belt of Fluidity, Finna, Payne, Great Cycle, Laboratories in the Walls and
  Basilica, Eamonn/Sworn to War, Alder Malloi, Cillian, Hyperian Temple,
  Anira, the Idylla board, Saturnyn, Scion/Akara, Tari Holstig, Castellan,
  Gallows Tree, and the 44199 Average marker.
- The historical notes explicitly leave canonical names, Great Cycle and
  institution terms, the Scion/Akara relationship, and rank/faction meanings
  open. The likely 44200 agency reversal was checked against all three
  references and remains a preliminary candidate.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44151-44200 once
  and in identical ascending order.
- All selected rows have zero embedded line breaks; no hidden formatting
  characters were detected.
- ID 44199 retains the `{*2...}` runtime marker and localized `Average`
  payload. The three-reagent count at 44152 and three-weapons reference at
  44187 are preserved.
- No other numeric-value or runtime-marker discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44151-44200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44201.
