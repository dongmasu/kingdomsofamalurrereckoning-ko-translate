# Consolidated Context Review: 200 Default Keys, D-19653

Scope: all 200 entries in `uncertain-200-D4747-D5107-20261012.jsonl`.
English anchors meaning; Japanese informs voice/register; Chinese is
supporting evidence. All 200 source-keyed cells matched their English,
Japanese, Chinese, and pre-edit active Korean CSV rows (200/200 per locale).
The page-indexed official Korean manual and established project decisions
were reused. No PAK or PAK-derived material was used.

All 200 findings are closed: 13 accepted corrections and 187 `not an issue`;
none remains uncertain. The accepted IDs are 15585, 15590, 15671, 15713,
15739, 15774, 15789, 15930, 15950, 15951, 15994, 16200, and 16242. Every
other ID in the snapshot is `not an issue`.

## Accepted Corrections

| ID | Applied correction | Evidence |
| ---: | --- | --- |
| 15585, 15739 | `콜로세` -> `콜로사이` | Reuse the established Kollossae spelling (D-18878/D-18933); all locale rows identify the same people. |
| 15590 | `완벽한 미사란 확장 안감` -> `흠 없는 미타란 확장 안감` | Apply Flawless `흠 없는` (D-19551/D-19651) and item Mitharan `미타란` (D-1096/D-18158); preserve Expansive Lining. |
| 15671 | `마스터 미타루 면역 문자열` -> `마스터 미타란 면역 실` | The source and Chinese identify a crafting string/thread, not a software text string. Apply item Mitharan `미타란`; retain the Master tier and Immunity modifier. |
| 15713 | `발라드 가문` -> `발라드의 집` | Reuse the established House of Ballads faction form (official manual p. 7; D-711/D-10221 and later decisions). |
| 15774 | `여행자(Traveler)` -> `트래블러(Traveler)` | Capitalized Traveler is the named faction; use the official-manual form (p. 7; D-19609). |
| 15789 | `초대받은 자` -> `부름받은 자` | Reuse the established player title from D-692 and later accepted decisions. |
| 15930, 15994 | `Delvers` role `탐험가들` -> `탐구자들` | Apply the established House of Sorrows role form at D-19632/D-19651 without changing the sentence's other lore claims. |
| 15950 | `미타란 프리즘미어 미트` -> `미타란 프리즘미어 장갑` | D-6296 established that `Mitt` is a hand covering, not a literal `미트`; Chinese `手套` confirms gloves. |
| 15951 | `여행자(Traveler)` -> `트래블러(Travelers)` | English explicitly names the faction; use the official Korean manual's `트래블러` form (p. 7). |
| 16200 | `갤로우스 엔드` -> `갤로스 엔드` | Align the named place with accepted spellings at IDs 14718, 14791, 14883, and 15369. |
| 16242 | `완벽한 미타란` -> `흠 없는 미타란` | Apply the accepted Flawless item modifier (D-19551/D-19651); preserve Mitharan and Arcane Bindings. |

## Not an Issue

The other 187 rows were compared against their English-led source meaning,
Japanese register, Chinese supporting text, and applicable terminology
precedents. Their current Korean preserves the evidenced meaning; locale
differences or unresolved broader context did not justify inventing a
different reading.

## Integrity and Resume

- Pre-edit default SHA-256: `48c602334e9bec5320d37886362d5cc9fcf707ccd37eac82954d8b4a83c050b9`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19653/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256: `56e3ba6ac74d5b21700e8b28076aa6e5a96e877c270ce4be6e8c96b3deefe2af`.
- The apply script verifies exact inverse reconstruction, UTF-8 BOM, mixed record endings, ID order, snapshot-matched Korean cells, and unchanged bytes outside the 13 approved `Texto` rows.
- Totals: **2,809 accepted / 27,816 not an issue / 7,899 uncertain** (38,524). The separate 55 Chinese-only provisional affix holds remain open; overall review is incomplete.
- Next **D-5108 / ID 16252**; prepared snapshot `uncertain-200-D5108-D5506-20261012.jsonl`. Continue with the next 200 open default findings before the separate affix pass.
