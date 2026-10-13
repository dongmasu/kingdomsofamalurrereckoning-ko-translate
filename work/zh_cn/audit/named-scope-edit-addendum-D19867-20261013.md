# Edit Addendum D-19867

| In-scope ID | Before | After | Reason |
| ---: | --- | --- | --- |
| 39211 | `교수대 끝` | `갤로우스 엔드` | Normalize named island. |
| 39226 | `가로우즈 엔드` | `갤로우스 엔드` | Normalize named island. |
| 39238 | `완벽한 미사루식 피추적자의 자루` | `흠 없는 미타란 피추적자의 자루` | Correct Flawless quality and Mitharan affiliation; preserve the item component. |
| 39239 | `까마귀단` | `크로우즈(The Crows)` | Reuse the established arena-team name. |

## Out-of-Scope Side Effect

The applicator also changed ID 39091 from `복수의 가문` to
`복수의 집`. ID 39091 is outside D-19867's 39151-39250 scope. The
form is supported by D-19806, but this cell is disclosed separately
and is excluded from D-19867's in-scope edit count.

`apply-named-scope-D19867.rb` checked the active hash and made
a byte-identical backup immediately before editing. Its edit list
contained the out-of-range ID; subsequent applicators now reject any
edit outside their assigned 100-ID range.
Pre-edit SHA-256
`034dcd97223785cd071c89305b0ff1a80c88d11b1b136afa6fc630dbbd4bec20`;
backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19867/locatexts_zh_cn.koalocatext_default.csv`;
post-edit SHA-256
`27715acf05bb289275a4d1507560f5f387654055147f38b9d574c3c22ddfc1bd`.
Inverse byte reconstruction, BOM, mixed endings and ordered IDs verified.
All 100 scope rows align in four locales; the three in-range D-19667
source keys (39159, 39191, 39231) match the three read-only source locales.
