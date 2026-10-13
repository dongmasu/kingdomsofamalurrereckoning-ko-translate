# Consolidated Context Review: Warsworn Ranks and Fulcrum

- Date: 2026-10-11
- Decision: D-18254
- Scope: `default` IDs 65066, 65089, and 65127, with repeated rank and item
  labels checked by `ID_Linha`.
- Result: two uncertain keys are accepted after targeted corrections. ID
  65127 receives a rank-term correction but remains uncertain over the
  separate Korean spelling of `Gwyn Anwy`.

## Evidence and Decisions

At ID 65066, English explicitly calls Oathblade a rank and describes
Pledgeshield as its preceding Warsworn rank. English repeats that hierarchy
at IDs 2976, 29923, 44646, and 49414. Japanese substitutes second- and
first-class mercenary grades; Chinese renders the titles as oath-shield and
oath-blade. The English rank hierarchy governs meaning, while the Chinese
compound meanings corroborate the Korean terms. Existing Korean rank
contexts use `서약방패병` for Pledgeshield and `맹세의 칼날` for Oathblade.

- ID 65066: replace the untranslated `플레지실드` / `오스블레이드` with
  `서약방패병` / `맹세의 칼날`. The rank progression and service period
  remain unchanged. This resolves its prior uncertainty.
- ID 65127: replace only `오스블레이드` with `맹세의 칼날`. The row remains
  uncertain because active Korean spellings for `Gwyn Anwy` conflict. The
  name question is not recounted or treated as resolved.

At ID 65089, English names a Flawless Mitharan Butcher's Fulcrum; Japanese
transliterates `Fulcrum`, while Chinese uses `支点`. Related Mitharan Fulcrum
item labels confirm this is an item component, not a freestanding pedestal.
Korean `받침대` incorrectly names a stand. Replace it with `지렛목`, the
lever's supporting/pivot component, and retain the already-correct
`완벽한 미타란 도살자` wording. This resolves the row's outstanding
item-category uncertainty.

## Edit and Verification

- Only the active Korean `Texto` cells at IDs 65066, 65089, and 65127 changed.
- The UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and 73 bare-LF
  endings are preserved. No runtime marker or embedded line break occurs in
  these rows; numeric values are unchanged.
- Pre-edit default SHA-256:
  `a19d10e66a7946ce925300d542d37951a123189804571b701269b11fbfb7a35a`.
- Post-edit default SHA-256:
  `a0f2e86b36c9ba3878403e4ec09a701247c7a1531d42c87e9d80f97d5e204618`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-ranks-fulcrum-D18254/locatexts_zh_cn.koalocatext_default.csv`.
- D-18254 reclassifies IDs 65066 and 65089 from uncertain to accepted.
  ID 65127 remains uncertain and is linked without recounting.
- Cross-resource totals through D-18254: 1,931 accepted, 23,086 `not an
  issue`, and 13,505 uncertain (38,522 unique dispositions); next decision:
  D-18255.

These are working dispositions, not independent final linguistic approval.
