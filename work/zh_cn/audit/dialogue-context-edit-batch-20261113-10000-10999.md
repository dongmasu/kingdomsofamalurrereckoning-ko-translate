# Dialogue Context Translation Edit Batch: IDs `10000`-`10999`

- Date: 2026-11-13.
- Scope: re-adjudicate 51 new correction candidates across the four sequential
  range reports against current English, Japanese, Chinese, and Korean rows;
  include the previously recorded `10945` finding and directly related
  exact-text/name occurrences.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from asset links.

## Decisions

The 51 new candidates were rechecked and their supported corrections applied.
The earlier `10945` Ticneri pairing was also completed without recounting it
as a new candidate. The manifest contains 68 fragment rules and 72
ID-scoped applications across 59 unique rows: 52 IDs in this range and seven
related rows outside it.

The edits correct conversational register and naturalness (`10079`, `10267`,
`10293`, `10814`), clarify wording and UI/objective labels (`10155`, `10179`,
`10309`, `10392`, `10994`), and complete source-name pairings. Related
occurrences were checked together, including `Order of the Ash` (`10090`,
`2138`), `Turner's Finest` (`10154`, `49035`), `Rathir Harbor` (`10174`,
`17491`), `Order of Mitharu` (`10258`, `56193`, `59891`), and `Arcane
Carrack` (`10287`, `8608`, `22801`). The complete Troll subtype at `10683`
was paired consistently in both mentions.

Evidence-limited findings in the four range reports remain unresolved; no
speaker, addressee, proper-name status, or ambiguous meaning was inferred to
force a correction. Existing sentence-specific wording and paragraph layout
were retained.

## Application and Verification

- The ID-scoped application manifest is
  [`dialogue-context-edit-batch-20261113-10000-10999.json`](dialogue-context-edit-batch-20261113-10000-10999.json).
- The active CSV already contained the complete manifest application when
  this batch was resumed. Reversing all 72 operations in memory restored the
  manifest's exact input SHA-256, confirming the saved edits without
  reapplying or overwriting them.
- All 59 changed rows were checked for line-break and runtime/display-token
  signatures against the reconstructed input; no differences were found.
- The full 65,135-ID ledger fingerprint check, index/catalog reproducibility,
  nine context-index tests, 11 CSV-preservation tests, and CRLF-aware
  `git diff --check` passed.
- The CSV has a UTF-8 BOM and 65,135 rows; its newline inventory remains
  71,845 CRLF and 244 LF-only endings.
- Current SHA-256: CSV
  `d443457688afd35b7473def0af5e97ba37eea35f4cb53ab342d218d650ec55f4`;
  review ledger
  `8f08f24dcebc159c9deb33cd3cdc238a6fafb7125dc2298e6e010410c1f3eba5`.
- No source CSV, extracted asset, or game binary was modified.

The 51 new candidates in this range are adjudicated. With the preceding
batches, the cumulative candidate count is 405 of approximately 3,155
(about 12.8%); later candidates remain in progress.
