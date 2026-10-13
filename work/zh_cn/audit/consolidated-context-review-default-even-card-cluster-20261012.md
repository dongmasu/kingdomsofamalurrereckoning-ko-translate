# Consolidated Context Review: Even Card Labels

- Date: 2026-10-12.
- Decisions: D-19470-D-19471.
- Scope: `default` IDs 3774, 7461, 8342, 8610, 10597, 14884, and 15151.

## Finding

The seven isolated English `Even` labels belong to the game's odd/even card
draw exchange, not a tied result. English ID 10861 explicitly asks which card
to draw, “odd or even”; ID 12942 rejects an odd guess because the card is a
four, and ID 18669 rejects an even guess because the card is a three.
Japanese uses `偶数` at all seven labels and confirms the number sense in the
exchange. Chinese uses `平局` consistently, but its tie reading conflicts
with the English-defined card choices and is not followed as meaning
authority. Existing Korean precedents at IDs 1899 and 11573 already use
`짝수`; ID 1899 was explicitly confirmed as an even-number card prompt.

| ID | English | Japanese source | Chinese source | Active Korean | Decision |
| ---: | --- | --- | --- | --- | --- |
| 3774 | `Even` | `偶数` | `平局` | `짝수` | D-19471: not an issue |
| 7461 | `Even` | `偶数` | `平局` | `짝수` | D-19471: not an issue |
| 8342 | `Even` | `偶数` | `平局` | `짝수` | D-19471: not an issue |
| 8610 | `Even` | `偶数` | `平局` | `짝수` | D-19471: not an issue |
| 10597 | `Even` | `偶数` | `平局` | `무승부` -> `짝수` | D-19470: accepted |
| 14884 | `Even` | `偶数` | `平局` | `짝수` | D-19471: not an issue |
| 15151 | `Even` | `偶数` | `平局` | `짝수` | D-19471: not an issue |

One prior uncertainty was accepted with a targeted correction; six were
resolved as `not an issue`. No other key was recounted. No runtime marker,
embedded line break, or variant field occurs in these labels.

## Verification

- Compared English, Japanese source and preserved draft, Chinese source, and
  active Korean by `ID_Linha`; the card-dialogue evidence is at IDs 10861,
  12942, and 18669.
- The pre-edit active Korean SHA-256 was
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- The post-edit active Korean SHA-256 is
  `df9685d685ab7dd41c9490ef6e46283f16d370592f617e28beba4ac34c7306dc`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-even-card-cluster-D19470/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the exact `10597;무승부` -> `10597;짝수` substitution reproduces
  the backup byte-for-byte. The UTF-8 BOM, 65,135 data rows, row order,
  72,011 CRLF endings, and 73 pre-existing bare-LF endings are preserved.
- Totals after D-19471: **2,350 accepted / 25,097 not an issue / 11,077
  uncertain** (38,524). Resume at **D-19472** from the deduplicated
  unresolved-source queue; do not restart contiguous scans.
