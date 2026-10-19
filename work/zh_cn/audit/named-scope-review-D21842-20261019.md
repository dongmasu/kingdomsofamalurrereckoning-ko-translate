# D-21842: English-Heuristic Candidate Reconciliation

Date: 2026-10-19

## Scope

Recomputed the bounded English proper-name heuristic against the preserved
`proper-name-candidates.tsv` baseline. The current scan has 29,632 phrases,
28 more than the 29,604-phrase baseline. This reconciles the newly surfaced
phrase set without treating heuristic phrases as an exhaustive inventory or
as a backlog count.

Twenty-four candidate phrases are already covered by D-21447/D-21639 and
three by D-21836. The additional phrase `Seal of Ansilla` was already
reviewed as a source-local alias in D-21839 at default:37757, 43136, 46678,
and 9734. Its base:796:11 and base:4816:11 contexts were already reviewed
under the complete label `Royal Seal of Ansilla` in D-21395. These six
contexts are referenced, not reopened or counted again. No CSV, glossary,
occurrence-index status, or cumulative disposition changed.

Evidence mapping: `proper-name-candidate-reconcile-D21842.tsv`.
The source comparisons remain in the cited D-21395, D-21447, D-21639,
D-21836, and D-21839 manifests and reports.

## Verified State

Latest verified proper-name batch: D-21842 (2026-10-19).
Next batch: D-21843; continue source discovery and residual checks.
Indexed matches: 48,406; accepted=32,588, excluded=3,216,
not-an-issue=12,491, uncertain=111.
Unreviewed indexed matches: 0. Reviewed unresolved holds: 111 across
106 distinct CSV row keys. These are focused index states, not global
translation totals.

The sequential default review through ID 65134 remains completed and is
not recounted. The machine-generated 305-term list and the English
heuristic are bounded discovery aids; neither proves overall completeness.
Full proper-name discovery/residual validation remains incomplete.

## Validation

- Candidate diff: PASS; baseline=29,604, fresh=29,632, added=28,
  removed=0; all 28 terms match the evidence mapping.
- Proper-name data: PASS; 2,338 unique entities and 48,406 unique
  active-aligned occurrences.
- Residual audit: PASS; 47,336 source matches and 48,406 indexed matches
  across 73,430 CSV rows; missing keys=0, undocumented extras=0, and
  terminal matches without bilingual English coverage=0. All 1,070
  contextual extras are documented.
- Reverse edit chain: PASS; 1,411 reviewed edit stages verified in reverse
  chronological order, including reconstructed pre-D-20390 resource hashes.
- Regression tests: candidate application 27 runs/23 assertions; residual
  audit 1 run/17 assertions; full-chain verifier 15 runs/37 assertions.

Active CSV SHA-256, unchanged from D-21841:
- affix: `9dbee978d73148eeb547c2a01a58e3d8168a519824382d339179c55770492b33`
- base: `a982e3e5cee9ecbf3eb9ef0f4c146f6693b17e1a04b9c116c799bd2975e7ca94`
- default: `e209d929297dced7bc78f106a59365181698d91cd9121746e0d66b2374faa12b`

No CSV cell was edited; no new backup was required. Existing last-edit
backups remain recorded in the D-21841 checkpoint. The aligned inventory,
occurrence index, and glossary hashes remain unchanged from D-21841.
