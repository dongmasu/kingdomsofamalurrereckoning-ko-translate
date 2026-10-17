# D-20401: A-Family Personal-Name Review

Date: 2026-10-15

## Scope and Decisions

Reviewed the next 50 distinct indexed row keys with unresolved confirmed
personal-name matches: 17 Alfarinn, nine Alisen, 23 Alleia, and the first
Aloff row key. The scope covers `affix`, `base`, and `default`; each row was
checked against English, Japanese, Chinese, and the Korean text in context.

Accepted 30 `Texto` edits (six `affix`, 24 `default`) and retained 20 rows as
`not-an-issue`. Standardized Aesa Alfarinn to `에이사 알파린(Aesa Alfarinn)`,
Alisen to `앨리슨(Alisen)`, and Alleia to `알레이아(Alleia)`. The reviewed
Aloff row already used `알로프(Aloff)`. Existing full-name wording such as
`앨리슨 시와인(Alisen Seawine)` and already-canonical name cells were
retained.

The manifest records all 50 resource/ID/variant row keys and their aligned
source evidence:
[`proper-name-edits-D20401.tsv`](proper-name-edits-D20401.tsv).

## Integrity

See the [edit addendum](named-scope-edit-addendum-D20401-20261015.md).
Only accepted `Texto` cells in `affix` and `default` changed. Source files,
other paths, sequential-review dispositions, and global tallies were not
changed. The occurrence index was refreshed from the active CSV snapshots
without changing unrelated entity dispositions.
