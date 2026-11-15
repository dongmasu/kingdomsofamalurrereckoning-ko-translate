# Candidate Reconciliation: IDs `42500`-`42749`

- Date: 2026-11-15.
- Rechecked all 35 correction candidates against current English, Japanese,
  Chinese, Korean, and the existing application findings.
- Exact-source comparison found two additional Korean mismatches:
  `25302`/`42694` and `42639`/`49115`. Each pair has identical English,
  Japanese, and Chinese text. The two linked IDs were newly classified as
  candidates and aligned with the matching Korean objectives.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `42503`, `42510`, `42511`, `42520`, `42528`, `42545`, `42554`, `42557`, `42569`, `42570`, `42574`, `42577`, `42579`, `42583`, `42611`, `42622`, `42638`, `42639`, `42642`, `42655`, `42666`, `42673`, `42694`, `42713`, `42720`, `42722`, `42730`, `42738`, `42741`, `42743`, `42744`, `42745`, `42748` | The supported name pairings, meaning, terminology, objective forms, and sentence revisions were already present in the active Korean. |
| `42675` | Changed the mismatched honorific exclamation to the plain, familiar `이게 누구야, 새 챔피언이잖아!`, matching Japanese and Chinese tone. |

## Exact-Source Objective Pairs

| IDs | Result |
| --- | --- |
| `25302`, `42694` | All three source-language rows are identical. Both Korean objectives now read `오드라(Audra)와 대화하기`. |
| `42639`, `49115` | All three source-language rows are identical. Both Korean objectives now read `티르노크(Tirnoch)의 해방을 저지하기`. |

The newly found linked IDs `25302` and `49115` were changed from `not-issue`
to candidates in the ledger. The evidence-limited holds `42542`, `42582`,
`42591`, `42599`, `42660`, `42733`, and `42738` remain; the open
`The Plains` meaning question at `42738` is separate from its accepted
sentence and name correction. Speaker identity and playback order remain
unassigned where evidence does not establish them.

## Verification

- Reconciled 35 in-range candidates and added/reconciled linked candidates
  `25302` and `49115`: 37 unique IDs total.
- Candidate reconciliation now covers 2,824 / 4,024 IDs (70.18%), with
  1,200 remaining.
- Three Korean rows changed: `25302`, `42675`, and `49115`. Their
  four-language fingerprints were refreshed.
- The 65,135-ID ledger check, index/catalog reproducibility checks, 11
  CSV-preservation tests, nine dialogue-context tests, CSV structure and
  newline checks, both exact-source objective-pair checks, and the
  CRLF-aware diff check passed.
- The CSV retains 65,135 ordered records and its UTF-8 BOM, with 71,839
  CRLF sequences, 242 LF-only separators, and no bare CR.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
