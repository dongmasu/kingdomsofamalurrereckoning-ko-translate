# Consolidated Context Review: 200 Default Keys, D-19651

Scope: all 200 entries in `uncertain-200-D4123-D4409-20261012.jsonl`.
Each English, Japanese, Chinese, and active Korean cell was checked directly
against its keyed CSV row (200/200 matches per locale). English anchors
meaning; Japanese informs voice/register; Chinese is supporting evidence.
The searchable official Korean manual extraction was reused. PDF p. 7
confirms the weapon class `셉터(Sceptres)` and the faction `트래블러`.
PAK files were not used.

All 200 findings are closed: 18 accepted corrections and 182 `not an issue`;
none remains uncertain. The accepted IDs are 13911, 13917, 13945, 13988,
14034, 14097, 14134, 14154, 14155, 14159, 14202, 14219, 14251, 14384,
14458, 14484, 14555, and 14557. Every other ID in the snapshot is
`not an issue`; this complement is the complete disposition, not an
unreviewed remainder.

## Accepted Corrections

| IDs | Disposition and evidence |
| --- | --- |
| 13911 | `Savant` is the formal Scholia Arcana rank `사반트` (D-18268), not generic `학자`. |
| 13917 | Correct `Eel Petal` from `일 펫틀` to the same ingredient spelling `일 페탈` already used at ID 29833; Japanese and Chinese identify the same reagent. |
| 13945, 14458 | Use official-manual `트래블러` for the named Travelers faction/base and standalone faction label. |
| 13988 | The same Brother Fallon is `패런 수사` (D-15959); `형제` is not the established religious title. |
| 14034, 14154 | Correct `Kollossae` to the accepted people-name `콜로사이` (D-18878/D-18933). At 14154, also use accepted Beckoned `부름받은 자`. |
| 14097 | The official Korean manual p. 7 names `Sceptre` as `셉터`; replace generic `홀`. |
| 14134, 14155 | Apply formal Warsworn `Oathblade` rank `맹세의 칼날` (D-18254), not an English-letter transliteration. |
| 14159, 14251, 14384, 14484 | Align the in-world title `Beckoned` with the established `부름받은 자` (D-692/D-18212/D-19303). |
| 14202, 14219 | Use the accepted House of Sorrows role form `탐구자` for capitalized `Delver(s)` (D-19632); preserve the sorrow-hearing role/context. |
| 14555, 14557 | Align item modifier `Flawless` to `흠 없는`, following the exact item-term precedent at D-19551/D-19649; retain each supported component and `미타란`. |

## Not an Issue

The other 182 IDs preserve the English meaning and relevant relationships,
actions, values, and register after Japanese/Chinese cross-check. No
correction was made merely to normalize unsupported spelling variants,
names, or broad lore terminology.

## Integrity and Resume

- Pre-edit default SHA-256: `a83130a7664a70bbf2ea3490faab3aebce8c7f290683e6b7f4240052a5882301`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19651/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256: `544f212767bbe8088823222ca45fb0bf775bddc29003959fdf3939dc4df79f0f`.
- Exact inverse reconstruction, BOM, 72,011 CRLF / 73 bare-LF endings, row order, and all non-`Texto` bytes verified; exactly 18 approved rows changed.
- Totals: **2,778 accepted / 27,447 not an issue / 8,299 uncertain** (38,524). Separate Chinese-only provisional affix holds: **55**. Overall review remains incomplete.
- Continue with the next 200 open default findings before the separate affix pass.
