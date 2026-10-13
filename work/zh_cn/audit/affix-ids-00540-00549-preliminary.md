# Preliminary Language Scan: `affix` IDs 540-549

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 540-549.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 541 | `Adroit` | 재빠른 | Check whether the modifier means skillful/dexterous rather than simply quick; choose a Korean term that preserves technique/ability. | Chinese says agile/sensitive and English `adroit` primarily indicates skill or dexterity. Korean `재빠른` narrows it toward speed. | Medium |
| 544 | `Enforcerer's` | 집행자의 | Preserve the Korean meaning but record the malformed English possessive; do not silently normalize source data. | English has the apparent typo `Enforcerer's`; Japanese/Chinese identify an enforcer. Korean translates the likely intended “Enforcer's” without reproducing the typo. This repeats the historical question. | Medium |
| 548 | `Plant dagger in` | 단검을 꽂기: | Preserve the incomplete destination relation “plant dagger in [target]”; Korean currently lacks the required `in` relation. | English, Japanese, and Chinese all retain a target location/object continuation. Korean's trailing colon preserves the fragment boundary but `단검을 꽂기` alone does not express where it is planted. | High |

## Variant Coverage

- All IDs 540-549 contain target variants 11, 12, 14, 21, 22, and 24.
  Total: 10 x 6 = 60 rows.
- English affix entries use `FF` rather than target-locale variant codes, so
  rows were matched by `ID_Linha`.
- Korean wording is identical across all six variants for each ID; all target
  keys remain present. This does not establish the engine's variant
  selection semantics.
- IDs 540 (`Easy Unlock`), 542 (`of the Gladiator`), 543 (`Shining`), 545
  (`Strengthening`), 546 (`Indestructible`), 547 (`Executioner's`), and 549
  (`of the Gale`) had no additional high-confidence concern in the
  fragment-level comparison.

## Historical Audit Reconciliation

- Rechecked the historical affix question for ID 544. The source typo remains
  documented; the Korean current reading is plausible.
- Same-numbered historical `base` and `default` questions were kept separate.

## Batch Status

All 60 target variant rows for IDs 540-549 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
