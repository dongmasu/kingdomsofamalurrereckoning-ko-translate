# Consolidated Context Review: Unused Stat Labels

- Date: 2026-10-12.
- Decision: D-19449.
- Scope: eleven candidate `DO NOT USE` stat-label IDs:
  2793, 12637, 23907, 31372, 32632, 41093, 43261-43262, 44240, 53446,
  and 58568. Ten were open at review start; 23907 had already been cleared.

## Decisions

| ID | Source / active Korean | Disposition | Finding |
| ---: | --- | --- | --- |
| 2793 | `Scourge DoT [DO NOT USE]` / `역병 지속 피해(DoT) [사용 금지]` | not an issue | The damage-over-time meaning and warning are retained. Internal versus player-facing status is not a translation defect. |
| 12637 | `Scourge Armor [DO NOT USE]` / `재앙 방어구 [사용 금지]` | uncertain; retained | The warning is present, but the source-term/category issue remains: Japanese uses plague-defense wording and Chinese uses scourge-armor wording. |
| 23907 | `Min Health [DO NOT USE]` / `최소 체력 [DO NOT USE]` | already not an issue; linked | D-18746 already resolved this unique ID. Do not recount it. |
| 31372 | `Ice Armor [DO NOT USE]` / `얼음 갑옷 [사용 금지]` | not an issue | The label and warning are conveyed. English, Chinese, and Korean use brackets; Japanese uses parentheses. This annotation-format difference is not a runtime-token defect. |
| 32632 | `Mana Steal Armor [DO NOT USE]` / `마나 흡수 방어구 [사용 금지]` | not an issue | The stat wording and explicit warning are preserved across the source locales; internal status need not be inferred. |
| 41093 | `[DO NOT USE]` / `[DO NOT USE]` | not an issue | Korean matches the English warning exactly; Japanese says unavailable and Chinese localizes the same warning. Other questions at 41073 and 41078 remain uncertain. |
| 43261 | `Heroes Shall Not Pass` / `영웅은 지나갈 수 없다` | not an issue | The standalone sign preserves the English prohibition. |
| 43262 | `Phoenix Armor [DO NOT USE]` / `불사조 갑옷 [DO NOT USE]` | not an issue | Korean translates the item label and preserves the exact warning. Display/runtime status is separate. |
| 44240 | `Bleeding Armor [DO NOT USE]` / `출혈 방어구 [DO NOT USE]` | uncertain; retained | The warning is exact, but the item/effect/category and intended meaning of `Armor` remain unsettled across references. |
| 53446 | `Physical DoT [DO NOT USE]` / `물리 지속 피해 [사용 금지]` | not an issue | Korean expresses physical damage over time; Japanese and Chinese support the meaning. The warning is retained, and no rule requires the English abbreviation `DoT`. |
| 58568 | `Pierce DoT Duration [DO NOT USE]` / `관통 지속 피해 지속 시간 [사용 금지]` | not an issue | Pierce, damage-over-time, duration, and the warning are all retained. The repeated Korean `지속` reflects two separate source concepts. |

The two retained uncertainties are limited to the stat/category meanings at
12637 and 44240. Displaying a warning-marked label in-game versus treating
it as internal metadata is not used by itself to hold an otherwise faithful
translation.

## Verification

- Exact IDs were compared across English, Japanese source, Japanese-derived
  draft, Chinese, and active Korean. Source warning text and runtime markers
  were distinguished; `[DO NOT USE]` is literal annotation text here.
- Eight previously uncertain IDs move to `not an issue`; 12637 and 44240
  remain uncertain. ID 23907 is linked to D-18746 without recounting.
- No active Korean cell changed; no backup was needed. Active default
  SHA-256 remains
  `cc8c2706805482a13a2bd44a8d58687b1804a8f06bea3c6632b47639f20073f4`.
- Totals: **2,284 accepted / 24,993 not an issue / 11,247 uncertain**
  (38,524). Resume at **D-19450**.
