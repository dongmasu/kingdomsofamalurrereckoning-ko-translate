# Consolidated Context Review: 200 Default Keys, D-19654

Scope: all 200 entries in `uncertain-200-D5108-D5506-20261012.jsonl`.
Each source-keyed `Texto` cell was checked against English, Japanese,
Chinese, and the pre-edit Korean CSV (200/200 exact matches per locale).
English anchored meaning, Japanese informed voice/register, Chinese provided
supporting evidence, and the page-indexed official Korean manual supplied
established setting and skill/faction terms. No PAK or PAK-derived material
was inspected or used.

All 200 findings are closed: 18 accepted corrections and 182 `not an issue`;
none remains open in this batch.

## Accepted Corrections

| ID | Applied correction | Evidence |
| ---: | --- | --- |
| 16252 | `마법사 기사 아니라` -> `마녀 기사 아니라` | The named `Witchknight` is a witch-knight, not a generic wizard knight; English and Chinese support the witch reading, while Japanese confirms the knight/magic role. |
| 16262, 16523, 17014 | `완벽한` -> `흠 없는` | Reuse the accepted item modifier `Flawless = 흠 없는` and `Mitharan = 미타란`; preserve each distinct item component. |
| 16400 | `아가씨` -> `친구` | Lowercase `dove` is a familiar vocative, not a gendered title. Reuse the same-line precedent at ID 5285 / D-19637 and D-19432. |
| 16575 | `맹세검` -> `맹세의 칼날` | English and Chinese identify the formal Warsworn Oathblade rank; reuse D-18254. |
| 16697 | `숨은 물체 감지 기술` -> `숨겨진 물건 찾기 기술` | The official Korean manual (printed p. 4) names Detect Hidden `숨겨진 물건 찾기`; reuse D-2434 and later accepted rows. |
| 16818 | `장로들` -> `엘더스트(The Eldest)` | This is the named Fae group/title, established at D-18300 and D-18338, not a generic plural of elders. |
| 16848 | `여행자들도` -> `트래블러들도` | Capitalized Travelers names the faction listed as `트래블러(Travelers)` in the official manual (printed p. 7). |
| 16873 | `비탄과 먼지의 여왕` -> `비탄과 먼지의 여인` | English says `Lady`, not queen. Reuse the supported title distinction at ID 5551 / D-19642; the other epithets and defiant voice remain. |
| 17003 | `콜로세 농민` -> `콜로사이 농민` | Align Kollossae with the accepted people-name `콜로사이` (D-18878/D-18933). |
| 17024 | `여행자를 만났다` -> `트래블러(Traveler)를 만났다` | Capitalized Traveler identifies a member of the named faction; use the official-manual form. |
| 17028, 17086 | `불려온 자` -> `부름받은 자` | Explicit player title `Beckoned`; reuse the established form at D-692 and subsequent accepted decisions. |
| 17189 | `그가 집을 떠난 이유` -> `그가 비탄의 집을 떠난 이유` | Japanese explicitly names the House of Sorrows, and the established Korean faction name is `비탄의 집`; the sentence's other claims remain unchanged. |
| 17248 | `장어 꽃잎(Eel Petal)` -> `일 페탈(Eel Petal)` | Reuse the accepted ingredient spelling at ID 29833 / D-19651. |
| 17295 | `해제 능력` -> `디스펠 능력` | Use the official manual's `디스펠(Dispelling)` name (printed p. 4) and the accepted skill wording at D-19652. |
| 17356 | `매일 병이 낫지 않으니` -> `그들은 여전히 앓고 있어` | Restore the explicit plural subject in English; Japanese identifies the sick couple, and the line then clearly connects their continued illness to the grain shortage. |

The other 182 IDs in the exact snapshot are `not an issue`: their Korean
preserves the English-led meaning and supported register. Conflicting
phonetic spellings, unexplained proper-name forms, or malformed source prose
were not grounds to invent more specific Korean claims. In particular,
`Got a severed leg` remains source-faithful to the English and parallel
Japanese/Chinese injury readings; item, quest, and location categories were
not guessed where the references did not establish them.

## Integrity and Resume

- Pre-edit default SHA-256: `56e3ba6ac74d5b21700e8b28076aa6e5a96e877c270ce4be6e8c96b3deefe2af`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19654/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256: `e6bddf41b83aa8533948eafec2dde2c2f88de7054f2ba5f2e0d0579b64e58348`.
- Exact inverse reconstruction, BOM, mixed record endings, row order/keys, all four locale snapshots, and bytes outside the 18 approved `Texto` cells passed.
- Totals: **2,827 accepted / 27,998 not an issue / 7,699 uncertain** (38,524).
- The separate 55 Chinese-only provisional affix holds remain; overall review is incomplete.
- Next default decision: **D-5507**. Continue with the next prepared source-keyed snapshot; do not repeat this batch.
