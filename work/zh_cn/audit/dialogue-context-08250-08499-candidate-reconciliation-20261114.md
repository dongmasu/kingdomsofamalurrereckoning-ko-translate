# Candidate Reconciliation: IDs `8250`-`8499`

- Date: 2026-11-14.
- Scope: all 11 current `overall=candidate` IDs in the numeric range, plus
  16 unprocessed linked candidates checked to resolve the related name and
  terminology groups.
- English controls meaning; Japanese is the primary voice and register
  reference; Chinese is supporting evidence.
- Two in-range rows were corrected. The other nine in-range candidates
  were retained as already supported or previously corrected.
- All 16 linked candidates were retained as already consistent. A previous
  `3187` retain decision was reopened and corrected using the more specific
  `SQ50` / Paling Wand context; it is not counted twice.
- No speaker identity or playback order was inferred from asset membership.

## In-Range Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `8257` | Retained | The Gravehal materials are already aligned to `비치스톤(Beachstone)`, `엠버우드(Emberwood)`, and the source-local `바다강철(seasteel)`. The Korean correction was applied in the earlier 7750-range batch; this records the still-open candidate disposition. |
| `8258` | Retained | `스트라톤(Straton)의 연극 배역 정하기` naturally conveys assigning the play's roles. Exact-English duplicate `55074` has the same wording. |
| `8274` | Retained | The line already uses `라이라(Lyra)`, matching Japanese `ライラ`; the SQ144 Lyra Vogard references were cross-checked as a group. |
| `8294` | Retained | The letter's direct quotation is already marked with Korean quotation marks, matching the English, Japanese, and Chinese formatting. |
| `8301` | Retained | The label is already `아카사(Acathan)`, consistent with the Acathan references at `21210` and `52524`. |
| `8310` | Corrected | Changed the object particle after consonant-final `울프 팩(Wolf Pack)` from `를` to `을`. |
| `8323` | Retained | The capitalized place name is already `할로(The Hollow)` and matches `23199` and `25385`; it is not conflated with `Adarus Hollow`. |
| `8360` | Retained | `은둔 대장장이(Hermit Smith)` is already the consistent paired form in the connected references. |
| `8378` | Corrected | Added the English title to the standalone quest title: `자유의 대가(Price of Freedom)`. |
| `8463` | Retained | `흉악한 헤드헌터단원(Headhunter)` accurately conveys `deadly Headhunter` and agrees with all four parallel item descriptions. |
| `8467` | Retained | `거래해 줘서 고마워` is natural Korean for the merchant's clipped customary sign-off and matches the Japanese intent. |

## Linked Candidate Decisions

These linked candidates were checked against their same-context language
rows. They already use the supported paired name or term and were retained:

- Lyra Vogard: `24485`, `43760`, `44354`, `52754`, `55900` already use
  `라이라(Lyra)`.
- Hermit Smith: `10939`, `11581`, `12164`, `14861`, `19097`, `28676`,
  `28839`, `59710` already use `은둔 대장장이(Hermit Smith)`. The objective
  at `10939` already uses the natural action form `도움 구하기`.
- The Hollow: `23199` and `25385` already use `할로(The Hollow)` for the
  named location.
- Acathan: `52524` already uses `아카사의 춤(Acathan Dance)` and
  `아카사 늪지(Acathan swamps)`, consistent with `아카사(Acathan)` at
  `8301` and `아카사 습지대(Acathan wetlands)` at `21210`.

The other previously reviewed Lyra Vogard references remain aligned:
`1835`, `5388`, `9190`, `10033`, `33255`, and `62233`. The five English
`deadly Headhunter` item descriptions (`8463`, `26436`, `31277`, `46633`,
`54611`) already use `흉악한` consistently; the latter four are not new
candidate dispositions in this batch.

## Reopened SQ50 Context

ID `3187` was previously retained as generic `동굴` because its English
source uses lowercase `hollow`. Rechecking it alongside `8323`, `23199`, and
`25385` in the same `SQ50` / Nareen Farm Paling Wand context supports the
named location. It now reads `그들은 할로(The Hollow)에 있는 마법 지팡이가
필요해.` This is limited to `The Hollow`; no equivalence with `Adarus Hollow`
is asserted.

## Changes and Verification

- Changed only the Korean text at `3187`, `8310`, and `8378`, using the
  byte-preserving ID-scoped editor.
- Refreshed only those three IDs' `source_fingerprint` values in the
  append-only review ledger. Candidate dispositions and evidence links were
  otherwise preserved.
- Reconciled 11 in-range and 16 linked candidate IDs. Cumulative candidate
  reconciliation is 463 / 4,015 (11.53%), with 3,552 not yet reconciled.
- The CSV remains at 65,135 ordered records with its UTF-8 BOM and 71,838
  CRLF / 244 LF-only endings; the preservation editor left all other bytes
  untouched.
- All 11 CSV-preservation tests and nine context-index tests passed. The
  65,135-row ledger fingerprint check, index/catalog reproduction, and
  CRLF-aware `git diff --check` also passed.
- No `src/` CSV or extracted game asset was changed.
- No commit was made.
