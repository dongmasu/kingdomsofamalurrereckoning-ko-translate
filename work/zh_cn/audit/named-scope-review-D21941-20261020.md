# D-21941: Canonical-Label Collision Screen

Date: 2026-10-20

## Scope

Compared exact English and Korean canonical labels across proper-name
glossary entity keys. One English label is shared by two entities:
`Cryamor` (`person:cryamor` and `unique_item:cryamor`). Two Korean labels
are shared: `크라이아모어(Cryamor)` for those same entities, and
`요르반(Yolvan)` for `place:yolvan` and the unresolved `source-form:yolvan`.

## Findings

- `Cryamor`: default:54488 explicitly names Cryamor as Gask's pet sword;
  other source contexts identify Cryamor as the Witch Knight with soldiers.
  The glossary preserves separate person and item entities. D-20490 and
  D-20492 keep context-dependent or bare labels scoped without asserting
  identity. The matching Korean spelling is intentional.
- `Yolvan`: D-21289 distinguishes the confirmed region from 19 unresolved
  source-form occurrences. The source-form record intentionally has no
  English canonical or alias because the shared referent is unproven. Both
  use the established Korean spelling without merging their identities.

These collisions match prior explicit decisions; no new name error or
identity conflict was found. No translation, glossary, or occurrence-index
change was warranted. No format/residual audit, verifier, inventory rebuild,
package build, or in-game test was run.

Next: D-21942, use another distinct, source-bounded content heuristic. The
hard stop remains D-22000.
