# Consolidated Context Review: `default` IDs 28051-28100

- Review date: 2026-10-12.
- Scope: open findings D-8821-D-8825 for IDs 28051-28100, checked against
  English, Japanese source and preserved Japanese-derived Korean draft,
  Chinese, active Korean, and related audit decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: two accepted `Texto` corrections and twenty `not an issue`
  resolutions; no uncertainty remains in this batch.

## Decisions D-19421-D-19425

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19421 | `default` 28058 | accepted | Replace `용병 견습` with `고용병(Hireling)`. English is the standalone role label `Hireling`, and Chinese `雇佣兵` means hired soldier; neither supports the extra apprentice qualification in the Japanese source/draft. Reuse the accepted role wording at D-3509 and retain the English label. |
| D-19422 | `default` 28097 | accepted | Replace `소로스 가문(House of Sorrows)이 있는` with `비탄의 힘(Sorrows)이 깃든`. Japanese explicitly says “the power of Sorrows”; English uses capitalized `Sorrows`; corpus lore at IDs 4472 and 64074 defines the Sorrows as destructive magical energy, and D-19375 uses `비탄의 힘(Sorrows)`. Esharra is the Fae magical plane (D-18258), not evidence that this line names the House as the referent. |
| D-19423 | `default` 28056 | not an issue | `Clear the area` has no surrounding scene context. Korean `주변을 정리해` remains a broad instruction to clear the vicinity, without choosing evacuation or avoidance; the Japanese and Chinese readings are narrower alternatives, not evidence of a Korean error. |
| D-19424 | `default` 28055, 28057, 28059, 28062, 28066, 28070, 28074-28077, 28079-28081, 28088, 28090, 28096, 28098 | not an issue | Akara's Essence, Deda/Nanne, Sweetspot, Testament, Savant, Jottun armor, Sparrows, widow, Irminsul/Aesir Dannin, Garaner, the rented shirt, headpiece, harvest image, Sagecraft, Kandrian High Lords, and Preordained poachers retain the English-led row meanings. Recurring name and role variants alone do not establish local translation errors. |
| D-19425 | `default` 28073, 28082 | not an issue | ID 28073's English follow-up at 53181 names Cadwallon and Nesta Gwynedd, supporting Korean `부부`; Japanese also says couple. At 28082, English leaves “He” ambiguous and Korean `그가` preserves that ambiguity rather than adding a referent; Japanese selects Aedran, but the English-led text does not require Korean to do so. |

Previously dispositioned IDs 28051-28054, 28060-28061, 28063-28065,
28067-28072, 28078, 28083-28087, 28089, 28091-28096, and 28099-28100 are
linked without recounting, including the existing Venris and gate-dialogue
decisions at IDs 28068 and 28086.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 28058 | `용병 견습` | `고용병(Hireling)` | Remove an apprentice rank unsupported by English and Chinese; reuse the accepted Hireling role wording. |
| 28097 | `소로스 가문(House of Sorrows)이 있는 에샤라(Esharra)` | `비탄의 힘(Sorrows)이 깃든 에샤라(Esharra)` | Resolve the referent as the magical force identified by Japanese and established English lore, not the House/faction. |

## Structural and Context Notes

- English, Japanese source, Chinese, active Korean, and the preserved
  Japanese-derived Korean draft contain IDs 28051-28100 once in ascending
  order. Default rows have `ID_Linha` and `Texto`; there is no variant
  column.
- The preliminary structural check found no line-break, runtime-token,
  numeric, or key-order mismatch. The Shift control marker at 28051 is
  unchanged; neither edit affects markers or line layout.
- IDs 28068 and 28086 had already been resolved in the earlier disposition
  pass and are linked, not counted again.

## Verification

- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-28051-28100-D19421/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `1f87d9201636d6c423045c7dbf9360f9f65143665c95d08e9b0d257ff196efeb`.
- Post-edit SHA-256:
  `ee18e87ec14c17736f0e8afb9f00d8420e2f535e95a2727dc9702a60305304e6`.
- Reversing the two exact substitutions reproduces the backup byte-for-byte.
  Only Korean `Texto` at IDs 28058 and 28097 changed; the UTF-8 BOM, row
  order, existing line endings, and all other CSV bytes are preserved.
  Source CSVs were not edited.

Totals: 2,262 accepted / 24,937 `not an issue` / 11,325 uncertain (38,524).
Resume D-19426 at ID 28101; sequentially unreviewed interval is 28101-65134
(37,034 IDs), besides older specific holds and register reconciliation.

These are working dispositions, not independent final linguistic approval.
