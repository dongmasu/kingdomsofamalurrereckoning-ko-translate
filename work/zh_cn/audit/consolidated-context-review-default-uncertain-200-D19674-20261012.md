# Grouped Default Uncertain Review: D-19674

Reviewed the 200 source-keyed four-locale records in
`uncertain-200-D14080-D14340-20261012.jsonl` by formal rank,
named locale/organization, and quest item. English anchors
meaning; Japanese voice and Chinese context supplement. Compared
accepted in-corpus precedents and official manual's faction
terminology. No PAK sources used.

| ID | Approved change | Basis |
| --- | --- | --- |
| 46099 | `발라드 가문` -> `발라드의 집` | Formal House of Ballads faction. |
| 46155 | `홀` -> `셉터` | Staves and Sceptres are distinct weapon types in previous accepted decisions. |
| 46210 | `히에로판트` -> `대사제` | Established Hierophant title. |
| 46271, 46279 | `교차점` -> `크로싱` | Named Crossing, a location with magical power; established in D-19673. |
| 46652, 46803 | `플레지실드` -> `서약방패병` | Formal Pledgeshield rank; Fenan and Bolton are rank-bearing people. |
| 46662 | `라시르` -> `라시어` | Established Rathir location. |
| 46666 | `베렌의 성약` -> `벨렌의 테스타먼트` | Named order Belen's Testament; retain doctrinal `성약` elsewhere (46781) when it describes the god's tenet. |
| 46826 | `교수대 끝` -> `갤로우즈 엔드` | Gallows End is the island's formal name. |
| 46887 | `장인의 곡괭이` -> `명인의 자물쇠따개` | Master's Pick is explicitly associated with the locked chest at ID 42782; Japanese pick does not resolve type, but the same in-corpus quest does. |
| 46936 | `초대받은 자` -> `부름받은 자` | Formal Beckoned address. |

**12 accepted / 188 not an issue / 0 newly retained**. Other
rows are English-led or lack a supported row-local correction.
Mitharan equipment was not silently converted to deity-derived
Mitharu; cf. D-19670/71.

Pre-edit SHA-256:
`4c8aff3c0a2e28f14ac355da123a92d3aa509f52a608ea2bce7285636a876b86`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19674/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`3c0c9de36f8ad11550aca6adaafbc8fccd229195d042b571bc673fb83b230e2f`.
Applicator `REVIEW_BATCH=D19674 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified exact four-locale text at 200 keys, byte-exact inverse,
BOM, mixed line endings, ordered IDs and all untouched bytes.

Totals **3,136 accepted / 31,286 not an issue / 4,102 uncertain**
(38,524). Separate affix 55 closed D-19565, default incomplete.
