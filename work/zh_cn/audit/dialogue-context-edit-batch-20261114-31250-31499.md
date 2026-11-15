# Dialogue Context Translation Edit Batch: IDs `31250`-`31499`

- Date: 2026-11-14.
- Rechecked all 21 candidates against the current English, Japanese, Chinese,
  and Korean text. English anchored meaning; Japanese guided voice and layout;
  Chinese was supporting evidence.
- Applied 17 supported in-range corrections. Four candidates already reflected
  the supported wording and were retained.
- Aligned 19 directly related rows outside the range, for 36 unique edited
  `default` IDs total. Uncertain meanings remain held; no speaker or playback
  order was inferred.

## In-Range Corrections

| ID | Correction |
| ---: | --- |
| `31255` | Standardized `Eimer` as `에이머(Eimer)`. |
| `31270` | Rewrote the stiff intimate-reward clause as a natural token of affection and keepsake; retained all paragraphs and the signature. |
| `31275` | Added the full `Remus Bloodhawk` pairing. |
| `31278` | Standardized `틱네리(Ticneri)` and recast the awkward lever direction as reaching the throne-room lever. |
| `31279` | Added the full `Effie Cruikshank` pairing. |
| `31294` | Changed the unclear transliteration to `흉터가 있는 식물`; Japanese and Chinese both describe a scar, and no other `scarr` use was found in the English source corpus. |
| `31299` | Paired `리아나(Lyana)` and `셈페스트레(Cempestre)`. |
| `31318` | Standardized and paired `장엄한 종(Solemn Bell)` and `탄생의 초(Birth Candle)`. |
| `31329` | Added the `De Groot` name pairing. |
| `31332` | Added the `Rhewani` name pairing. |
| `31355` | Replaced the generic-sounding `기술 책` with the in-game item term `기술서`. |
| `31370` | Paired `Brightower`, retained the existing `Faelands` pairing, and corrected the particle after `Lady Oleyn`. |
| `31375` | Reworked the awkward reading of `readied, light`, paired the Faehunter gauntlets, and preserved the six-line poem. |
| `31395` | Standardized `틱네리(Ticneri)`. |
| `31420` | Added the `Keep Courtyard` pairing. |
| `31433` | Added the `Sacred Passage` pairing in the existing `-기` objective form. |
| `31490` | Added the `Forum` pairing. |

The candidates at `31374`, `31387`, `31423`, and `31466` already used the
supported Maisie's Luck, Belen's Testament, Magnus, and Squire Coran forms;
they were not edited again. The earlier evidence-limited holds at `31283` and
`31386` remain unresolved.

## Related Consistency Corrections

| Group | IDs and result |
| --- | --- |
| Ticneri | Aligned `1133`, `2546`, `7885`, `9622`, `9701`, `32115`, `42445`, `42909`, `45004`, `46979`, `55380`, and `59551` to `틱네리(Ticneri)` where first named. At `32115`, rendered `latest creation` as `가장 최근에 만들어 낸`; at `46979`, preserved the objective's `-하기` form. `10945` already had the established pairing. The material intended by `carve off a piece` at `59551` remains unspecified. |
| Solemn Bell and Birth Candle | Standardized all nine source-matched `Solemn Bell` references to `장엄한 종(Solemn Bell)` and all four `Birth Candle` references to `탄생의 초(Birth Candle)`. The six linked rows changed were `5873`, `39020`, `39714`, `41821`, `49731`, and `64833`; `31318` is in-range. Already-correct references were retained. |
| Duplicate poem | Applied the same six-line Korean text to `31375` and its exact-English duplicate `37047`. Their Korean text remains identical, with the original line count preserved. |

## Verification

- Refreshed only the 36 edited IDs' `source_fingerprint` fields; all other
  ledger fields, row order, and bytes were preserved. All 65,135 ledger rows
  validate.
- The active `default` CSV retains its UTF-8 BOM, 65,135 ordered records,
  71,842 CRLF record endings, and 244 LF-only record endings.
- The full index and asset catalog reproduce; the all-ID catalog reproduces;
  all 20 CSV-preservation and context-index tests pass.
- The six-line duplicate poem, linked terminology groups, and
  `git -c core.whitespace=cr-at-eol diff --check` were verified.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

The next sequential candidate range is `31500`-`31749`; application remains
ongoing.
