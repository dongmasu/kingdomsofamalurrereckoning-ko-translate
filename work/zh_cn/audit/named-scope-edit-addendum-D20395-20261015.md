# D-20395 Edit Addendum

Date: 2026-10-15

Applied 433 reviewed proper-name corrections: seven `base` cells and 426
`default` cells. The 687-row manifest records 433 `accepted`, 252
`not-an-issue`, and two `excluded` dispositions; no `affix` cell changed.

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| base | `2572b912bf6aa4f7417da12b3f705178bf3b16975918c338ab3b1fb135c6be5b` | `b32b921bb5fd3d2a8da9808c021a8fb6eb5587ee582731b9536e20be1cd6071c` |
| default | `0fbcfe1dbe1e100d3c99cc889491d71dbd9e2e0b53a5a9c1ff9e5bcef079af60` | `7791a717a61f8e30d67ff9e648fb2f4377088c86c3abe2dd7b4f6f18278a64c3` |

Byte-identical backups created immediately before the writes:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20395-person-C/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20395-person-C/locatexts_zh_cn.koalocatext_default.csv`

The independent saved-byte verifier passed: all 4,844 ordered `base` rows
and 65,135 ordered `default` rows, headers, IDs/variants, BOM, complete
line-ending sequences, target values, and every non-target byte were
preserved. Reversing the target-field patches reproduced both backups
byte-for-byte. `affix` was unchanged at SHA-256
`0d323b8fc86cc44c5f5386767a3ca073afd990ed1fa7b09f6ce376a765786112`.

No historical translation disposition or global tally was reopened or
recounted. Sequential default review remains complete through D-20377 /
ID 65134; this named-entity pass is a separate, incomplete workstream.
