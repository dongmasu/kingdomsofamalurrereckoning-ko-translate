# Consolidated Context Review: `default` IDs 26401-26450

- Review date: 2026-10-11.
- Scope: the 22 unique IDs previously held by D-8581-D-8583. ID 26434
  appears in two terminology groups and is counted once. The previously
  accepted Warden correction at 26436 is linked, not recounted.
- Result: two accepted corrections, nineteen `not an issue`, and one
  specific unresolved term (`Crossing` at 26422).
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19306-D-19308

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19306 | `default` 26441, 26443 | accepted | Apply the accepted Warsworn form from D-2857. At 26441, the English explicitly says an ancient Warsworn vault; at 26443, the standalone row is the faction name. |
| D-19307 | `default` 26405-26406, 26408, 26417, 26419-26420, 26423-26424, 26428, 26430, 26432, 26434, 26436-26437, 26439-26440, 26442, 26444, 26447 | not an issue | Proper names and concise labels are recognizable; the Master's Key, seasteel, Adarus Key seed, relic, loyalty, amulet, and quest passages preserve the source facts. The Headhunter-to-reward handoff supports `현상금 사냥꾼`; the already accepted `감시관` at 26436 is unchanged. Japanese and Chinese corroborate the relevant meanings without requiring a new Korean form. |
| D-19308 | `default` 26422 | uncertain | `Crossing` is capitalized and may be a named lore location, while this isolated quest instruction and the translations do not establish its canonical in-game Korean form. Keep `교차점` unchanged pending a source-linked location reference; do not treat capitalization alone as proof of an error. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26441 | `...고대 워스워른의 금고에서...` | `...고대 워스원(Warsworn)의 금고에서...` | Reuse the accepted faction rendering at D-2857; the English directly identifies the vault as Warsworn. |
| 26443 | `워스워른` | `워스원(Warsworn)` | Apply the accepted faction form to the standalone faction label. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain IDs 26401-26450 exactly once in ascending order.
- The two accepted replacements are the only active Korean CSV changes.
  Reversing them reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file still has 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The earlier preliminary scan verified aligned row order, embedded
  line-break counts, and runtime-token signatures across the five files.
  Direct sequence checks in this review independently confirmed 50 ordered
  rows in each file.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26401-26450-D19306/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `cf82bebc2dba96dadfb61fdf8ff484e78347e7bedcae773c546be03be566861b`.
- Post-edit SHA-256:
  `655bd05983ef107d1962baa58c60de069bd86190fed707bb2fe4851ce639e658`.
- Twenty-two prior uncertain IDs were reclassified: two accepted, nineteen
  `not an issue`, and one remains uncertain. Totals: 2,202 accepted /
  24,420 `not an issue` / 11,902 uncertain (38,524). Resume at D-19309,
  ID 26451.
