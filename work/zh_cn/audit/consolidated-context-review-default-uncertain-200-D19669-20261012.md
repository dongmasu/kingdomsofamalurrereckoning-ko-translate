# Grouped Default Uncertain Review: D-19669

**Correction:** IDs 42970, 43168 end in `미타란`, and 43468
in `고대 미타란어`. See
`consolidated-context-review-default-mitharan-corrigendum-D19670-D19671-20261012.md`.
The post-edit hash below is the historical D-19669 checkpoint.

Reviewed 200 exact four-locale source-keyed rows in
`uncertain-200-D13087-D13409-20261012.jsonl` by named title, faction,
deity, geography and dialogue context. English anchors meaning;
Japanese informs voice, Chinese corroborates. Used the extracted
official Korean manual's Mitharu and Warsworn terminology and prior
accepted rank/place decisions; no PAKs.

| IDs | Approved change | Basis |
| --- | --- | --- |
| 42824 | `상담자` -> `조언자`; `콜로새` -> `콜로사이족` | Counsel is the named person Arkes, former Kollossae Primos, not an informal counseling encounter. |
| 42882, 43396 | `투아타` -> `투아사` | Established Tuatha name; leave the verse and political context intact. |
| 42922, 43502 | `교수대 끝` / `갤로우스 엔드` -> `갤로우즈 엔드` | Formal Gallows End island name. |
| 42970, 43168, 43468 | `미사란` -> `미사루식` for equipment, `고대 미사루어` for the language | Official manual's Mitharu form and established `미사루식` adjective in analogous items. |
| 43094 | `맹세검` -> `맹세의 칼날` | Formal Oathblade rank. |
| 43158, 43232 | `선택받은 자` -> `부름받은 자` | Established Beckoned title. |

**11 accepted / 189 not an issue / 0 newly retained** in this batch.
Other rows were left source-faithful, including D-13087's existing
insult `천것`, the canonical `숙련자` at ID 43300, and the official
manual's `대장기술` for the Blacksmithing skill.

Pre-edit SHA-256:
`52b1d3cd174daec6e30f4c65e7d939cc1a7b93f865f927ba26076c1c3f3f3f84`;
byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19669/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`118c55ed5ffc18e35561843823ad5e6802730c4d30b40ce9624f6fb290d84d93`.
`REVIEW_BATCH=D19669 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified English/Japanese/Chinese/pre-edit Korean exact key matches
(200 each), inverse reconstruction, BOM, mixed line endings, ordered
IDs, and untouched bytes outside the approved `Texto` fragments.

Totals **3,097 accepted / 30,725 not an issue / 4,702 uncertain**
(38,524). Affix 55 closed D-19565; default still incomplete.
