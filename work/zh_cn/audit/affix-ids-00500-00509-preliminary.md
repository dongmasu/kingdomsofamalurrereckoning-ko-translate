# Preliminary Language Scan: `affix` IDs 500-509

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 500-509.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 501 | `Shrewd` | 빈틈없는 | Check whether the intended adjective is “shrewd/astute” rather than “without gaps/flawless.” | Chinese says “clever/astute,” supporting the English sense; Korean `빈틈없는` can describe a clever person but more directly means flawless or leaving no openings. The modifier's item context may resolve the nuance. | Medium |
| 505 | `Feed fish to` | 물고기 먹이기: | Preserve the incomplete destination relation “feed fish to [target]”; Korean currently omits `to` and reads as simply feeding fish. | English, Japanese, Chinese, and sibling locales all retain a destination/object continuation. The Korean colon remains, but the required relation is absent, which can make the joined UI phrase grammatically incomplete. | High |
| 509 | `Claim the` | 청구하기: | Confirm whether this is “claim/collect the [item/reward]” rather than the Korean financial/legal sense of requesting payment. | Japanese says “take,” Chinese says “collect/claim,” and English is a fragment preceding its object. `청구하기` may imply billing or asserting a claim rather than receiving an item. Preserve the colon and fragment boundary. | Medium |

## Variant Coverage

- All IDs 500-509 contain target variants 11, 12, 14, 21, 22, and 24.
  Total: 10 x 6 = 60 rows.
- English affix entries use `FF` rather than target-locale variant codes, so
  rows were matched by `ID_Linha`.
- Korean wording is identical across all six variants for each ID; all target
  keys remain present. This does not establish the engine's variant
  selection semantics.
- IDs 500 (`Take Lord Kandrian's Ring`), 502 (`Aggressor's`), 503 (`of
  Skinning`), 504 (`Merciless`), 506 (`Umbral`), 507 (`Cunning`), and 508
  (`Squire's`) had no additional high-confidence concern in the
  fragment-level comparison.

## Historical Audit Reconciliation

- No historical affix open-question entry was found for IDs 500-509.
- Same-numbered historical `base` and `default` questions were kept separate.

## Batch Status

All 60 target variant rows for IDs 500-509 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
