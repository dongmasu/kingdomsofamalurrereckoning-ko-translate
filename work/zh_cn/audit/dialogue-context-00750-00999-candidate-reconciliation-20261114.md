# Candidate Application Reconciliation: IDs `750`-`999`

- Date: 2026-11-14.
- Reconciled all 10 `overall=candidate` IDs in this range against the active
  Korean row and the aligned English, Japanese, and Chinese sources.
- Applied the remaining container-task wording correction at `853`.
- The poem at `952` already had the `Children of Dust` pairing. Its exact
  English/Japanese/Chinese duplicate at `60106` lacked that pairing, so the
  Korean lines were aligned without changing the poem or its line breaks.
- The other eight candidate findings already reflected their supported
  correction. Related Vorm, Gravehal Gallery, and lost-book references were
  cross-checked; unresolved spell-identity questions were not inferred.
- Only IDs `853` and `60106` changed. Their source fingerprints alone were
  refreshed; existing review-ledger dispositions and unrelated bytes were
  preserved.
- No speaker or playback order was inferred from asset membership.

Exact decisions and changed strings are in
[`dialogue-context-final-edits-followup-00750-00999-20261114.json`](dialogue-context-final-edits-followup-00750-00999-20261114.json).

## Verification

- All 10 candidate IDs in the range have a recorded disposition.
- All 65,135 review-ledger fingerprints validate.
- The CSV-preservation tests pass; the active CSV retains its BOM, ordered
  rows, and existing mixed line endings.
- The CRLF-aware diff check passes.
- No source CSV, extracted asset, or game binary was modified. No commit was
  made.
