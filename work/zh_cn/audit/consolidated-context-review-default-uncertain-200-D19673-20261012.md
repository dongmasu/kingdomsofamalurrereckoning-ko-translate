# Grouped Default Uncertain Review: D-19673

Reviewed the 200 exact four-locale keys in
`uncertain-200-D13765-D14079-20261012.jsonl` by skill, institution,
named faction, title and quest context. English anchors meaning;
Japanese informs register, Chinese cross-checks. Applied official
Korean manual's Detect Hidden terminology and established prior
faction/rank decisions. No PAKs consulted.

| IDs | Approved corrections | Basis |
| --- | --- | --- |
| 45034 | `진료 구역` -> `병원 구역` | Hospitalis Quarters, accepted D-19612. |
| 45060, 45222, 45305 | Generic `여행자` -> `트래블러` | Travelers/Traveler identifies the named thieves' faction in these contexts; Japanese トラベラーズ. |
| 45114, 45305, 45395, 45470 | `히에로판트` -> `대사제` | Approved Hierophant title; named shrines/sanctums retain the local place type. |
| 45127 | `초대 서약자들의 전당` -> `첫서약자 전당` | Hall of the Firstsworn established place. |
| 45167 | `비탄의 가문` -> `비탄의 집` | Formal House of Sorrows, not Sorrows as a power. |
| 45173, 45739 | `교차로`/`교차점` -> `크로싱` | Named Crossing site and source of magical energy; accepted in prior decisions. |
| 45215 | `은신 감지 기술` -> `숨겨진 물건 찾기 기술` | Official manual skill Detect Hidden. |
| 45222 | `도둑맞은 물건을 사 주는` -> `훔친 물건을 사 주는` | Stolen goods offered to a fence are goods stolen by the player, not goods lost to theft. |
| 45604, 45768 | `선택받은 자여` -> `부름받은 자여` | Established Beckoned address. |
| 45608 | Delete added `선택받은 자` address | Neither English nor Japanese/Chinese addresses the player here; keep the location and directions. |
| 45713 | `발라드 가문` -> `발라드의 집` | Named House of Ballads. |
| 45873 | `달지는 야영지` -> `문다운 야영지` | Camp Moondown place, matching accepted active-corpus form. |

**17 accepted / 183 not an issue / 0 newly retained.** The other
183 remain source-faithful or lack row-local evidence to change,
including existing correct Mitharu and Mitharan distinctions and
already correct faction/role references.

Pre-edit SHA-256:
`a44a29d2195137b56389d70343e3d813afa7996204a7b24db414b95e9706a7d8`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19673/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`4c8aff3c0a2e28f14ac355da123a92d3aa509f52a608ea2bce7285636a876b86`.
Applicator `REVIEW_BATCH=D19673 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified exact source-key values (200 per locale), byte-exact inverse
reconstruction, BOM, mixed endings, row IDs/order, all other bytes.

Totals **3,124 accepted / 31,098 not an issue / 4,302 uncertain**
(38,524). Affix 55 closed D-19565; default review incomplete.
