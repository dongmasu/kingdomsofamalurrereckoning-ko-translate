# D-21447: Proper-Name Candidate Refresh

Date: 2026-10-17

## Scope

A fresh English-led heuristic scan of the current 73,430-row aligned
inventory and 1,655-entry glossary generated 29,606 phrases. The saved
`proper-name-candidates.tsv` snapshot contains 29,604 phrases; comparison
found two newly surfaced phrases and no removed phrases:

- `Ever Glen` at `default:11821`, already terminal as `place:ever-glen`
  under D-21433 (`not-an-issue`).
- `Theater of Fates` at `default:54811`, already terminal as
  `place:theater-of-fate` under D-21435 (`accepted`).

Both Korean cells already have the canonical bilingual label. Their
English-led identity and aligned Japanese/Chinese evidence are retained in
[`proper-name-candidate-refresh-D21447.tsv`](proper-name-candidate-refresh-D21447.tsv).
These are previously dispositioned keys, not new reviews. No glossary,
occurrence-index, decision, translation tally, or CSV cell was changed.

## Validation

- Fresh inventory: 73,430 rows; SHA-256
  `fecc697351653fdf03f549f2df40dc223cf09760a57b54e49d185cb21b1b157f`.
- Fresh heuristic scan: 29,606 phrases; SHA-256
  `f125666c784d95d74eb8296f88bbcfcc859247c1c3fb3bf7ddcd290939ab62a1`.
- Source/index comparison: 40,324 generated matches, 41,152 indexed matches,
  zero missing keys, 828 contextual extras, zero undocumented extras.
- Terminal matches without a covering bilingual English label: zero.
- Documented exceptions: one idiomatic non-label, three invocation phrases,
  four lowercase descriptive references, and one source-local rank translation.
- `validate-proper-name-data.rb`: PASS, 1,655 entities and 41,152 unique
  active-aligned occurrences.
- Focused candidate and residual-audit tests: PASS, 14 runs and 75 assertions.

The 305-row variant-consistency shortlist remains marked
`registered-reviewed` for all rows. Neither it nor the 29,606-phrase heuristic
scan is exhaustive; no overall completion percentage is inferred. Full
proper-name discovery remains incomplete. No PAK or PAK-derived data was
consulted.

Active CSV SHA-256 values are unchanged:

- `affix`: `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`
- `base`: `d3a5124336d76c56c4f8eb17d4457ee2523920f4895ab75fcda7b7934d406b76`
- `default`: `e34d0ba797327656ff054622f386776b92a3968015de1b5ceec485df18cf6ac2`

No CSV edit occurred, so no new pre-edit backup was required. The last
actual-edit backups remain recorded in the active checkpoint blocks.
