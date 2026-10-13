# Default Scope Reconciliation D-19845

2026-10-13. Reviewed all 100 active `default` IDs 36951-37050
against English meaning, Japanese register, supporting Chinese, active
Korean, official Korean manual materials and previous exact-key history.
No PAK or PAK-derived material was consulted.

All 21 D-19666 manifest keys in this range exactly match their
current English, Japanese, and Chinese source fields. The previous
accepted corrections at 36973 (Kollossae), 36993 (Mitharu), 37033
(Travelers) and 37035 (Mitharan) remain applied; the other 17 keys
were already terminal `not an issue`. No terminal key is newly
classified or counted again. Other rows were reviewed in the active
four-locale order, retaining English-led meaning, UI placeholders,
quantities and layout where supported.

| ID | Result | Evidence |
| ---: | --- | --- |
| 36958 | Supported subsequent terminology correction, no duplicate classification | English names the wisdom goddess Ethene. The official Korean manual extraction (PDF p. 2) and reference both use `에테네`; replace the local `에센` while preserving the war and new-homeland context. The older D-11943 uncertainty was already terminal under D-19666, so this edit is not a new global finding. |

The other historical uncertainties in this exact range are already
terminal under D-19666; variant readings alone are not used to reopen
them. No current global category total is asserted. Separate affix
55 remain closed D-19565.

## Verification

All four default CSVs have 65,135 IDs (0-65134) once and in identical
order, with all 100 range IDs aligned. Exact inverse reconstruction
verifies all bytes outside ID 36958's `Texto` cell are unchanged.
UTF-8 BOM, 72,011 CRLF and 73 pre-existing bare-LF endings remain.

Pre-edit SHA-256:
`ac7a388338969aaf0dcae17c1e036a56318cd23084491c69f2b95061732709f5`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19845/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`6c7d7447bf7a5ee0d8699881c0df5730c2e6d8b192229ac4ab5273a08b42d1fa`.

D-19845 is reviewed; overall default review is incomplete. Last
reviewed ID 37050; next D-19846 / IDs 37051-37150; 28,084
actual default rows remain through 65134.
