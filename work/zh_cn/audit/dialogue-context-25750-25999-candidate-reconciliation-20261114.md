# Candidate Reconciliation: IDs `25750`-`25999`

- Date: 2026-11-14.
- Rechecked all 26 correction-candidate IDs against active Korean and the
  same-ID English, Japanese, and Chinese rows, then checked the earlier edit
  report and all prior machine-readable reconciliation lists for overlap.
- All 26 current Korean rows match their supported corrections in
  `dialogue-context-edit-batch-20261114-25750-25999.md`. They were already
  applied before this reconciliation, so no translation row or fingerprint
  was changed in this pass.
- No prior candidate reconciliation manifest counted any of these 26 IDs.
  Earlier linked terminology reviews mentioned `25777`, `25806`, and
  `25823`, but did not count them as correction candidates.

## Candidate Decisions

| IDs | Decision and evidence |
| --- | --- |
| `25752`, `25758`, `25777`, `25778`, `25814`, `25822`, `25823`, `25826`, `25852`, `25856`, `25898`, `25976`, `25984` | Confirmed the English title/name pairings and source-supported Korean wording. `25777` retains its unresolved Korean spelling question; adding the English source name does not settle that separate hold. |
| `25806`, `25832`, `25840`, `25885`, `25896`, `25912`, `25913`, `25925`, `25926`, `25939`, `25963`, `25996` | Confirmed the meaning and naturalness corrections against English, Japanese, and Chinese. In particular, `25806` says Eventide was one of the most respected clans; `25885` does not claim the heart was delivered to Anker; `25963` preserves the Hatpins wordplay. |
| `25915` | Confirmed the five-line confession layout against all three source languages; the Korean has the same four embedded line breaks. |

The related `Sorrows` pairing at `25884` is present and follows the existing
`비탄의 힘(Sorrows)` form. The exact referent is not resolved by this row
alone; this consistency update is not counted as a correction candidate. The
existing evidence-limited holds at `25766` and `25871` remain unresolved and
are not included in the candidate total.

## Verification

- All 26 candidate IDs were reconciled; no prior-counted candidate IDs were
  found.
- The active CSV's line-break counts were checked against English, Japanese,
  and Chinese for all 26 IDs; no mismatches were found.
- The full review ledger validated against all 65,135 current four-language
  records.
- CSV-preservation tests: 11 passed; context-index tests: 9 passed.
- Cumulative candidate reconciliation is 1,473 / 4,015 (36.69%), with 2,542
  not yet reconciled.
- No source CSV or extracted game asset was changed; no commit was made.

The next sequential range is `26000`-`26249`.
