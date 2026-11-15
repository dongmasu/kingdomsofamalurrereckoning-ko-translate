# Candidate Reconciliation: IDs `37250`-`37499`

- Date: 2026-11-14.
- Rechecked all 23 in-range candidates against English, Japanese, Chinese,
  the active Korean CSV, and prior decisions.
- Rechecked linked consistency rows for `First Sword`, `Storyteller`, and
  `Notice of Duty`. Only linked candidate `41418` was added to the candidate
  subtotal; other linked rows were terminology checks, not new candidates.
- English anchored meaning; Japanese guided style and register; Chinese
  provided supporting evidence. Asset associations were not used to infer
  individual speakers or playback order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `37261` | Corrected | Recast the contract-failure journal entry in plain `-다` narration, consistent with its Japanese source and the surrounding journal style; no speaker was assigned. |
| `37268` | Confirmed | The active Korean already uses `에린(Ereen)` and retains the source's comic `talk my ears off` exaggeration. |
| `37274` | Corrected title retained; meaning held | The current title uses the full `Nil "The White" Kern` pairing. Preserve all eight line breaks; the malformed source clauses and their conflicting locale interpretations remain unresolved. |
| `37275` | Held | The source's lowercase `gorta` and relationship to `Faer Gorta` do not establish a canonical Korean lore spelling or capitalization. |
| `37286` | Confirmed | The active Korean pairs `타인힐(Tinehil)` and `처형인(Headsman)`; no speaker was inferred. |
| `37303` | Corrected | Rendered the objective `Follow Telogrus` in the established concise action form `텔로그루스(Telogrus) 따라가기`. |
| `37310` | Corrected | Paired the named possessive fragment as `가스티르(Gastyr)의`, without expanding the incomplete source label. |
| `37312` | Corrected | Paired `Lir` as `리르(Lir)`; the English, Japanese, and Chinese identify him as the Lord of the already-paired Blackened Hall. |
| `37333` | Corrected | Added `브락시스(Braxis)` while preserving the account of House Gastyr's fall and the hidden royal fortunes. |
| `37334` | Corrected | Completed the item label as `꽃망울 반지(Bloom Ring) 획득하기`, matching the source objective and action-label style. |
| `37343` | Confirmed | The active Korean already pairs `매딩 윈드(Madding Wind)` in the prison name. |
| `37360` | Corrected | Replaced the awkward repeated `그랬어` calque with natural rough speech, retaining the gallows, madness, and pirate-king blame. |
| `37367` | Corrected | Rendered the established Alfar rank as `제일검(First Sword)` and paired Bronwen Senn separately. |
| `37387` | Corrected | Recast the awkward `미래의 복잡한 짜임` as a natural image of a complexly entangled future while retaining the weave metaphor. |
| `37400` | Corrected | Paired the complete label as `굿차일드 저택(Goodchild Estate)`; Japanese `屋敷` and Chinese `宅邸` support `저택`. |
| `37404` | Format corrected; title status held | Paired the complete source as `위도우의 행차(The Widow Walks)`. The isolated key does not establish whether it is a title, quest, or ordinary phrase. |
| `37417` | Corrected | Paired the named role as `이야기꾼(Storyteller)` while retaining the line's existing register and meaning. |
| `37421` | Confirmed | The active Korean already clarifies codes engraved on both daggers' and swords' blades and avoids the earlier awkward search wording. |
| `37436` | Confirmed | The active Korean already pairs `처형인(Headsman)`. |
| `37473` | Confirmed | The active Korean already pairs `그레이트 스파인(Great Spine)` and `잉그레스 동굴(Caverns of Ingress)`. |
| `37486` | Confirmed | The active Korean already uses the established equipment term `버클러` for `buckler`. |
| `37487` | Confirmed | The active Korean already completes the contrast naturally: the world's magic grows while the Fae seem to wither. |
| `37488` | Corrected | Paired the complete military document label as `복무 소집 통지서(Notice of Duty)`, matching the established Korean term. |

## Linked Consistency Checks

- `First Sword`: standardized the title as `제일검(First Sword)` at `37367`,
  `41418`, and `63777`; aligned the title/name boundary at `4994` with the
  established split form. `41418` was a linked candidate and is counted once.
  `63777` explicitly defines the title, resolving that terminology question;
  its other ledger dimensions were not reclassified.
- `Storyteller`: added the exact role gloss at `13731`, `37417`, `39980`,
  `53070`, and `57771`. Existing complete pairings at `43875` and `64768`
  were retained. This standardizes the term without assigning any line to a
  particular speaker.
- `Notice of Duty`: paired the repeated singular labels at `33190`, `34744`,
  `37488`, `44470`, and `48434`, and used the same complete name in the
  sentence at `47862`. Existing plural `Notices of Duty` wording was left
  plural and unchanged. The separate `base` row was not edited.
- `37274` retains its eight embedded line breaks. The independent meaning
  hold is not resolved by the title-format correction.

## Verification

- Reconciled 23 in-range candidates and one newly counted linked candidate
  (`41418`). Cumulative candidate reconciliation is 2,352 / 4,015 (58.58%),
  with 1,663 remaining.
- Changed only Korean `Texto` at 25 IDs and refreshed only those IDs'
  `source_fingerprint` values.
- The active CSV retains 65,135 ordered records, its UTF-8 BOM, 71,838 CRLF
  sequences, 244 LF-only separators, and no bare CR.
- All 65,135 ledger fingerprints validate. Index/catalog reproducibility,
  11 CSV-preservation tests, nine dialogue-context tests, and the CRLF-aware
  diff check pass.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
