# Candidate Coverage Accounting Reconciliation

- Date: 2026-11-15.
- Scope: the `default` review ledger rows whose current `overall` field is
  `candidate`, plus the candidate-reconciliation reports and linked-row
  follow-ups.

## Result

The ledger contains 4,026 rows currently marked `overall=candidate`.
ID-scoped reconciliation records cover 3,996 candidates in their own numeric
ranges. Another 29 IDs are explicitly dispositioned in linked duplicate,
terminology, or missing-candidate follow-ups. The remaining ledger row,
`14325`, is explicitly described by its range report as not a current
candidate and was not counted as one.

Accordingly, all 4,025 current candidates have a documented disposition.
The recorded `3,518 / 4,026` (`87.38%`) figure is a cumulative
newly-counted tally, not a complete measure of disposition coverage; its
`508 remaining` value must not be interpreted as 508 unreviewed candidates.
This correction reconciles accounting only. Evidence-limited holds remain
open where the sources do not support a safe decision.

## Cross-Range Candidate Records

These 29 candidates are documented outside their own numeric-range report:

`4025`, `6044`, `7079`, `11619`, `14404`, `15833`, `16532`, `18339`,
`23870`, `25302`, `25968`, `27676`, `27747`, `30142`, `34443`, `38295`,
`41926`, `42559`, `42683`, `43026`, `43167`, `43305`, `44457`, `44458`,
`44580`, `44961`, `45085`, `45361`, `54691`.

Their dispositions are recorded in the relevant range and linked-row reports,
including:

- `dialogue-context-06000-06249-candidate-reconciliation-20261114.md`
- `dialogue-context-07000-07249-candidate-reconciliation-20261114.md`
- `dialogue-context-11000-11249-candidate-reconciliation-20261114.md`
- `dialogue-context-11500-11749-candidate-reconciliation-20261114.md`
- `dialogue-context-13000-13249-candidate-reconciliation-20261114.md`
- `dialogue-context-15000-15249-candidate-reconciliation-20261114.md`
- `dialogue-context-15500-15749-candidate-reconciliation-20261114.md`
- `dialogue-context-21250-21499-candidate-reconciliation-20261114.md`
- `dialogue-context-24000-24249-candidate-reconciliation-20261114.md`
- `dialogue-context-40000-45999-missing-candidate-followup-20261114.md`
- `dialogue-context-41000-41249-candidate-reconciliation-20261115.md`
- `dialogue-context-42250-42499-candidate-reconciliation-20261115.md`
- `dialogue-context-42500-42749-candidate-reconciliation-20261115.md`
- `dialogue-context-42750-42999-candidate-reconciliation-20261115.md`
- `dialogue-context-43250-43499-candidate-reconciliation-20261115.md`
- `dialogue-context-43500-43749-candidate-reconciliation-20261115.md`
- `dialogue-context-44750-44999-candidate-reconciliation-20261115.md`
- `dialogue-context-37500-37749-candidate-reconciliation-20261114.md`

Other linked IDs are documented in their corresponding range reports. The
old `overall=candidate` value for `14325` is preserved as historical ledger
data; its range decision is recorded in
`dialogue-context-14250-14499-candidate-reconciliation-20261114.md`.

## Method And Limits

- Started from the current review ledger's `overall=candidate` IDs.
- Counted IDs with an explicit disposition in their numeric-range candidate
  decision records, using the machine-readable manifests and decision tables.
- Checked the remaining IDs against linked-row follow-ups rather than
  treating any incidental mention as a disposition.
- Preserved the ledger, candidate reports, and translation CSV; this report
  makes no translation or ledger edits.
- Disposition coverage means each current candidate has a recorded outcome
  such as corrected, retained, or held. It does not mean every evidence-limited
  question has been resolved.
