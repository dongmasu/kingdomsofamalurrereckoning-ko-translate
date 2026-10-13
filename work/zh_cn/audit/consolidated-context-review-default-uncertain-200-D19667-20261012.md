# Grouped Default Uncertain Review: D-19667

Reviewed 200 distinct source-keyed rows in
`uncertain-200-D12178-D12542-20261012.jsonl`. English is the meaning
anchor; Japanese voice and Chinese corroboration were checked alongside
the Korean. Earlier official-manual deity and established proper-name,
role, faction and item decisions were applied. PAKs were not used.

| IDs | Approved correction | Basis |
| --- | --- | --- |
| 37728 | `미타루` -> `미사루` | Official manual's Mitharu deity form. |
| 37880, 38382, 38744 | Named arena team `까마귀` -> `크로우` | Crows is a formal competitor category, as in D-19665/35179; Japanese likewise uses クロウズ. |
| 37961 | `내 사랑` -> `친구` | Dove is a friendly address, not a romantic relationship; Japanese drops the pet name and Chinese reads a peacemaker. |
| 38082 | `발라드 가문` -> `발라드의 집`; `메아리돌` -> `메아리석` | House of Ballads and Echo Stone established names. |
| 38128, 38799 | `갤로우스 엔드` -> `갤로우즈 엔드` | Named island; reuse D-19666. In the long lore entry only the place-name occurrence changes; the pirate's literal gallows metaphor remains. |
| 38139 | `라시르` -> `라시어` | Rathir established location, same batch 36524. |
| 38235, 38241 | `복수의 가문` -> `복수의 집` | House of Vengeance formal faction. |
| 38300 | `초대받은 자` -> `부름받은 자` | Established Beckoned title. |
| 38845, 39022 | Generic `여행자` -> `트래블러` | Capitalized Travelers faction, Japanese トラベラーズ. |
| 38934 | `소로우즈(House of Sorrows)` -> `비탄의 힘(Sorrows)` | English names Sorrows, not the House; Japanese explicitly identifies the power. |
| 39131 | `서약방패` -> `서약방패병` | Formal Pledgeshield rank, D-18254. |

**16 accepted**, **184 not an issue**, **0 newly retained**. The other
184 remain source-faithful or have no grounded row-local correction.
In particular the short Silken Seat label (38132) differs across
locales; the existing Korean follows the English literal meaning,
so the Japanese-only venue reading does not warrant a speculative
replacement. ID 39071 already uses approved `Adept = 숙련자`.

Pre-edit SHA-256:
`58e2eb44354d3511ca231390e690c21d2407e11e2dcd37a9c1c3eab59724332d`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19667/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`4e5ef51a298d4c94b86b48c623026bc3d1e9732be1e53d904f5ab88b5b717cfd`.
Applicator: `REVIEW_BATCH=D19667 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`.
Verification passed: exact four-locale source keys 200/200;
inverse reconstruction, BOM, mixed newlines, row order and all
non-approved bytes preserved.

Totals: **3,074 accepted / 30,348 not an issue / 5,102 uncertain**
(38,524); separate affix 55 closed D-19565. Default incomplete.
