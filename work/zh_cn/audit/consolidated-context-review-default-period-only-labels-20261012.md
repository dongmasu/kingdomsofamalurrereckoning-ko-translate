# Consolidated Context Review: Period-Only Labels

- Date: 2026-10-12.
- Decision: D-19466.
- Scope: `default` IDs 28424, 28764, 29101, 29901, 29918, 30461, 31083,
  31211, and 32072.

## Finding

All nine keys were still uncertain in their latest explicit register
entries. At every ID, English, Japanese source, preserved Japanese-derived
draft, Chinese, and active Korean are exactly `.`. These are punctuation-only
rows, not cases where Korean added a period missing from English. The active
translation preserves the source exactly; resolve all nine as `not an issue`.

| IDs | English | Japanese | Draft Korean | Chinese | Active Korean | Disposition |
| --- | --- | --- | --- | --- | --- | --- |
| 28424, 28764, 29101, 29901, 29918, 30461, 31083, 31211, 32072 | `.` | `.` | `.` | `.` | `.` | not an issue |

No Korean CSV cells changed and no backup was needed.

## Verification

- Joined all five resources by `ID_Linha`; each target key occurs once per
  resource and has the exact same one-character `Texto`.
- No runtime markers or embedded line breaks occur in these cells.
- Active default SHA-256 remains
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- Totals after D-19466: **2,349 accepted / 25,057 not an issue /
  11,118 uncertain** (38,524). Resume at **D-19467** from the deduplicated
  unresolved-source queue.
