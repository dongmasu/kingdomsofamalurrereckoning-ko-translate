# Edit Addendum D-20237

Active CSV and byte-identical backup immediately before edits
both had SHA-256
`4c83443139ee3473547b2506f0d388e7a8586e971c7d90d4a9d44b706ed01b63`:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20237/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58147 | `마녀 기사 아니라를` | `마녀 기사 아니라(Anira)를` | English names Witch Knight Anira; accepted exact D-19827/35210 established this explicit personal-name form. |
| 58148 | `숙소 구역에는` | `병원 구역에는` | The petition board in the Quarters corresponds to English/Korean 35155's Hospitals Quarter board and 35175 Hospitalis Quarters (`병원 구역`). |

Original CRLF restored for both affected rows. Inverse
substitutions recreate the backup byte-for-byte: no bytes
outside these `Texto` cells changed. BOM, 72,011 CRLF
and 73 bare-LF endings, 65,135 ordered IDs and 50
four-locale keys/breaks/markers passed. Post-edit SHA-256:
`365a6055b7b5e7704f481f3f5dc36be331209ee485f188df3b97ff40f098d2f5`.
