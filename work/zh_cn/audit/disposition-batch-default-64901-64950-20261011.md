# Disposition Batch: `default` IDs 64901-64950

- Date: 2026-10-11. Rechecked all 50 Korean rows by aligning English,
  Japanese source, Chinese source, Japanese draft, and Korean working CSVs
  on `ID_Linha`; reconciled source-keyed historical questions.
- One accepted targeted correction, 42 `not an issue` IDs, and seven
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18149 | 64937 | `너무 커.` | `키가 너무 커.` | English `Too tall` and Japanese `背が高すぎる` specify height, not generic size. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18150 | 64902 | `Gallows End` has multiple Korean forms in the corpus; preserve this occurrence pending a deliberate place-name standard. |
| D-18150 | 64907 | Four named scribes are retained, but their Korean spellings differ across locales and lack canonical glossary confirmation. |
| D-18150 | 64909 | `Cape Solace` is a named place whose Korean transliteration varies; the salvage contrast is otherwise preserved. |
| D-18150 | 64911 | `Kollossae` names the speaker's people; Korean preserves the collective claim, but the ethnonym spelling remains inconsistent across the corpus. |
| D-18150 | 64921 | `Pledgeshield` is used as a direct rank/title; its established Korean form remains unsettled. |
| D-18150 | 64930 | The sequence `lured, wooed, honored` is compressed into overlapping Korean seduction/flattery wording; preserve the current text pending context for the distinct honor nuance. |
| D-18150 | 64948 | The final English clause is elliptical about the ancients shaping the area; Caer Elatha and Crossing terminology also need consistency review. |

## Not an Issue

Decision D-18151 records these 42 IDs: 64901, 64903-64906, 64908,
64910, 64912-64920, 64922-64929, 64931-64936, 64938-64947, and 64949-64950.
They preserve the available meaning, voice, and structure. `FAIL LINE` stays
source-like as in English and Japanese; `A second?` follows the historical
dueling-assistant context rather than a time unit. The 10+2 House count is
retained.

## Structural and Historical Reconciliation

- Direct ID alignment found 65,135 rows in each of the five locale/draft
  CSVs and all 50 reviewed IDs in ascending order.
- No embedded line breaks, runtime markers, or numeric values occur in the
  range.
- Only the `Texto` cell at ID 64937 changed. UTF-8 BOM, 65,135 data rows,
  key order, and the existing 72,012 CRLF/72 bare-LF endings are preserved.
  Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-64901/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `c30ad5460e23b8ed0e4783e07cffd0a703f0da264d335e605f53942739d631dc`.
  Post-edit SHA-256:
  `c8477257078f832fad1caa3507b48275b253314b1d1559909e91b7e95444c44c`.

- D-18149 records one accepted correction, D-18150 records seven uncertain
  findings, and D-18151 records 42 `not an issue` IDs. Cumulative register
  counts through D-18151: 1,855 accepted, 17,089 `not an issue`, and 12,811
  uncertain (31,755 dispositions); next D-18152.

Resume at `default` ID 64951; 184 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
