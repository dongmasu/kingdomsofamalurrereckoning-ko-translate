# Edit Addendum D-20236

Active CSV and byte-identical backup immediately before editing
both had SHA-256
`13ba416b884d6c785d81a93594fde03a878587d7e012a884fb5d66fe75932223`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20236/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58065 | `미사루시여, 와 주셔서 감사합니다.` | `네가 와 줬구나. 미사루께 감사해야겠어.` | English `Thank Mitharu you are here` thanks Mitharu for the addressee's arrival; the old Korean directly addressed the god as the visitor. |

After the original row CRLF was restored, inverse
replacement matched the pre-edit backup byte-for-byte.
Only this `Texto` cell changed; BOM, 72,011 CRLF and 73
bare-LF endings, 65,135 ordered IDs and 50 four-locale
keys/breaks/markers passed. Post-edit SHA-256:
`4c83443139ee3473547b2506f0d388e7a8586e971c7d90d4a9d44b706ed01b63`.
