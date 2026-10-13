# Grouped Context Review: Numbered `FAIL LINE` Labels

- Date: 2026-10-12.
- Decision: D-19446.
- Scope: seven explicit open `FAIL LINE 1/2` findings at IDs 6848, 9846,
  11396, 31235, 39875, 45042, and 46628.

## Decision

English and Japanese preserve each numbered diagnostic-looking label
verbatim. Chinese localizes the labels, but that alone does not establish
that the Korean should do so. D-1407 already accepts the exact `FAIL LINE 1`
form at ID 5515; the grouped D-19442 decision likewise preserves the exact
English/Japanese `FAIL LINE` label. Preserve the numeral and exact source
string, without inferring whether the runtime displays it to players.

| ID | Previous Korean | Applied Korean | Disposition |
| ---: | --- | --- | --- |
| 6848 | `실패 문자열 2` | `FAIL LINE 2` | accepted |
| 9846 | `FAIL LINE 2` | unchanged | not an issue |
| 11396 | `FAIL LINE 1` | unchanged | not an issue |
| 31235 | `실패 대사 1` | `FAIL LINE 1` | accepted |
| 39875 | `FAIL LINE 1` | unchanged | not an issue |
| 45042 | `FAIL LINE 2` | unchanged | not an issue |
| 46628 | `FAIL LINE 2` | unchanged | not an issue |

Previously dispositioned exact labels, including ID 5515 and other numbered
forms, are precedent only and are not recounted. At ID 46628, this resolves
only the numbered label. The separate template warning at 46626 and
`[DO NOT USE]` label at 46650 were reviewed under D-19448 and both cleared
as `not an issue`.

## Verification

- All seven explicit holds were compared by ID in English, Japanese,
  Chinese, and active Korean; the numbered source strings and Japanese
  strings match exactly.
- Only the approved `Texto` cells at IDs 6848 and 31235 changed.
- Pre-edit SHA-256:
  `7feb04d2ef991183e310657f610ce2ae67b14b0f6cbe9e57dc90327ff7511ecb`.
- Post-edit SHA-256:
  `cc8c2706805482a13a2bd44a8d58687b1804a8f06bea3c6632b47639f20073f4`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-numbered-fail-line-D19446/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the two exact substitutions reproduces the backup byte-for-byte.
  The UTF-8 BOM, 65,135 CSV records, row order, 72,011 CRLF endings, and 73
  pre-existing bare-LF endings are unchanged.
- Seven holds resolved: two accepted, five `not an issue`. Totals:
  **2,284 accepted / 24,983 not an issue / 11,257 uncertain** (38,524).
- Resume at **D-19447** from the deduplicated unresolved-source queue. Do not
  restart the original contiguous disposition pass or repeat completed
  50-ID scans.
