# Candidate Reconciliation: IDs `7250`-`7499`

- Date: 2026-11-14.
- Scope: all 10 current candidate IDs in the range, including findings from
  the five-asset review.
- English controls meaning; Japanese is the primary voice and register
  reference; Chinese is supporting evidence.
- One candidate required a correction, eight were retained as already
  resolved or adequately supported, and one remains held for insufficient
  context.
- Speaker identity and playback order were not inferred.

## Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `7299` | Retained | The gold/rebuilding sentence is natural, and `Motus Mining Interests` and `Ruin Imas` are fully paired. |
| `7339` | Held | English `it` has no secure antecedent; Japanese suggests self-control, while Chinese suggests luck. Do not replace Korean `인내심` based on conflicting evidence. |
| `7346` | Retained | The current line already expresses Bloody Bones' new desire naturally as a direct threat. |
| `7398` | Retained | `너처럼 우리 중 마지막 남은 이들도 머지않아 그렇게 되리라` is a natural, ominous rendering of the comparison. |
| `7402` | Retained | Korean already says the speaker found him and preserves the source's last first mate. |
| `7406` | Retained | The Health attribute is already rendered with the established term `체력`. |
| `7417` | Retained | `정찰 보고서` accurately conveys the recovered reconnaissance and the return instruction. |
| `7472` | Corrected | Completed the three artifact names as `태양석(Sun Stone)`, `폭풍석(Storm Stone)`, and `서리석(Frost Stone)`. |
| `7479` | Retained | The Korean already states the speaker believes the lullaby will lead somewhere important and preserves the danger clause. |
| `7484` | Retained | `사반트 엥가르(Savant Engar)` is already paired; related ID `14746` has the same complete pairing. |

## Related Artifact Terms

The current four-language rows for `7484`, `14746`, `18134`, `24729`, and
`27929` were checked against the Sun/Storm/Frost artifact terminology.
Their existing names follow the source-local decisions recorded in the
SA05/SA08 reviews; no unrelated rows were changed. This correction is limited
to the incomplete names in `7472`.

## Verification

- Refreshed only `7472`'s `source_fingerprint` in the append-only review ledger.
- All 65,135 ledger fingerprints validated; index and both catalogs reproduced.
- All 11 CSV-preservation tests and nine context-index tests passed.
- The CSV retains 65,135 ordered IDs and its UTF-8 BOM. The newline inventory
  remains 71,838 CRLF, 244 LF-only, and zero bare-CR endings.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was modified.

Sequential candidate reconciliation now covers 393 of 4,015 candidates
(9.79%), with 3,622 not yet reconciled. The unresolved antecedent at `7339`
remains open.
