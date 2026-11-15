# Candidate Reconciliation: IDs `25250`-`25499`

- Date: 2026-11-14.
- Rechecked all 29 current candidate IDs against active Korean and same-ID
  English, Japanese, and Chinese rows, including earlier findings and the
  current translation edit-batch report.
- Twenty IDs are newly counted; nine had already been counted in linked
  reviews.
- The current Korean reflects all supported corrections. No additional CSV
  edit was needed in this reconciliation pass.
- Asset associations were used only as grouping evidence; no speaker or
  playback order was inferred.

## Candidate Decisions

| IDs | Decision and evidence |
| --- | --- |
| `25275`, `25288`, `25292`, `25301`, `25311`, `25333`, `25342`, `25358`, `25403`, `25407`, `25411`, `25433`, `25435`, `25450`, `25465`, `25486`, `25487`, `25491`, `25495`, `25498` | Confirmed the supported corrections recorded in `dialogue-context-edit-batch-20261114-25250-25499.md`. English establishes meaning, Japanese guides voice/register and layout, and Chinese supports the comparison. |
| `25277` | The objective already pairs `크리살레(Chrysalae)`. The canonical Korean spelling remains unresolved in the linked Chrysalae review, so this pass does not guess or broaden the terminology decision. |
| `25298` | Retained `메이지의 행운(Maisie's Luck)`, consistent with the named ring references. |
| `25368` | Retained the sentence aligned with `22613` and `35580`; each row's distinct continuation remains intact. |
| `25398` | Retained the direct name pairing `휴고(Hugo)` and the plain imperative supported by English, Japanese, and Chinese. |
| `25408` | Retained the complete pairings for `Tari`, `Akara-Tor`, and `Gallows End`; the journal's first-person objective remains unchanged. |
| `25441` | Retained `하트바인` and the distinct name `스레시(Thresh)`, consistent with the linked heartvine terminology review. |
| `25496` | Retained the paired objective `카마잔두(Khamazandu)에게 돌아가기`. |

## Evidence-Limited Holds

- `25385`: The location is paired as `할로(The Hollow)`, supported by its
  SQ50 context and linked review. The broader location-name interpretation
  remains evidence-limited and was not expanded here.
- `25474`: The address/register question remains unresolved. The sources do
  not establish enough speaker/addressee context to revise the line safely.

## Previously Counted IDs

The following nine candidates were checked in earlier linked reviews and are
not counted again: `25277`, `25298`, `25333`, `25342`, `25358`, `25368`,
`25385`, `25441`, and `25474`.

## Verification

- All 29 candidate IDs have a disposition; 20 are newly counted.
- The active Korean rows match the supported corrections in the edit-batch
  report. No translation row or ledger fingerprint changed in this pass.
- The full review ledger validated against all four current language tables.
- The context index and catalogs reproduced byte-for-byte. The CSV
  preservation and context-index regression suites passed (20 tests).
- Cumulative candidate reconciliation is 1,434 / 4,015 (35.74%), with
  2,581 not yet reconciled.
- No source CSV or extracted game asset was changed; no commit was made.
