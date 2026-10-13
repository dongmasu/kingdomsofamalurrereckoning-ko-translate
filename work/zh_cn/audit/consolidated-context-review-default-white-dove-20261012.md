# Consolidated Context Review: `The White Dove`

- Review date: 2026-10-12.
- Scope: repeated source label at `default` IDs 43186 and 47503, plus the
  adjacent Henge question at 43187 for context.
- No CSV cells changed.

## Decision D-19434

English IDs 43186 and 47503 exactly repeat `The White Dove`. Chinese uses
`白鸽`; Japanese uses `白鳩の園` (“White Dove Garden”), adding a venue-like
element not present in English. Korean uses `흰 비둘기` at 43186 and
`하얀 비둘기` at 47503. Both are ordinary, accurate Korean renderings of
“white dove” and do not assert whether the phrase is a common description or
a named title. No source establishes that this title must be transliterated
or that the Korean adjective variation changes the referent.

Disposition: ID 47503 is `not an issue`; its literal Korean meaning is
source-supported without deciding the title's in-world status. ID 43186 is
not counted again because D-13220 keeps it uncertain together with ID 43187
for the separate unresolved referent/Henge context.

## Verification

- Compared English, Japanese, Chinese, preserved Japanese-derived Korean,
  and active Korean by ID.
- No active CSV changed; SHA-256 remains
  `6f80a870f122f45d9e87553e4c76d39e547d6194843dc244b20eec82be5ec513`.
- Totals: 2,268 accepted / 24,950 `not an issue` / 11,306 uncertain
  (38,524).
- Resume at D-19435 from the deduplicated unresolved-finding queue.
