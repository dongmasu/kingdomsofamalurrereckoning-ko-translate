# Dialogue Context Translation Edit Batch: IDs `33500`-`35999`

- Date: 2026-11-14.
- Each candidate in the range was rechecked against current English,
  Japanese, Chinese, and Korean text. English anchored meaning; Japanese
  guided register and layout; Chinese provided supporting evidence.
- The first pass applied 191 ID-scoped edits; a follow-up corrected six
  findings, including two additional candidate IDs. The follow-up also
  refined four rows changed in the first pass. In total, 193 unique IDs were
  changed, including linked rows `3475`, `4468`, and `24660`.
- The full edit manifest records old/new text and rationale. It preserves the
  current Korean wording when a proposal was already resolved, and keeps
  uncertain interpretations on hold.

## Adjudication Highlights

- Corrected source meaning and Korean naturalness, including the ability
  question at `33787`, the `Makhaira` sentence at `34129`, the comparison at
  `34570`, the captive lockpick at `33902`, and the health recipient at
  `35957`.
- Completed source pairings for attested names, titles, locations, creature
  types, items, abilities, and standalone titles. Related full labels were
  checked together, including `Irion, King of Cups`, `Before The Talk`,
  `First Sword`, the `Aster` family, and `Knave of Pride`.
- Corrected dialogue and journal phrasing without inferring a speaker from
  asset association. Examples include `33813`, `33833`, `34204`, `35331`,
  and `35623`.
- Preserved multiline structure and runtime tokens, including the long
  entries at `33628`, `35162`, and `35645`.
- Rejected the prior claim that `상상하는 것보다는 심하지` means “worse than
  imagined”; it means “not as severe as imagined” and was corrected.
- Kept `35565` as an English-supported imperative rather than changing it to
  a question based only on Japanese. Held `34387`, `34936`, and `35107`
  because the available evidence does not settle their interpretation or
  terminology.
- Retained already-correct text instead of rewriting it, including `33892`,
  `33899`, `34152`, `34167`, `34259`, `34414`, `34567`, `34594`, `34765`,
  `34912`, `35070`, `35147`, `35317`, `35326`, `35465`, `35537`, `35580`,
  `35655`, `35667`, `35715`, `35729`, `35744`, `35843`, and `35959`.

## Verification

- The two manifests account for 193 edited IDs, 62 retained candidates, and
  three holds. Ledger `source_fingerprint` values were refreshed only for
  those 193 edited IDs; unrelated stale fingerprints were left untouched.
- The active `default` CSV retains its UTF-8 BOM, 65,135 ordered rows, 71,838
  CRLF sequences, 244 LF-only sequences, and no bare CR. The CSV preservation
  helper validates the selected ID before each edit.
- All 20 CSV-preservation and dialogue-context-index unit tests pass.
- A pre-existing stale ledger fingerprint at ID `22292` causes the global
  `--check-review-ledger` check to fail; it predates this batch and was not
  changed. The remaining catalog/index reproducibility and CRLF-aware diff
  checks are to be run after the in-progress application batches finish.
- No source CSV, extracted game asset, or game binary was modified. No commit
  was made.
