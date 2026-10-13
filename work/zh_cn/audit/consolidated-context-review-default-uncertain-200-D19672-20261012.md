# Grouped Default Uncertain Review: D-19672

Reviewed 200 exact English/Japanese/Chinese/pre-edit Korean keys in
`uncertain-200-D13410-D13763-20261012.jsonl` by name, title,
faction and dialogue context. English anchors meaning, Japanese
voice and Chinese cross-check. Consulted official Korean manual
extraction and prior accepted named terms. No PAK materials used.

| IDs | Approved correction | Basis |
| --- | --- | --- |
| 43739 | `여보` -> `친구` | Familiar dove address does not establish a romantic relationship; Japanese omits it and Chinese reads peacemaker. |
| 43893, 43964, 44844 | `갈로우스 엔드` / `교수대 끝` -> `갤로우즈 엔드` | Formal Gallows End place name used in earlier reviewed batches. |
| 44194 | `투아타` -> `투아사` | Established Tuatha spelling. |
| 44231 | `첫 맹세자들의 전당` -> `첫서약자 전당` | Formal Hall of the Firstsworn, notwithstanding the source's Firstworn typo. |
| 44259 | `근위병` -> `프레토리안` | Praetorian is a named formal rank, not an unspecified guard. |
| 44562 | `진료 구역` -> `병원 구역` | Previously accepted Hospitalis Quarters name (D-19612). |
| 44627 | `벨렌의 성약` -> `테스타먼트` | Testament is an organization, not merely an oath. |
| 44816 | `망자 켈` -> `데드 켈` | Reuse established Dead Kel name in adjacent Gallows End quests. |

**10 accepted / 190 not an issue / 0 newly retained**. Other
entries preserve the source-led meaning or lack evidence for a
local correction: 44006 and 44657 already use `숙련자` for Adept;
`Mitharan` equipment is not automatically deity-derived
(`Mitharu = 미사루`); cf. D-19670/D-19671 correction.

Pre-edit SHA-256:
`b3b7d7922b9587b5d87e4c092dd4eb8fd0c7d4ca3281b6ab7b4768de7166f119`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19672/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`a44a29d2195137b56389d70343e3d813afa7996204a7b24db414b95e9706a7d8`.
Applicator `REVIEW_BATCH=D19672 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified all four exact source keys 200/200, inverse byte
reconstruction, BOM, mixed endings, ordered IDs, untouched bytes
outside approved `Texto` fragments.

Totals **3,107 accepted / 30,915 not an issue / 4,502 uncertain**
(38,524). Affix 55 closed D-19565; default review incomplete.
