# Edit Addendum D-20248

Immediately before editing, active CSV and byte-identical
backup both had SHA-256:
`504e61aa43762c1f118ff070b2ddd1eb678389803e702da7dd3ed1352919b2f8`.
Backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20248/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 58654 | `주변에 포위된 에틴이 훔쳐 간 걸까?` | `주변에 있던 에틴이 훔쳐 간 걸까?` | English `surrounded ettin` is awkward; Japanese/Chinese specify an ettin nearby, not encircled. |

Original CRLF retained. Inverse substitution reproduces
the backup byte-for-byte; all non-target bytes preserved.
BOM, 72,011 CRLF/73 bare-LF, 65,135 ordered IDs,
all 50 scoped keys/breaks and marker identities passed.
Japanese 58669 retains its documented marker-order variant.
Active SHA-256:
`dbb7bf2610595eb4d5b8a55d4bf5b19a30ee799705782b54d6737987fe50d45d`.
