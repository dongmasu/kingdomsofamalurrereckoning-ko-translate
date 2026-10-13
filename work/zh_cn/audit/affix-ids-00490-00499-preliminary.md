# Preliminary Language Scan: `affix` IDs 490-499

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 490-499.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 493 | `(Very Easy) Dispel` | (매우 쉬움) 해제하기: | Retain the short action-fragment form; confirm only whether the project's final UI term for `Dispel` is `해제` or a more specific spell/curse term. | All compared locales use a dispel/dispel-curse verb, and Korean preserves the difficulty, action, and trailing colon. This UI action is distinct from the historical skill-term question at `default` ID 2168. | Low |
| 496 | `Prime` | 최상급 | Confirm whether `Prime` names a premium/elite quality tier, an original/ancient property, or “first/primary”; keep all six target variants until the target's variant semantics are established. | Chinese says “supreme”; German/Russian suggest primordial or elite; Spanish says fundamental; French says first; Italian says primeval. Japanese leaves the English at variant 11 only. Korean `최상급` is plausible as an item tier, but context and sibling products are needed. This repeats the historical ambiguity. | Medium |

## Variant Coverage

- All IDs 490-499 contain target variants 11, 12, 14, 21, 22, and 24.
  Total: 10 x 6 = 60 rows.
- English affix entries use `FF` rather than target-locale variant codes, so
  rows were matched by `ID_Linha`.
- Korean wording is identical across all six variants for each ID; all target
  keys remain present. This observation does not establish that the engine
  selects or interprets the variants in a particular way.
- IDs 490 (`Killer's`), 491 (`Illuminator's`), 492 (`Emboldening`), 494
  (`Ruthless`), 495 (`Unassailable`), 497 (`Pick`), 498 (`Pull`), and 499
  (`of the Geyser`) had no additional high-confidence concern in the
  fragment-level comparison.

## Historical Audit Reconciliation

- Rechecked the historical affix question for ID 496. The intended `Prime`
  quality/name meaning remains unresolved.
- Same-numbered historical `base` and `default` questions were not applied
  to these affix fragments.

## Batch Status

All 60 target variant rows for IDs 490-499 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
