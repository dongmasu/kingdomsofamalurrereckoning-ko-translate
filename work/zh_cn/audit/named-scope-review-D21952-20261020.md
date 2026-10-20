# D-21952: Similar Short Personal-Name Check

Date: 2026-10-20

## Scope

Checked the Korean-near forms `겔트(Gelt)`, `헬트(Helt)`, `홀트(Holt)`,
`홀트(Holte)`, and `칼트(Kalt)` for accidental cross-character reuse.

## Findings

The English source forms identify separate people. The current glossary keeps
Holt and Holte distinct, with Holte's full name recorded as Holte Frenn;
Holt is Brother Holt. The exact personal-name records for Gelt, Helt, and
Kalt retain their own source keys and established Korean forms. Existing
aligned-locale and row-level decisions do not support merging these people.

No new, clearly evidenced name error was found. No source CSV, glossary, or
occurrence-index change was warranted. No format/residual audit, inventory
rebuild, package build, or in-game test was run.

Next: D-21953, use a distinct source-bounded content heuristic. The hard stop
remains D-22000.
