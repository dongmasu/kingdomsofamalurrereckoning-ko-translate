# D-21944: Cross-Entity Korean-Label Overlap Screen

Date: 2026-10-20

## Scope

Compared each glossary Korean canonical label and variant within the same
entity category. The current glossary has 27 shared Korean labels spanning
44 entity pairs.

## Findings

The shared forms do not establish that the English entities are identical.
English source labels and existing row-specific evidence distinguish the
people, places, items, monsters, skills, and titles. The Yolvan
region/source-form overlap remains explicitly unresolved rather than merged.
Air Shrine and Shrine of Air are already treated as source-label variants for
the same sanctuary in prior decisions; no source-text correction follows
from this spelling overlap.

Checked the concrete collision risks in the active evidence: no current
`place:moon-camp` occurrence uses `문다운`, and the base item row for Chaos
Flame Dowel currently reads `혼돈의 화염 다월(Chaos Flame Dowel)`, distinct
from Chaos Flame Rod. Their historical Korean variants do not indicate an
active translation error. Existing exact-key decisions for the other
overlaps remain unchanged.

No new, clearly evidenced Korean translation error was found. No source CSV,
glossary, or occurrence-index change was warranted. No format/residual audit,
inventory rebuild, package build, or in-game test was run.

Next: D-21945, use a distinct source-bounded content heuristic. The hard stop
remains D-22000.
