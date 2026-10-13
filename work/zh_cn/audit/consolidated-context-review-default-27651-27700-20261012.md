# Consolidated Context Review: `default` IDs 27651-27700

- Review date: 2026-10-12.
- Scope: re-review the 24 uncertain IDs in D-8760-D-8766.
- Result: four accepted corrections, sixteen `not an issue`, and four
  specific uncertainties remain. Earlier dispositions for 27651, 27663,
  27687, 27692's source-only format character, and 27697's placeholders were
  linked, not recounted.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  historical decisions by `ID_Linha`. English controls meaning; Japanese
  informs voice/register; Chinese is supporting evidence.

## Decisions D-19386-D-19391

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19386 | `default` 27654 | accepted | Reuse the established `Valor = 용맹` rendering (D-1463); the current `발러` conflicts with the accepted Korean term for this arena. |
| D-19387 | `default` 27660 | accepted | Replace `발러 가문` with approved `용맹의 집(House of Valor)` (D-148/D-650). Keep the armor-owner spelling traceable to English `Onwer Brond`; do not silently repair a possible source typo using conflicting locale spellings. |
| D-19388 | `default` 27676 | accepted | Replace `콜로새` with approved `콜로사이(Kollossae)` (D-18878/D-18933, D-19333). |
| D-19389 | `default` 27680 | accepted | Replace `미사란(Mitharans)` with the established `미타란(Mitharans)` (D-18158). |
| D-19390 | `default` 27652, 27657, 27659, 27672, 27674, 27677-27679, 27682-27683, 27688, 27692-27693, 27697-27698, 27700 | not an issue | The Widow/Canneroc account, role and title meanings, ritual/object terms, faction relations, names traceable to English, Stations/date UI labels, Forsaken Plain reading, and Belmaid poem content are preserved. The source spelling `Onwer` remains literal; the poem's two-stanza lineation is intact. |
| D-19391 | `default` 27670-27671, 27689-27690 | uncertain | The game meaning of `hex` versus a six-point result is unresolved; `dove` may be an endearment or another form of address; English/Japanese/Chinese differ on what “the rest of Dolve Arne” denotes. Keep all four cells unchanged. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27654 | `발러 투기장(Valor Arena)` | `용맹의 투기장(Valor Arena)` | Reuse the approved Korean Valor terminology. |
| 27660 | `발러 가문(House of Valor)` | `용맹의 집(House of Valor)` | Reuse the accepted House of Valor name. |
| 27676 | `콜로새 비극 작가` | `콜로사이 비극 작가` | Reuse the accepted Kollossae spelling. |
| 27680 | `미사란(Mitharans)` | `미타란(Mitharans)` | Reuse the accepted Mitharan spelling. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active Korean
  each contain the 50 IDs 27651-27700 in identical order. Embedded line-break
  counts match across all five files; the two stanzas and blank line in the
  poem at 27700 are preserved.
- Only active Korean `Texto` values at IDs 27654, 27660, 27676, and 27680
  changed. Reversing the four exact substitutions reproduces the pre-edit
  backup byte-for-byte; all other parsed cells and row order are identical.
- Chinese ID 27692's source-only U+FEFF remains untouched and absent from
  Korean. Korean ID 27697 retains `{1}` and `{2}` in source order; ID 27663's
  `50%` remains unchanged.
- UTF-8 BOM, 65,135 rows, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Pre-edit SHA-256:
  `f8f33527f9960ca5e02e26744c943f83bf96c20df9aac5157ab89d989e66eaa6`.
- Post-edit SHA-256:
  `591c2e33cff598e6f9ab274025532761164658320892324fd4b220958fcea5e2`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27651-27700-D19386/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,245 accepted / 24,781 `not an issue` / 11,498 uncertain
  (38,524). Resume D-19392 at ID 27701; sequentially unreviewed interval is
  27701-65134 (37,434 IDs). Specific uncertainties in the reviewed interval
  and the D-19162-D-19238 / D-18422-D-18452 register-detail gaps remain.
