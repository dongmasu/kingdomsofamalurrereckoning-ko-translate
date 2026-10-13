# Default Scope Review D-19863

2026-10-13. Reviewed all 100 active `default` IDs 38751-38850
against English meaning, Japanese register, Chinese support, current
Korean and established terminology. All four locale files contain
65,135 ordered IDs and the 100-row scope aligns. No PAK-derived source
was consulted.

The nine D-19667 keys in this range (38752, 38760, 38777, 38789,
38793, 38803, 38817, 38818, 38836) match current English/Japanese/
Chinese exactly (9/9 per locale). Prior uncertain statuses remain
unchanged and were not recounted.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 38793 | Subsequent Cairn term correction | English and Japanese identify the final Fae Cairn (`ケルン`). Reuse the active-corpus `돌무덤` form established at 38082/D-19856, replacing `무덤돌`; retain Nix and the Maid reference. |
| 38803 | Subsequent faction-name correction | Capitalized English `The Sparrows`, Japanese quotation marks, trade with Dunn's group and repeated gang usage identify the Rathir orphan/rag-picker gang. Reuse `참새단(Sparrows)` from D-19762, rather than the literal-bird `참새들`. |
| 38818 | Minor naturalness correction | English and Japanese describe being torn into three equal pieces. Reorder the Korean adverb to `세 조각으로 똑같이 찢긴` without changing the number or event. |

The other 97 cells retain their current meanings and prior dispositions.
In particular, the unresolved Child of Dust/Glass/Water Lock/Hospitalis/
antecedent/Crows questions remain open. The encrypted-looking text at
38751 is identical across all four locales and is not decoded or altered.
No global tally is asserted; separate affix 55 remain closed by D-19565.

Pre-edit SHA-256:
`5521eab2f38ca49f4467a70575776a51b19157e3432d2b26c071c80ccbbd5757`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19863/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`8afe48a50cbd5f8af3380bbff6f68e39a03eb6682b0c1d3d2134386ddda4716d`.
Exact inverse reconstruction verified only three target `Texto` cells
changed. UTF-8 BOM, 72,011 CRLF, 73 existing bare-LF endings and row
order remain intact.

Last reviewed ID 38850; next D-19864 / IDs 38851-38950.
26,284 actual default rows remain through 65134; review incomplete.
