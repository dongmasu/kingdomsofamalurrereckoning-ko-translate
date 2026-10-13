# Consolidated Name Review: Gwyn Anwy

- Date: 2026-10-11
- Decision: D-18255
- Scope: all 51 English `default` rows containing the exact name `Gwyn
  Anwy`, aligned by `ID_Linha`.
- Result: standardize every corresponding Korean name fragment to
  `그윈 안웨이`; resolve the name-related uncertainty at ID 65127.

## Evidence and Decision

The Japanese source spells the name `グウィン・アンウェイ` in 50 of the
51 rows; the remaining Japanese row uses a consistent rank/name variant.
The Chinese source uses `格文·安维` in 49 rows; two natural-language rows
omit or vary part of the name. These forms support `Gwyn = 그윈` and
`Anwy = 안웨이`. English is the identity anchor; Japanese phonetics and
Chinese transliteration corroborate the Korean form.

The active Korean corpus had six competing forms across the 51 keyed rows:
`그윈 안위` (27), `그윈 앤위` (17), `귄 안위` (4), `귄 앤위` (1),
`오윈 안위` (1), and `귀윈 언위` (1). These are inconsistent renderings
of the same repeatedly identified Warsworn woman, not separate characters.
Normalize only the Korean name fragment to `그윈 안웨이`; preserve each
row's remaining wording, title, punctuation, and parenthetical-English
style. The standalone source string `Anwy` at ID 14520 is not identified as
this character and was deliberately left unchanged.

ID 65127 now preserves the rank as `맹세의 칼날` and the person's name as
`그윈 안웨이`; its only previously unresolved issues are settled, so its
uncertain disposition is accepted. The other 50 keys retain their existing
dispositions; name normalization does not clear unrelated row-level
uncertainties.

## Edit and Verification

- Exactly 51 active Korean `Texto` cells changed, all selected from the
  English source by exact-name match. Each changed one Korean name fragment.
- The UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and 73 bare-LF
  endings are preserved. Runtime markers, values, and embedded line breaks
  were not changed.
- Pre-edit default SHA-256:
  `a0f2e86b36c9ba3878403e4ec09a701247c7a1531d42c87e9d80f97d5e204618`.
- Post-edit default SHA-256:
  `ed5639b5ba84ea7f1f236220faf6b889d87d5f0009d0b0b024878f91380bedab`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-gwyn-anwy-D18255/locatexts_zh_cn.koalocatext_default.csv`.
- D-18255 reclassifies ID 65127 as accepted; the other 50 keys are linked
  without recounting.
- Cross-resource totals through D-18255: 1,932 accepted, 23,086 `not an
  issue`, and 13,504 uncertain (38,522 unique dispositions); next decision:
  D-18256.

These are working dispositions, not independent final linguistic approval.
