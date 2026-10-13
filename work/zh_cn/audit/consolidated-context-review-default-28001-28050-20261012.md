# Consolidated Context Review: `default` IDs 28001-28050

- Review date: 2026-10-12.
- Scope: open findings D-8814-D-8817 for IDs 28001-28050, checked against
  English, Japanese source and preserved Japanese-derived Korean draft,
  Chinese, active Korean, and related audit decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: two accepted `Texto` corrections and twenty-three `not an issue`
  resolutions; no uncertainty remains in this batch.

## Decisions D-19418-D-19420

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19418 | `default` 28004, 28021 | accepted | Replace the inconsistent House of Valor forms with the established `용맹의 집(House of Valor)` from D-148/D-650 and subsequent accepted applications. At 28021, retain the source's transfer of the House to the new Champion. |
| D-19419 | `default` 28005, 28032, 28040 | not an issue | ID 28005 retains the English trade-above-and-below image without resolving its ellipsis; Japanese diverges on “rags,” while Chinese supports the surface/underground relation. ID 28032 remains a short “off the road” fragment in all locales. ID 28040 preserves the forced walk to/onto the gallows and plunge into the waters below; the locale differences do not establish a Korean meaning error. |
| D-19420 | `default` 28008, 28012-28013, 28015, 28017, 28020, 28024-28025, 28028, 28030-28031, 28035, 28037, 28039, 28041-28044, 28047, 28049 | not an issue | The Firstsworn era/meeting place, Unbound affiliation, Warrior Kings, Kobold Rogue, Warden decision, Hyperian/Cipher relation, Widow title, Brownies, Beckoned address, institution/sentry names, twin Defenders, Gadflow threat, Apotyre miners, dedication, quest status, Faitir/Scaith relation, peace euphemism, Celerity, and Amaldor command are retained. The named labels are source-traceable; no row-local correction is better supported. |

Previously accepted IDs 28006 and 28022 and previously resolved D-8813 rows
are linked without recounting.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 28004 | `용맹의 가문(House of Valor)` | `용맹의 집(House of Valor)` | Reuse the accepted formal House name. |
| 28021 | `발러 가문(House of Valor)` | `용맹의 집(House of Valor)` | Reuse the accepted formal House name while retaining the ownership/award meaning. |

## Structural and Context Notes

- English, Japanese source, Chinese, active Korean, and the preserved
  Japanese-derived Korean draft contain IDs 28001-28050 once in ascending
  order. Default rows have `ID_Linha` and `Texto`; there is no variant
  column.
- The preliminary structural check found no line-break, runtime-token,
  numeric, or key-order mismatch in this batch. Both edits change only
  Korean names and do not affect markers or layout.
- ID 28005's elliptical trade language remains intentionally broad; no
  interpretation was added beyond the English-led reading.
- Existing differences in how Firstsworn is rendered remain corpus-wide
  terminology work, not evidence that this row's retained source identity is
  wrong.

## Verification

- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-28001-28050-D19418/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `d20a5a3975b34218f38abb3a3cb7e048a5955df94c87a2d55502a3d0f4cbb367`.
- Post-edit SHA-256:
  `1f87d9201636d6c423045c7dbf9360f9f65143665c95d08e9b0d257ff196efeb`.
- Reversing the two exact substitutions reproduces the backup byte-for-byte.
  Only Korean `Texto` at IDs 28004 and 28021 changed; the UTF-8 BOM, row
  order, existing line endings, and all other CSV bytes are preserved.
  Source CSVs were not edited.

Totals: 2,260 accepted / 24,917 `not an issue` / 11,347 uncertain (38,524).
Resume D-19421 at ID 28051; sequentially unreviewed interval is 28051-65134
(37,084 IDs), besides older specific holds and register reconciliation.

These are working dispositions, not independent final linguistic approval.
