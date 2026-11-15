# Candidate Reconciliation: IDs `42250`-`42499`

- Date: 2026-11-15.
- Rechecked all 26 correction candidates against the current English,
  Japanese, Chinese, and Korean rows and the existing application findings.
  English anchors meaning; Japanese is the main reference for voice and
  layout; Chinese is supporting evidence.
- Exact-source comparison also found two unflagged Korean mismatches:
  `16532`/`42307` and `15833`/`42371`. Each pair has identical English,
  Japanese, and Chinese text. The two non-range IDs were added as candidates
  and aligned with their matching objective labels.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `42254`, `42258`, `42261`, `42297`, `42307`, `42329`, `42340`, `42348`, `42349`, `42350`, `42351`, `42360`, `42371`, `42377`, `42385`, `42426`, `42431`, `42445`, `42449`, `42461`, `42474`, `42493` | The active Korean already contained the supported pairing, objective, naturalness, or register correction. `42340` and `42350` were confirmed in the current CSV; no edit was repeated. |
| `42450` | Completed the material-name pairing as `비치스톤(Beachstone)`, `곰가죽(Bearhide)`, and `바다강철(Seasteel)`. |
| `42456` | Added the question mark to the natural rhetorical question about affording an exterminator. |
| `42489` | Recast the awkward appositive and integrated “the poor souls” naturally: the speaker identifies the imprisoned group as former servants and advisors, then notes that most prisoners died of starvation or disease. |
| `42447` | The English title pairing is already present. Its meaning remains held because English, Japanese, and Chinese give materially different readings. |

## Exact-Source Objective Pairs

| IDs | Result |
| --- | --- |
| `16532`, `42307` | All three source-language rows are identical. Both Korean objectives now read `크루독(Crudok) 처치하기`. |
| `15833`, `42371` | All three source-language rows are identical. Both Korean objectives now read `프리즘미어 예배당(Prismere Chantries) 파괴하기`. |

The other evidence-limited findings `42268`, `42272`, `42315`, `42405`, and
`42482` remain held outside the correction-candidate tally. No speaker,
dialogue order, or unsupported meaning was inferred.

## Verification

- Reconciled 26 in-range candidates and added/reconciled linked candidates
  `15833` and `16532`: 28 unique IDs total.
- Candidate reconciliation now covers 2,787 / 4,022 IDs (69.29%), with
  1,235 remaining.
- Five Korean rows changed in this reconciliation: `15833`, `16532`,
  `42450`, `42456`, and `42489`. Their four-language fingerprints were
  refreshed. The current translations at `42340` and `42350` were verified
  without reapplying their existing edits.
- The 65,135-ID ledger check, index/catalog reproducibility checks, 11
  CSV-preservation tests, nine dialogue-context tests, CSV structure and
  newline checks, both exact-source objective-pair checks, and the
  CRLF-aware diff check passed.
- The CSV retains 65,135 ordered records and its UTF-8 BOM, with 71,839
  CRLF sequences, 242 LF-only separators, and no bare CR.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
