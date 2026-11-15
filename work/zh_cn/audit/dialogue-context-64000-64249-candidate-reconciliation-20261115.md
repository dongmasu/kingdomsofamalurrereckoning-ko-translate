# Candidate Reconciliation: IDs `64000`-`64249`

- Date: 2026-11-15.
- Rechecked eight recorded candidates against the active Korean and the
  same-ID English, Japanese, and Chinese text.
- Six candidates were newly reconciled; `64085` and `64167` were already
  handled in earlier reviews and are not counted twice.
- The supported corrections at `64054`, `64074`, `64110`, `64193`, and
  `64240` are already present in the active Korean. `64234` already uses the
  established `무기 교관` term.
- English anchors meaning, Japanese is the primary reference for voice,
  register, and phrasing, and Chinese is supporting evidence.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `64054` | Confirmed | The teasing line consistently uses plain conversational Korean; the unsupported honorific shift has already been removed. |
| `64074` | Confirmed | The sentence identifies Sorrows as magical energy and uses the established `비탄의 힘(Sorrows)`, distinct from the House of Sorrows. |
| `64085` | Previously reconciled | `clan` is already `씨족`; `our people` is a distinct source phrase and is not forced into the same term. |
| `64110` | Confirmed | The awkward passive has already been replaced with natural wording, and the informal register is consistent. |
| `64167` | Previously reconciled | The repeated Khamazandu offer sentence uses the established, source-supported Korean wording; the separate quest progress is preserved. |
| `64193` | Confirmed | English has a local `Dierdre` typo; the active `디어드리(Deirdre)` matches the established character name at `64103` and elsewhere. |
| `64234` | Confirmed | `무기 교관` matches the selected translation for the `master-at-arms` role and the established usage across Gravehal references. |
| `64240` | Confirmed | The epitaph correctly uses the divine name `권능(Authority)` and preserves Mitharu's order and the date. |

The six newly reconciled candidates are `64054`, `64074`, `64110`, `64193`,
`64234`, and `64240`. The earlier dispositions for `64085` and `64167` were
not counted again.

## `Master-at-Arms` Consistency

An English-source scan found 15 exact `master-at-arms` / `master at arms`
occurrences in `default`. The established `무기 교관` form is now consistent
across all 15:

- Changed `17267`, `19483`, `29235`, `31502`, `49162`, and `60558`.
- Kept already-aligned occurrences `13436`, `13502`, `14231`, `20428`,
  `34890`, `35410`, `41271`, `64234`, and `65048`.
- The distinct plural `weapon trainers` at `24993` remains
  `무기 교관들`.

Only the six listed `default` `Texto` fields were changed for this
terminology follow-up. `base:160` was outside this `default` review scope and
was not edited. The previous name annotation correction in the long entry at
`31502` was preserved.

## Holds And Formatting

- The evidence-limited holds and report-only questions in the sequential
  range report remain unresolved. No speaker identity, dialogue order,
  source conflict, or unknown lore was inferred.
- The user's current text at `64046` was left untouched.
- No embedded line breaks, runtime markers, immutable source CSVs, extracted
  game assets, or game binaries were changed.

## Result And Verification

- Six candidates were newly reconciled; two previously handled candidates
  were rechecked without double counting.
- Cumulative reconciliation is `3,503 / 4,026` (`87.01%`), with `523`
  remaining.
- Six Korean rows changed for the related terminology cleanup:
  `17267`, `19483`, `29235`, `31502`, `49162`, and `60558`. Only their
  `Texto` fields changed, and only those six ledger `source_fingerprint`
  fields were refreshed.
- All 65,135 ledger fingerprints validate. The index and both catalogs
  reproduce; all 11 CSV-preservation tests and nine context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No commit was made.
