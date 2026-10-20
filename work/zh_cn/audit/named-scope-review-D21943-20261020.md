# D-21943: Near-Duplicate Non-Person/Place Name Screen

Date: 2026-10-20

## Scope

Extended the one-character English canonical-name comparison to all glossary
categories except people and places. The first pass surfaced many numbered
series titles; after excluding pairs that differ only by a Roman-numeral
volume, 13 candidate pairs remained.

## Findings

Twelve pairs are distinct numbered source labels for journals, memoirs,
collections, reports, or titles. The remaining pair is `Vlaskar's Forge` /
`Vlasker's Forge`. D-21540 reviewed their exact English, Japanese, Chinese,
and Korean labels and retained them as separate title scopes with their
source-local spellings. The identity of the two source forms remains
unasserted; the separate `person:vlaskar` decision is preserved.

No new, clearly evidenced name error was found. No translation, glossary, or
occurrence-index change was warranted. No format/residual audit, verifier,
inventory rebuild, package build, or in-game test was run.

Next: D-21944, use another distinct, source-bounded content heuristic. The
hard stop remains D-22000.
