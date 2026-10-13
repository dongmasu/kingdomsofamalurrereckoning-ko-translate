# Preliminary Language Scan: `affix` IDs 480-489

- Review date: 2026-10-07
- Scope: all 55 active target variants for IDs 480-489.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 484 | `Place silver chain on` | 은 사슬을 놓기: | Preserve the destination relation `on` in this incomplete action; the placement target is missing from the fragment. | All checked sibling locales explicitly retain “on/to.” Korean currently says only “place silver chain,” so it may lose the relation needed to join the following UI text. | High |
| 488 | `Exit` | 나가기 | Confirm whether this is a command (“Exit/leave”) or a named menu/action label; preserve its UI register consistently. | English/Japanese/Chinese use a short action label and Korean is a natural match. No additional semantic problem is evident, but its fragment function depends on the surrounding interface. | Low |

## Variant Coverage

- IDs 480-487 and 489 contain target variants 11, 12, 14, 21, 22, and 24;
  ID 488 contains variant 11 only. Total: 9 x 6 + 1 = 55 rows.
- English affix entries use `FF` rather than target-locale variant codes, so
  rows were matched by `ID_Linha`.
- Korean wording is identical across all six variants for each six-variant
  ID; all target keys remain present.
- IDs 480 (`Avalanche`), 481 (`Noxious`), 482 (`Copper`), 483 (`Flood`),
  485 (`Reinforcing`), 486 (`Cobra`), 487 (`Infected`), and 489
  (`Bandit's`) had no additional high-confidence concern in the fragment-level
  comparison.

## Historical Audit Reconciliation

- No historical open-question entry was found for IDs 480-489. ID 487 also
  appears in a separate source-typo note for `Clairty` at other IDs; that
  note does not apply to this `Infected` row.
- Same-numbered historical `base` and `default` notes were not applied to
  these affix rows.

## Batch Status

All 55 target variant rows for IDs 480-489 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
