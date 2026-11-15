# Candidate Application Reconciliation: IDs `0`-`499`

- Date: 2026-11-14.
- Reconciled all 21 historical `overall=candidate` ledger IDs in these ranges
  against the current English, Japanese, Chinese, and Korean rows and their
  cited context findings.
- In `0`-`249`, nine candidates already reflected their supported correction;
  `239` was retained as source-compatible. The separate speech-level
  uncertainty at `95` and singular `Templar` title question at `209` remain
  unresolved and were not guessed.
- In `250`-`499`, ten candidates already reflected their supported correction
  or terminology decision. `280` was recast to clarify the relationship
  between Engard, the Fae, and the Champion of Valor title.
- Only `default:280` changed. Its source fingerprint alone was refreshed.
- No speaker or playback order was inferred from asset association.

The machine-readable decisions are in
[`0`-`249`](dialogue-context-final-edits-followup-00000-00249-20261114.json)
and
[`250`-`499`](dialogue-context-final-edits-followup-00250-00499-20261114.json).

## Verification

- `default:280` was edited with `tools/replace_text_preserve_eol.py`.
- The review manifests cover all 21 candidate IDs in the two ranges; there
  are no unclassified IDs.
- The 65,135-ID ledger fingerprint check and all 11 CSV-preservation tests
  pass. The active CSV retains its BOM, 65,135 ordered rows, 71,838 CRLFs,
  244 LF-only separators, and no bare CR.
- `git -c core.whitespace=cr-at-eol diff --check` passes.
- No source CSV, extracted asset, or game binary was modified. No commit was
  made.
