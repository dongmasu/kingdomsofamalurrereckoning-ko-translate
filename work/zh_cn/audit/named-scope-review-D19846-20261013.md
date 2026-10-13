# Default Scope Reconciliation D-19846

2026-10-13. Reviewed all active `default` IDs 37051-37150 against
English meaning, Japanese register, supporting Chinese, active Korean,
official Korean manual terminology and prior exact-key history. No PAK
or PAK-derived material was consulted.

The D-19666 manifest has nine keys in this scope. All nine English,
Japanese and Chinese fields match the current source rows. The accepted
Kollossae correction at 37138 remains applied; the other eight keys
(37058, 37064, 37067, 37085, 37093, 37115, 37137, 37144) were already
terminal `not an issue`. None is reclassified or recounted. All other
active rows were inspected in four-locale order with the existing
terminal and ordinary-text dispositions.

| ID | Result | Evidence |
| ---: | --- | --- |
| 37063 | Supported subsequent grammatical correction; no duplicate classification | English makes the frightening implement the thing discovered after a massive mountain landslide; rescuers then heard it calling for help. Japanese and Chinese support that sequence. Restore the Korean subject/predicate connection in the second sentence without changing the gelatinous orb or the rescue account. D-11991 previously accepted removal of an unsupported retrieval action; that earlier edit remains applied and is not recounted. |
| 37076 | Supported subsequent terminology correction; no duplicate classification | English names the deity Mitharu. Official Korean manual PDF p. 2 uses `미사루`; replace `미타루께` only. D-11996 had closed the shrine/offering meaning; that earlier exact-key classification is not repeated. |
| 37123 | Supported subsequent place-name correction; no duplicate classification | English Rathir, Japanese `ラシーア` and Chinese `拉瑟里` name the city whose Korean form `라시르` was accepted in D-19743/D-19773 and subsequent reviews. Keep the `지부`/`분회` hierarchy accepted in D-12017; replace only `라시어`. |
| 37124 | Supported subsequent place-name correction; no duplicate classification | English locates the Scholia Arcana library in Rathir. Retain D-12018's accepted `서클릿` and `스콜리아 아르카나` along with the chest/stealth objective; correct only the local city spelling to `라시르`. |

The other rows retain source-led meanings and markup. No current global
category total is asserted; separate affix 55 remain closed D-19565.

## Verification

All four default CSVs have 65,135 ordered IDs (0-65134), with the
100 scope IDs occurring once across all locales. Exact inverse
reconstruction confirms that all bytes outside four target `Texto`
cells are unchanged. UTF-8 BOM, 72,011 CRLF and 73 pre-existing
bare-LF endings were preserved.

Pre-edit SHA-256:
`6c7d7447bf7a5ee0d8699881c0df5730c2e6d8b192229ac4ab5273a08b42d1fa`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19846/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`9acaf85a7e5c69b2b57b93f659ab5467d9187cab68f8eadf86a51bcd515bf8d3`.

D-19846 is reviewed; overall default review remains incomplete.
Last reviewed ID 37150; next D-19847 / IDs 37151-37250;
27,984 actual default rows remain through 65134.
