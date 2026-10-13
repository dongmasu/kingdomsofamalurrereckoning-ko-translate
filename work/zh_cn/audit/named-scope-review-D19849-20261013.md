# Default Scope Reconciliation D-19849

2026-10-13. Reviewed all active `default` IDs 37351-37450 against
English meaning, Japanese voice/register, supporting Chinese, active
Korean, official Korean manual terminology and prior exact-key history.
No PAK or PAK-derived material was consulted.

The D-19666 manifest contains 19 keys in this range, all matching
the current English, Japanese and Chinese fields exactly. Previously
accepted corrections at 37415 (Gallows End), 37417 (House of Ballads)
and 37432 (Defender of Pride) remain applied. The other 16 keys were
terminal `not an issue`. None was reclassified or counted again.
The rest of the range was checked in active four-locale order.

| ID | Result | Evidence |
| ---: | --- | --- |
| 37351 | Supported subsequent deity-name correction, no duplicate tally | English Mitharu, Japanese `ミサール` and Chinese `米萨鲁` refer to the god named `미사루` in official Korean manual PDF p. 2. Correct local `미타루` while preserving the blessing. |
| 37358, 37366 | Supported subsequent place-name correction, no duplicate tally | Both English rows name Rathir; Japanese `ラシーア` and Chinese `拉瑟里` support that reading. Reuse `라시르` accepted at D-19743/D-19773, keeping all names, journey and Summer Cradle context unchanged. D-19666's terminal exact key at 37358 is not reopened. |
| 37415 | Supported later spelling correction, no duplicate tally | D-19666 already accepted this Gallows End key, but its `갤로우즈 엔드` spelling conflicts with D-10903/D-11264 and D-19839's later correction at 36143. Change only to `갤로우스 엔드`; preserve Dead Kel, Akara, quotation layout and the earlier accepted status. |

Other rows retain their English-led meaning. In particular, competing
Prismere forms were not normalized by inference alone. No current
global category total is asserted; separate affix 55 remain closed
D-19565.

## Verification

All four default CSVs contain 65,135 ordered IDs (0-65134), and all
100 scope IDs align. Exact inverse reconstruction confirms all bytes
outside four target `Texto` cells match the pre-edit backup. UTF-8
BOM, 72,011 CRLF and 73 pre-existing bare-LF endings remain.

Pre-edit SHA-256:
`bc50e76a5b85d748ae18fb5246285472264737450c66542feeb60e5ec3b57bf5`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19849/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`c54c0caa01daaaaa12004bf8d0adc1b13e3828a5baa58e1762248ed9102cf804`.

D-19849 is reviewed; overall default review is incomplete.
Last reviewed ID 37450; next D-19850 / IDs 37451-37550;
27,684 actual default rows remain through 65134.
