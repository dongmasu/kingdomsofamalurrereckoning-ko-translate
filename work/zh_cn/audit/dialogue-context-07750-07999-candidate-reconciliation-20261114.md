# Candidate Reconciliation: IDs `7750`-`7999`

- Date: 2026-11-14.
- Scope: the ten current candidate IDs in this numeric range, checked against
  the active English, Japanese, Chinese, and Korean rows and linked reviews.
- English controls meaning; Japanese is the primary voice and register
  reference; Chinese is supporting evidence.
- Three candidates required corrections; seven were already supported by the
  active Korean and were retained.
- Two related material rows outside the range were aligned with the same
  source-backed terminology. Their IDs are not included in the ten-candidate
  range count.
- No individual speaker or playback order was inferred from asset membership.

## Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `7783` | Retained | The active `빙결 피해(Freezing Damage)` distinguishes the source from `Ice Damage` and matches the proposed term. |
| `7813` | Corrected | Standardized `Beachstone` and `Emberwood` to their established material labels. Rendered `seasteel` as `바다강철(seasteel)`, preserving the lowercase source form required by the recorded Seasteel decision. |
| `7850` | Retained | The active `마법물품 제작(Sagecrafting)` already uses the established full term. |
| `7875` | Corrected | Niahm Kent explicitly identifies themself in the line. Japanese and the matching self-identification at `33884` support plain conversational speech; changed the marked `-이오` ending to `-이지`. |
| `7885` | Retained | The active text already uses the supported `틱네리(Ticneri)` form. Other reviewed Ticneri mentions in the bounded group were also checked; no further edit was needed. |
| `7901` | Retained | `참 편리한 소리군. 내가 왜 널 믿어야 하지?` conveys the sarcastic distrust supported by the English and Chinese. |
| `7907` | Retained | `활기찬 손님` adapts the playful `live one` greeting without the literal, misleading “living person” reading. The exact idiom remains context-sensitive, so no stronger interpretation was added. |
| `7935` | Retained | `이 건방진 신참 아니신가` preserves the taunting sense of `upstart` and already matches the proposed direction. |
| `7943` | Corrected | Recast the past-tense wording about Fate's continuing permission and streamlined the departure instruction, preserving Boderill and Brunuath. |
| `7989` | Retained | `백년꽃 2` already uses the established flowering-stage label and preserves the UI numeral. |

## Related Material Rows

The shared Gravehal materials finding also applies to `8257` and `50541`.
Both now use `비치스톤(Beachstone)` and `엠버우드(Emberwood)`. `50541` now
uses the established `바다강철` form as well. The Seasteel decision requires
preserving source-local capitalization, so lowercase source `seasteel` remains
lowercase in parenthetical references, as recorded in
[`D-21364`](named-scope-review-D21364-20261017.md). The same-group row `48659`
already had the supported material names and was retained.

## Changes

- Edited the Korean text at `7813`, `7875`, `7943`, `8257`, and `50541` using
  the byte-preserving ID-scoped CSV editor.
- Refreshed only those five IDs' `source_fingerprint` fields in the review
  ledger.
- Kept the ten candidate dispositions separate from the translation changes;
  no ledger status or evidence attribution was rewritten.

## Verification

Verification is recorded in the accompanying decision manifest. The CSV
preservation tests, context-index tests, ledger fingerprints, generated
catalogs, record structure, BOM, line-ending inventory, and CRLF-aware diff
check were checked after the edits.

Sequential candidate reconciliation now covers 418 of 4,015 candidates
(10.41%), with 3,597 not yet reconciled.
