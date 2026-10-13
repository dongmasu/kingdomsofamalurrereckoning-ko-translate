# Disposition Batch: `default` IDs 64951-65000

- Date: 2026-10-11. Rechecked all 50 Korean rows against English, Japanese
  source, Japanese draft, and Chinese source by `ID_Linha`; reconciled the
  source-keyed historical questions and prior terminology decisions.
- Four accepted targeted corrections, 37 `not an issue` IDs, and nine
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18152 | 64969 | `좋은 하루야, 여행자.` | `안녕, 여행자.` | English, Japanese, and Chinese use a greeting; the current Korean is an unnatural literal rendering of “Good day.” |
| D-18152 | 64970 | `... 다른 일이 있는지 물어봐야겠다.` | `... 달 야영지에 다른 의뢰가 있는지 알아봐야겠다.` | Restore the explicit destination of the possible jobs in English, Japanese, and Chinese; retain the loot return to Irion. |
| D-18152 | 64984 | `이 눈처럼?` | `이 눈 좋아해?` | Japanese and Chinese resolve the elliptical English question as asking whether the listener likes the snow, not making a comparison. |
| D-18152 | 64999 | `안녕히, 행운을 빌어.` | `잘 가, 행운을 빌어.` | Keep the farewell and good-luck wish in a consistent informal register supported by the Japanese and Chinese. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18153 | 64951 | `Missives` is clearly the sought document, but its identity as a named book/artifact and canonical Korean title remain unresolved. |
| D-18153 | 64952 | English says `Saken Plains`, while the Korean follows the established `Forsaken Plain` form; this may be a source/name conflict. |
| D-18153 | 64954 | “My custom” may mean trade/business or customary practice; Japanese and the iron request support commerce, while Chinese supports custom/tradition. |
| D-18153 | 64960 | Esharra's plane relationship is preserved, but its canonical Korean spelling differs across project materials. |
| D-18153 | 64967 | The return/conquest/chaos meaning is retained; Enfamanir's Korean name form remains unstandardized. |
| D-18153 | 64972 | `전하` may overstate the English `your grace`; the addressee's rank and house style are not established by this line. |
| D-18153 | 64973 | The person is identified, but the Korean transliteration of Eathe Dunbert differs from Japanese and has no confirmed project standard. |
| D-18153 | 64974 | `자유민단` conveys a group, but whether `The Freemen` is the named faction and should use the previously accepted `프리맨` form remains unsettled. |
| D-18153 | 64987 | The safety claim is clear, but `Cape Solace` has competing Korean forms elsewhere in the corpus; retain the current form pending a global decision. |

## Not an Issue

Decision D-18154 records these 37 IDs: 64953, 64955-64959, 64961-64966,
64968, 64971, 64975-64983, 64985-64986, 64988-64998, and 65000. Their
current translations preserve the available meaning, voice, values, and
structure. ID 64965 retains `{LINE_SPACE}{LINE_LEFT}` in order. ID 64998
retains all four headings, seven damage types, three damage-over-time
subtypes, and the original runtime-marker order.

## Structural and Historical Reconciliation

- English source, Japanese source, Japanese draft, Chinese source, and active
  Korean each contain 65,135 records with identical unique ascending IDs
  0-65134. All 50 target IDs occur once in each file and in identical order.
- The `default` schema has no `Tipo_Variante` field; no variant sequence
  applies. The CSV separator is semicolon, and `Texto` may contain embedded
  line breaks.
- The five input files were compared by ID, not physical line number.
  No embedded newline, runtime-marker, or numeric-value discrepancy was
  found in this range.
- Only the active Korean `Texto` cells at IDs 64969, 64970, 64984, and 64999
  changed. UTF-8 BOM, 65,135 data rows, ID order, and the existing 72,012
  CRLF/72 bare-LF endings are preserved.
- Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-64951/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `c8477257078f832fad1caa3507b48275b253314b1d1559909e91b7e95444c44c`.
  Post-edit SHA-256:
  `0df634ae50365ff1f01d9b952e339ab4f62662482b65d8e3c21bd789902caf5b`.
- D-18152 records four accepted corrections, D-18153 records nine uncertain
  findings, and D-18154 records 37 `not an issue` IDs. Cumulative register
  counts through D-18154: 1,859 accepted, 17,126 `not an issue`, and 12,820
  uncertain (31,805 dispositions); next D-18155.

Resume at `default` ID 65001; 134 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
