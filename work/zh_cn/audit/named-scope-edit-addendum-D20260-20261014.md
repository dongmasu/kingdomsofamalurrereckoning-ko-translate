# Edit Addendum D-20260

The active CSV and byte-identical backup immediately before editing had
SHA-256 `b5bbf4f8bb0a5feaa2d0cb07e9971b3cbf96764f3109a46cd848891ebfa94166`.
Backup:
`/private/tmp/ko-translate-backups/20261014/before-named-scope-D20260/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Before | After | Evidence |
| ---: | --- | --- | --- |
| 59294 | `대장장이 기술을 익히면 수리 도구의 효율이 높아져 야외에서도 장비를 손볼 수 있습니다.` | `대장기술을 익히면 수리 도구의 효율이 높아져 야외에서도 장비를 손볼 수 있습니다.` | The official Korean manual (PDF p. 4) establishes `Blacksmithing = 대장기술`; retain the Repair Kit effect and field-maintenance meaning. |

Only this `Texto` value changed; its record ending and every other byte
were preserved. Inverse substitution recreated the backup exactly.
UTF-8 BOM, 72,011 CRLF and 73 bare-LF endings, all 65,135 ordered IDs, and
the 50-ID scope across English, Japanese, Chinese, and Korean passed.
Post-edit SHA-256:
`6acee9a3f0415992d65b4f1b3dabadacb6906b3e066ab99f7a3be304b4fe17f1`.
