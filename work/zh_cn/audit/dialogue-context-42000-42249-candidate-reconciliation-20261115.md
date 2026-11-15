# Candidate Reconciliation: IDs `42000`-`42249`

- Date: 2026-11-15.
- Rechecked 28 unique candidate IDs against current English, Japanese, Chinese,
  and Korean. English anchors meaning; Japanese is the main reference for
  voice and layout; Chinese is supporting evidence.
- The 26 IDs in the prior application manifest were reconciled with `42176`,
  which had a separate candidate disposition and evidence hold, and `42063`,
  which was restored as a valid candidate by the later missing-candidate
  follow-up.
- Twenty-one supported corrections were already present, four other rows
  were retained as correct, and `42031` and `42198` were corrected in this
  pass. `42176` remains held for its unresolved address/insult nuance.

## Decisions

| ID | Result |
| ---: | --- |
| `42003`, `42024`, `42072`, `42086` | Retained. The active Korean is natural and preserves the source meaning or established name pairing. |
| `42009`, `42039`, `42050`, `42061`, `42063`, `42068`, `42073`, `42089`, `42096`, `42098`, `42107`, `42124`, `42127`, `42131`, `42132`, `42137`, `42149`, `42162`, `42178`, `42193`, `42197` | Retained as already corrected. The active Korean matches the source-supported wording in the prior manifests. |
| `42031` | Changed `카이트 실드` to `연 방패`, matching the active `base` category at IDs `440` and `1626`. Kept `버클러`; `base` itself has both `소형 방패` and `버클러` for Buckler. |
| `42176` | Held. The sources identify `dreg` as an insult but do not establish a Korean form that preserves its force without overstatement. |
| `42198` | Changed the poem's layout to match exact-source duplicate `320`. The four source-language rows are identical; `320` already has the matching six-line Korean layout. The extra Korean break before `너를 붙들지` was removed. |

## Reopened and Linked Findings

The earlier `42000`-`42249` report released `42063` as a false positive.
The November 14 missing-candidate follow-up directly compared all source
languages, found that `우린 막지 않았어요` omitted the speakers' lack of
intent to stop the visitors, and applied `우린 막을 생각이 없었어요`.
This later source-based decision supersedes the earlier release; `42063` is
included once in this reconciliation and was not edited again.

The prior final-application manifest retained `42031` and held `42198`.
Rechecking the active `base` category and the exact four-language duplicate
at `320` supplied direct evidence for the two ID-scoped corrections here.
ID `320` was already reconciled in its own range and is not counted again.

The other evidence-limited holds from the original range remain open:
`42000`, `42007`, `42028`, `42047`, `42095`, `42115`, `42146`, and `42186`.
They are not additional correction candidates in this batch.

## Verification

- Reconciled 28 unique candidate IDs. Candidate reconciliation now covers
  2,759 / 4,020 IDs (68.63%), with 1,261 remaining.
- Changed Korean IDs: `42031` and `42198`. Their four-language fingerprints
  were refreshed. `42063` was already corrected and fingerprinted by the
  November 14 follow-up.
- The complete 65,135-ID ledger fingerprint check and index/catalog checks
  passed. Both regression suites passed: 11 CSV-preservation tests and nine
  dialogue-context tests.
- The CSV retains 65,135 ordered records and its UTF-8 BOM. It contains
  71,839 CRLF sequences, 242 LF-only sequences, and no bare CR. IDs `320` and
  `42198` now have identical Korean text and line layout. The CRLF-aware diff
  check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
