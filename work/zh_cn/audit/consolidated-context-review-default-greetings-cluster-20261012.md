# Consolidated Context Review: Repeated `Greetings.` Lines

- Review date: 2026-10-12.
- Scope: unresolved exact-English greeting rows at `default` IDs 19391,
  21320, 32449, and 42804. Other exact-source matches were already
  dispositioned and were not recounted.
- No CSV cells changed.

## Decision D-19436

English uses the generic greeting `Greetings.` in all four rows. Chinese
`致敬` also supplies a greeting/salutation. Japanese varies between
`よく来たな`/`よく来たわね`, closer to “welcome/you have come,” which is
useful voice context but does not establish a semantic error in the English
or Korean. The active Korean values are `안녕하십니까`, `안녕하시오`,
`어서 오세요`, and `안녕하시오`; each is a natural Korean greeting. The
English does not specify register, and the rows do not identify a speaker
whose established voice would rule out these forms.

Disposition: `not an issue` for all four IDs. No register rewrite is
authorized. Exact English duplicates already dispositioned elsewhere are
linked without recounting.

## Verification

- Compared English, Japanese, Chinese, and active Korean values by ID.
- No translation CSV changed; active default SHA-256 remains
  `6f80a870f122f45d9e87553e4c76d39e547d6194843dc244b20eec82be5ec513`.
- Totals: 2,268 accepted / 24,955 `not an issue` / 11,301 uncertain
  (38,524).
- Resume at D-19437 from the deduplicated unresolved-finding queue.
