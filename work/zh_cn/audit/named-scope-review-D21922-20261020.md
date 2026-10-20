# D-21922: Fresh Name Candidates at default:23700-23799

Date: 2026-10-20

## Findings

- Screened English-source name candidates in `default:23700-23799` against
  the aligned Korean, Japanese, and Chinese rows, existing occurrence
  decisions, and the proper-name glossary.
- No new, clearly evidenced Korean content error was found. Existing forms
  for names in the range remain unchanged.
- `Marga Sammoc` and `Oreyn Vilsar` (`23730`), `Adessa` (`23752`),
  `Fahrlang` (`23755`), and other encountered person, place, faction,
  creature, and reagent names already have exact-row or glossary decisions.
  These scopes were not reopened.
- `The Pryderi` (`23749`) remains covered by D-18700; its line locates the
  name among shops and stalls without establishing a more specific entity
  type. No new evidence warrants revisiting that disposition.

No Korean CSV cell, glossary entry, or occurrence-index row changed. No
format/residual audit, verifier, inventory rebuild, package build, or in-game
test was run.

Next: D-21923, screen fresh candidates from `default:23800` onward; exclude
exact scopes already reviewed and retain existing unresolved holds unless
new decisive evidence appears.
