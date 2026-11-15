# Dialogue Context Translation Edit Batch: IDs `28750`-`28999`

- Date: 2026-11-14.
- Rechecked all eight current ledger candidates against English, Japanese,
  Chinese, active Korean, and their linked review reports.
- All eight supported corrections were already present in the active Korean
  CSV. This follow-up made no translation or ledger changes.

## Reconciled Findings

| ID | Finding | Verification |
| ---: | --- | --- |
| `28762` | Address / naturalness | The Korean directly addresses the Adept and gives natural advice not to keep the Archsage waiting. Japanese supports the plain, advisory reading. |
| `28779` | Name / format | The source's lowercase `the order` is generic in isolation. A separate English historical line (`38945`) explicitly places Caerwyn with Warsworn smiths and troops fighting the Niskaru; Japanese and Chinese describe the organization generically rather than contradicting this reading. The mixed-quest `464173.quest_bxml` asset was not treated as per-line evidence. The existing `워스원(Warsworn)` pairing is supported. |
| `28797` | Naturalness | `불의의 죽음을 맞았으니` naturally conveys `met an untimely death`; Japanese and Chinese support the same event. |
| `28827` | Meaning | `긍지의 페이(Fae of Pride)` preserves the English group label without changing it to the separately suggested House of Pride interpretation. The connecting phrase now clearly says the speaker represents that group. |
| `28839` | Epithet / pairing | `은둔 대장장이(Hermit Smith)` supplies the explicit English title. The Korean does not import the extra blade name found only in Japanese. |
| `28875` | Journal register | The written `-것이다` ending matches the quest-log narration; `감방` is a precise rendering of the prison cell. |
| `28893` | Name / format | `겨울 페이(Winter Fae)` pairs the complete source group name. All five Korean verse lines and their order are preserved. |
| `28938` | Naturalness | `성과는 좀 있었어?` is a natural conversational rendering of `Any luck?` when asking whether an effort succeeded. Its linked asset has no dialogue handlers, so no speaker or preceding exchange is inferred. |

## Verification

- The current Korean text for all eight IDs matches the reviewed directions.
- No source fingerprint needed refreshing in this follow-up; the full ledger
  validates against all four current language tables.
- The relevant source rows retain their line-break and runtime-token
  structure. No per-key speaker or playback order was inferred.
- The 20 CSV-preservation and dialogue-context-index tests, index/catalog
  reproducibility checks, and CRLF-aware diff check pass.
- No commit was made.
