# Sequential `default` Revalidation: IDs `64500`-`64749`

- Date: 2026-11-13.
- Compared the current Korean with English for meaning, Japanese for voice,
  register, honorifics, and layout, and Chinese as supporting evidence.
- Rechecked 64 existing ledger IDs without rewriting their append-only rows.
  Added the other 186 IDs in ascending order: 185 with no new issue and one
  correction candidate.
- No translation CSV, source CSV, or extracted game asset was changed for
  this review.

## New Correction Candidate

| ID | Finding | Review note |
| ---: | --- | --- |
| `64706` | `this season's tour` rendered as `이번 시즌 순회 공연` | The English and Japanese say `tour`; Chinese specifies a circuit/tournament, and the named subjects are fighters. `공연` may incorrectly imply a performance. A neutral rendering such as `시즌 투어` should be considered only after checking the in-game event context. |

## Rechecked Existing Findings

Four existing candidate rows (`64633`, `64643`, `64664`, `64722`) and one
existing uncertain row (`64511`) were rechecked against the current Korean
and source languages. Their ledger rows and fingerprints remain unchanged;
the original reports retain the ID-specific evidence.

## Cross-Checks

- All four language tables contain the same 65,135 IDs in matching order.
- Sixty-four exact-English duplicate groups touch the range and contain
  1,076 corpus rows. Korean translations match within all groups.
- Seventeen Korean multiline records were checked. Logical line-break
  structure and runtime-marker/formatting skeletons match the corresponding
  language sources; existing Korean CRLF separators were preserved.
- Of the 186 newly recorded IDs, 128 have indexed asset links (134 links
  across 71 assets) and 58 have none. Asset association does not establish a
  specific speaker or playback order.

## Range Result

- The new rows comprise 185 `not-issue` dispositions and one correction
  candidate.
- This range adds 186 IDs to the ledger; 64 IDs already had records and were
  rechecked without rewriting those rows.
- The candidate is not approval to edit the translation CSV.

## Verification

The final corpus-wide ledger fingerprint, catalog, regression-test, and
CRLF-aware diff checks are recorded in the completion report and current
audit summaries.
