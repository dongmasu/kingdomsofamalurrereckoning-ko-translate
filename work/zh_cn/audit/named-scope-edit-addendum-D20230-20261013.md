# Edit Addendum D-20230

Byte-identical backup immediately before editing:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20230/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`f9fe3bea192893ca3f13045f1dbaf2b9ac06d5795fd16799bc2d528bd9dee0d5`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 57762 | `그분들의 응답을 목격하는구나!` | `그분들의 승인을 목격하는구나!` | English `their confirmation`, Japanese `承認`, Chinese `肯定` indicate approval rather than a reply. |
| 57773 | `결투에서 그를 쓰러뜨렸지.` | `결투에서 그를 죽였지.` | English `slew him in fair combat` and Chinese explicitly describe death. |

After restoring the affected CRLF line endings, inverse substitutions
reconstruct the backup byte for byte. Only these two `Texto` cells
changed; BOM, 72,011 CRLF plus 73 bare-LF endings, 65,135 ordered
IDs and 50 four-locale keys, breaks and markers passed.
Post-edit SHA-256:
`28ecc619c26a37224ba0c53e47c57d1788544ee688f88904dadef78ce79f7938`.
