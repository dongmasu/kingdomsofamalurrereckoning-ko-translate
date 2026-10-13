# Edit Addendum D-20241

Active CSV and byte-identical backup immediately before editing
both had SHA-256
`7e251267909c22c8f174b22054e695ff5fa6942daccef1d465eef356c5ad5b7a`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20241/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58314 | `까마귀단은` | `크로우즈(The Crows) 팀은` | English names the same arena team already aligned at 57726, 57792, 57947 and 58032. |

Original row CRLF restored. Inverse replacement
recreated the backup byte-for-byte; no other `Texto`
or non-target bytes changed. BOM, 72,011 CRLF
and 73 bare-LF endings, 65,135 ordered IDs and
50 four-locale keys/breaks/markers passed. Post SHA-256:
`7614388ab81d79987c8bf073d053a9f2b1f69e8cb4cf1e739b0b9cb7b9324eee`.
