# Edit Addendum D-19897

Scope: `default` IDs 41101-41150.

The earlier accepted corrections at IDs 41118 and 41123 were already active
and were verified without re-editing or recounting.

Immediately before the new edit, the active CSV had SHA-256
`01f3a81c477a5c79256de777ae0a2d505229d770a8cdf1a2d6c57fc4bed9f97b`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19897/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 41117 | `바다 문양이 새겨진 윤이 나는 은 팔찌.` | `바다 문양이 새겨진 윤이 나는 은 반지.` | English `band` is supported as a ring by both Japanese and Chinese; correct the unsupported bracelet-specific reading. |

Post-edit SHA-256:
`823f144e32bdd4d13c501ab96d696417f8dacdaf09c2c06e211270ccf224f9df`.
The guarded edit script
`apply-named-scope-D19897.rb` verified the active hash and backup,
four-locale scope alignment, complete ID order, BOM, line-ending counts,
and exact inverse reconstruction of all non-target bytes.
