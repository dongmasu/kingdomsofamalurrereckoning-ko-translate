# Edit Addendum D-20255

Active CSV and byte-identical backup immediately before editing:
`97e65d4e1ab2b7c5abd560842ced692da81cd48baf477713f23999e8d1bd4096`.
Backup:
`/private/tmp/ko-translate-backups/20261014/before-named-scope-D20255/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 59008 | `델프를 죽이면 범죄자로 지내며 모은 재물을 대부분 차지할 수 있다.` | `델프를 죽이면 그의 재물을 차지할 수 있다. 그 재물 대부분은 델프가 범죄자로 지내며 모은 것이다.` | English `welcome to his treasures, most of which were gathered`; `most` describes acquisition, not claimable share. |
| 59038 | `그들에게 내가 낭비한 숨결조차 아깝군. 강한 전사들이 있긴 하지만, 집단으로서는 결속력이 없어.` | `그들에겐 말을 섞을 가치도 없군. 강한 전사들이 있긴 하지만, 집단으로서는 기개가 없어.` | English `don't deserve the breath I waste on them` and `no collective spine`; Japanese supports contempt and lack of resolve. |

Both original CRLF endings retained. Inverse
substitutions recreated the backup byte-for-byte.
BOM, 72,011 CRLF and 73 bare-LF endings, all 65,135
ordered IDs and 50 four-locale keys/breaks/marker
identities passed. Post-edit SHA-256:
`d41168ea09a0d1b328a9d26fd87c91f7c6dfa938c8ca4dca5b34939bf6477dfd`.
