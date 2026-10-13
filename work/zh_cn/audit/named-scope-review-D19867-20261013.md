# Default Scope Review D-19867

2026-10-13. Reviewed active `default` IDs 39151-39250 across
English, Japanese, Chinese, and Korean, using English for meaning,
Japanese for voice/register, Chinese as supporting evidence, plus
established terms and prior decisions. All 100 rows align in the four
locale files (65,135 ordered IDs). No PAK-derived material was used.

Three D-19667 exact keys in this range (39159, 39191, 39231) match
the current English/Japanese/Chinese fields (3/3 per locale).
Previous dispositions remain unchanged; none was reclassified or
recounted.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 39211, 39226 | Normalize Gallows End | Both refer to the named island. Reuse established `갤로우스 엔드` (D-10903/D-11264 and later corrections) instead of literal/variant forms. |
| 39238 | Subsequent quality/affiliation correction | `Flawless Mitharan` is `흠 없는 미타란` (D-19551/D-19718 and later use), replacing `완벽한 미사루식`; retain Bloodseeker's Shaft. |
| 39239 | Normalize the named arena team | The line announces a tournament match; Japanese explicitly calls the Crows a team, Chinese likewise uses a team name. Reuse `크로우즈(The Crows)` (D-10626 and repeated arena decisions), replacing `까마귀단`. |

Four in-scope `Texto` cells changed; the other 96 scope rows retain
their current translations and dispositions.
At 39161, the Saturnyn spelling remains unchanged because earlier
decisions explicitly leave its canonical Korean form unresolved.
Other source fragments, names, marker sequences and values remain intact.
No global tally is asserted; affix 55 remain closed by D-19565.

## Out-of-Scope Side Effect

The D-19867 applicator also changed ID 39091 from `복수의 가문` to
`복수의 집`, although 39091 is outside the assigned 39151-39250 range.
The translation itself reuses the accepted House of Vengeance form from
D-19806, but this edit was not authorized as part of D-19867 and is not
included in its four in-scope corrections or disposition counts. It
remains in the active CSV and is disclosed here rather than silently
reverted.

Pre-edit SHA-256:
`034dcd97223785cd071c89305b0ff1a80c88d11b1b136afa6fc630dbbd4bec20`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19867/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`27715acf05bb289275a4d1507560f5f387654055147f38b9d574c3c22ddfc1bd`.
Exact inverse reconstruction verified that only those five `Texto`
cells changed across the whole active CSV: the four in-scope cells above
and the disclosed out-of-scope ID 39091. UTF-8 BOM, 72,011 CRLF,
73 existing bare-LF endings and ordered IDs remain intact.

Last reviewed ID 39250; next D-19868 / IDs 39251-39350.
25,884 actual default rows remain through 65134; review incomplete.
