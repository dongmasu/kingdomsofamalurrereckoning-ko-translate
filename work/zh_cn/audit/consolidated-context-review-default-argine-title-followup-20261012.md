# Consolidated Context Review: `Argine, Queen of Staves`

- Date: 2026-10-12.
- Decision: D-19462.
- Scope: the sixteen open exact-label keys from D-19445:
  3307, 6044, 8663, 12593, 14564, 21485, 30045, 31796, 38694, 40340,
  41255, 43684, 52596, 53842, 55720, and 62000.

## Finding

The prior review used only the repeated label and therefore lacked context
to distinguish a card from an in-world title. English ID 60044 resolves
that question directly: `Queen of Staves` is a title reserved for the
oldest and wisest camp leaders and awarded by the Hierophant for service.
Japanese ID 60044 independently calls it a title; Chinese describes it as
a crown/title awarded to the most qualified camp leader. The sixteen target
rows all use the exact same English label for Argine.

The accepted active Korean form at ID 33892 is `지팡이 여왕 아르진`.
English `Argine`, Japanese `アジーン`, Chinese `阿金妮`, and the established
Korean precedent support using that same spelling for this character. The
title definition at ID 60044 already renders `Queen of Staves` as
`지팡이 여왕`. The card-versus-title question is therefore settled, and the
remaining word-order, particle, and transliteration variants can be
normalized to the accepted Korean precedent.

## Decisions and Applied Cells

All sixteen previously uncertain keys are accepted. Fifteen cells changed;
ID 40340 already matched the accepted form and needed no edit.

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 3307 | `완드의 여왕 아르진(Argine)` | `지팡이 여왕 아르진` |
| 6044 | `홀의 여왕 아르진(Argine)` | `지팡이 여왕 아르진` |
| 8663 | `아르진, 홀의 여왕` | `지팡이 여왕 아르진` |
| 12593 | `지팡이의 여왕 아르진(Argine, Queen of Staves)` | `지팡이 여왕 아르진` |
| 14564 | `지팡이의 여왕 아르진(Argine)` | `지팡이 여왕 아르진` |
| 21485 | `지팡이의 여왕 아르진` | `지팡이 여왕 아르진` |
| 30045 | `지팡이의 여왕 아르진(Argine)` | `지팡이 여왕 아르진` |
| 31796 | `지팡이 여왕 아르긴` | `지팡이 여왕 아르진` |
| 38694 | `지팡이의 여왕 아르진(Argine)` | `지팡이 여왕 아르진` |
| 40340 | `지팡이 여왕 아르진` | unchanged; already canonical |
| 41255 | `아르진, 지팡이의 여왕` | `지팡이 여왕 아르진` |
| 43684 | `지팡이의 여왕 아르긴` | `지팡이 여왕 아르진` |
| 52596 | `지팡이의 여왕 아르긴(Argine)` | `지팡이 여왕 아르진` |
| 53842 | `지팡이 여왕 아르진(Argine)` | `지팡이 여왕 아르진` |
| 55720 | `지팡이의 여왕 아르진(Argine, Queen of Staves)` | `지팡이 여왕 아르진` |
| 62000 | `지팡이 여왕 아르긴(Argine)` | `지팡이 여왕 아르진` |

ID 30045's separate basic meaning was already `not an issue`; this review
closes its remaining title-form uncertainty without recounting its key.

## Verification

- Compared all sixteen exact labels across English, Japanese source,
  Japanese-derived draft, Chinese, and active Korean; checked the direct
  title definition at ID 60044 and accepted title precedent at ID 33892.
- Only the fifteen listed Korean `Texto` cells changed.
- Pre-edit SHA-256:
  `e279b66c19bca275f0d4a16efa527aee7a223a89bffec285b49449e68a47db7d`.
- Post-edit SHA-256:
  `048004332ac9b2d5125a9d68c63b369ebf766f41261b8e23d95b85a62a329f37`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-argine-title-normalization-D19462/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the fifteen exact substitutions reproduces the backup byte for
  byte. BOM, row order, CRLF endings, and pre-existing bare-LF endings are
  preserved.
- Totals after D-19462: **2,333 accepted / 25,006 not an issue /
  11,185 uncertain** (38,524). Resume at D-19463 from the deduplicated
  unresolved-source queue.
