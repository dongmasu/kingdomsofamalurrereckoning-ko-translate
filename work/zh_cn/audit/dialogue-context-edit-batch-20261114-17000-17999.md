# Dialogue Context Translation Edit Batch: IDs `17000`-`17999`

- Date: 2026-11-14.
- The 34 ledger candidates were rechecked against the active Korean and the
  English, Japanese, and Chinese sources. Of these, 31 were corrected, two
  were already resolved, and one was retained.
- The batch changed 56 unique Korean IDs, including directly related
  terminology and duplicate-source entries. The manifest records the
  ID-scoped decisions and reasons. Two particles introduced in the Kiftal
  title changes were corrected after application at IDs `26577` and `32759`.
- `17474` retains `이쑤시개들(Toothpicks)` per the existing quest review;
  the paired Great General entries and the distinct `Sky Blossom` entry
  `50873` were not changed.
- Speaker and playback order were not inferred from asset associations.

## Verification

- CSV output SHA-256:
  `ab1ef5073ac5b0c59d77ba279e7b508de1bc5a16e49f85c60ad78af2a95660a3`.
- Ledger output SHA-256:
  `378d71b42ff6f97a9d633b3dd55affe912d9eea981179f310b2071316f6ee2a0`.
- The BOM, 65,135 ordered records, 71,845 CRLF and 244 LF-only line endings
  were preserved. The ledger validated for all 65,135 IDs; 11 preservation
  tests, nine context-index tests, and CRLF-aware diff checks passed.
- Candidate dispositions in older reports use a different denominator from
  the current ledger's 4,015 `candidate` rows. The cumulative percentage is
  therefore not asserted until the sets are reconciled; the next sequential
  candidate range is `18000`-`18999`.

See the [application manifest](dialogue-context-edit-batch-20261114-17000-17999.json)
for the changes and post-application corrections.
