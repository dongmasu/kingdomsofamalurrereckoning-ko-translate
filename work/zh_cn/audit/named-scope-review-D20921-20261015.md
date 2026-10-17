# D-20921: Proper-Name Discovery Review

Date: 2026-10-15

## Scope

Reviewed the `candidate:summer` lexical-discovery row across 334 distinct
source resource/ID keys: nine `base` rows and 325 `default` rows. The exact
candidate key and source-key list are in
[`proper-name-candidates.tsv`](proper-name-candidates.tsv), SHA-256
`c95d4014cb0f14afcf2819b44c5aea75de4c91a4993ec0e7280edace000d489e`.
The scoped outcome is recorded in
[`proper-name-discovery-D20921.tsv`](proper-name-discovery-D20921.tsv).

## Decision

Do not register `Summer` as a standalone entity or global alias. English
contexts use it as the ordinary season and as part of distinct titles,
locations, peoples, and institutions. Aligned examples include the ordinary
season label at `default:7990` (`Summer` / `夏` / `夏天` / `여름`) and the
separate `Summer Fae` identity, already registered as
`people:summer-fae`. References to Summer/Winter Courts remain their own
contextual scopes; no existing terminal disposition was reopened. No new
evidence justified changing those prior decisions or merging them with
Summer Fae.

No glossary entry or active CSV cell was changed. No CSV backup was needed,
and no global tally was adjusted. The active occurrence index remains at
25,873 matches: 17,177 accepted, 1,576 excluded, 7,102 `not-an-issue`, and
18 uncertain matches across 16 row keys. Sequential default review through
ID 65134 remains complete; proper-name discovery and residual validation
remain incomplete.

## Integrity and Next Step

Active CSV SHA-256 values are unchanged: `affix`
`a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`,
`base`
`37af347b74b00ba65ce028c02081726ba76e3d7db70261d36631056e0791e1eb`,
and `default`
`5f43c4d7d9e0d14ffed51cc73fef79deb58e99e3218a9b156b55eaf3ba5928d1`.

Next: D-20922, review the 138 source rows for `Scion`. Determine whether the
glossary should represent this recurring spiritual office/title before
registering it. Do not reopen earlier exact-key dispositions without new
evidence.
