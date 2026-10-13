# Legacy Default Hold Review (D-19740)

- Date: 2026-10-12.
- Scope: all 85 exact source-keyed entries in
  `uncertain-85-D19740-20261012.jsonl`, the remaining entries in the
  original 98-row D-17843 snapshot after prior exact closures.
- Result: 15 accepted corrections, 70 `not an issue`, zero unresolved in
  this manifest. This is a source-keyed batch result, not a reconciliation
  of membership in the historical 987 uncertain tally.
- English controls meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. The official Korean manual and accepted Korean
  term decisions were consulted. No PAK or PAK-derived material was used.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Evidence |
| ---: | --- | --- | --- |
| 58614 | `자유민` | `프리맨(Freemen)` | Capitalized English names the Freemen group; Japanese `フリーマン団` supports a faction reading. Reuse D-18219 and later accepted faction corrections. |
| 58615 | `트래블러스` | `트래블러(Travelers)` | Capitalized Travelers names the faction. Use the official Korean manual's `트래블러` (printed p. 7); retain the Hierophant's guiding-eyes image and gift. |
| 58619 | `하이페리안` | `하이페리언` | Reuse the accepted Hyperian spelling established at D-19584/D-19722. The row's “at the Hyperian” does not require deciding whether it is a place, event, or entity. |
| 58632 | `관` | `서클릿` | English `circlet` and Japanese `サークレット` identify the equipment type. Reuse the accepted `서클릿` term at D-022/D-19720; the three locations and other items remain unchanged. |
| 58720 | `트래블러스` | `트래블러(Travelers)` | Standalone capitalized faction label; official Korean manual, printed p. 7. |
| 58742 | `맹세의 검` | `맹세의 칼날` | Reuse D-18254's accepted formal Warsworn Oathblade rank. Chinese supports the blade/oath components; Japanese rank context is consistent with the established term. |
| 58754 | `비둘기야` | `친구` | English lowercase `dove` is a familiar vocative. Reuse the neutral address accepted at D-19432; Japanese omission and Chinese literalization do not establish a different Korean relationship. |
| 58784 | `교수대의 끝` | `갤로스 엔드` | Capitalized English names the location. Reuse the same-English accepted spelling at D-19709; this is a row-level application, not a claim that conflicting corpus spellings have been globally reconciled. |
| 58790 | `물에 피를 물들이는 자` | `물을 피로 물들이는 자` | Repairs Korean case/word order while retaining the title's bloodied-waters image. Japanese says “stain the sea with blood”; Chinese likewise describes bloodied waters. |
| 58797 | `그들도 우리 것이고, 우리도 그들의 일부니까` | `그들도 우리에게 속해 있고, 우리도 그들에게 속해 있으니까` | Restores the source's parallel reciprocal belonging (“we are theirs, as much as they are ours”); Japanese describes reciprocity and Chinese preserves both directions. |
| 58814 | `페이의 돌무덤` | `페이의 케른` | English `Cairn`, Japanese `ケルン`, and the Lorestone/Echo Stone function identify a lore marker, not an established grave. |
| 58852 | `머간` | `머건` | English identifies the murghan creature; Japanese and Chinese confirm the breeding-ground context. Reuse the established Korean creature spelling at D-19635 / ID 5157. |
| 58866 | `판매 가격` | `금화 가치` | English says `gold value`, Japanese says the item's monetary amount, and Chinese explicitly describes its value as gold. `금화 가치` avoids adding an unstated sale transaction; the 15% recovery is preserved. |
| 58880 | `교수대의 끝` | `갤로스 엔드` | Same named location as ID 58784; reuse the accepted D-19709 spelling while preserving the Fallen Son, patrol, prisoner comparison, and Akara's role. |
| 58887 | `후계자` | `사이온(Scion)` | Capitalized Scion is the established named office, not generic succession. Reuse D-19496 and later accepted corrections; English, Japanese, and Chinese identify the same title. |

## `Not an Issue`

The other 70 exact rows preserve the English meaning and material details
after Japanese-register and Chinese-support comparison. No additional
sentence-level correction is justified by these rows; unresolved proper-name
or entity taxonomy beyond what the English establishes is not used to keep
these exact keys open.

IDs: 58599, 58600, 58604, 58607, 58610, 58618, 58622, 58624, 58628, 58634,
58640, 58643, 58647, 58648, 58652, 58654, 58655, 58657, 58658, 58659, 58664,
58667, 58669, 58671, 58672, 58678, 58682, 58684, 58712, 58713, 58716, 58722,
58726, 58736, 58737, 58738, 58749, 58750, 58758, 58763, 58764, 58770, 58774,
58778, 58779, 58783, 58789, 58793, 58798, 58806, 58809, 58815, 58816, 58819,
58827, 58829, 58831, 58836, 58837, 58839, 58840, 58842, 58845, 58851, 58857,
58858, 58868, 58882, 58894, 58898.

## Integrity and Resume

- The manifest contains 85 rows, 85 unique IDs, in ascending order from
  58599 through 58898. Every row's exact text was matched against the active
  English, Japanese, and Chinese CSVs and the byte-identical pre-edit Korean
  backup.
- Pre-edit default SHA-256:
  `efcc82a6f550773a19bd731999ba2b14f4f0913f317a6c194de2f798355de1a7`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-legacy-85-D19740/locatexts_zh_cn.koalocatext_default.csv`.
- Active default SHA-256:
  `3f862aeda41678f71ceb3cce3ab4bbc9298dfb2bdbc6695223847378ccabf964`.
- Applying exactly the 15 listed substitutions to the backup reconstructs
  the active CSV byte-for-byte. The UTF-8 BOM, ascending row order, 72,011
  CRLF endings, 73 pre-existing bare-LF endings, and every unapproved byte
  are unchanged.
- The historical operational tally remains **3,419 accepted / 34,118
  `not an issue` / 987 uncertain** (38,524), unreconciled and unchanged.
  The 85-row batch is not presumed to belong to that 987-member cohort.
- D-19729-D-19738's 905-key reconstructed candidate inventory and all 98
  entries in the D-17843 source snapshot now have recorded terminal
  dispositions. This does not resolve the documented 110-key reconstruction
  mismatch or prove the historical 987 cohort complete.
- Next decision: **D-19741**, reconcile the historical 987 cohort against
  the canonical terminal-decision ledger and resolve the 110-key mismatch
  before selecting another translation row or claiming default completion.
  Use `open-uncertainty-reconciliation-D19726-20261012.md`; do not resume
  the heuristic queue or repeat the closed 905/98 source keys.
- The separate 55 Chinese-only affix findings remain recorded closed at
  D-19565. Overall default review is incomplete.
