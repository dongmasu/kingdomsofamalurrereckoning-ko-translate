# Edit Addendum D-20256

The active CSV and byte-identical backup immediately before editing had
SHA-256 `d41168ea09a0d1b328a9d26fd87c91f7c6dfa938c8ca4dca5b34939bf6477dfd`.
Backup:
`/private/tmp/ko-translate-backups/20261014/before-named-scope-D20256/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 59059 | `멜 센시르의 위대한 영웅인 당신이 오셨군요. 뵙게 되어 영광입니다. 유언 결사에 맞서도록 도와주시겠습니까?` | `멜 센시르의 위대한 영웅인 당신이 오셨군요. 뵙게 되어 영광입니다. 테스타먼트에 맞서도록 도와주시겠습니까?` | English capitalizes the named Testament. Reuse the established Korean form `테스타먼트`; do not import Belen from auxiliary locales or translate the faction as a last will. |
| 59079 | `자유민을 적으로 돌렸구나, 이 자식아.` | `프리맨(Freemen)을 적으로 돌렸구나, 이 자식아.` | English capitalizes Freemen and Japanese names the faction. Reuse accepted D-14185/D-16464/D-16754 usage. |

Only these two `Texto` values changed; their record endings and every other
byte were preserved. Inverse substitutions recreated the backup exactly.
UTF-8 BOM, 72,011 CRLF and 73 bare-LF endings, all 65,135 ordered IDs, and
the 50-ID scope across English, Japanese, Chinese, and Korean passed.
Post-edit SHA-256:
`f9c8e65d6c9cd8c8d694031636a675d1bcc0c49a444c14fa1130b6e6e0bd293f`.
