# Candidate Reconciliation: IDs `43500`-`43749`

- Date: 2026-11-15.
- Rechecked the 25 IDs currently marked as candidates in this range against
  English, Japanese, Chinese, Korean, and the earlier sequential review.
  English anchors meaning; Japanese is the primary voice and layout reference;
  Chinese is supporting evidence.
- The earlier range report listed 28 candidates, but the current ledger
  contains 25. The current ledger defined this batch. Its linked title and
  duplicate-source rows were reviewed without inferring speaker identity or
  dialogue order from asset associations.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `43506`, `43516`, `43519`, `43520`, `43525`, `43536`, `43538`, `43547`, `43548`, `43555`, `43572`, `43574`, `43591`, `43606`, `43609`, `43632`, `43661`, `43671`, `43675`, `43684`, `43688`, `43693`, `43734`, `43735` | Retained as already correct after source review. This includes the existing complete name/title pairings, concise objective forms, the established `겸손해진 자들(The Humbled)` play title, and the `노움 삼단노선(Gnomish Trireme)` label. `43548` and `43632` were also confirmed to contain their previously proposed wording. |
| `43585` | Changed the final `있소` to `있어`. The Korean line had an isolated archaic ending, while Japanese uses direct plain speech; the meaning and established `비탄의 힘(Sorrows)` and `신시어(Sinsear)` pairings were preserved. |

## Linked Source Checks

- `43520` and `64742` have identical English, Japanese, and Chinese objective
  text, and both Korean rows read `이전 계약 담당자 찾기`.
- The promise-and-gift passage at `10708`, `41402`, and `43547` now has the same
  Korean wording, `잘 활용해라`. The Japanese text is identical; the English
  punctuation variants do not support different Korean wording.
- The `The Humbled` play-title family was checked across
  `12779`, `14404`, `18339`, `19981`, `23870`, `25968`, `27676`, `38295`,
  `43305`, `43555`, `44258`, `46913`, `49487`, and `55431`. Its Korean title
  form is now consistently `겸손해진 자들`; at `44258`, the one remaining
  internal `겸손한 자들` reference was aligned. The first title occurrence
  retains its English pairing; repeated references in the same document do
  not repeat it. `19981` was already reconciled in its own batch and was not
  counted again. The isolated title at `12779` still does not settle the
  singular/plural nuance; its ledger disposition was corrected from a
  formatting candidate to an evidence-limited hold.
- All 26 exact English labels `Argine, Queen of Staves` use the same complete
  Korean form, `지팡이 여왕(Queen of Staves) 아르진(Argine)`. No title part is
  missing, so the earlier formatting candidate at `43684` required no edit.
- `41266`, `43734`, and `55925` use the same `Gnomish Trireme` label and
  Korean pairing. The heading in `47542` uses that same term. Its separate
  source conflict about the Alfar crew's departure from Mel Senshir remains
  held.
- The `Julius Mavern` occurrences at `43688`, `47211`, and `63161` were
  checked for complete name/title pairing. The independent evidence-limited
  disposition at `63161` remains unchanged.

## Changes and Verification

- Korean rows `43585` and `44258` changed. Both were edited with the
  line-ending-preserving CSV tool. `44258` retains its existing paragraph
  breaks.
- Eight stale ledger fingerprints were refreshed:
  `64742`, `43555`, `43585`, `44258`, `46913`, `47542`, `49487`, and `63161`.
  The malformed 15-field row for `12779` was restored to the 16-column schema.
- The active candidate count is 4,028 after `12779` was returned to
  `uncertain`; the prior cumulative point was 2,902 / 4,028. This batch
  reconciled 33 unique candidates: the 25 current in-range candidates plus
  linked candidates `14404`, `18339`, `23870`, `25968`, `27676`, `38295`,
  `43305`, and `44258`. Cumulative reconciliation is 2,935 / 4,028
  (72.86%), with 1,093 remaining.
- The active CSV retains 65,135 ordered records and its UTF-8 BOM, with
  71,839 CRLF record endings, 242 LF-only separators, and no bare CR.
- Review-ledger fingerprints and index/catalog reproducibility checks passed.
  The 11 CSV-preservation tests and nine dialogue-context tests passed.
  The CRLF-aware diff check passed.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
