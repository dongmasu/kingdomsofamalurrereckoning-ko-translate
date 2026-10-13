# Default Scope Reconciliation D-19851

2026-10-13. Reviewed all active `default` IDs 37551-37650 against
English meaning, Japanese voice/register, supporting Chinese, active
Korean, prior exact-key history, and the official Korean manual. No PAK
or PAK-derived material was consulted.

All 17 D-19667 manifest keys in this range exactly match the current
English, Japanese, and Chinese rows. D-19667 accepted 16 corrections
elsewhere; these 17 keys were among its other 184 terminal `not an issue`
findings. They were validated but not reclassified or recounted. Earlier
accepted changes at 37567, 37604, 37629, and 37636 remain applied.

| ID | Result | Evidence |
| ---: | --- | --- |
| 37554 | Supported subsequent place-name correction, no duplicate tally | English identifies Rathir; reuse established `라시르` from D-19743/D-19773 and the preceding source-checked reviews. Correct `라시어` only; preserve the civic-voice contrast and all other wording. |
| 37626 | Supported subsequent deity-name correction, no duplicate tally | English identifies Mitharu, rendered `미사루` in the official Korean manual, PDF p. 2. Replace `미타루` only. |

The other 98 active rows retain their current English-led meanings and
previous dispositions. This includes the 17 exact D-19667 keys, whose
source keys were checked without duplicate classification, and the
previously applied corrections in this scope. No current global category
total is asserted. Separate affix 55 remain closed by D-19565.

## Verification

All four active default CSVs contain 65,135 ordered IDs (0-65134), and
all 100 scope IDs align. Exact inverse reconstruction confirms all
pre-edit bytes outside the two target `Texto` cells are preserved.
The UTF-8 BOM, 72,011 CRLF endings, and 73 pre-existing bare-LF endings
remain unchanged.

Pre-edit SHA-256:
`bb26b0db979b3e2ce51ce1cc1a6c197ad5efedd423eb770d3856cb8966b76cc9`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19851/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`05f4004cc3f1a57ca2cf8441b14418519db85f29d17443cfb0479c63b4d8abd7`.

D-19851 is reviewed; overall default review remains incomplete.
Last reviewed ID 37650; next D-19852 / IDs 37651-37750;
27,484 actual default rows remain through 65134.
