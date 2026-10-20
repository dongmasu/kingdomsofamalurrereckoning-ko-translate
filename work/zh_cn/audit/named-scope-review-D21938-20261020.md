# D-21938: Heuristic Delta And Existing Hold Check

Date: 2026-10-20

## Scope

Ran the candidate extractor against the existing inventory's immutable
English-text field and the current glossary only. The inventory's Korean
field is stale, so it was not used for decisions; no aligned inventory was
rebuilt.

The refreshed heuristic contained 29,632 phrases versus the preserved
29,604-phrase baseline: 28 additions, no removals. All additions are already
reconciled in D-21842; no new English title-case candidate surfaced.

The saved discovery pools are also dispositioned: places (510 rows),
monsters (478), books/artifacts (59), and camps/institutions (582). Their
statuses are terminal except one existing uncertain scope:
`organization:motus-mining` at `default:31817`.

## Finding

At `default:31817`, English says “Motus Mining Operations”; Japanese uses
`モータス・マイニング社`, Chinese uses `莫图斯矿业`, and Korean says
`모투스 광산 운영부`. These locales support the established Motus Mining
organization but do not establish whether “Operations” is an organizational
alias or a department. This is the existing glossary hold, not new evidence.
Retain the current Korean text and the hold; do not add an alias.

No CSV, glossary, or occurrence-index change was made. No format/residual
audit, verifier, inventory rebuild, package build, or in-game test was run.

Next: use a different bounded content heuristic, such as a confirmed-name
cross-locale spelling comparison. Do not repeat this unchanged heuristic
delta or reopen `default:31817` without new evidence.
