# Refugee Term Consistency Review

- Date: 2026-11-27.
- Scope: active Korean `default` rows using `피란민` or `피난민`.
- Decision: use `난민` for people called `refugee(s)` in the English source.
- Source authority: English establishes meaning; Japanese is checked for
  voice and nuance; Chinese is supporting evidence.

## Cross-Language Evidence

All 25 affected IDs use `refugee` or `refugees` in English and `难民` in
Chinese. Japanese uses `難民` in most rows and `避難民` in a few, but the
aligned dialogue and journal contexts do not establish a distinct group or
status. The English `refugee(s)` is the same group label throughout this
reviewed set. The Korean variants were therefore aligned to `난민`, retaining
the original sentences, particles, and compounds.

The National Institute of Korean Language says both `피난` and `피란` are
correct, with a nuance difference: `피란` is fleeing war or disorder, while
`피난` is avoiding disaster or danger more broadly. Both derived people terms
are valid; neither is required as the rendering of the English term
`refugee(s)` in this set.

## Edited IDs

`3276`, `3533`, `4590`, `4854`, `4944`, `5464`, `9279`, `23519`, `23614`,
`24062`, `27184`, `27316`, `27908`, `29167`, `33083`, `38470`, `45319`,
`45434`, `49074`, `52767`, `52905`, `53959`, `57605`, `62122`, and `62307`.

Each row's only terminology change was `피란민` or `피난민` to `난민`.
Only the corresponding `source_fingerprint` fields were refreshed in the
dialogue-context review ledger. No source CSV or existing user edit was
changed.

## Verification

- The preservation editor's regression suite passed: 11 tests.
- All 65,135 review-ledger fingerprints validate against the four current
  language tables.
- No `피란민` or `피난민` occurrences remain in the active Korean `default`
  CSV.
- `git -c core.whitespace=cr-at-eol diff --check` passed.
