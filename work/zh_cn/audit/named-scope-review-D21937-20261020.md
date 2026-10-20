# D-21937: Fresh Heuristic Candidate Screen

Date: 2026-10-20

## Scope

Filtered the 2026-10-18 short-label snapshot against exact-key candidate
dispositions and the occurrence index. Only two uncovered groups remained:
`Scarwood` and `Templar`. Stale `candidate-not-reviewed` flags were not
treated as evidence of open work.

## Findings

- `Scarwood` / `default:8694`: English, Japanese, and Chinese all retain
  `Scarwood`; Korean is `스카우드`. Existing source evidence identifies a
  separate `Scarwood Tree` and `Scarwood Bark`, but does not establish what
  the standalone label denotes. D-21791 explicitly kept bare `Scarwood`
  separate from the tree and bark. Retain the Korean text without adding an
  English pairing or entity.
- `Templar` / `default:23891`: already closed as `not-an-issue` by D-18738;
  the older D-7629 uncertainty is not reopened.
- `Templar` / `default:48712`: English `Templar`, Japanese `聖堂騎士`,
  Chinese `圣殿骑士`, and Korean `성전 기사` agree on a translated rank or
  role. The aligned dialogue at `default:52027` uses the same generic term.
  Exclude this candidate from proper-name registration; no text change.

No CSV, glossary, or occurrence-index changes were made. No format/residual
audit, verifier, inventory rebuild, package build, or in-game test was run.
The review was limited to the exact candidate keys and their direct locale
evidence.

Next: identify fresh source-bounded heuristic candidates outside the stale
2026-10-18 snapshot. Filter exact keys against existing dispositions before
review; do not rebuild the inventory or rerun broad format/residual checks.
