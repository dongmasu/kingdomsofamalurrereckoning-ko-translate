# Dialogue Context Translation Edit Batch: IDs `32000`-`32249`

- Date: 2026-11-14.
- Rechecked the current English, Japanese, Chinese, and Korean rows before
  applying supported findings. English anchored meaning; Japanese guided
  voice and layout; Chinese was supporting evidence.
- Applied 15 in-range corrections and 10 directly related corrections,
  changing 25 unique `default` IDs.
- The findings at `32057`, `32115`, and `32146` already matched the supported
  wording after earlier edits and were retained. The holds at `32063`,
  `32226`, and `32239` remain unresolved; no speaker or playback order was
  inferred.

## In-Range Corrections

| ID | Correction |
| ---: | --- |
| `32020` | Rendered `travesties` as `촌극`, not tragedy, while preserving the distinction from heresy. |
| `32058` | Recast the ship offer naturally as `배삯은 받지 않을게` and kept the friends' choice of route. |
| `32097` | Named the attacking faction as `겨울 페이(Winter Fae)`; preserved all four verse lines. |
| `32128` | Replaced the literal, unnatural `깜박이는 혀` with a natural image of a flickering tongue; retained the passage and paragraph layout. |
| `32135` | Added `올라프(Olaf)` without changing the speaker's anxious question. |
| `32144` | Standardized the bonus as `마법(Sorcery) 능력에 +1`. |
| `32169`, `32170` | Paired the standalone names `모르수스(Morsus)` and `멘델러 버트(MendellerBirt)`. |
| `32181` | Paired the quoted game term as `레코닝(Reckoning) 마법`. |
| `32188` | Recast the first-person log in concise, natural past-tense prose. |
| `32212` | Completed the title pairing as `셰인 성주(Castellan Shane)`. |
| `32217` | Standardized `혼돈 학자(Chaos Scholar)` and retained the established `심연의 갑옷(Abyss armor)`. |
| `32225` | Paired the named guardian group as `감시자들(Watchers)`. |
| `32238` | Recast the complaint about Bisarane's delays and insults in natural Korean while preserving the call for the House to go to war. |
| `32241` | Paired the named royal object as `인장(Seal)`; its exact-English duplicate `33619` was aligned. |

## Related Consistency Corrections

| Group | IDs and result |
| --- | --- |
| `travesties` | `40355` also uses `촌극`; its full sentence and Japanese/Chinese support the farce/sham sense, not an atrocity reading. |
| `Chaos Scholar` | Standardized the term and English pairing at `1488`, `1691`, and `51109`, matching `32217`. |
| `Watchers` | Added the named-group pairing at `3242`, `40558`, `44903`, and `46147`. Directly related references at `1641`, `14521`, `23111`, `26725`, `29685`, `55061`, and `55195` were checked and already paired. |
| `The Seal` | Added `인장(Seal)` at `52784`, the related description of the same Ansilla seal. The linked entries `32241` and `33619` remain identical in Korean. |

## Verification

- Across this batch and the adjacent `32250`-`32499` batch, refreshed only
  the 38 changed IDs' `source_fingerprint` fields. The complete 65,135-ID
  ledger validates.
- The `default` CSV retains its UTF-8 BOM, 65,135 ordered records, 71,842
  CRLF record endings, and 244 LF-only record endings.
- Existing line breaks in `32097` and `32128` were preserved. Source
  formatting and runtime markers were not changed.
- Index and both catalogs reproduce; all 20 CSV-preservation and
  context-index tests pass; the CRLF-aware diff check is clean.
- Source CSVs, extracted assets, and game binaries were not changed. No
  commit was made.

The adjacent `32250`-`32499` batch is recorded separately. Sequential
application continues with `32500`-`32749`.
