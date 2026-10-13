# Korean PAK Precedent: Balla Lach (D-19560)

- Date: 2026-10-12; decision D-19560.
- Scope: default ID 62869, previously uncertain under D-18038.
- Read-only comparison used the earlier Korean PAK (`zxcv3428`) and its
  corrected Korean PAK (`dcinside`/`deinside` extraction), in addition to
  English meaning, Japanese phonetics, and Chinese support.

## Decision

| ID | Active Korean | Disposition | Evidence and rationale |
| ---: | --- | --- | --- |
| 62869 | `이 얼음 속성 무기들은 발라 라치가 사용했어. 발라 라치는 아말루르와 다른 세계들 사이의 희미해지는 장막을 순찰하던 정예 페이 전사들이야.` | not an issue; close D-18038 | The correctly indexed PAK row 62869 renders the name as `발라 라치` in the corrected Korean patch and `발라 라치 (Balla Lach)` in the earlier patch. This directly corroborates the active spelling. English/Japanese/Chinese and the Korean PAK rows retain the ice weapons, elite Fae warriors, and patrol between worlds. No row-local defect remains. |

## Integrity and Tally

- No Korean CSV cells changed; no edit backup was required.
- Active default SHA-256 remains
  `539e1d1a1473a229ba218b853d514ba0f25a68083e4ed19dff389c33adb6067f`.
- Default totals are now **2,458 accepted / 25,352 not an issue / 10,714
  uncertain** (38,524). Four default uncertainties remain: 62755, 62792,
  62796, and 62867.
- The separate 55 Chinese-only `affix` fallback keys remain 10 / 10 / 35;
  all 140 fallback keys remain 10 / 95 / 35.

These are working dispositions, not independent final linguistic approval.

## Resume

Resume D-19561 with the 35 uncertain Chinese-only `affix` fallback rows
across unique IDs 101, 115, 117, 124, 255, 341, and 496 (variants 12, 14,
21, 22, and 24). Compare each with its active variant-11 sibling and the
two included Korean PAK extractions; preserve the linked counts for IDs
115 and 117.
