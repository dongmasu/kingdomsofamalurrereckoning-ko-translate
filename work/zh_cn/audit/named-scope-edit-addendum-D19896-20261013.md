# Edit Addendum D-19896

Scope: `default` IDs 41051-41100.

The earlier accepted corrections at IDs 41075 and 41083 were already active
and were verified without re-editing or recounting.

Before the range edits, the active CSV had SHA-256
`1da9b9fc714dc1a9d666a5c4ec4382252c0045f10d68bcbee9661aa11e895434`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19896/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 41060 | `시드헤를 지나는 동안엔` | `시드를 지나는 동안엔` | English `traversed the Sidhe` identifies the place/realm sense; reuse the accepted scoped form `시드` (D-19793/D-19795). |
| 41085 | `까마귀단의 새 단원을` | `크로우즈(The Crows)의 새 단원을` | English identifies the Crows as the named arena team; reuse the accepted group form (D-10626/D-19867/D-19890). |

After those two edits, SHA-256 was
`13399f5dde9240408b05e73aae062da46b7931f93921188c88e058a5b3540336`.
The byte-identical follow-up backup is
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19896-followup/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 41068 | `투사 본인인` | `챔피언 본인인` | Preserve the capitalized arena title `Champion`; reuse the established Korean title `챔피언` (D-10598/D-12002). |

Final SHA-256:
`01f3a81c477a5c79256de777ae0a2d505229d770a8cdf1a2d6c57fc4bed9f97b`.
The guarded scripts checked both byte-identical backups, the four-locale
scope IDs, complete ID order, BOM, mixed line-ending counts, and exact
inverse reconstruction of every non-target byte.
