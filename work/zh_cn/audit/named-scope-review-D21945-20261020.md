# D-21945: Single-Word English Alias Collision Screen

Date: 2026-10-20

## Scope

Compared single-word English canonical names and aliases across glossary
entities, checking for exact collisions not covered by the prior multiword
alias screen.

## Findings

No same-category collision was found. The only exact shared label is
`Cryamor`, shared across the person and unique-item categories; D-21941
already reviewed the distinct source contexts and retained separate entity
scopes.

No new name error or identity conflict was found. No source CSV, glossary, or
occurrence-index change was warranted. No format/residual audit, inventory
rebuild, package build, or in-game test was run.

Next: D-21946, screen cross-category Korean canonical/variant overlaps. The
hard stop remains D-22000.
