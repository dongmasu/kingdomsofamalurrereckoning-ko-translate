# Sequential `default` Revalidation: IDs `30500`-`30749`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 69 existing ledger entries and added 181 IDs. Findings are
  proposals, not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `30537` | Name / format | `Forum` is the named seat of government. Korean `포럼` lacks the source pairing; consider `포럼(Forum)` so it is clear this is a named place, not a general forum. | Medium-high |
| `30550` | Meaning | English says letters were left at the narrator's `mail table`; Korean says `우편함`, which normally means a mailbox. The Chinese also says they were left on a table. Use wording for a table or surface where mail is placed, not a mailbox. | High |
| `30563` | Title / format | `Lord Callor` is rendered `칼로르 경` without its English title/name pairing. Add `칼로르 경(Lord Callor)`. | High |
| `30604` | Name / format | The objective `Speak to Alma` omits the English name pairing. Add `알마(Alma)` in the objective. | High |
| `30613` | Title / format | `Maire, Queen of Cups` is rendered `컵의 여왕 메어(Maire)`, leaving the title unpaired. Pair the full source label, e.g. `컵의 여왕 메어(Maire, Queen of Cups)`. | High |
| `30614` | Name / format | The artisan `Skarsgard Bellum` is rendered only in Korean. Add the English name pairing. | High |
| `30631` | Title / format | `Master Mcleod` is rendered `맥클라우드(Mcleod) 선생님`, detaching the English title from the name. Pair the full source label without changing the established Korean honorific. | Medium-high |
| `30659` | Name / format | `Breca's Vigil Fighter` is a named item label but appears as `브레카의 파수 전사` without English. Add the full source pairing. | Medium-high |
| `30681` | Title / format | The objective `Confront Adept Ignas` renders the name and role only in Korean. Pair the full source label, while retaining the established rendering of `Adept`. | Medium-high |
| `30682` | Rank / format | `Private Cassi` is rendered `캐시 일병` without the source rank/name pairing. Add `캐시 일병(Private Cassi)`. | High |
| `30695` | Name / format | English spells the item `Echo Stone`, but Korean pairs `에코스톤` with `Echostone`. Keep the standardized Korean term and make the parenthetical match this row's exact source spelling. | High |
| `30713` | Meaning / terminology | `Hollow of Cathrus` is rendered `캐스러스의 움푹한 곳`, which is awkward as a location and obscures the place name. Japanese and Chinese identify it as a cave; consider a natural cave name with the full English pairing. | Medium-high |
| `30741` | Meaning | English refers to multiple `notices`, while Korean says `이 통지서` singular. Preserve the plural, e.g. `이 통지서들을`. | High |
| `30744` | Title / format | `high priestess Corina Graf` appears as `대사제 코리나 그라프` without English. Pair the complete rank and name. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `30663` | Terminology / format | The poem uses `Chausses of the Faehunter`; Korean has `페이 사냥꾼(Faehunter)의 각반`. The user's `Leggings` → `레깅스` decision may or may not cover this distinct source garment term. Do not conflate them without resolving the glossary scope. |
| `30718` | Meaning | English says `go to Hystis`, while Japanese says to go meet Hystis and Chinese says simply to go there. Korean adds `만나러`, but the available row does not establish whether Hystis is a person or a place. |

## Earlier Findings Rechecked

- Retain existing candidates `30588`, `30599`, `30637`, and `30731`; their
  four-language fingerprints still match.
- `Darkvari` remains consistently rendered as `다크바리 가문(Darkvari)` at
  IDs `30533` and `30620`; no additional change is proposed from this range.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

## Repeated Sources And Structure

- One exact-English duplicate group touches this range: `Goodbye.` (`30541`,
  `30557`). Korean wording matches.
- Runtime-token signatures match across all four languages.
- At `30744`, English and Korean have eight embedded line breaks; Japanese
  and Chinese have eleven. Korean follows the English layout.

After this range, the ledger contains 39,750 of 65,135 unique IDs, leaving
25,385. Sequential coverage reaches ID `30749`; next: `30750`-`30999`.
