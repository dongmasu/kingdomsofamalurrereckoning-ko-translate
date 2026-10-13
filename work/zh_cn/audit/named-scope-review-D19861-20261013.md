# Default Scope Review D-19861

2026-10-13. Reviewed all active `default` IDs 38551-38650 against
English meaning, Japanese voice, supporting Chinese, active Korean,
the two prior disposition batches and official Korean manual terminology.
All four locale CSVs contain the 65,135 ordered IDs and the 100 scope
IDs align. No PAK or PAK-derived material was consulted.

Five D-19667 exact keys in this range (38560, 38608, 38619, 38642,
38643) exactly match current English/Japanese/Chinese (5/5 per locale).
Their prior uncertain dispositions are retained, not reclassified or
recounted. D-12464/38551's accepted `부름받은 자` is already applied;
D-12467/38597's accepted Testament correction is also present.
Other terminal findings from the earlier batches were reviewed without
duplicate tally.

| ID | Result | Evidence |
| ---: | --- | --- |
| 38564 | Subsequent terminology correction | English `Flawless Mitharan` is `흠 없는 미타란` (D-19551/D-19718 and subsequent reuse); current `완벽한 미사루의` conflates quality/people with the deity. Preserve `단단한 끈`. |
| 38596 | Precision correction | English says the enchanted helmet has never been `worn` in battle. Render the equipment action as `착용한 적이 없다`, not generic `쓰이지 않았다`. |
| 38617 | Manual terminology correction | Official manual PDF p. 4 names the skill `Dispelling` as `디스펠`; replace generic `해제 기술` while retaining the temporary-skill effect, recipe and quantities. |

Other scope rows retain their current text and previous dispositions.
In particular, preserve the open questions at 38560, 38608, 38619,
38642 and 38643; the English at 38551 and 38597 is already corrected
per prior accepted findings. Markers, values and line breaks were not
changed. No global tally is asserted; affix 55 remain closed by D-19565.

Pre-edit SHA-256:
`51f8e220cd7618b3a15b9aa6a852c7924352a2db006077e6be04da9a5c36ef64`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19861/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`685eac23e5c72a315431d98391ecf2b93b0e6037d756b5c321919ab023b37651`.
Exact inverse reconstruction verified only the three target `Texto`
cells changed. UTF-8 BOM, 72,011 CRLF, 73 existing bare-LF endings
and ID order remain intact.

Last reviewed ID 38650; next D-19862 / IDs 38651-38750.
26,484 actual default rows remain through 65134; overall review incomplete.
