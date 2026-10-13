# Edit Addendum D-20242

Active CSV and byte-identical backup immediately before editing
both had SHA-256
`7614388ab81d79987c8bf073d053a9f2b1f69e8cb4cf1e739b0b9cb7b9324eee`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20242/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58393 | `대회를 진행하지 않으려 하지.` | `대회를 진행하지 않을 거야.` | English `won't let it go on until we can participate`; old double-negative reversed the condition. |
| 58396 | `하지만 시단은` | `하지만 사이던은` | English Cydan; active ID 57977 already spells this character `사이던`. |

Both original CRLF endings restored. Inverse substitutions
recreated the backup byte-for-byte; no bytes outside
these `Texto` cells changed. BOM, 72,011 CRLF plus 73
bare-LF endings, all 65,135 ordered IDs and 50
four-locale keys/breaks/markers passed. Post-edit SHA-256:
`0be32e9b9e5c112fd7ad63888010bbd8911389bf7595998c66e78fceea55bd6d`.
