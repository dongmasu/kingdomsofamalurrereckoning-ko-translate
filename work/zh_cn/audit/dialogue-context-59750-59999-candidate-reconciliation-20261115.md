# Candidate Reconciliation: IDs `59750`-`59999`

- Date: 2026-11-15.
- Rechecked all ten new correction candidates against the active Korean CSV
  and the English, Japanese, and Chinese sources. Eight were corrected and
  two already had supported wording.
- Rechecked nine earlier candidates: five were corrected and four already
  had supported wording in the current CSV.
- Rechecked two report-only findings and corrected both. Existing ledger
  dispositions were preserved; only fingerprints for changed Korean rows
  were refreshed.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `59753` | Corrected | Made the book the subject of the binding and handwriting description: `제본 솜씨가 뛰어나고, 손으로 쓴 글씨도 흠잡을 데 없이 깔끔하다.` |
| `59765` | Corrected | Removed the unsupported plural `이것들이`; the singular artifact may contain a clue to escaping the caverns. |
| `59790` | Already resolved | The active text correctly coordinates the roles: `노예상이자 살인자라고?` |
| `59806` | Corrected | Paired the complete role and name as `성전 기사 조리엘(Templar Jorielle)`. |
| `59812` | Corrected | Paired the standalone item name as `불꽃 봉헌물(Votive of Flame)`. |
| `59903` | Corrected | Recast the awkward `추락한 우리` as `몰락한 이들`, without claiming the former House of Valor members were expelled. |
| `59911` | Corrected | Replaced marked 하게체 with natural friendly 해체, preserving the offer of future help. |
| `59926` | Corrected | Clarified the `one part ore for every thirty parts refuse` ratio and rendered double shifts naturally. |
| `59965` | Corrected | Paired the complete standalone location label as `에테네의 성소(Shrine of Ethene)`. |
| `59975` | Already resolved | The current sentence already has a natural word order and preserves the Archsage's quarters and plural `us`. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `59795` | Corrected | Replaced the awkward `결승선을 통과하게 몬` and clarified that payment increases with the number of antelopes herded across the finish line. |
| `59823` | Corrected | Paired the complete title in `컵의 왕(King of Cups) 이리온(Irion)`. |
| `59843` | Retained | `병원 구역` is supported by the English hospital context and Chinese; no global `Quarters` terminology rule was inferred. |
| `59868` | Corrected | Replaced the inanimate `그건` with person-referential `그 사람은`, consistent with the source and Chinese. |
| `59891` | Retained | `미사루 교단(Order of Mitharu)` and the Ordination Tome objective are already represented. |
| `59925` | Retained | `지점 업무 안내서` clearly identifies the recovered branch-office handbook and its delivery. |
| `59928` | Corrected | Paired the specific plural creature name as `스프라이트(Sprites)`, without applying it to generic fairies. |
| `59947` | Corrected | Paired the standalone quest title as `얽힌 거미줄(A Tangled Web)`. |
| `59953` | Retained | `은둔 대장장이(Hermit Smith)` is paired and reads naturally in the line. |

## Report-Only Findings and Holds

- `59863`: Added the full item-name pairing `수도사 형제단의 반지(Band of Brother Monks)`.
- `59904`: Changed the quest-failure/status text from polite endings to plain style, consistent with the Japanese and comparable journal entries.
- `59785`: Held. English `breaking free of Mel Senshir` conflicts with Japanese, which says the siege was lifted; the intended event remains unclear.
- `59763`: Held. The English source's `solf leather` conflicts with Japanese wolf skin and Chinese leather; the intended material cannot be established.
- `59789`: Held. Only Japanese explicitly includes a toast; English and Chinese do not.
- `59959`: Held. The referent of `one of them` is not established by the available excerpts.

No speaker or playback order was inferred from asset associations. Existing
append-only ledger dispositions were not rewritten.

## Applied Changes

The active Korean CSV already contained all 15 text changes when this
reconciliation was resumed. The changed IDs are `59753`, `59765`, `59795`,
`59806`, `59812`, `59823`, `59863`, `59868`, `59903`, `59904`, `59911`,
`59926`, `59928`, `59947`, and `59965`. Only these IDs' four-language
`source_fingerprint` fields were refreshed.

## Result and Verification

- All ten new candidates were reconciled: eight corrected and two already
  supported by the active text. The nine earlier candidates and two
  report-only findings were also rechecked.
- Candidate reconciliation is `3,362 / 4,026` (`83.51%`), with `664`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
