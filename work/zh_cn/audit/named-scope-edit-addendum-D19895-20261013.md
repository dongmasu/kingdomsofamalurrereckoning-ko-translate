# Edit Addendum D-19895

Scope: `default` IDs 41001-41050.

The earlier accepted corrections at IDs 41002 and 41017 and the House of
Ballads phrase at 41044 were already present in the active CSV and were
verified without re-editing or recounting their terminal decisions.

Immediately before the new edit, the active CSV had SHA-256
`bcc14cb244505cfa700aa79043fb2487e3758d5586799d097dbd111d1d55ceee`.
Its byte-identical backup is
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19895/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 41044 | `아가씨는 또다시 좌절했네,` | `시녀는 또다시 좌절했네,` | English's capitalized `The Maid` identifies the named figure; reuse the accepted Maid-of-Windemere form `시녀` from D-19880/D-19889. Keep the separate, previously accepted `발라드의 집` correction and all remaining poem text/lineation. |

Post-edit SHA-256:
`1da9b9fc714dc1a9d666a5c4ec4382252c0045f10d68bcbee9661aa11e895434`.
The guarded edit script
`apply-named-scope-D19895.rb` verified the active hash and backup, scope
alignment in all four locales, BOM, line-ending counts, complete ID order,
and exact inverse reconstruction of all non-target bytes.
