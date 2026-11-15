# Translation Follow-up: ID `64246`

- Date: 2026-11-15.
- Reopened the earlier evidence-limited UI-label finding using the same-ID
  English, Japanese, and Chinese text plus related Blacksmithing screen
  instructions.

## Decision

| ID | Result | Evidence |
| ---: | --- | --- |
| `64246` | Corrected | `Salvageable Items` is `サルベージ可能アイテム` in Japanese and `回收物品` in Chinese. The related salvage-screen instructions at `11144`, `14967`, and `43919` describe the same `salvageable items` UI state; the current Korean already calls it `분해 가능한 아이템`. Use that established term rather than `분해 가능한 물품`. |

The Korean label is now `분해 가능한 아이템`. The selected operation term
`분해` is consistent with the related crafting-screen instructions; this
change only aligns the generic `Items` noun with the same UI context.

## Verification

- Only `default:64246`'s Korean `Texto` field changed, using the
  byte-preserving editor.
- Only ID `64246`'s four-language `source_fingerprint` changed; all ledger
  decision fields, rows, and ordering were preserved.
- The previous uncertainty about this UI noun is resolved by the repeated
  screen instructions; no speaker or dialogue-order claim is involved.
- No immutable source CSV, extracted game asset, or binary changed.
- No commit was made.

See the
[`decision manifest`](dialogue-context-final-edits-followup-64246-20261115.json)
and the original
[`64000`-`64249` sequential review](dialogue-context-default-64000-64249-revalidation-20261113.md).
