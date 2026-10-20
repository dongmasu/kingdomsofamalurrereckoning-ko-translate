# D-21930: Fresh Name Candidates at default:24500-24599

Date: 2026-10-20

## Findings

- Screened fresh name candidates in `default:24500-24599` against aligned
  English, Korean, Japanese, and Chinese rows, existing occurrence
  dispositions, and the proper-name glossary.
- No new, clearly evidenced Korean name error was found.
- `Afe Bolstid` at `default:24522` already uses the bilingual form
  `아페 볼스티드(Afe Bolstid)`, matching Japanese and Chinese context.
- The ship names `Barufakir` and `Naglfar` in `default:24594` are already
  paired in Korean. The names in the related journal and quest rows retain
  their existing exact-row decisions.
- `Cuba` at `default:24540` is accurately localized as `쿠바`; no project
  evidence calls for a different form or an English annotation.
- Other name-bearing candidates in the range are consistent with their
  prior exact-row dispositions or confirmed glossary forms. Existing
  unresolved content/name holds were not reopened.

No Korean CSV cell, glossary entry, or occurrence-index row changed. No
format/residual audit, verifier, inventory rebuild, package build, or in-game
test was run.

Next: D-21931, screen fresh candidates from `default:24600` onward; exclude
exact scopes already reviewed and retain existing unresolved holds unless
new decisive evidence appears.
