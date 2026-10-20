# D-21942: Near-Duplicate Person And Place Name Screen

Date: 2026-10-20

## Scope

Compared English canonical person/place names for one-character edit-distance
pairs with the same number of words. Seven pairs surfaced.

## Findings

- `Barren Cove` / `Burren Cove`: separately registered locations with
  distinct source labels; retain D-21275 and D-21155 decisions.
- `Cennar Bruge` / `Cenner Bruge`: exact English labels at default:61461 and
  default:14957 support distinct personal-name forms; retain D-21198 and
  D-21600.
- `Courdan` / `Courden`: English identifies Courdan Passant and Courden,
  author of two separate treatises; retain D-20395 and D-21581.
- `Florian` / `Florion`: separate source-named people with distinct
  contexts; retain their existing glossary identities.
- `Helyc Crosse` / `Helyca Crosse`: both source labels are explicit, but
  their identity relationship remains unproved under D-21138; do not merge.
- `Obsidian Isle` / `Obsidian Isles`: English uses singular and plural
  geographic forms separately; retain D-21169/D-21170 and D-21246 scopes.
- `Snaketail Grotto` / `Snakestail Grotto`: default:19487 literally says
  `Snakestail Grotto`; its Korean parenthetical preserves that exact source
  spelling. D-21308 already reviewed the row, while the established
  `Snaketail Grotto` form remains separate. Do not normalize the source
  spelling or alter the Korean label.

No new, clearly evidenced name error was found. No translation, glossary, or
occurrence-index change was warranted. No format/residual audit, verifier,
inventory rebuild, package build, or in-game test was run.

Next: D-21943, use a distinct, source-bounded content heuristic. The hard
stop remains D-22000.
