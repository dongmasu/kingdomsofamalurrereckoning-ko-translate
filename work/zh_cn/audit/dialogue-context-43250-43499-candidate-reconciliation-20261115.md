# Candidate Reconciliation: IDs `43250`-`43499`

- Date: 2026-11-15.
- Rechecked the 19 IDs currently marked as candidates in the active review
  ledger against English, Japanese, Chinese, Korean, and the earlier range
  report.
- The earlier range report and current ledger disagree on one candidate:
  `43289` remains a candidate in the ledger and was reconciled here, while
  `43364` is already `not-issue` in the ledger and its active Korean already
  uses the supported `-하기` objective form. The current ledger, not the
  stale candidate list in that report, defined the candidate batch.
- Exact-source comparison found two Korean mismatches, including one
  previously unflagged occurrence at `44580`. One row-level false positive
  (`43340`) was cleared.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `43263`, `43268`, `43275`, `43289`, `43317`, `43327`, `43333`, `43391`, `43392`, `43404`, `43422`, `43429`, `43460`, `43461`, `43472`, `43481`, `43485` | Retained. The active Korean already has the source-supported meaning, terminology, name pairing, and objective form. In particular, `43289` already uses the proposed `재료`; `43460`'s pre-existing wording was preserved; and the actual Galen item description is `43461`, whose Korean already pairs `게일런(Galen)`. |
| `43379` | Revised the final clause to `...서로 다른 장소로 이끌었지...`. Japanese uses plain conversational narration; this adjusts the register without assigning an unsupported speaker. |
| `43340` | Cleared as a false positive. This row describes armor designed by King Gadflow, and the Korean already pairs `가드플로(Gadflow)`. The Galen finding belongs to `43461`. |

## Exact-Source Follow-up

| IDs | Result |
| --- | --- |
| `43317`, `60675` | English, Japanese, and Chinese are identical (`Explore the Ancient Vault`); both Korean objectives now read `고대 금고(Ancient Vault) 탐험하기`. `60675` was already a candidate and is reconciled here. |
| `43364`, `44580` | English, Japanese, and Chinese are identical (`Begin the Ritual`). `43364` was already correctly rendered and is not a current ledger candidate; `44580` is newly identified, and both now read `의식 시작하기`. |

The three evidence-limited holds at `43309`, `43319`, and `43359` remain
unchanged. No identity, speaker, or dialogue order was inferred from asset
association alone.

## Edits and Verification

- Korean rows `43379`, `44580`, and `60675` changed. Their four-language
  fingerprints were refreshed. Ledger status was corrected for `43340`
  (candidate to `not-issue`) and `44580` (`not-issue` to candidate).
- The candidate pool gained `44580` and removed false-positive `43340`, so
  its total remains 4,028. Twenty unique candidates were reconciled,
  including linked candidate `60675`. Cumulative reconciliation is
  2,902 / 4,028 (72.05%), with 1,126 remaining.
- Both exact-source groups now match across all four languages. The active
  CSV retains 65,135 ordered records and its UTF-8 BOM, with 71,839 CRLF
  record endings, 242 LF-only separators, and no bare CR.
- All 65,135 ledger fingerprints and the regenerated index/catalog checks
  passed. The 11 CSV-preservation tests and nine dialogue-context tests
  passed. The CRLF-aware diff check passed.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
