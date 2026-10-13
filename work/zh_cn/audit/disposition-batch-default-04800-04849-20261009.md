# Disposition and Edit Batch: `default` IDs 4800-4849

- Decision date: 2026-10-09.
- Scope: all direct preliminary findings and carried historical questions for
  `default` IDs 4800-4849.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Twelve findings were dispositioned: three accepted, five `not an issue`,
  and four uncertain. Three accepted corrections were applied to their
  approved Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4800 | White Nil Kern clothing/age wordplay | Keep the wordplay and current name form. | D-1165: not an issue. |
| 4803 | `If I didn't know better` | Restore the sardonic hypothetical. | D-1166: accepted. |
| 4805 | `Mindnull` curse | Defer proper-name versus literal-effect reading. | D-1167: uncertain. |
| 4806 | Custodians versus masters | Keep the supported contrast and resentment. | D-1168: not an issue. |
| 4814 | Silent quorums, garrison, and humors analogy | Defer the obscure passage and analogy. | D-1169: uncertain. |
| 4815 | Cursewood village massacre | Keep the source-matched events; exclude the mismatched historical label. | D-1170: not an issue. |
| 4819 | `man of office` | Use the natural Korean `공직자라`. | D-1171: accepted. |
| 4820 | `sharpshooting` | Use the natural term `정밀 사격`. | D-1172: accepted. |
| 4824 | Vial hand-off | Keep the current vial delivery; exclude the mismatched historical title. | D-1173: not an issue. |
| 4833 | `Crudok2` | Defer whether this unchanged source string is developer/test content. | D-1174: uncertain. |
| 4840 | `fastings` / underground passages | Keep the contextual passage reading confirmed by Japanese/Chinese. | D-1175: not an issue. |
| 4843 | Fragment `with Faeblades` | Defer the Korean completion until adjoining UI context is known. | D-1176: uncertain. |

Same-numbered findings in other resources and historical source-key
mismatches were kept separate. All uncertain items remain unchanged.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4803 | `내가 모르는 게 없었다면 이게 운명이라고 했겠지.` | `내가 이걸 잘 몰랐다면 이걸 운명이라고 했겠지.` | D-1166 |
| 4819 | `하지만 나는 공직에 있는 몸이고, 그대의 사랑스러운...` | `하지만 나는 공직자라 그대의 사랑스러운...` | D-1171 |
| 4820 | `명중 사격부터 근접전까지...` | `정밀 사격부터 근접전까지...` | D-1172 |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 4800-4849 once
  and in identical order; all four parse as 65,135 rows.
- Marker sequences match. English, Chinese, and Korean line-break counts
  match for every row in this range. At ID 4819, Japanese alone has one
  additional paragraph break; this pre-existing source-layout difference is
  documented in the preliminary report and was not copied into Korean.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  physical record endings, and zero bare LF bytes.
- Only the three accepted Korean `Texto` cells changed; keys, order, other
  fields, and uncertain Korean rows remain unchanged.
- Active Korean `default` CSV SHA-256:
  `7ce37307fb036997e9b5dc73f0dfe049269f8b3a5689ba67b09052747865d9c8`
- Cumulative dispositions: 246 accepted, 270 `not an issue`, and 660
  uncertain. Resume at `default` ID 4850.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
