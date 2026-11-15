# Sequential `default` Revalidation: IDs `29750`-`29999`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 60 ledger entries and added 190 IDs. Findings are proposals, not
  approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `29758` | Speech level / naturalness | Japanese is conversational, while Korean shifts from `그립군` to `바라`. Keep one natural plain-conversational register; avoid inferring a speaker. | Medium |
| `29770` | Name / format | The document label names `Motus Mining`, consistently rendered `모투스 광업(Motus Mining)` elsewhere. Add the pairing in this title, e.g. `모투스 광업(Motus Mining) 문서`. | High |
| `29774` | Text type / naturalness | This is a completed-quest journal entry, but Korean uses conversational endings (`도왔어`, `얻었지`) where English and Japanese use journal narration. Recast as concise journal prose without changing the quest outcome or the `Chariot` title. | High |
| `29791` | Name / terminology | English names the `longlegs`; Korean has unpaired `롱레그들`, while other rows vary between `롱레그` and `롱레그스`. Review the established form and add the English pairing locally; do not infer a broader alias or apply a global replacement from this row alone. | Medium |
| `29799` | Speech level / naturalness | The Korean shifts from `넘쳐나는군` to `받을게`; Japanese keeps a casual conversational tone. Smooth the opening into the same register. | Medium |
| `29801` | Name / format | The letter signature `Lord Gastyr` appears as `가스티르 경` without its source pairing. Add the complete title/name pairing, e.g. `가스티르 경(Lord Gastyr)`. | High |
| `29809` | Speech level / naturalness | `무사히 다녀오게` uses a marked `-게` ending not present in the simple Japanese farewell `良い旅を`. Use a less marked conversational blessing unless wider scene evidence supports this register. | Medium |
| `29811` | Name / format | `Tapestry of Fate` is rendered `운명의 태피스트리` without English, unlike the established paired form elsewhere. Add `(Tapestry of Fate)`. | High |
| `29842` | Name / format | The epithet and name `Kelgar the Black` are translated as `검은 켈가르` without the English pairing. Consider `검은 켈가르(Kelgar the Black)`. | High |
| `29867` | Speech level / naturalness | The Korean combines `관리하고 있네` with `내 일이야`, producing a marked register shift. Japanese describes the role in plain conversational language. Smooth the Korean into one conversational level. | Medium |
| `29878` | Speech level | Korean begins politely (`고마워요`) and switches to plain speech (`재배포할게요`) within one utterance. Japanese stays casual; use one consistent level without inferring the speaker. | High |
| `29888` | Name / format | The title `Witchknight Khleran` is rendered `마녀기사 클레란(Khleran)`; `Witchknight` lacks its English pairing. The term is paired elsewhere, so consider `마녀기사(Witchknight) 클레란(Khleran)`. | High |
| `29911` | Title / format | `Master Onesimos` is rendered `오네시모스(Onesimos) 사부`, leaving the English title detached. Pair the full source title and name, e.g. `오네시모스 사부(Master Onesimos)`. | High |
| `29939` | Name / format | `Bodan Aster's Grave` omits the English name pairing. Consider `보단 애스터(Bodan Aster)의 무덤`. | High |
| `29953` | Rank / name / format | `Private Eilis` appears as `이병 에일리스` without the English rank/name pairing. Pair the complete source label, e.g. `이병 에일리스(Private Eilis)`. | High |
| `29959` | Name / format | The named venue `Theater of Andronikos` is translated as `안드로니코스 극장` without an English pairing. Consider `안드로니코스 극장(Theater of Andronikos)`. | Medium-high |
| `29998` | Name / format | The key description pairs only the surname `Fel` and omits the named inn. Pair the full person name and venue: `레르카라 펠(Lerkaara Fel)` and `톨 핀트 여관(Tall Pint Inn)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `29826` | Meaning / terminology | The repeated phrase is consistent across seven exact-English rows, but its relationship to the Warsworn order and whether it is a title or descriptive phrase need a scoped terminology decision. Do not change or harmonize it by inference. |

## Earlier Findings Rechecked

- Retain existing candidates `29779`, `29805`, `29808`, `29824`, `29900`,
  `29917`, `29962`, and `29990`; their source fingerprints still match.
- `29753`, `29759`, `29766`, `29772`, `29777`, `29784`, `29785`, `29787`,
  `29788`, `29793`, `29798`, `29804`, `29816`, `29825`, `29827`, `29829`,
  `29841`, `29845`, `29853`, `29859`, `29882`, `29885`, `29889`, `29890`,
  `29893`, `29896`, `29910`, `29918`, `29923`, `29932`, `29935`, `29947`,
  `29949`, `29955`, `29957`, `29958`, `29960`, `29966`, `29969`, `29973`,
  `29977`, `29983`, `29985`, `29986`, `29992`, `29993`, `29994`, and
  `29995` remain not flagged after current-source comparison.
- `29839` names `Priestess Aurela` in English and Chinese, matching Korean;
  Japanese instead names `Korelon`. Treat this as a source discrepancy, not
  evidence for changing the Korean name.
- `29900` remains covered by the existing `The Big Hunt` name-consistency
  candidate, which compares IDs `29900`, `41905`, `47041`, `47200`, and
  `59258`.

## Repeated Sources And Structure

- Fifty-five exact-English duplicate groups touch this range (1,142 corpus
  rows). Korean wording matches within each group except `You have come.`:
  ID `14256` is `왔네요.` with Japanese `来ましたね`, while ID `29817` is
  `왔구나.` with Japanese `来たわね`. Preserve the register distinction.
- Runtime-token signatures match across all four languages.
- At ID `29868`, English, Japanese, and Korean each contain 23 embedded
  line breaks. Chinese contains 22: its third line of the first poem runs
  directly into the following prose. Korean follows the English/Japanese
  layout; no Korean line-break change is proposed.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, the ledger contains 39,213 of 65,135 unique IDs, leaving
25,922. Sequential coverage reaches ID `29999`; next: `30000`-`30249`.
