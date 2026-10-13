# Consolidated Context Review: Joining the House of Sorrows

- Date: 2026-10-12.
- Decision: D-19483.
- Scope: `default` IDs 2348 and 51579, grouped by the House-membership
  context in their prior uncertainty findings.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  the established House definition/name by `ID_Linha`.

## Findings

English ID 39470 directly defines the House of Sorrows as a collective of
Winter Fae. The accepted canonical Korean name is
`비탄의 집(House of Sorrows)` (D-19451).

| Decision | ID | Disposition | Rationale |
| --- | ---: | --- | --- |
| D-19483 | 2348 | accepted | English says the mortal has a chance to join the House of Sorrows; Japanese also describes joining the named House, and Chinese supports the family/group reading. Replace the transliteration `하우스 오브 소로우` with the accepted `비탄의 집`, retaining the English name and the rest of the sentence. |
| D-19483 | 51579 | not an issue | English and Japanese explicitly say the speaker can join the House; Chinese calls it a family/group. Korean already uses the accepted `비탄의 집(House of Sorrows)` and preserves escape, trial completion, membership, and aid against the Tuatha. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean rows were matched by ID. Each key occurs once in all five files.
- No runtime markers, embedded line breaks, or numeric values occur in
  either target cell.
- Only the `Texto` value at ID 2348 changed. ID order, row count, BOM, and
  line endings remain unchanged.
- Pre-edit SHA-256:
  `11793c84b5d2ca2983b7bd0f9abf5f4b5a490b75e988f3095eec4cba655f4ce8`.
- Post-edit SHA-256:
  `843b333e6e621e58ffb8473ed7ed7cce3d1bfac3035f09e94889f9a3b1ae4ebc`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-join-2348-D19483/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing the exact ID 2348 cell in the backup reproduces the active CSV
  byte-for-byte. BOM, 65,135 records, 72,011 CRLF endings, and 73 existing
  bare-LF endings are preserved.
- Two prior uncertainty findings were resolved: one accepted correction and
  one `not an issue`. Totals: **2,357 accepted / 25,141 not an issue /
  11,026 uncertain** (38,524). Resume at **D-19484** from the deduplicated
  unresolved-finding queue.

These are working dispositions, not independent final linguistic approval.
