# Edit Addendum D-20246

Immediately before editing, active CSV and byte-identical backup
had SHA-256:
`68c45b4e871f171be1a20dcf4923723689ac824fd828a8ae8d15d312928fe946`.
Backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20246/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58563 | `내 신부가 될` | `나를 신부로 맞아 줄` | English Widow's `I seek a man / To make me bride`; Japanese/Chinese confirm that the man marries her. |
| 58572 | `홀 숙련` | `셉터 숙련` | English `Sceptre Mastery`; official Korean manual PDF p. 7 labels the weapon class `셉터`. |

Original CRLF endings restored, including the ballad's
embedded line. Inverse substitutions reproduce backup bytes
exactly; all non-target bytes retained. BOM, 72,011
CRLF/73 bare-LF, 65,135 ordered IDs and 50 scoped
four-locale keys/markers passed; 58599 source-locale
line-count difference retained. Active SHA-256:
`504e61aa43762c1f118ff070b2ddd1eb678389803e702da7dd3ed1352919b2f8`.
