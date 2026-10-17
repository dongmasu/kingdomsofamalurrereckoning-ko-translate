# D-20400: Remaining Magnus Personal-Name Review

Date: 2026-10-15

## Scope and Decisions

Reviewed all 48 remaining indexed `person:magnus` row keys in `default`.
This completes the indexed Magnus-person scope that D-20399 began. The
review checked the exact English row and complete Korean context; Japanese
and Chinese were used to corroborate readings and identities. Related
`person:tyr`, `person:tyr-magnus`, and `person:hroth-magnus` occurrences on
the same rows received the same person-name disposition.

Accepted 39 `Texto` edits and retained nine rows as `not-an-issue`. The
canonical forms remain `매그너스(Magnus)`,
`티르 매그너스(Tyr Magnus)`, and
`흐로스 매그너스(Hroth Magnus)`. Context identifies the first/mortal
Magnus as Hroth Magnus in IDs 34335, 42767, and 61822. At ID 63582,
“Old Magnus” remains the generic `매그너스(Magnus)` because the source
does not establish a full name. ID 51049 already carries the complete
English title `Magnus' Trickery`, so adding a second parenthetical for the
name component would be redundant.

The manifest records every row, its English/Japanese/Chinese context, and
the disposition:
[`proper-name-edits-D20400.tsv`](proper-name-edits-D20400.tsv).

## Integrity

See the [edit addendum](named-scope-edit-addendum-D20400-20261015.md).
Only 39 `Texto` cells in the active `default` CSV changed. No `affix` or
`base` cells, source CSVs, PAKs, or PAK-derived files were changed or
consulted. No global translation tally was recalculated.
