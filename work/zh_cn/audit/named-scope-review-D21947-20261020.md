# D-21947: Near-Duplicate Korean Place-Name Screen

Date: 2026-10-20

## Scope

Reviewed the same-category place-name candidates whose Korean canonical forms
differ by one Hangul edit, excluding numbered titles and non-place categories.

## Findings

The named locations remain distinguishable by their exact English labels and
source contexts: Adessa/Acatha, Cann-Rane/Mull-Rane, Moon Camp/Star Camp,
Eamonn's Isle/Path, and the Air/Earth Shrines and their caverns.

`Sea Foam Tavern` and `Seafoam Tavern` identify the same Rathir venue in
English, Japanese, and Chinese. The existing Korean records use `씨폼` and
`시폼` respectively and explicitly retain these as spelling variants; the
current cells preserve each complete source label. The evidence does not
establish either spelling as a content error, so they were not normalized.
`Lycium Grove` remains a source-form hold separate from the confirmed
`Lyceum Grove`; its exact row-local Korean/English pairing is preserved.

No new, clearly evidenced translation error was found. No source CSV,
glossary, or occurrence-index change was warranted. No format/residual audit,
inventory rebuild, package build, or in-game test was run.

Next: D-21948, use a distinct source-bounded content heuristic. The hard stop
remains D-22000.
