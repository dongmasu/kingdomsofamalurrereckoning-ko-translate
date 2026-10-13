# Grouped Context Review: Repeated `FAIL LINE` Label

- Date: 2026-10-12.
- Scope: fourteen explicit uncertain occurrences of the exact English
  `FAIL LINE` label. Exact variants `FAIL LINE 1/2/3` are separate strings
  and were not included. Previously dispositioned exact matches were used
  as precedent but not recounted.

## Decision D-19442

English and Japanese retain the exact uppercase `FAIL LINE` at all fourteen
IDs. Chinese consistently localizes it as `失败的对话` (“failed dialogue”).
Earlier Korean decisions D-1647, D-2204, and D-3135 accept retaining this
exact test-like label verbatim, while D-1407 and other `FAIL LINE 1/2`
decisions likewise preserve numbered forms. The repeated label and prior
decisions support preserving the exact English token in Korean; runtime
visibility need not be guessed to align this untranslated source string.

| Result | IDs | Details |
| --- | --- | --- |
| accepted; edit to `FAIL LINE` (7) | 16425, 31138, 38240, 39619, 40523, 40647, 52813 | Replace varying translations (`실패 줄`, `실패 대사`, `대사 실패`, `실패 행`) with the exact English/Japanese label. |
| not an issue (7) | 20478, 43507, 43949, 44842, 45285, 51059, 58305 | Korean already matches English/Japanese exactly. |

Partial grouped findings remain open where other issues are distinct:
ID 20481's `After The Talk` had already been cleared under D-18288; the
mention of it as open here was a stale cross-reference. ID 40530's corporate
job title was later cleared under D-19450. Other named/UI terms in D-12824
remain open. Previously cleared exact `FAIL LINE` entries were not counted
again.

## Verification

- Compared exact IDs in English, Japanese, Chinese, and active Korean.
- Only seven approved Korean `Texto` cells changed. Replacing those seven
  lines with their backup values reproduces the original byte-for-byte.
- Pre-edit SHA-256:
  `67215c90989cd5b530b5e5d5b9df6f7f07be264faf9f4ad65dda1438f39c861d`.
- Post-edit SHA-256:
  `7feb04d2ef991183e310657f610ce2ae67b14b0f6cbe9e57dc90327ff7511ecb`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-fail-line-cluster-D19442/locatexts_zh_cn.koalocatext_default.csv`.
- BOM, row order, and all original line endings are preserved.
- Totals: **2,282 accepted / 24,967 not an issue / 11,275 uncertain**
  (38,524). Resume at **D-19443** with the next explicit open finding,
  grouped by exact source or shared context.
