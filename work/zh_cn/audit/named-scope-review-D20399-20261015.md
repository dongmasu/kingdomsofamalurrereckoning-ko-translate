# D-20399: Magnus Personal-Name Review

Date: 2026-10-15

## Scope and Decisions

Reviewed the first 50 indexed `person:magnus` occurrences as 50 distinct
resource/ID/variant row keys: four `base` rows and 46 `default` rows.
English established the named people and the surrounding meaning; Japanese
and Chinese corroborated identities and name readings. Related component
and full-name matches for Tyr Magnus and Hroth Magnus were checked together.

Accepted 33 `Texto` edits (one `base`, 32 `default`), retained 14 rows as
`not-an-issue` (three `base`, 11 `default`), and excluded three `default`
matches from the personal-name scope. The three exclusions are the
transferable Arena Champion title at ID 8625, a reference to the Magnus
family as a collective at ID 15137, and the Champion title at ID 29812.
They are not unresolved personal-name occurrences.

Standardized the person forms as `매그너스(Magnus)`,
`티르 매그너스(Tyr Magnus)`, and `흐로스 매그너스(Hroth Magnus)`.
Explicit repeated names and full-name compounds in the reviewed cells use
the same forms. The manifest records each row-level result and its aligned
English, Japanese, Chinese, and Korean context:
[`proper-name-edits-D20399.tsv`](proper-name-edits-D20399.tsv).

This is a bounded 50-row pass, not a complete Magnus or proper-name audit.
The next pass is D-20400 over the remaining 48 indexed `person:magnus`
occurrence rows. No sequential translation finding or global tally was
reopened, recounted, or changed.

## Integrity

See the [edit addendum](named-scope-edit-addendum-D20399-20261015.md).
Only `Texto` cells in active `base` and `default` were edited. `affix`,
source CSVs, and all unrelated paths were left unchanged. No PAK or
PAK-derived file was inspected.
