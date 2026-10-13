# Range Reconciliation D-19833

2026-10-13. Reviewed every active `default` ID 35751-35850 against the
English source, Japanese voice/register, supporting Chinese, the active
Korean cells, exact-key history, and the official Korean manual where
applicable. English anchored meaning. No PAK or PAK-derived material was
consulted.

## Prior Dispositions Verified

| ID | Prior result | Verification |
| ---: | --- | --- |
| 35836, 35840, 35849 | D-19665: `not an issue` | These exact keys are among the 179 `not an issue` dispositions in D-19665's 200-key review. Their active Korean cells match the reviewed state; do not reopen or recount them. |
| 35843 | D-19665: accepted | D-19665 accepted `교만의 시종` for `Knave of Pride`; the current cell retains that correction. The associated `Bolgan Masters` wording is not a new finding in this range. |
| 35852-35853, 35857-35858, 35864-35865, 35870, 35872, 35874-35875, 35889-35890 | D-19728: terminal | D-19728 already corrected or closed these exact keys; current active cells were validated without readjudication or recounting. |

## Prior-Key Reconciliation

D-19665 also already accepted IDs 35752, 35764, and 35843; D-19728
resolved its listed keys through ID 35832. D-11575/D-11576 and the broad
D-11574/D-11585 row blocks are terminal as recorded. These and other
exact-key dispositions were checked against active Korean without
readjudication or recounting. No new classification or global tally was
added. The separate 55 affix findings remain closed by D-19565.

All 100 IDs occur once and in the same order in the active Korean, English,
Japanese, and Chinese default CSVs. No net `Texto` changes remain. A
proposed change at ID 35836 was withdrawn after the D-19665 terminal
disposition was located; the cell was restored from the byte-identical
pre-range backup. The active file now matches that backup exactly.
UTF-8 BOM, mixed line endings, all 65,135 ordered IDs, and all other bytes
are preserved.

Pre-range and final SHA-256:
`8863b53c9c7e16d048067581c2cee7f961a17511dbe3f51e823b12737ca567b7`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19833/locatexts_zh_cn.koalocatext_default.csv`.
The temporary, reverted state had SHA-256
`d43cccfcee720fb3a221ba73032fb692d3d9ecb2ff744cc1ced8e74b714de433`;
`audit/restore-D19833-D19665-terminal-cell.rb` verified exact restoration.

The D-19833 range reconciliation is complete. Default review remains incomplete.
Resume D-19834 / IDs 35851-35950; 29,284 default IDs remain through 65134.
