# Consolidated Context Review: `default` IDs 26451-26500

- Review date: 2026-10-11.
- Scope: the 22 unique prior uncertain IDs from D-8587-D-8589 after linking
  already-reclassified Fateweaving at 26476 and the accepted Crilgarin title
  at 26496. Overlaps at 26481, 26483, and 26490 were counted once.
- Result: two accepted corrections and twenty `not an issue`; no new
  uncertainty remains in this range.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19309-D-19310

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19309 | `default` 26473, 26479 | accepted | Reuse approved standalone forms: `The Burn` is `번(The Burn)` at ID 7284 (D-1976), and `Moon Camp` is `달 야영지` at IDs 2836 and 62843 (D-18030). |
| D-19310 | `default` 26452, 26455-26456, 26462, 26466, 26471-26472, 26475, 26477-26478, 26481, 26483-26486, 26490-26492, 26494-26495 | not an issue | The Siegebreaker and creature labels remain traceable; both separate +20% effects and the +9/+40% Faeblades values are preserved. The Font-flow deception, Wreath/atonement sequence, Dark Empyrean claim, Winter Court/Tuatha relation, Sparrow Murders note, antelope-head label, and Wyvyrn-Gifre address are source-aligned. The current name forms are plausible; no stronger approved correction applies to these keys. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26473 | `번트` | `번(The Burn)` | Reuse the accepted rendering for the identical standalone source label at ID 7284. |
| 26479 | `달빛 캠프` | `달 야영지` | Reuse the accepted Moon Camp form at IDs 2836 and 62843. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain IDs 26451-26500 exactly once in ascending order.
- The two accepted replacements are the only active Korean CSV changes.
  Reversing them reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file still has 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The earlier preliminary scan verified embedded line-break counts,
  runtime-token signatures, and the separate effect values across the five
  files. Direct sequence checks in this review independently confirmed 50
  ordered rows in each file.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26451-26500-D19309/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `655bd05983ef107d1962baa58c60de069bd86190fed707bb2fe4851ce639e658`.
- Post-edit SHA-256:
  `6d60b9da225f25c8f925b2a1ca328c9643f3d14ddbb51d17367cd3586e88c74c`.
- Twenty-two prior uncertain IDs were reclassified: two accepted and twenty
  `not an issue`. D-18208 at 26476 and D-18633 at 26496 are linked without
  recounting. Totals: 2,204 accepted / 24,440 `not an issue` / 11,880
  uncertain (38,524). Resume at D-19311, ID 26501.
