# Preliminary Language Scan: `affix` IDs 450-459

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 450-459.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 452 | `Vindicator's` | 응징자의 | Confirm whether this names a person/title (`Vindicator`) or describes a protective/vindicating property. | European/Russian locales range from vindicator/defender to protective meanings. Korean chooses “one who exacts retribution”; the fragment lacks enough context to distinguish the intended sense. | Medium |
| 453 | `Speak into` | 말하기: | Preserve the destination relation in `into` when the following UI/object context is known; current Korean only says “speak.” | German, Spanish, French, and Italian all retain “speak into/to” plus an implied object; Japanese omits the relation. Korean follows Japanese and may lose a meaningful direction. Historical question remains open because the target object is absent. | High |
| 458 | `of the Mystic` | 신비주의자의 | Determine whether `Mystic` is a person/title or the Mystic skill/property, then avoid a person-like possessive if it names a stat. | German says “of mysticism,” French “of the Mystic,” and other locales use a mystic/person or mysticism reading. Korean commits to “of a mystic.” | Medium |
| 459 | `Rugged` | 투박한 | Check whether this item modifier means rough-looking or durable/sturdy. | Spanish, French, Italian, and Russian favor rugged/solid/robust meanings; Korean `투박한` emphasizes coarse appearance and may not express durability. The fragment alone cannot settle the property. | Medium |

## Variant Coverage

- All IDs 450-459 contain target variants 11, 12, 14, 21, 22, and 24.
  Total: 60 rows.
- English affix entries use `FF` rather than target-locale variant codes, so
  rows were matched by `ID_Linha`.
- Korean wording is identical across all six variants for each ID; all target
  keys remain present.
- IDs 450 (`Disable`), 451 (`Crappy`), 454 (`Zealous`), 455 (`Blasting`),
  456 (`Loathsome`), and 457 (`Disciple's`) had no additional
  high-confidence concern in the fragment-level comparison.

## Historical Audit Reconciliation

- Rechecked the historical affix question for ID 453. The Korean preserves
  the action fragment but drops the explicit `into` relation; its destination
  remains unavailable in this row.
- Same-numbered historical `base` and `default` notes were not applied to
  these affix rows.

## Batch Status

All 60 target variant rows for IDs 450-459 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
