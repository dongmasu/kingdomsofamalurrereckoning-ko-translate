# Edit Addendum D-19869

| ID | Before | After | Reason |
| ---: | --- | --- | --- |
| 39357 | `상호작용/달리기` | `상호작용/질주` | Match English Sprint and parallel action labels; preserve the icon token. |
| 39380 | `교수대 끝` | `갤로우스 엔드` | Use the accepted name for Gallows End island. |
| 39385 | `콜로새` | `콜로사이` | Reuse the later accepted Kollossae ethnonym D-19573. |
| 39392 | `이딜라` | `이디라` | Reuse the accepted Idylla spelling. |
| 39398 | `발라드 가문` | `발라드의 집` | Reuse the accepted House of Ballads faction name. |
| 39402 | `미사루식` | `미타란` | Distinguish Mitharan from the deity Mitharu; retain the Dreadscale Heel component. |
| 39441 | `미사루 저항군` | `미타란 저항군` | Apply the accepted Mitharan people/adjective form. |

`apply-named-scope-D19869.rb` enforces that all edit IDs are within
39351-39450, verifies the active pre-edit SHA-256, and makes the
byte-identical backup immediately before writing.

Pre-edit SHA-256:
`dc72d6b0c6d461aa6dfc01f7300cb5c7fd1274044f91377829d5c2790f766f17`.
Backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19869/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`6f0bc1e827146e1888e4cf42639ecb97224bf2c57527eaa726a6873473579d16`.
Inverse reconstruction verified that all bytes outside these seven target
`Texto` cells were preserved. BOM, mixed line endings, ordered IDs and
four-locale alignment were also verified.

No other CSV cells were changed. The previously accepted 39419 correction
was verified without duplicate classification. Resume at D-19870 /
IDs 39451-39550.
