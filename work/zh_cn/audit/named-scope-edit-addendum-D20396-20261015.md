# D-20396 Edit Addendum: D-L Personal Names

Applied 23 reviewed proper-name corrections: six `base` cells and 17
`default` cells. The 42-row manifest contains 23 `accepted` and 19
`not-an-issue` decisions.

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| `base` | `b32b921bb5fd3d2a8da9808c021a8fb6eb5587ee582731b9536e20be1cd6071c` | `237bcf318dee4eb4655860e9d6fc9cd7c0334a9f466ee1b3be3fc2338c85788a` |
| `default` | `7791a717a61f8e30d67ff9e648fb2f4377088c86c3abe2dd7b4f6f18278a64c3` | `03c94d80116480d237c07cb77f1001bfc1f1624b8ac9c0acb8aa3111064e3c69` |

Byte-identical backups created immediately before the CSV writes:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20396-D-L/locatexts_zh_cn.koalocatext_base.csv`
- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20396-D-L/locatexts_zh_cn.koalocatext_default.csv`

The independent verifier passed for all six and 17 targets respectively:
ordered rows and keys, BOM, exact line-ending sequence, target values,
non-target fields and bytes, and inverse reconstruction. `base` remains
4,844 rows with 4,845 CRLF endings; `default` remains 65,135 rows with
72,084 CRLF endings. Both have zero bare-LF or bare-CR endings. `affix`
remains unchanged at SHA-256
`0d323b8fc86cc44c5f5386767a3ca073afd990ed1fa7b09f6ce376a765786112`.

The refreshed 11,018-row occurrence index preserves prior dispositions and
adds D-20396's 42 row-level decisions: 2,551 `accepted`, 1,423
`not-an-issue`, 7,041 `needs-context`, and three `excluded`. These are
entity/row match states, not global review counts. The aligned source
inventory contains 73,430 rows and has SHA-256
`a97774ace68b7a009db2a64c3bdaa85aa8ac69fc6de0f5a231567133f9df5eaa`.

No historical translation disposition or global tally was reopened or
recounted. Sequential default review remains complete through D-20377 /
ID 65134. The separate proper-name candidate review remains incomplete;
continue with D-20397.
