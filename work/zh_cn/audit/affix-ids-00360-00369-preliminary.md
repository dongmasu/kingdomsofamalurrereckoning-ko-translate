# Preliminary Language Scan: `affix` IDs 360-369

- Review date: 2026-10-07
- Scope: all 55 active target variants for IDs 360-369 (ID 361 has variant
  11 only; the other nine IDs have six variants each).
- Matched English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 361 | `Mitharan Platinum` | 미사란 백금 | Reconcile `미사란` with the other Korean forms for `Mitharan`, including `미타란`, while keeping the deity's official name distinct. | Japanese and Chinese connect the adjective to Mitharu; German, Spanish, French, Italian, and Russian also use Mitharu-derived forms. The active corpus varies between `미사란` and `미타란`; do not normalize globally from this row alone. | Medium |
| 365 | `(Very Hard) Dispel` | (어려움) 해제하기: | Preserve the English difficulty intensifier and confirm the most precise Korean verb for this compositional UI fragment. | English explicitly says `Very Hard`; Korean drops `Very` and renders only `어려움`. Japanese, Chinese, German, Spanish, French, Italian, and Russian retain a hard-difficulty label and a dispel/remove-magic action. `해제하기` may be serviceable but is broad without the assembled string. | High |

## Japanese-Missing Variant Follow-Up

- IDs 368 and 369 each have variants 12, 14, 21, 22, and 24 absent from the
  Japanese-derived draft and listed in `affix-extra-variant-review.tsv`.
- All ten exact target keys were checked against English `FF`, Chinese,
  German, Russian, and available Spanish/French/Italian entries. The sources
  support `Embryonic` for ID 368 and `of the Destined` for ID 369; the current
  fallbacks `배아의` and `운명지어진 자의` preserve those meanings.
- These sibling fallbacks remain provisional; this cross-check is not final
  approval.

## Variant Coverage

- All 55 target variants were examined: ID 361 has variant 11 only; IDs 360
  and 362-369 have variants 11, 12, 14, 21, 22, and 24.
- English affix source entries use `FF` rather than the target locale's
  `Tipo_Variante` codes, so they were matched by `ID_Linha`.
- Korean wording is identical across target variants for each ID, which is
  plausible for Korean; every target key is retained.
- IDs 360 (`Stalwart`), 362 (`Extinguish`), 363 (`Wise`), 364 (`Mages`),
  366 (`Soldiers`), 367 (`Use`), 368 (`Embryonic`), and 369 (`of the
  Destined`) had no additional high-confidence concern.

## Batch Status

All 55 target variant rows for IDs 360-369 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
