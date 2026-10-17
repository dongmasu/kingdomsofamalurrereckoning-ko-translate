# D-20394 Edit Addendum

Date: 2026-10-15

Applied 139 personal-name corrections to active `default`; the other 190
reviewed `default` rows remained unchanged and one title-like match was
excluded. All five reviewed `base` rows remained unchanged. The
[manifest](proper-name-edits-D20394.tsv) records all 335 reviewed row keys.

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| default | `9227d08704aa95e3d64f481f3ac00a6fb479591665586d07c8ee8e380ebadb79` | `0fbcfe1dbe1e100d3c99cc889491d71dbd9e2e0b53a5a9c1ff9e5bcef079af60` |

Byte-identical backup created immediately before the write:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20394-person-B/locatexts_zh_cn.koalocatext_default.csv`

The independent saved-byte verifier passed: all 65,135 ordered rows,
headers, IDs/variants, BOM, complete line-ending sequence, tokens, target
values, and every non-target byte were preserved. Reversing the target-field
patches reproduced the backup byte-for-byte. `affix` and `base` were
unchanged; their active SHA-256 values are
`0d323b8fc86cc44c5f5386767a3ca073afd990ed1fa7b09f6ce376a765786112` and
`2572b912bf6aa4f7417da12b3f705178bf3b16975918c338ab3b1fb135c6be5b`.

The glossary now contains 395 entries. Its refreshed occurrence index
contains 10,673 active-aligned matches (1,905 `accepted`, 1,102
`not-an-issue`, 7,665 `needs-context`, and one `excluded`); these are
glossary-match states, not global review or unresolved totals. No historical
terminal disposition or global tally was reopened or changed.
