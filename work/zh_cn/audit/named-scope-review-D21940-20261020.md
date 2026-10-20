# D-21940: Cross-Entity English Alias Collision Screen

Date: 2026-10-20

## Scope

Compared multiword English canonical names and aliases in the current
proper-name glossary across entity keys. The screen found two shared phrases:
`Ansilla and Gastyr` and `Houses of Ansilla and Gastyr`, each attached to
`faction:house-ansilla` and `faction:house-gastyr`.

## Finding

The exact source contexts at `default:21190`, `default:44051`, and
`default:54539` name both families together. English, Japanese, Chinese, and
the existing Korean labels all preserve the two-family reference. D-21118
and D-21119 already reviewed these exact rows and keep the two family
entities separate. The shared phrases are coordinated mentions, not evidence
that the houses are one entity.

No translation, glossary, or occurrence-index change was warranted. No
format/residual audit, verifier, inventory rebuild, package build, or
in-game test was run.

Next: D-21941, screen canonical-label collisions across entities; keep
existing row-scoped identity holds closed unless new evidence appears.
