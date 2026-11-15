# Candidate Reconciliation: IDs `37000`-`37249`

- Date: 2026-11-14.
- Rechecked all ten in-range candidates against English, Japanese, Chinese,
  the active Korean CSV, and prior decisions.
- Checked linked candidates `1349`, `18874`, `31375`, `40387`, and `59562`.
  The first three were already counted in earlier reconciliations.
- English anchored meaning; Japanese guided style and register; Chinese
  provided supporting evidence. Asset associations were not used to infer
  individual speakers or dialogue order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `37008` | Confirmed | `영원한 카스마란(Casmaran the Eternal)` now gives the complete named epithet, matching the dialogue at `1349`. |
| `37047` | Held | The six-line poem is identical to `31375` and keeps the same Korean. English `readied, light` is ambiguous; Japanese omits the weight nuance and Chinese supports lightweight instruments. Keep the line and layout unchanged rather than force a reading. |
| `37057` | Previously corrected, confirmed | The Bera journal entry now uses `동물 고기` and pairs `목마른 자작나무 여관(Thirsty Birch)`, matching the related quest entry and objective wording. |
| `37083` | Confirmed | The shop label includes the complete name `벨처 잡화점(Belcher's Sundries)`. |
| `37115` | Confirmed | The named people are paired as `먼지의 자손(Children of Dust)`. Its exact-English duplicate at `40387` has identical Korean. |
| `37117` | Corrected | Standardized the parallel `Terminate the [family] family` objective to `신릭 가문(Cynric family) 처단하기`, matching `18874` and `59562`. |
| `37122` | Confirmed | The named concept is fully paired as `운명의 태피스트리(Tapestry of Fate)`. |
| `37149` | Previously corrected, confirmed | `이리 와. 나와 함께 새로운 운명을 만들어 가자...` preserves the invitation and shared action in natural plain speech. |
| `37189` | Refined | Quest context identifies the target as the silver-back troll called the Stowaway (`25333`). The objective now uses the established full type/name form `밀항자 트롤(Stowaway Troll)을 찾아 처치하기`. |
| `37217` | Corrected | Added the complete `Sun Stone` and `Frost Stone` pairings. Kept source-local lowercase `Storm stone` as specified by the SA08 review. |

## Linked Candidate Checks

- `1349`, `18874`, and `31375` were already reconciled and are not counted
  again. They respectively confirm the Casmaran epithet, the family-objective
  wording, and the poem duplicated at `37047`.
- `40387` is the exact-English duplicate of `37115`; its Korean already
  matches the corrected full `Children of Dust` pairing.
- `59562` is the third parallel family objective and was corrected with
  `37117` to use the same `처단하기` form.
- The `Stowaway Troll` decision uses the same-quest creature description and
  the established type/name wording. The separate quest title at `3971`
  remains `밀항자(Stowaway)`.

## Verification

- Reconciled ten in-range candidates and two newly counted linked candidates.
  The three previously reconciled linked IDs were excluded from the new
  subtotal. Cumulative candidate reconciliation is 2,328 / 4,015 (57.98%),
  with 1,687 remaining.
- Changed only Korean `Texto` at `37117`, `37189`, `37217`, and `59562`;
  refreshed only those IDs' source fingerprints.
- The active CSV retains 65,135 ordered records, its UTF-8 BOM, 71,838 CRLF
  sequences, 244 LF-only separators, and no bare CR.
- All 65,135 ledger fingerprints validate. Index/catalog reproducibility,
  20 regression tests, and the CRLF-aware diff check pass.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
