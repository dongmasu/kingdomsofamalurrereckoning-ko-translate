# Big Hunt Name Consistency Follow-up

- Date: 2026-11-15.
- Rechecked the five linked `default` occurrences `29900`, `41905`, `47041`,
  `47200`, and `59258` across English, Japanese, Chinese, and current Korean.
- English identifies the same named establishment as `The Big Hunt`;
  Japanese consistently uses `ビッグハント`, and Chinese uses `大狩猎`.
  The Japanese and Chinese rows support the shared referent, while English
  supplies the exact name.
- `47041` and `47200` already used the established `빅 헌트(The Big Hunt)`.
  The other three rows had the less complete pairing `빅 헌트(Big Hunt)`.
  Standardized `29900`, `41905`, and `59258` to the complete source name.
- Preserved each sentence's text and register: `29900` remains polite
  customer-facing dialogue, while `41905` and `59258` remain informal and
  welcoming. ID `59258`'s Japanese explicitly describes the establishment
  as a shop; `47200`'s surrounding text describes its food business.
- `29900` was already reconciled in the `29750`-`29999` candidate pass and
  was not counted again. `47041`, `47200`, and `59258` were still candidate
  ledger rows without a prior candidate-reconciliation record; they were
  reconciled here with the in-range candidate `41905`.
- Refreshed four-language source fingerprints for the three edited IDs.
  No speaker identity or playback order was inferred from asset membership.
- The 65,135-row ledger validation, CSV-preservation and context-index
  regression tests, CSV structure/BOM/line-ending checks, and CRLF-aware diff
  check passed. Source CSVs and extracted assets were not modified.

The corresponding range-level candidate decisions are recorded in
[`dialogue-context-41750-41999-candidate-reconciliation-20261115.md`](dialogue-context-41750-41999-candidate-reconciliation-20261115.md).
