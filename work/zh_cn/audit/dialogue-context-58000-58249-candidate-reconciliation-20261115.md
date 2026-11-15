# Candidate Reconciliation Follow-Up: ID `58055`

- Date: 2026-11-15.
- Scope: rechecked the open English-name-pairing proposal at `58055`
  against the active Korean and the English, Japanese, and Chinese rows.
- Added the exact English label `Eastern Sewers Henge` without changing the
  Korean lexical rendering or deciding whether a Henge is a structure or
  location.
- The separate meaning hold at `58143` remains unresolved because the
  language references do not agree on the sense of `quarry`.

## Decision

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `58055` | Corrected | The row is the named `Eastern Sewers Henge` location label. English gives the exact compound, Japanese `東下水道のヘンジ` supports the east/sewer/Henge components, and Chinese describes the corresponding eastern-sewer circular structure. Another sewer Henge label at `44217` already uses an English pairing. The Korean remains `동부 하수도 헨지`; only `(Eastern Sewers Henge)` was added. This does not settle the Henge's physical type. |
| `58143` | Held | English permits both a pursued quarry and a stone quarry in the wordplay, while Japanese and Chinese do not establish the proposed physical-quarry reading. No wording change is justified by this evidence. |

## Verification

- Applied the `58055` edit with `tools/replace_text_preserve_eol.py`.
- Refreshed only ID `58055`'s four-language `source_fingerprint`; its review
  dispositions and every other ledger field remain unchanged.
- The ledger fingerprint check, 20 preservation/context-index tests, CSV
  record-order/BOM/line-ending checks, and CRLF-aware diff check passed.
- Candidate reconciliation is `3,298 / 4,026` (`81.92%`), with `728`
  remaining. This resolves one candidate; the separate `58143` hold remains
  open.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

See the machine-readable
[`decision manifest`](dialogue-context-final-edits-followup-58000-58249-20261115.json)
and the original
[`58000`-`58249` sequential revalidation](dialogue-context-default-58000-58249-revalidation-20261113.md).
