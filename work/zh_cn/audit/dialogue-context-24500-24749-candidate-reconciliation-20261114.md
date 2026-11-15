# Candidate Reconciliation: IDs `24500`-`24749`

- Date: 2026-11-14.
- Rechecked all 19 current correction candidates against the active Korean
  and same-ID English, Japanese, and Chinese rows, including linked findings
  and the existing edit reports.
- Eleven candidates are newly counted; eight were already counted.
- Applied the omitted cross-range correction at `24673`. `24716` remains
  unresolved because the language sources disagree about the Hierophant's
  task.

## Candidate Decisions

| ID(s) | Decision and evidence |
| --- | --- |
| `24506`, `24546`, `24578`, `24589`, `24600`, `24639`, `24648`, `24661`, `24666`, `24718`, `24722`, `24729`, `24730` | Confirmed that the active Korean contains the source-supported corrections recorded in `dialogue-context-edit-batch-20261114-24500-24749.md`. |
| `24590`, `24624`, `24693` | Retained the already-correct active Korean; the English meaning and Japanese/Chinese references support the reported terminology and meaning. |
| `24660` | Retained `제일검(First Sword) 물리치기`. It now exactly matches `35478`; English, Japanese, and Chinese are identical for both practice-bout objectives. The later 33500-35999 manifest records this correction for both IDs, superseding the older 24500-range note that described a different prior Korean form. |
| `24673` | Added the missing pairing `겨울 왕국(Winter Realm)`. The same named setting is paired at `40689`; English explicitly uses `Winter Realm`, Japanese describes the Winter Fae kingdom, and Chinese names the Winter Realm. The related `Winter Court` remains distinct. |
| `24716` | Held. English `has been awarded` can indicate assignment, while Japanese and Chinese support a reward reading; the available sources do not settle the intended meaning. |

The eight previously counted candidates are `24589`, `24590`, `24624`,
`24661`, `24666`, `24693`, `24716`, and `24729`. `24673` had been recorded
as a cross-range candidate in other reports but was absent from prior
candidate-reconciliation tallies; it is counted here once.

## Linked Exact-Source Checks

- `35478` currently matches `24660` as `제일검(First Sword) 물리치기`.
- `27929` retains the complete `Sun Stone`, `Storm Stone`, and `Frost Stones`
  pairings in its statue-placement objective.
- No speaker identity or dialogue order was inferred from asset associations.

## Verification

- All 19 in-range candidates have a current disposition; eight previously
  counted IDs were not counted twice.
- `default:24673` was edited with `tools/replace_text_preserve_eol.py`; only
  its four-language `source_fingerprint` was refreshed.
- The 11 CSV-preservation tests passed and the review ledger validates all
  65,135 IDs against the four language tables.
- Cumulative candidate reconciliation is 1,384 / 4,015 (34.47%), with
  2,631 not yet reconciled.
- No source CSV or extracted asset was changed; no commit was made.
