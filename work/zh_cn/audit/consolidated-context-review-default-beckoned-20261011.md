# Consolidated Context Review: `Beckoned`

- Date: 2026-10-11
- Scope: 17 previously uncertain `default` IDs: 8822, 12958, 18145, 26101,
  26134, 29660, 32582, 43478, 48472, 48905, 49380, 49876, 49898, 52221,
  52479, 52546, and 58726.
- Result: D-18212 accepts seven corrections from `선택받은 자(여)` to
  `부름받은 자(여)`. Ten keys remain uncertain because prior accepted
  decisions use both `부름받은 자` and `불려온 자`; context does not establish
  one exclusive Korean title form. No other title variants were normalized.

## Evidence

English capitalizes `Beckoned` as the protagonist's recurring title/address.
The Japanese source uses `招かれし者` in several matching rows, while Chinese
uses both `天选者` and `召唤者`. Earlier accepted decisions D-692 and D-3115
specifically replace `초대받은 자`/`선택받은 자` with `부름받은 자` for this
player title. Later D-1701 and D-1776 also accept `불려온 자` in title
contexts. The first pair establishes that Korean `선택받은 자` changes the
source from being called/beckoned to being chosen; the latter decisions show
that a single exclusive Korean form has not been maintained.

Apply the supported D-692/D-3115 correction only to these seven rows:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 8822 | `선택받은 자여` | `부름받은 자여` |
| 43478 | `선택받은 자여` | `부름받은 자여` |
| 48472 | `선택받은 자` | `부름받은 자` |
| 48905 | `선택받은 자` | `부름받은 자` |
| 49380 | `선택받은 자여` | `부름받은 자여` |
| 49876 | `선택받은 자여` | `부름받은 자여` |
| 49898 | `선택받은 자여` | `부름받은 자여` |

The other ten reviewed IDs already use `부름받은 자`, `불려온 자`, or
`초대받은 자`. Their source meaning is retained, but the corpus contains
conflicting accepted precedents for the formal Korean title. Leave those
translations unchanged and uncertain until a corpus-wide title convention is
established. This review does not authorize replacing all instances of
`Beckoned`.

## Verification

- The 17 IDs were joined by `ID_Linha` across English, Japanese,
  Japanese-derived Korean, Chinese, and active Korean files.
- Only the seven approved `Texto` cells changed. The CSV retains its UTF-8
  BOM, 65,135 records, row order, 72,011 CRLF endings, and 73 existing bare-LF
  endings.
- Pre-edit SHA-256:
  `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
- Post-edit SHA-256:
  `4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-beckoned-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18212: 1,917 accepted, 22,969 `not an
  issue`, and 13,636 uncertain (38,522 unique dispositions); next decision:
  D-18213.

These are working dispositions, not independent final linguistic approval.
