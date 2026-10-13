# Consolidated Context Review: `default` IDs 28101-28150

- Review date: 2026-10-12.
- Scope: unresolved findings D-8830-D-8834 and carried historical notes for
  IDs 28101-28150, checked against English, Japanese source and preserved
  Japanese-derived Korean draft, Chinese, active Korean, and prior decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: three accepted `Texto` corrections, eleven `not an issue`
  resolutions, and three specific uncertainties retained.

## Decisions D-19426-D-19431

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19426 | `default` 28107 | accepted | Change `풀려나면` to `유출되면`. The stolen object is an alchemical formula; English says it could cause devastation “if released,” Japanese says if it is spread around, and Chinese says if published. Korean `유출되면` expresses the supported disclosure of the stolen formula without making the formula sound like a living thing being released. |
| D-19427 | `default` 28108, 28119 | accepted | Correct `Mitharan` from `미사란` to accepted `미타란` per D-18158, and `Kollossae` from `콜로새` to accepted `콜로사이` per D-18878/D-18933. The item and sentence meanings otherwise remain intact. |
| D-19428 | `default` 28106, 28116, 28120, 28125, 28131, 28133, 28140, 28142, 28144, 28147, 28150 | not an issue | The Mithros hope, Lyria blessing, Warlock Destiny effects, Cranalt objective, House of Vengeance/Bhaile attack plan, Gale Crossing label, Court of Enchantments, battle outcome, Deirdre's translation task, Last Breath armor, and trouble warning preserve the English-led meanings and relations. Existing name forms are traceable; unresolved corpus-wide preference alone does not establish a row-local error. |
| D-19429 | `default` 28129 | uncertain | The identical English/Japanese line at ID 5285 and repeated Traveler dialogue show lowercase `dove` is a familiar form of address, not a character name. However, Korean renders that duplicate as `아가씨`, the active row uses `도브(Dove)`, Japanese omits the vocative, and Chinese uses “peace messenger.” The Korean voice-equivalent remains unsettled; retain the current cell pending a consistent, non-gendered address decision. |
| D-19430 | `default` 28138 | uncertain | English `they` and Korean `그들은` preserve a plural referent, but this row and the checked adjacent lines do not identify which beings are meant. Do not insert a guessed antecedent. |
| D-19431 | `default` 28141 | uncertain | English can describe Trav and Camp Moondown jointly pushing through an unstated obstacle; Korean retains that reading. Japanese instead says Trav pushed on without considering the camp, while Chinese is closer to the English coordination. The referent of `it` and the camp/person relation cannot be settled from available context, so no edit is made. |

Previously dispositioned rows, including the accepted Emerald Lady correction
at ID 28135 and the runtime/value checks at IDs 28104 and 28134, are linked
without recounting.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 28107 | `꼭 알아야겠다면, 귀중한 물건이 도난당했어… 풀려나면 엄청난 재앙을 일으킬 연금술 공식이지. 그 징후가 곳곳에서 보여.` | `꼭 알아야겠다면, 귀중한 물건이 도난당했어… 유출되면 엄청난 재앙을 일으킬 연금술 공식이지. 그 징후가 곳곳에서 보여.` | Express the formula's dangerous disclosure/distribution, supported by English, Japanese, and Chinese. |
| 28108 | `흠 없는 미사란(Mitharan) 면역 안감` | `흠 없는 미타란(Mitharan) 면역 안감` | Reuse accepted `Mitharan = 미타란` terminology. |
| 28119 | `그것을 도시의 중심에 두면 내 힘이 콜로새(Kollossae) 전체로 퍼져, 내가 뜻한 모습으로 그들을 빚을 것이다.` | `그것을 도시의 중심에 두면 내 힘이 콜로사이(Kollossae) 전체로 퍼져, 내가 뜻한 모습으로 그들을 빚을 것이다.` | Reuse accepted `Kollossae = 콜로사이` terminology. |

## Structural and Context Notes

- English, Japanese source, Chinese, preserved Korean draft, and active Korean
  each contain IDs 28101-28150 once in identical ascending order. The default
  CSV schema has `ID_Linha` and `Texto` only; there is no variant column.
- Normalized runtime-token identity/order and embedded line-break counts match
  across all five resources. ID 28104's localized `*1` service marker and
  `{1}` control are retained; ID 28134's `+17%` value matches English.
- The active Korean CSV has a UTF-8 BOM, 72,011 CRLF endings, and 73 existing
  bare-LF endings. Only the three approved `Texto` values changed; row order,
  keys, BOM, line endings, and all other bytes remain intact.
- The repeated `dove` line at ID 5285 supports a familiar vocative, but does
  not settle its Korean realization. ID 28138's antecedent and ID 28141's
  scene attachment remain specific, evidence-based holds.

## Verification

- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-28101-28150-D19426/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `ee18e87ec14c17736f0e8afb9f00d8420e2f535e95a2727dc9702a60305304e6`.
- Post-edit SHA-256:
  `9283e4d07847fecb9daac7a6b4ca9b40b48d7848fd3b7aa5e3d07611e4c30cfa`.
- Reversing the three exact substitutions reproduces the backup byte-for-byte.
  The source CSVs and preserved Japanese-derived Korean draft were not edited.

Totals: 2,265 accepted / 24,948 `not an issue` / 11,311 uncertain (38,524).
Resume D-19432 at ID 28151; sequentially unreviewed interval is 28151-65134
(36,984 IDs), besides older specific holds and register reconciliation.

These working dispositions are not independent final linguistic approval.
