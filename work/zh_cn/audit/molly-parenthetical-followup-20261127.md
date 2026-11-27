# Molly Parenthetical Follow-Up

- Date: 2026-11-27.
- Scope: all English `Molly` occurrences in the active `default` source.
- Cross-language basis: English identifies the name; Japanese `モリー` and
  Chinese `莫莉` corroborate its reading in the affected rows.

## Findings

The English source contains `Molly` in 11 IDs: `6783`, `15532`, `15591`,
`19889`, `26285`, `30234`, `30837`, `39867`, `40176`, `41941`, and `43070`.
The already paired occurrences were retained. The full names `Molly Fion`
and `Molly Janick` remain paired as complete source names.

Added the short-name pairing `몰리(Molly)` to four unpaired name mentions:
both mentions in `default:15591`, and the single mentions in `default:30234`
and `default:39867`. No surname or relationship was inferred from these
short-name references.

Updated only the matching Korean snapshots for IDs `15591` and `39867` in
`proper-name-occurrences.tsv`; no matching occurrence-index row existed for
`30234`. Refreshed only the three corresponding review-ledger source
fingerprints.

## Verification

- All affected English, Japanese, Chinese, and Korean rows were checked by ID.
- All 65,135 review-ledger fingerprints validate against the four current
  language tables.
- The proper-name occurrence fixtures passed.
- `git -c core.whitespace=cr-at-eol diff --check` passed.
