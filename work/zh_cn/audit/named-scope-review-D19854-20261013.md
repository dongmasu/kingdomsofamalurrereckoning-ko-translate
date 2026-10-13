# Default Scope Reconciliation D-19854

2026-10-13. Reviewed all active `default` IDs 37851-37950 against
English meaning, Japanese voice/register, supporting Chinese, active
Korean, prior exact-key history, and the official Korean manual. The
earlier 50-row preliminary/disposition reviews were reconciled against
the current cells. No PAK or PAK-derived material was consulted.

All 19 D-19667 manifest keys in this range exactly match the current
English, Japanese, and Chinese rows. ID 37880's accepted `크로우`
correction remains applied; the other 18 keys retain their terminal
`not an issue` dispositions. They were validated without duplicate
classification or recounting.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 37867, 37888 | Supported subsequent Hugues spelling correction | Both English rows name Hugues; Japanese `ヒューズ` and Chinese `修格斯` corroborate the same name. Reuse the established active-corpus form `휴그` (D-839, D-19513, and D-19836). This resolves the name-spelling issue at 37867 under D-12296; the sentence and question remain unchanged. |

The other 98 active rows retain their English-led meanings and prior
dispositions. This includes the source-validated D-19667 keys, the
already accepted Antechamber correction at 37857, and the established
Crows term at 37880. No current global category total is asserted.
Separate affix 55 remain closed by D-19565.

## Verification

All four active default CSVs contain 65,135 ordered IDs (0-65134), and
all 100 scope IDs align. Exact inverse reconstruction confirms all
pre-edit bytes outside the two target `Texto` cells are preserved.
The UTF-8 BOM, 72,011 CRLF endings, and 73 pre-existing bare-LF endings
remain unchanged.

Pre-edit SHA-256:
`8405c183302a41a7758122b881dc2bf893df9718d4326b98798b0c84dcd17df8`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19854/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`fe43cb27539ac59cb30a1cfc1c497bd5ba1aabe2d179baa48bf71b25a9ef6f42`.

D-19854 is reviewed; overall default review remains incomplete.
Last reviewed ID 37950; next D-19855 / IDs 37951-38050;
27,184 actual default rows remain through 65134.
