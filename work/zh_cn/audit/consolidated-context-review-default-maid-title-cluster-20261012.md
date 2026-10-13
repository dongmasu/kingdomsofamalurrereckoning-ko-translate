# Consolidated Context Review: Maid of Windemere

- Date: 2026-10-12.
- Decision: D-19475.
- Scope: `default` IDs 5144, 5229, 6566, 8428, 9026, 10363, 10400,
  12891, 13302, 15333, 20547, 56762, 57347, 57724, 57829, and 62752.
- Compared immutable English, Japanese, and Chinese sources, the preserved
  Japanese-derived Korean draft, active Korean, and prior accepted decisions
  by `ID_Linha`. English governs meaning; Japanese informs voice; Chinese is
  supporting evidence.

## Decisions

| Decision | IDs | Disposition | Rationale |
| --- | --- | --- | --- |
| D-19475 | 10363, 10400 | accepted | Correct the two stale `윈드미어의 시녀` spellings to `윈더미어의 시녀`. English gives `Windemere`; the approved Korean place/title form is established at ID 42026 (D-12978), with `Maid` rendered as `시녀` under D-18128 and D-18140. |
| D-19475 | 5144, 5229, 6566, 8428, 9026, 12891, 13302, 15333, 20547, 56762, 57347, 57724, 57829, 62752 | not an issue | These rows preserve the named Maid/person and the local event, label, or dialogue function using the accepted Korean title form. Japanese `ウィンダメアの烈女` and Chinese `温德米尔的少女` characterize the figure differently, but do not establish a row-local mistranslation against English. This clears the translation holds without deciding the character's full lore identity or office. |

At ID 57347, this decision concerns only the Maid phrase. The separate
House of Ballads correction remains under D-17270 and is not recounted.
ID 62752 was one member of the grouped D-18027 hold; only its Maid question
is resolved here, while the other listed questions remain open.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10363 | `윈드미어의 시녀` | `윈더미어의 시녀` | D-19475 |
| 10400 | `윈드미어의 시녀` | `윈더미어의 시녀` | D-19475 |

Fourteen uncertain findings were resolved as `not an issue`; two were
accepted and corrected. No runtime markers or embedded line breaks occur in
these 16 rows.

## Verification

- All 16 IDs occur once and in the same order in active Korean, English,
  Japanese source, Chinese source, and the preserved Japanese-derived draft.
- Pre-edit SHA-256:
  `df9685d685ab7dd41c9490ef6e46283f16d370592f617e28beba4ac34c7306dc`.
- Post-edit SHA-256:
  `33138438fc84241984b61349c4e992cdf7480496186fc686538db3d736587628`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-maid-title-cluster-D19475/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing only the two listed substitutions reproduces the backup
  byte-for-byte. The UTF-8 BOM, 65,135 ordered records, 72,011 CRLF
  sequences, and 73 pre-existing bare-LF sequences are preserved.
- Totals after D-19475: **2,352 accepted / 25,120 not an issue / 11,052
  uncertain** (38,524). Resume at **D-19476** from the deduplicated
  unresolved-source queue.

These are working dispositions, not independent final linguistic approval.
