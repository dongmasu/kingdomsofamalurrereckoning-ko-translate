# Dialogue Context Translation Edit Batch: IDs `4000`-`4999`

- Date: 2026-11-13.
- Scope: adjudicate the 12 correction candidates in the `4000`-`4999`
  revalidation reports against the current English, Japanese, Chinese, and
  Korean rows; then check exact duplicates and directly related terms.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- Speaker attribution and playback order were not inferred from IDs or asset
  associations. Evidence-limited findings remain unchanged.

## Candidate Decisions

| ID | Applied decision |
| ---: | --- |
| `4013` | Restored the source meaning “warned her”; Korean had changed this to trying to dissuade her. |
| `4311` | Replaced the unnatural literal oath with a natural plea invoking Mitharu; retained the warning not to lead the Kobolds back. |
| `4337` | Replaced the unidiomatic `잠금 보관되어` with `보관되어`; retained the book's age, location, and uncertainty about its contents. |
| `4521` | Rendered `main hall` as `중앙 홀(Main Hall)`, not the chapterhouse's main building. |
| `4768`, `50357` | Reworked the four-line poem identically, preserving its imagery and source-aligned line count. |
| `4793` | Replaced the overly literal “solid sort” with a natural description of a dependable person. |
| `4803` | Recast `If I didn't know better` as `사정을 모르면`, preserving the sardonic fate comparison and threat. |
| `4814` | Replaced the opaque “silent quorums” wording with people who are content to remain silent; retained the formal letter register and all paragraph breaks. |
| `4910`, `4911` | Removed unsupported 하오체 and used consistent contemporary conversational Korean. Added the full `Lord Godric Payne` pairing at `4910`. |
| `4925` | Clarified that Anira holds the Master Makers captive and smoothed the quest-log sentence without changing its events. |
| `4991` | Corrected “judge themselves fit to divine right” to the source-supported claim that the Ljosalfar consider themselves to possess divine rights; preserved all wrappers. |

## Related Terminology

- The Scholia Arcana location term `Main Hall` is now consistently
  `중앙 홀(Main Hall)` at IDs `4521`, `55994`, and `8142`. Other uses of the
  generic phrase `main hall` refer to different locations and were not
  changed.
- The poem at `4768` and its exact-English duplicate at `50357` now match.
- The force called `the Sorrows` is defined as accumulated destructive magic
  at `4472` and as a force of magical energy at `64074`. Japanese explicitly
  identifies the force at `36127`, `43404`, `60075`, and `65058`; the
  corresponding force references at `2577`, `25884`, and `56083` were
  reconciled to `비탄의 힘(Sorrows)`. These remain distinct from
  `비탄의 집(House of Sorrows)`. Other ambiguous uses were not globally
  replaced.

The complete ID-scoped application manifest is
[`dialogue-context-edit-batch-20261113-4000-4999.json`](dialogue-context-edit-batch-20261113-4000-4999.json).

## Verification

- The 12 candidate IDs were rechecked against the four language rows before
  editing. Existing uncertain findings in the range were not converted into
  changes.
- Exactly 22 Korean rows were edited: the 12 candidates, the duplicated poem
  row, two related Scholia Arcana location rows, and seven Sorrows references.
- The poem copies at `4768` and `50357` are identical and retain four lines.
- The full paragraph structure at `4814` and all runtime/display wrappers at
  `4991` are preserved.
- Ledger fingerprints are refreshed only for the 22 edited IDs. Existing
  dispositions, row order, and all unrelated ledger bytes remain unchanged.
- The 65,135-row ledger validation, index/catalog reproducibility checks, all
  nine context-index tests, all 11 CSV-preservation tests, and the CRLF-aware
  diff check passed. The CSV retains its UTF-8 BOM and 71,845 CRLF / 244
  LF-only newline inventory.
