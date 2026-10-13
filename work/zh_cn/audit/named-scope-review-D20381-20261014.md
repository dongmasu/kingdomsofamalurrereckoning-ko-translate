# Focused `base` Title Review D-20381

Review date: 2026-10-14.

Reviewed all 183 active `base` rows whose English `Texto` begins with
capitalized `The`. Compared the English source with active Korean and the
matching Japanese and Chinese rows. The official Korean manual was consulted
for established setting terminology. No PAK or PAK-derived file was
consulted.

The user clarified that these entries should be considered as possible
titles/proper names, not translated as ordinary phrases by default, and that
the complete English title should be considered for parenthetical
traceability. For this focused pass, the Korean display text keeps its Korean
rendering and appends the exact source title as `Korean (The English Name)`.
Redundant embedded copies of source names were removed where the full title
now follows. This is a targeted title-presentation pass, not a new global
disposition tally.

## Text Corrections

| ID | Previous Korean | Revised Korean before source-title suffix | Rationale |
| ---: | --- | --- | --- |
| 56 | `주인의 열쇠` | `장인의 열쇠` | Japanese `達人` and Chinese `大师` support “master/expert”; `장인` better fits the item-title reading than an owner. |
| 524 | `계곡의 손붕대` | `계곡의 손싸개` | `Handwraps` names handwear; `손싸개` is more natural equipment wording. |
| 1199 | `갤로우스 엔드의 처형자들` | `갤로우스 엔드의 처형된 자들` | English `the executed` denotes people who were executed, not executioners; Chinese supports that reading. |
| 1440 | `그 보석` | `보석` | Remove the unsupported demonstrative from the standalone title label. |
| 2074, 2129, 4387, 4506 | `새 조수` | `새로운 조수` | Align repeated instances with the same title at IDs 226 and 1099. |
| 3635 | `약제사의 비할 데 없는 반지들` | `약제사의 비할 데 없는 반지` | Korean need not mark the English plural; align the repeated item title with ID 1119. |

All 183 rows now preserve the complete English title in parentheses. Existing
accepted D-001 at ID 1741 (`The Beast`) was not reclassified or recounted;
its display was normalized to `야수 (The Beast)`. The manual's established
`패란즈` rendering for `Faelands` was retained at ID 1908.

ID 3900 (`The Master's Pick`) retains `장인의 곡괭이`: the English and
Japanese leave the object sense ambiguous, and Chinese is supporting evidence
only. The source title is now retained for traceability; no unsupported
equipment-category change was made.

## Scope

IDs: 9, 28, 35, 56, 65, 88, 121, 136, 226, 262, 312, 345, 356, 429, 437,
493, 510, 524, 617, 650, 687, 691, 699, 711, 764, 844, 871, 900, 963, 974,
1033, 1041, 1060, 1071, 1099, 1104, 1119, 1137, 1154, 1168, 1174, 1199,
1212, 1221, 1238, 1252, 1271, 1272, 1333, 1342, 1362, 1401, 1440, 1486,
1495, 1563, 1609, 1620, 1647, 1659, 1682, 1707, 1712, 1741, 1754, 1758,
1769, 1808, 1827, 1860, 1875, 1899, 1908, 1944, 1957, 1978, 2001, 2036,
2074, 2101, 2108, 2113, 2129, 2143, 2197, 2204, 2293, 2307, 2315, 2366,
2379, 2447, 2448, 2472, 2499, 2540, 2547, 2585, 2597, 2602, 2674, 2681,
2684, 2690, 2770, 2777, 2784, 2790, 2821, 2844, 2872, 2884, 2923, 2952,
2985, 3001, 3041, 3049, 3104, 3128, 3167, 3236, 3245, 3271, 3272, 3276,
3310, 3358, 3373, 3447, 3504, 3520, 3532, 3544, 3561, 3610, 3635, 3652,
3690, 3693, 3722, 3723, 3740, 3806, 3835, 3878, 3900, 3910, 3912, 3924,
3959, 3960, 4048, 4061, 4082, 4107, 4180, 4223, 4252, 4263, 4292, 4308,
4316, 4347, 4366, 4385, 4387, 4389, 4393, 4402, 4450, 4506, 4540, 4543,
4571, 4594, 4615, 4633, 4644, 4655, 4715, 4716, 4828.

The edit was applied by
[`apply-base-the-scope-D20381.rb`](apply-base-the-scope-D20381.rb).
Previously terminal keys were not added again to global disposition counts.
See the [edit addendum](named-scope-edit-addendum-D20381-20261014.md).
