# Fingerprint Reconciliation: `33500`-`33749`

The revalidation manifest `dialogue-context-final-edits-33500-35999-20261114.json`
records these already-modified Korean rows as rechecked and retained:

`33528`, `33533`, `33534`, `33551`, `33569`, `33571`, `33574`, `33575`,
`33580`, `33581`, `33584`, `33585`, `33594`, `33596`, `33609`, `33621`,
`33628`, `33639`, `33641`, `33653`, `33679`, `33687`, `33688`, `33697`,
`33700`, `33720`, `33726`, and `33734`.

Their ledger fingerprints still matched the `HEAD` Korean text rather than
the working CSV. Before updating the 28 fingerprints, their current texts
were compared with the snapshot taken before the later `33500`-`35999`
application and confirmed to match it; the old fingerprints were confirmed
against `HEAD`. The current English and Japanese text was also inspected
against the Korean. No CSV text or historical ledger judgment was changed
for this reconciliation; only the 28 fingerprint fields were replaced.

ID `33645` received a separate follow-up correction and is documented in
`dialogue-context-default-33645-followup-20261114.md`. Any other stale
fingerprints require separate review.
