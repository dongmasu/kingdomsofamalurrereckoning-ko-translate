# Default Scope Reconciliation D-19842

2026-10-13. Reviewed every active `default` ID 36651-36750 against
English for meaning, Japanese for voice/register, supporting Chinese,
active Korean, official Korean manual terminology and exact-key history.
No PAK or PAK-derived material was consulted.

## Decisions

The 16 D-19666 manifest keys in this range match the current English,
Japanese and Chinese source fields exactly. ID 36655 was previously
accepted there for `콜로사이족`; that correction is retained. The other
15 keys (36663, 36669, 36674, 36675, 36684, 36686, 36697,
36701, 36705, 36711, 36717, 36727, 36738, 36740, 36742) were already
terminal `not an issue`. None is reclassified, reopened, or added again
to a global tally. The previously accepted Beckoned form at 36687 and
manual-backed race/faction terms remain applied.

| ID | Result | Evidence |
| ---: | --- | --- |
| 36655 | Subsequent correction to a previously accepted row, no duplicate classification | The English `Idylla` is the city already standardized as `이디라` by D-18904/D-19369 and D-19836/36052. Change only the local `이딜라`; retain D-19666's accepted `콜로사이족` and the Henge/Primos objective. The uncertain Primos identity cannot be inferred from this row and is not assigned a new classification under the terminal exact key. |
| 36677 | Subsequent terminology correction, no duplicate tally | English `Scholia Arcana` is the same institution corrected at D-19666/36609, with the established `스콜리아 아르카나` name (also D-18206). Replace only local `슐리아 아르카나`; preserve the comparison with other copies of the book. |
| 36688 | Subsequent terminology correction, no duplicate tally | English `Rathir`, Japanese `ラシーア` and Chinese `拉瑟里` identify the same city corrected at D-19840/36524 and D-19836/36092. Replace local `라시어` with source-checked `라시르`; keep the childhood magic-training statement. |

The remaining rows preserve English-led meaning, roles, numbers, UI
tokens and voice. The manual's `바라니`, `도크알브`, `료스알브`,
`워스원`, and Fate terminology were checked where relevant.
Earlier terminal findings are not recounted. No current global category
total is asserted; the separate 55 affix findings remain closed by
D-19565.

## Verification

All four CSVs have 65,135 IDs (0-65134) once and in identical order;
all 100 scope IDs occur once. The edit script verified inverse
reconstruction of the complete pre-edit bytes, so all bytes outside
three target `Texto` cells remain unchanged. UTF-8 BOM, 72,011 CRLF
and 73 pre-existing bare-LF endings remain intact.

Pre-edit SHA-256:
`19a774e00f1f30983953659f63755750335b179d684b15d5be8bc588433d2759`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19842/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`5bc06ff8239fc7a679bd9ce8c1b152a0d2086a8fa2ed021589e05987a4f2cb14`.

D-19842 is reviewed, not the overall default range. Last reviewed ID
36750; next D-19843 / IDs 36751-36850; 28,384 actual default rows
remain through 65134.
