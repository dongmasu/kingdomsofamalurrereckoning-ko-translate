# Default Scope Reconciliation D-19853

2026-10-13. Reviewed all active `default` IDs 37751-37850 against
English meaning, Japanese voice/register, supporting Chinese, active
Korean, prior exact-key history, and the official Korean manual. The
earlier 50-row preliminary/disposition reviews were reconciled against
the current cells. No PAK or PAK-derived material was consulted.

All 26 D-19667 manifest keys in this range exactly match the current
English, Japanese, and Chinese rows. None is among D-19667's 16 accepted
corrections; all 26 were among its other 184 terminal `not an issue`
findings. They were source-validated without reclassification or
recounting. This includes the already established Foes' Hearth form at
37767 and the Preordained terminology at 37797.

| ID | Result | Evidence |
| ---: | --- | --- |
| 37769 | Supported subsequent familiar-address correction, no duplicate tally | English directly addresses the listener as `dove`. Reuse the neutral familiar `친구` established by D-19432 and applied to the same vocative at 35148 and 37961. Japanese omits the vocative; Chinese differs, so neither supports adding a more intimate relationship. Preserve the rest of the sentence. |

No other new row-local correction is supported. The remaining current
texts retain their English-led meanings and existing dispositions,
including the D-19667 terminal keys and previously accepted terms.
No current global category total is asserted. Separate affix 55 remain
closed by D-19565.

## Verification

All four active default CSVs contain 65,135 ordered IDs (0-65134), and
all 100 scope IDs align. Exact inverse reconstruction confirms all
pre-edit bytes outside the target `Texto` cell are preserved. The
UTF-8 BOM, 72,011 CRLF endings, and 73 pre-existing bare-LF endings
remain unchanged.

Pre-edit SHA-256:
`a6b091e2b946496b37601d9f35aeece4f2c80be80bc73e8f573ae04e3dd5c853`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19853/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`8405c183302a41a7758122b881dc2bf893df9718d4326b98798b0c84dcd17df8`.

D-19853 is reviewed; overall default review remains incomplete.
Last reviewed ID 37850; next D-19854 / IDs 37851-37950;
27,284 actual default rows remain through 65134.
