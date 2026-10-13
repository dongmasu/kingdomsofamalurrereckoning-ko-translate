# Edit Addendum D-20233

Immediately before CSV editing, active CSV and byte-identical
backup both had SHA-256
`28ecc619c26a37224ba0c53e47c57d1788544ee688f88904dadef78ce79f7938`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20233/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 57901 | `창백한 지팡이` | `페일링 완드(Paling Wand)` | English names the Paling Wand, an established named farming artifact in active IDs 5386, 20780, 57408; do not misread Paling as `pale`. |

After restoring the row's original CRLF, inverse replacement
reconstructed the pre-edit backup byte-for-byte. No byte outside
this `Texto` cell changed; BOM, 72,011 CRLF plus 73 bare-LF
endings, 65,135 ordered IDs, and 50 four-locale rows,
embedded breaks and markers passed. Post-edit SHA-256:
`c4611e5bdeeac13f6ef2e42e8a13430640375029a136edbe01a4d09f6f4beb59`.
