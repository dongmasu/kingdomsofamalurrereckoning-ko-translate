# D-21929: Fresh Name Candidates at default:24400-24499

Date: 2026-10-20

## Findings

- Screened fresh name candidates in `default:24400-24499` against aligned
  English, Korean, Japanese, and Chinese rows, existing occurrence
  dispositions, and the proper-name glossary.
- No new, clearly evidenced Korean name error was found.
- `Meropis` at `default:24410` is accurately rendered as `메로피스`, but its
  canonical Korean form remains under the earlier D-6574/D-7921 alignment
  hold. No authoritative evidence in this row establishes a different
  spelling or warrants adding an English annotation; the separate
  D-18915 content disposition remains unchanged.
- `Oslach` at `default:24411` already uses `오슬라흐(Oslach)` under its
  source-local name decision. Other name-bearing rows in the range are
  consistent with their existing occurrence dispositions or glossary forms.

No Korean CSV cell, glossary entry, or occurrence-index row changed. No
format/residual audit, verifier, inventory rebuild, package build, or in-game
test was run.

Next: D-21930, screen fresh candidates from `default:24500` onward; exclude
exact scopes already reviewed and retain existing unresolved holds unless
new decisive evidence appears.
