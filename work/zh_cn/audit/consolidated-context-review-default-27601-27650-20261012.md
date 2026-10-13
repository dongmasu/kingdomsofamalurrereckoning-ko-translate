# Consolidated Context Review: `default` IDs 27601-27650

- Review date: 2026-10-12.
- Scope: re-review the 23 uncertain IDs in D-8750-D-8755.
- Result: four accepted corrections, fifteen `not an issue`, and four
  specific uncertainties remain. Existing findings D-8756-D-8758 and the
  accepted edit at 27643 were linked, not recounted.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  historical decisions by `ID_Linha`. English controls meaning; Japanese
  informs voice/register; Chinese is supporting evidence.

## Decisions D-19380-D-19385

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19380 | `default` 27604 | accepted | The English calls the Requiem a war galley and Japanese explicitly marks it as a ship. Reuse the accepted vessel name `레퀴엠호` from D-19315. |
| D-19381 | `default` 27628 | accepted | Reuse `콜로사이(Kollossae)` established by D-18878/D-18933 and D-19333; the current `콜로새` is an outdated conflicting spelling. |
| D-19382 | `default` 27631 | accepted | This capitalized Den is paired with the Arena as a revenue-generating venue. Japanese identifies a gambling venue and Chinese says casino; `소굴` obscures that function. |
| D-19383 | `default` 27648 | accepted | Reuse the approved `발라드의 집(House of Ballads)` form from D-18683, D-18892, and D-19328. |
| D-19384 | `default` 27601, 27606-27607, 27609-27610, 27614, 27617, 27621, 27623-27624, 27636, 27639, 27645-27646, 27649 | not an issue | The local place/person/object meanings, quest actions, and UI instruction are preserved. The damp-translation joke is retained literally as in Japanese; name-form variation alone does not establish a row-local defect. |
| D-19385 | `default` 27605, 27616, 27627, 27633 | uncertain | Keep the Sun referent and poem voice at 27605; the relation between the Hyperian/Cipher fragment and Ethene's explanation at 27616; whether “Withering” is a named event at 27627; and the formal Neophyte rank at 27633 unresolved. The six poem breaks at 27627 remain unchanged. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27604 | `무시무시한 레퀴엠(Requiem)이 떠오르는군.` | `무시무시한 레퀴엠호(Requiem)가 떠오르는군.` | Preserve the established Korean ship name and correct the particle with the ship suffix. |
| 27628 | `콜로새(Kollossae)의 가치관의 핵심` | `콜로사이(Kollossae)의 가치관의 핵심` | Reuse the accepted Kollossae spelling. |
| 27631 | `소굴(The Den)` | `도박장(The Den)` | The row identifies a gambling venue by its revenue and parallel Arena; Japanese and Chinese confirm the function. |
| 27648 | `발라드 가문을 떠난 이유` | `발라드의 집(House of Ballads)을 떠난 이유` | Reuse the accepted House of Ballads form. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active Korean
  each contain the 50 IDs 27601-27650 in identical order. Fresh checks found
  matching embedded line-break counts across all five files; the six-break
  poem at 27627 is unchanged. The preliminary normalized runtime-marker
  checks remain valid.
- Only active Korean `Texto` values at IDs 27604, 27628, 27631, and 27648
  changed. Reversing the four exact substitutions reproduces the pre-edit
  backup byte-for-byte; all other parsed cells and row order are identical.
- UTF-8 BOM, 65,135 rows, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Pre-edit SHA-256:
  `2d9e92876a48cebea2a6a719a6a916ec0faf806372fb2c7df3c6a04fb50a08b8`.
- Post-edit SHA-256:
  `f8f33527f9960ca5e02e26744c943f83bf96c20df9aac5157ab89d989e66eaa6`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27601-27650-D19380/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,241 accepted / 24,765 `not an issue` / 11,518 uncertain
  (38,524). Resume D-19386 at ID 27651; sequentially unreviewed interval is
  27651-65134 (37,484 IDs). Specific uncertainties in the reviewed interval
  and the D-19162-D-19238 / D-18422-D-18452 register-detail gaps remain.
