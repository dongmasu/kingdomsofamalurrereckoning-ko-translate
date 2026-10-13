# Edit Addendum D-20228

Verified the active default CSV at pre-edit SHA-256
`b575380bf7ac1d45f6a9e37fd5bf13602b29f2fdc81936f9ef1b71a00a4e20b5`
and the byte-identical backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20228/locatexts_zh_cn.koalocatext_default.csv`
before the range edits.

| ID | Before | After | Reason |
| ---: | --- | --- | --- |
| 57662 | Two references to `암호자` for capitalized `Cipher` | `사이퍼(Cipher)` in the quoted artifact reference and later carried-object reference | Reuse accepted named-artifact terminology at IDs 25030, 26923, and 4626; preserve narration, referents, and paragraph breaks. |
| 57663 | `이브닝타이드의 친구` | `이븐타이드의 친구` | Align the proper name with accepted D-19586/D-19710 usage. |
| 57696 | `까마귀단` | `크로우즈` | Align the standalone arena-team label with accepted Crows usage at IDs 23377 and 54427 and active team references. |

ID 57220 was also corrected as a separate out-of-range follow-up:
`암호문을 지닌 채` -> `사이퍼(Cipher)를 지닌 채`, reusing the same
accepted named-artifact term. It is not part of D-20228's 50-row review.

The range applicator's inverse reconstruction and an independent read-only
check confirmed that bytes outside these target `Texto` cells are
unchanged. BOM, mixed line endings, all 65,135 ordered IDs, and the 50
four-locale rows, embedded line breaks, and runtime markers were preserved.
Post-edit SHA-256:
`4888a62e9823614fca921dce65fbea5726c4e4877a380eb3237b1df1e4b90bce`.
