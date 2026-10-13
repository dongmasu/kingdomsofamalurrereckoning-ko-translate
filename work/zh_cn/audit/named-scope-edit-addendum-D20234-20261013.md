# Edit Addendum D-20234

Active and byte-identical backup immediately before editing
both had SHA-256
`c4611e5bdeeac13f6ef2e42e8a13430640375029a136edbe01a4d09f6f4beb59`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20234/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58000 | `까마귀와 큰까마귀` | `떼까마귀와 까마귀` | English `rooks and crows` (distinct from ravens); Chinese likewise distinguishes the rook. |

Affected row's original CRLF was restored after the patch.
Inverse substitution recreated the backup byte-for-byte;
only this `Texto` cell changed. BOM, 72,011 CRLF and 73
bare-LF endings, 65,135 ordered IDs, and all 50 four-locale
rows, breaks and runtime markers passed. Post-edit SHA-256:
`14b12fe0f3ecef90326a1d795ddcb0f48654bf03ae27abc2e49d3edd8341bec4`.
