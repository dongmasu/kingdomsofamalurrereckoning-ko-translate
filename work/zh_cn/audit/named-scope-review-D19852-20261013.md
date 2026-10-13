# Default Scope Reconciliation D-19852

2026-10-13. Reviewed all active `default` IDs 37651-37750 against
English meaning, Japanese voice/register, supporting Chinese, active
Korean, prior exact-key history, and the official Korean manual. No PAK
or PAK-derived material was consulted.

All 18 D-19667 manifest keys in this range exactly match the current
English, Japanese, and Chinese rows. D-19667 accepted ID 37728, whose
`미사루` correction remains applied; its other 17 keys were terminal
`not an issue` findings. These keys were validated without
reclassification or recounting. The accepted D-19501 form at 37675,
`예정된 자들(Preordained)`, also remains applied.

| ID | Result | Evidence |
| ---: | --- | --- |
| 37668 | Supported subsequent faction-name correction, no duplicate tally | English names the House of Ballads; Japanese and Chinese identify the same House. Reuse established `발라드의 집` from D-19488 and later exact-row applications; replace `발라드의 전당` only. |
| 37739 | Supported subsequent deity-name correction, no duplicate tally | English and both supporting locales identify Mitharu, rendered `미사루` in the official Korean manual, PDF p. 2. Replace `미타루` only; preserve the warning about exploiting the meek and the restoration claim. |

The other 98 active rows retain their English-led meanings and previous
dispositions. This includes prior accepted corrections at 37686, 37728,
37742, and 37748. No current global category total is asserted. Separate
affix 55 remain closed by D-19565.

## Verification

All four active default CSVs contain 65,135 ordered IDs (0-65134), and
all 100 scope IDs align. Exact inverse reconstruction confirms all
pre-edit bytes outside the two target `Texto` cells are preserved.
The UTF-8 BOM, 72,011 CRLF endings, and 73 pre-existing bare-LF endings
remain unchanged.

Pre-edit SHA-256:
`05f4004cc3f1a57ca2cf8441b14418519db85f29d17443cfb0479c63b4d8abd7`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19852/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`a6b091e2b946496b37601d9f35aeece4f2c80be80bc73e8f573ae04e3dd5c853`.

D-19852 is reviewed; overall default review remains incomplete.
Last reviewed ID 37750; next D-19853 / IDs 37751-37850;
27,384 actual default rows remain through 65134.
