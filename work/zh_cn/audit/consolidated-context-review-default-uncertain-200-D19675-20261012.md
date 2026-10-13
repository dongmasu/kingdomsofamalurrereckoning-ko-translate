# Grouped Default Uncertain Review: D-19675

Reviewed 200 exact English, Japanese, Chinese and Korean source-keyed
rows in `uncertain-200-D14341-D14601-20261012.jsonl`, grouped by
named rank, culture, faction and place. English anchors meaning;
Japanese informs voice, Chinese corroborates. Used approved active
corpus forms and the official manual's setting terminology; no PAKs.

| IDs | Approved correction | Evidence |
| --- | --- | --- |
| 46986, 47788 | `초대받은 자` -> `부름받은 자` | Formal Beckoned title. |
| 47066 | `프라에토리안 병사들` -> `프레토리안들` | Praetorian named military rank. |
| 47154, 47168 | `여행자` -> `트래블러` | Named Travelers member and their sloop; Japanese also names the faction. |
| 47165, 47456 | `라시르` -> `라시어` | Established Rathir city name. |
| 47215 | `미사루` -> `미타란` for *Mitharan* Bindings | Mitharan equipment is not the god Mitharu; see D-19670/71, D-1096. |
| 47618, 47752 | `콜로세` -> `콜로사이족` | Kollossae people and their Primos. |
| 47790 | `발러 투기장` -> `용맹 투기장` | Valor Arena, using established translated Valor form. |
| 47813 | `시데` -> `시드` | The Sidhe place name from other source-keyed quests. |

**12 accepted / 188 not an issue / 0 newly retained**. The other
188 do not present an evidence-backed row-local correction;
`Testament` in 46781 is a theological proposition, unlike
the named organization at 46666, which was corrected in D-19674.

Pre-edit SHA-256:
`3c0c9de36f8ad11550aca6adaafbc8fccd229195d042b571bc673fb83b230e2f`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19675/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`71486bee8158b2a50522eb3561cf9e06c68575f80a33f3e196c7b4cddc1b9f78`.
Applicator `REVIEW_BATCH=D19675 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified 200 four-locale exact keys, inverse byte reconstruction,
BOM, mixed line endings, ordered IDs and untouched bytes outside
the approved `Texto` replacements.

Totals **3,148 accepted / 31,474 not an issue / 3,902 uncertain**
(38,524). Affix 55 closed D-19565; default review incomplete.
