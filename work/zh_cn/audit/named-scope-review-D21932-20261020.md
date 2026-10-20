# D-21932: Fresh Name Candidates at default:24700-24799

Date: 2026-10-20

## Findings

- Screened fresh name candidates in `default:24700-24799` against aligned
  English, Korean, Japanese, and Chinese rows, existing occurrence
  dispositions, and the proper-name glossary.
- No new, clearly evidenced Korean name error was found.
- `Raf` at `default:24765` remains under D-8076/D-19004. A separate
  confirmed `Raf Klyr` entry exists at `default:40495`, but the current row
  provides no identity link; the prior decision against inferring a person
  component alias remains in force.
- `Adarus` at `default:24788` remains under D-8087/D-19010's fragment hold.
  The row and aligned locales do not settle the relation between Adarus and
  the Paling Wand.
- Other names in the range remain consistent with their exact-row decisions
  or confirmed glossary forms. Existing unresolved holds were not reopened.

No Korean CSV cell, glossary entry, or occurrence-index row changed. No
format/residual audit, verifier, inventory rebuild, package build, or in-game
test was run.

Next: D-21933, screen fresh candidates from `default:24800` onward; exclude
exact scopes already reviewed and retain existing unresolved holds unless
new decisive evidence appears.
