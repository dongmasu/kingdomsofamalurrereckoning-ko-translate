# Consolidated Context Review: 100 Default Keys (D-19736)

The 100 exact keys in `uncertain-100-D19736-20261012.jsonl` (64009-64318)
were compared with English semantics, Japanese voice, Chinese cross-checks,
official Korean manual and accepted glossary decisions. No PAKs.

Sixteen accepted rows:

| IDs | Correction and source |
| --- | --- |
| 64093, 64125 | `비사레인` -> `비사라네`; `소로우` -> `비탄의 힘`: English Sorrows, Japanese `嘆きの力`, Bisarane established at 61655. |
| 64103 | `갤로우스 엔드` -> `갤로스 엔드`: Gallows End D-5672. |
| 64128 | `사이언` -> `사이온`: Scion D-19496, Japanese same title. |
| 64148 | `대장 기술` -> `대장기술`: Blacksmithing, official manual p. 4. |
| 64169 | `하이페리안의 대기실` -> `하이페리언의 전실`: Hyperian, accepted 63788 and D-19584. |
| 64175 | `시어스톡` -> `시어스토크`: Searstalk, same named plant as 63687. |
| 64218 | `비사레인` -> `비사라네`; `엘디스트` -> `엘더스트`; `소로우의 집` -> `비탄의 집`; `소로우의 위치 ... 투아타로부터 그들을` -> `비탄의 힘의 위치 ... 투아사로부터 비탄의 힘을`: English distinguishes former House of Sorrows members (the Eldest) from the Sorrows they seek to protect. Japanese retains `エルデスト`, D-18300 establishes title. |
| 64226, 64309 | `히에로판트` -> `대사제`: Hierophant D-19638. |
| 64240 | `미타루` -> `미사루`: Mitharu, official manual p. 2. |
| 64254 | `윤회` -> `대순환`; `소로우` -> `비탄의 힘`: English capitalized Cycle / Sorrows; Japanese confirms the magical force. |
| 64258 | `오스블레이드` -> `맹세의 칼날`: Oathblade Warsworn rank D-18254. |
| 64269 | `윈드미어` -> `윈더미어`: Windemere D-19615. |
| 64278 | `플레지실드` -> `서약방패병`: Pledgeshield D-18254. |
| 64318 | `히에로판트` -> `대사제`; `트래블러스` -> `트래블러`: Hierophant rank and official manual p. 7 faction. |

Other 84 snapshot IDs are `not an issue`:
64009, 64013, 64015, 64017, 64018, 64021, 64023, 64029, 64033,
64046, 64047, 64053, 64054, 64055, 64056, 64057, 64058, 64066,
64069, 64075, 64079, 64085, 64087, 64090, 64095, 64096, 64097,
64098, 64101, 64105, 64107, 64109, 64110, 64112, 64116, 64117,
64120, 64123, 64124, 64130, 64133, 64136, 64143, 64145, 64147,
64151, 64157, 64162, 64166, 64167, 64177, 64186, 64189, 64193,
64201, 64202, 64204, 64213, 64216, 64219, 64223, 64224, 64231,
64234, 64237, 64241, 64242, 64245, 64246, 64250, 64251, 64252,
64256, 64264, 64270, 64273, 64276, 64283, 64285, 64287, 64294,
64301, 64313, 64316.

The Hierophant diversion at 64013 already matches English. No source-only
ambiguity triggers a new Korean hold. Technical IDs/markers remain intact.

Pre-edit SHA-256 `ef49938e801a2b9ebce54adf2044a4795105d0d65a0e7c6d0101446e99e378c0`.
Post-edit SHA-256 `4e73d8c22abfa6c2d255fb2749f794fdba1ae1dfd4fce5a9fde881e7355f9599`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-100-D19736/locatexts_zh_cn.koalocatext_default.csv`.
`apply-uncertain-100-D19729.rb 19736` checked every snapshot cell, BOM,
mixed endings, row order, unchanged non-target bytes and non-Texto cells,
and exact inverse restoration. Reconstructed candidate-open 105; historical
operational 3,419 / 34,118 / 987 remains unreconciled.
