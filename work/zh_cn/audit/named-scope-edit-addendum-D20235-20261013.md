# Edit Addendum D-20235

Immediately before editing, active CSV and byte-identical backup
both had SHA-256
`14b12fe0f3ecef90326a1d795ddcb0f48654bf03ae27abc2e49d3edd8341bec4`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20235/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58012 | `이 근방에서 나보다 나은 대장장이는 없다고 장담하지… 내 가격만 괜찮다면 말이야.` | `이 근방에서 나보다 나은 대장장이는 못 찾을걸… 내가 받는 값으로는 말이지.` | English `I defy you to find a better blacksmith ... at my prices` restricts the comparison by the smith's price, not buyer acceptance. |

Original CRLF restored after patching. Inverse replacement
recreates the backup byte-for-byte; no bytes except this
`Texto` cell changed. BOM, 72,011 CRLF and 73 bare-LF
endings, all 65,135 ordered IDs, 50 four-locale keys,
breaks and markers passed. Post-edit SHA-256:
`13ba416b884d6c785d81a93594fde03a878587d7e012a884fb5d66fe75932223`.
