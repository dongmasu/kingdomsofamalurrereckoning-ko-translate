# Candidate Reconciliation: IDs `26250`-`26499`

- Date: 2026-11-14.
- Rechecked all 25 current correction candidates against the same-ID English,
  Japanese, Chinese, and active Korean rows, plus the earlier edit report.
- The source-supported corrections are present in the active CSV. In this
  pass, `26251` was further corrected to pair the established
  `비탄의 힘(Sorrows)` term with its English source name.
- The location wording at `26251` remains provisional: the sources do not
  settle whether `Hollow` should be rendered as a cave, hollow, or valley, so
  the existing `공허` wording was not reinterpreted here.
- No earlier machine-readable candidate reconciliation list counted any of
  these 25 IDs.

## Candidate Decisions

| IDs | Decision and evidence |
| --- | --- |
| `26251` | Added the missing English pairing to `비탄의 힘(Sorrows)`. The translation keeps the hesitation and named Weeping King/Sinsear references; the exact geographic sense of `Hollow` remains unresolved. |
| `26255`, `26256`, `26259`, `26260`, `26261`, `26277`, `26313`, `26315`, `26316`, `26329`, `26343`, `26350`, `26357`, `26361`, `26369`, `26391`, `26395`, `26400`, `26414`, `26424`, `26431`, `26475`, `26477`, `26491` | Confirmed the active wording against the prior accepted corrections and current sources: conversational attack wording, ingredient spacing, reward phrasing, plain conversational register, full ballad/name pairings, localized markup, Neophyte rank, narrative quest-log style, item/name terms, and the explicit possibility of the boy's death. The `Sparrow Murders` note remains associated with the Sparrow group as supported by related references. |

At `26259`, the supported wording was already present. `26277` retains the two
localized wrappers in the same order as all three source languages. The
evidence-limited holds at `26252`, `26286`, `26399`, `26406`, and `26481`
remain separate from the candidate tally.

## Verification

- All 25 candidate IDs were reconciled; none was previously counted.
- Only `default:26251` was edited. Its `source_fingerprint` alone was
  refreshed, and the full 65,135-ID four-language ledger check passed.
- Embedded line-break counts match across all four languages for the 25
  candidate rows. `26277` has two `{*1...}` wrappers per language in matching
  order.
- CSV-preservation and context-index tests: 20 passed. CRLF-aware diff check
  passed.
- Cumulative candidate reconciliation is 1,522 / 4,015 (37.91%), with 2,493
  not yet reconciled.
- No source CSV or extracted game asset was changed; no commit was made.

The next sequential range is `26500`-`26749`.
