# Consolidated Context Review: 200 Default Keys, D-19652

Scope: all 200 entries in `uncertain-200-D4411-D4745-20261012.jsonl`.
English is the meaning anchor, Japanese informs voice/register, and Chinese
is supporting evidence. The source-keyed snapshot contains each selected
English, Japanese, Chinese, and active Korean cell. Relevant accepted
decisions and the page-indexed official Korean manual extraction were
checked; the manual's skill terms and faction list were consulted. No PAK
or PAK-derived material was used.

All 200 findings are closed: 18 accepted corrections and 182 `not an issue`;
none remains uncertain. The accepted IDs are 14565, 14578, 14637, 14744,
14823, 14824, 14898, 14916, 14991, 15016, 15047, 15095, 15108, 15188,
15201, 15238, 15253, and 15442. Every other ID in the snapshot is
`not an issue`; this complement is the complete disposition.

## Accepted Corrections

| ID | Applied correction | Evidence |
| ---: | --- | --- |
| 14565 | `수문 닫기` -> `관문 닫기` | English and Chinese give a generic gate; only Japanese specifies a water gate. Reuse the generic `관문` resolution at ID 25850 / D-8459 instead of adding unsupported specificity. |
| 14578 | `상업 기술` -> `상술 스킬` | The official Korean manual, PDF p. 4, names Mercantile `상술`; Japanese and Chinese identify the same skill. |
| 14637 | `봉인 해제 기술` -> `디스펠 스킬` | The official Korean manual, PDF p. 4, names Dispelling `디스펠` and calls it a skill; the line is a temporary +3 skill effect. |
| 14744 | `은신 감지 훈련사` -> `숨겨진 물건 찾기 훈련사` | The manual, PDF p. 4, names Detect Hidden `숨겨진 물건 찾기`. Japanese/Chinese identify a trainer/instructor label, not the Stealth skill. |
| 14823, 15016 | Translate Warsworn with established `워스원` | The official Korean manual, PDF p. 7, names the faction `워스원`; both English rows explicitly use Warsworn. |
| 14824, 14898, 15047 | `숄리아 아르카나` -> `스콜리아 아르카나` | Reuse the established Scholia Arcana name, including the official faction list on PDF p. 7 and accepted decisions D-6297/D-6368. |
| 14916 | `완벽한 미사란 감염 핵심석` -> `흠 없는 미타란 감염 지렛목` | Reuse exact item-component precedents: Flawless `흠 없는` (D-19551/D-19651), item Mitharan `미타란` (D-1096/D-18158), and Fulcrum `지렛목` (D-18254). Japanese/Chinese confirm the item components. |
| 14991 | `발라드 가문` -> `발라드의 집` | Japanese explicitly identifies the House of Ballads; the Hallam/Sagrell/Windemere context agrees. Reuse the established faction form (D-711/D-10221 and later decisions). |
| 15095 | `귀염둥이` -> `친구`; `여행자` -> `트래블러` | The vocative `dove` uses the established familiar `친구` (D-19432); capitalized Traveler names the faction `트래블러` (official manual p. 7; D-19609). |
| 15108 | Generic `'이야기'` -> `전승(The Telling)` | Capitalized lore term and Japanese `伝承`; reuse the accepted named-lore rendering (D-12514/D-18131). |
| 15188, 15201 | Correct `Flawless Mitharan` to `흠 없는 미타란` | Reuse the exact item-modifier and ethnonym precedents in D-19551/D-19651 and D-1096/D-18158; preserve the supported Flamed/Fulcrum and Infected/Hilt components. |
| 15238, 15442 | `콜로세` -> `콜로사이` | Reuse the accepted Kollossae form in D-18878/D-18933 and D-19651; English, Japanese, and Chinese identify the same people. At 15442, change only the two occurrences of the people-name and the separately established Beckoned title. |
| 15253 | `여행자들` -> `트래블러` | Standalone capitalized faction label; the official Korean manual p. 7 and the same-label correction at ID 14458 / D-19651 establish the form. |
| 15442 | `선택받은 자` -> `부름받은 자` | Capitalized `the Beckoned` is the protagonist's established title; reuse D-692 and D-19651. |

## Not an Issue

The other 182 keys were directly compared by source key. Their Korean
preserves the English-led action, relation, value, tone, or label meaning;
the locale differences did not establish a Korean defect requiring a
speculative rewrite. Where existing uncertainties concerned only wider lore,
UI placement, or unstandardized proper-name phonetics, no unsupported claim
was added to the translation.

## Integrity and Resume

- Pre-edit default SHA-256: `544f212767bbe8088823222ca45fb0bf775bddc29003959fdf3939dc4df79f0f`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19652/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256: `48c602334e9bec5320d37886362d5cc9fcf707ccd37eac82954d8b4a83c050b9`.
- The apply script verifies exact inverse reconstruction, UTF-8 BOM, mixed record endings, ID order, snapshot-matched Korean cells, and unchanged bytes outside the 18 approved `Texto` rows.
- Totals: **2,796 accepted / 27,629 not an issue / 8,099 uncertain** (38,524). The separate 55 Chinese-only provisional affix holds remain open; overall review is incomplete.
- Continue with the next 200 open default findings before the separate affix pass.
