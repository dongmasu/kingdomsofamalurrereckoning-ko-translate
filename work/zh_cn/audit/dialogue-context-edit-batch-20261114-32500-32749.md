# Dialogue Context Translation Edit Batch: IDs `32500`-`32749`

- Date: 2026-11-14.
- Rechecked candidate rows against the current English, Japanese, Chinese,
  and Korean text. English anchored meaning; Japanese guided voice, register,
  and layout; Chinese provided supporting evidence.
- Applied 15 in-range corrections and four directly related corrections,
  changing 19 unique `default` IDs. Uncertain or unsupported findings remain
  unresolved.
- The cross-range `Mudhold Fasting` correction was already present in the
  working tree: eight `default` rows and `base:1353`, variant `11`, use
  `머드홀드 지하 통로(Mudhold Fasting)`. Its eight ledger fingerprints were
  refreshed and validated.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `22579`, `32505`, `45949`, `54539` | Standardized the legend name as `안실라 부인의 아이들(The Lady's Children)`; `26672` already matched. Source forms `Lady Ansilla's Children` at `8108`, `26015`, and `42681` remain distinct. |
| `32511` | Aligned `Asker's Alley` to the established `애스커 골목(Asker's Alley)`; the `빅터의 양조주(Victor's Brew)` name and particle were already correct. |
| `32525` | Replaced the literal cleaning sense with `동굴을 소탕해 주세요`, matching the instruction to clear the boggart cave. |
| `32568` | Made the father's closing warmer as `아빠가`; preserved all 12 embedded line breaks. |
| `32569` | Recast the first-person journal entry in consistent written narration and clarified the reward escort. |
| `32585` | Paired the named location as `치킨힐(Chickenhill)의 샘`. |
| `32591` | Paired the abbreviated organization name as `테스타먼트(Testament)`. |
| `32598` | Corrected who owes the favor: Sveri owes it to the writer. Paired `스베리(Sveri)` and `크랜윈(Cranwyn)`; preserved all 13 embedded line breaks. |
| `32612` | Reconciled the mixed journal endings into consistent plain narration. |
| `32629` | Corrected the malformed ending to `그런 자들은 없는 편이 세상에 낫지.` |
| `32711`, `47165` | Unified the identical four-language source rows and removed the Korean-only line breaks. Both now use the same compact sequence of rhetorical fragments. |
| `32712` | Replaced `성채 관리관` with the established title `성주(Castellan)`. |
| `32713` | Clarified that the brownie was biting Arhaus's backside, matching the Japanese source. |
| `32741` | Restored the speaker's own skill/service: `야영지에서도 내 솜씨가 필요하겠네.` |
| `32748` | Paired the objective name as `에드몬(Aedmon)에게 돌아가기`. |

## Retained And Held

- `32518` already uses `처형인(Headsman)`. All 22 linked Headsman rows were
  checked and already use the established paired term.
- `32610` already matches the parallel response at `55662`.
- `32557` remains unchanged; the multilingual evidence does not establish a
  better rendering of `Captain Emotional`.
- `32700` remains unchanged pending a project-wide Korean rendering for
  `Templar`.
- `32590` (`Smuggler's Run`), `32641` (`Murder Most Fowl`), and the existing
  `32716` question remain held for unresolved source meaning or wordplay.
- The prior candidate at `32734` was not applied: its linked proposal refers
  to `Tidal Pools`, but the current English row concerns Tari's mother's ring
  and returning to his cage in Cape Solace. This is recorded as a report-to-ID
  mismatch, not a supported translation correction.
- No speaker identity or playback order was inferred from asset membership.

## Verification

- Refreshed only the 27 edited `default` IDs' `source_fingerprint` values:
  the eight `Mudhold Fasting` rows and the 19 IDs changed in this batch.
- The `default` CSV retains its UTF-8 BOM and 65,135 ordered records. Its
  current byte inventory is 71,838 CRLF sequences, 244 LF-only sequences, and
  no bare CR. The CRLF count is four lower because the Korean-only breaks
  were removed from both `32711` and `47165`.
- Exact-English duplicate groups touching the 19 edited IDs were checked.
  The only touched group, `32711` / `47165`, now has identical Korean text.
- The full review ledger validates all 65,135 IDs. The index and both
  catalogs reproduce byte-for-byte. All 11 CSV-preservation tests and nine
  context-index tests pass, as does the CRLF-aware `git diff --check`.
- `src/`, extracted game assets, and game binaries were not changed. No
  commit was made.

The next sequential application range is `32750`-`32999`.
