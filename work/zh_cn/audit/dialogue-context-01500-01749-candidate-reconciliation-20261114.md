# Candidate Reconciliation: IDs `1500`-`1749`

- Date: 2026-11-14.
- Rechecked all 17 current `overall=candidate` ledger IDs in this interval
  against English, Japanese, Chinese, and the active Korean CSV.
- Two source-supported corrections were applied; 15 candidates were retained
  because the current wording already reflected the evidence.
- The earlier full-corpus report's evidence-limited holds at `1676`, `1692`,
  and `1719` were not part of this current candidate set and remain unresolved.
- No speaker or playback order was inferred from asset association.

## Applied Decisions

At `1560`, the awkward phrase describing Gadflow's murder as a manner
(`비극적으로 살해한 뒤로`) was recast as the tragic event followed by its
consequence. The sentence remains in plain narrative style and retains all
name/title pairings.

At `1683`, `Turn in the Contract` was aligned to `계약서 제출하기`, the
established wording at eight other IDs with the same objective. English and
Chinese support submitting the contract; the broader Japanese wording does
not contradict that task.

## Retained

IDs `1519`, `1534`, `1572`, `1580`, `1590`, `1695`, `1697`, `1711`, `1721`,
`1723`, and `1739` already include the full supported title or name
pairings. The effect at `1671` already uses `체력 재생`; the derogatory
address and meaning at `1686` are preserved; the `Chaos Scholar` description
at `1691` already uses consistent garment wording and the English pairing.
At `1553`, all three gnomish pillars are already paired in English, and the
existing member wording for Praetorians is supported by the source's list of
people/groups; no forced terminology change was needed.

## Verification

- The two text changes were applied by ID with
  `tools/replace_text_preserve_eol.py`; only those IDs' ledger
  `source_fingerprint` fields were refreshed.
- All 17 current candidates in the interval have dispositions in the
  machine-readable
  [`decision manifest`](dialogue-context-final-edits-followup-01500-01749-20261114.json).
- Candidate reconciliation now covers 96 of 4,015 current candidates
  (2.39%). This is not full candidate-review completion.
- No commit was made.
