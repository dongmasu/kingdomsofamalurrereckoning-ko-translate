# Preliminary Language Scan: `affix` IDs 460-469

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 460-469.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 461 | `Attack` | 공격하기: | Confirm whether this is an action label followed by its target and preserve any target relation required by the UI. | Russian says “attack on,” while other locales mostly use a bare verb. Korean's `공격하기:` is a natural action fragment but does not show a target; the following UI text/context is unavailable here. | Medium |
| 466 | `of the Unyielding` | 굴하지 않는 자의 | Determine whether this denotes a person/group or the quality of being unyielding; translate the unchanged English rather than leave it untranslated. | This repeats the historical question. German/Italian translate an abstract quality, while Spanish/French and Korean imply a person. English/Japanese are otherwise untranslated; Korean is not and currently makes it person-like. | High |
| 468 | `Travel to` | 이동하기: | Preserve the destination relation (“travel to”) in the action fragment, pending the destination UI context. | German, Spanish, French, Italian, and Russian all explicitly express movement to a destination. Japanese and Korean use a generic “move/travel” verb. Korean may omit the preposition's destination meaning. | Medium |
| 469 | `Toughened` | 강화된 | Check whether this means hardened/rigid or generally strengthened; align with the crafting modifier context. | German/French/Italian/Russian describe hardening or impact resistance, while Korean's `강화된` is broader. English/Japanese alone do not establish the material property. | Medium |

## Variant Coverage

- All IDs 460-469 contain target variants 11, 12, 14, 21, 22, and 24.
  Total: 60 rows.
- English affix entries use `FF` rather than target-locale variant codes, so
  rows were matched by `ID_Linha`.
- Korean wording is identical across all six variants for each ID; all target
  keys remain present.
- IDs 460 (`Adder`), 462 (`Noble's`), 463 (`Ferocity`), 464 (`Superior`),
  465 (`Sleet`), and 467 (`Fortune`) had no additional high-confidence
  concern in the fragment-level comparison.

## Historical Audit Reconciliation

- Rechecked the historical affix question for ID 466. Korean provides a
  translated form, but the quality-versus-person distinction remains open.
- Same-numbered historical `base` and `default` notes were not applied to
  these affix rows.

## Batch Status

All 60 target variant rows for IDs 460-469 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
