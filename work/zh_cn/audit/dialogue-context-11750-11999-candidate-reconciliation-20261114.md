# Candidate Reconciliation: IDs `11750`-`11999`

- Date: 2026-11-14.
- Scope: all 15 unreconciled candidates in this range, checked against
  English meaning, Japanese voice/register/layout, Chinese supporting
  evidence, active Korean, and related terminology records.
- Eleven candidates have supported corrections: five were already applied
  and were reverified, and six were applied in this pass. Four candidates
  already matched the source evidence.
- Two directly related bounty-completion rows were aligned with `11896`.
- No speaker or playback order was inferred from asset membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `11778` | Previously applied, confirmed | `자, 여기 신청서류야...` identifies the application papers without adding an instruction to sign. |
| `11794` | Confirmed | `명장 세 명(Master Makers)` avoids double-marking the count as plural; the sentence preserves the masters' freedom to stay or leave. |
| `11805` | Confirmed | `조제법` matches the alchemical formula throughout the Nanne/Karth source group. The full line accurately says the formula was found and destroyed and retains its conversational emphasis. |
| `11824` | Corrected | Replaced the stiff written directive with `시간 끌지 마. ... 재빨리 공격해야 해.`, matching the direct, conversational Japanese instruction. |
| `11829` | Corrected | Preserved the source interruption without inventing what the accusation concerns; the hesitant speech and polite self-reference are now consistent. |
| `11845` | Corrected | Replaced `공감` (empathy) with `익숙한 감정`, preserving the recognition of a familiar experience in the English and Japanese. |
| `11846` | Corrected | Replaced the funeral-specific `수의` with `장막` and aligned the sentence with the same explanation at `52508`. |
| `11864` | Previously applied, confirmed | The performance is explicit in the English, Japanese, and Chinese; the current Korean identifies `공연` and keeps the informal address. |
| `11896` | Corrected | Recast the bounty-completion sentence in natural journal style and aligned the same sentence at `23465` and `34765`, preserving each family's name. |
| `11905` | Corrected | Changed the imperative to the established quest-objective form `-하기`. |
| `11907` | Previously applied, confirmed | `치유를 구하는 자(Cureseeker)` follows the Japanese/Chinese meaning and established Ballad title, correcting the source-local English typo `Curseeker`. |
| `11917` | Confirmed | The company heading is consistently paired at `11917`, `15183`, `36628`, and `58806`. The contract meaning is supported, and all four existing embedded line breaks were preserved. |
| `11934` | Previously applied, confirmed | The redundant Mana wording is removed; the concise `퀘이크(Quake) 마나 소모량 +16` matches the source. The existing line break remains. |
| `11948` | Previously applied, confirmed | The sentence correctly makes Anker the source of the information and restores the Paragon Barghest referent. |
| `11969` | Confirmed | `지점 업무 안내서` is consistent across the nine linked Motus handbook entries (`6626`, `7157`, `11969`, `14570`, `23156`, `34167`, `34414`, `53784`, `59925`). |

## Related Consistency

- IDs `11896`, `23465`, and `34765` now use the same journal sentence
  structure for the Zungar, Cynric, and Darkvari families.
- The 16-row Nanne/Karth formula group was checked in English, Japanese, and
  Korean. The active Korean consistently uses `조제법`; `11805` needed no
  terminology edit.
- The Motus handbook group was checked across all nine linked IDs; every
  active Korean row already uses `지점 업무 안내서`.
- The Shroud explanation at `11846` now matches the established rendering at
  `52508`; the English title remains paired separately where it is explicitly
  named.

## Verification

- All 15 in-range candidates are reconciled; cumulative candidate
  reconciliation is 720 / 4,015 (17.93%), with 3,295 remaining.
- The full review ledger validates all 65,135 reviewed IDs; the generated
  quest-asset index and both catalogs reproduce exactly.
- CSV preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838
  CRLFs, 244 LF-only separators, and no bare CRs.
- Eight changed IDs' fingerprints were refreshed: `11824`, `11829`, `11845`,
  `11846`, `11896`, `11905`, `23465`, and `34765`.
- CRLF-aware `git diff --check` passed. No source CSV or extracted asset was
  changed.
