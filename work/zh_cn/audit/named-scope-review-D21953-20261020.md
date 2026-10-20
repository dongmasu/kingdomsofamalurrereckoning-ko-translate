# D-21953: Punctuation-Normalized English Title Collision

Date: 2026-10-20

## Scope

Compared English canonical names and aliases after removing spaces and
punctuation to find distinct title records whose source spellings might
conceal an identity or translation conflict. The Sea Foam/Seafoam venue
candidate was excluded because D-21947 already checked it.

## Finding

`Siege Breaker` and `Siegebreaker` are source-local spellings of the
protagonist's siege-breaking epithet/title. Their aligned English contexts
refer to the same protagonist; Japanese uses `包囲を破りし者` or
`救国の英雄`, and Chinese uses `破城者`. Both current Korean forms are
`공성 파괴자`, with each exact English source form retained in parentheses.
Existing `title:siege-breaker` and `title:siegebreaker` row dispositions are
preserved; the punctuation-normalized match does not establish a Korean
translation error or require an identity/index migration.

No source CSV, glossary, or occurrence-index change was warranted. No
format/residual audit, inventory rebuild, package build, or in-game test was
run.

Next: D-21954, use a distinct source-bounded content heuristic. The hard stop
remains D-22000.
