# Default Scope Review D-19856

2026-10-13. Reviewed all active `default` IDs 38051-38150 against English
meaning, Japanese voice/register, supporting Chinese, active Korean,
historical exact-key decisions, recurring terminology, and the official
Korean manual. No PAK or PAK-derived material was consulted.

All eight D-19667 manifest keys in this range exactly match the current
English, Japanese, and Chinese rows. Its accepted keys at 38082, 38128,
and 38139 retain their terminal accepted status; the other five remain
terminal `not an issue`. These keys were validated without duplicate
classification or recounting. At 38082, the already-approved
`발라드의 집` and `메아리석` forms are present; the later edit addresses
the distinct Cairn noun.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 38059 | Subsequent title-term correction | English directly addresses the player as `the Beckoned`; use the approved title `부름받은 자` (D-692 and D-19613) instead of the provisional `초대받은 자`. |
| 38082 | Subsequent Cairn-term correction; prior D-19667 acceptance retained | English identifies a Fae Cairn, Japanese uses `ケルン`, and the active corpus renders the matching Fae Cairn at ID 58814 as `돌무덤`. Replace awkward `무덤돌` with `돌무덤`; the established House and Echo Stone corrections remain applied. |
| 38139 | Subsequent Rathir spelling normalization; prior D-19667 acceptance retained | The accepted D-19667 row is source-matched. Its earlier `라시어` is superseded by the later active-corpus form `라시르` established in D-19851. Leave `피르데리` unchanged; the English `Pyrderi` spelling and differing locale forms do not support a new row-level correction. |

The other 97 active rows retain their English-led meanings and prior
dispositions, including five D-19667 terminal `not an issue` keys and the
already-accepted corrections at 38081, 38121, 38128, and 38133. No prior
terminal key was reclassified or recounted. No current global category
total is asserted. Separate affix 55 remain closed by D-19565.

## Verification

All four active default CSVs contain the 65,135 ordered IDs 0-65134, and
all 100 scope IDs align. Exact inverse reconstruction confirms all pre-edit
bytes outside the three target `Texto` cells are preserved. The UTF-8 BOM,
72,011 CRLF endings, and 73 pre-existing bare-LF endings remain unchanged.
The eight D-19667 source keys were independently matched against the three
current source locales (8/8).

Pre-edit SHA-256:
`3443677a4e91afe8b3376c1c1aa9dc38e9bd4dc01574fd3a12fff7efa8cc598c`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19856/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`5218f3f3f316f1b1c4c13a98687b902087851212c7c7f9d1c92a1ae74c14374f`.

D-19856 is reviewed; overall default review remains incomplete. Last
reviewed ID 38150; next D-19857 / IDs 38151-38250; 26,984 actual default
rows remain through 65134.
