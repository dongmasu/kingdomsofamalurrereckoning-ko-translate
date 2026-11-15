# Candidate Reconciliation: IDs `34000`-`34249`

- Date: 2026-11-14.
- Rechecked the 28 rows currently marked `overall=candidate` in this numeric
  range against English, Japanese, Chinese, active Korean, and the prior
  application report.
- The sequential report dated 2026-11-12 listed 34 candidates. Five of those
  IDs (`34027`, `34155`, `34156`, `34192`, and `34245`) are now `not-issue` in
  the current ledger after later asset-specific reviews. `34047` remains
  `overall=uncertain`, with a separate high-confidence `Scaith` pairing
  finding. The current-ledger candidate count, rather than the historical
  report's count, is used here.
- Candidate `34152` had already been counted with the Aster-family group.
  Three linked candidates (`45625`, `53754`, and `55233`) are newly counted.
  Aster candidate `45816` was already counted with `34152`; the related
  candidates `26551`, `33141`, and `33266` were also counted in earlier
  reconciliations. `34167` appeared in an earlier handbook consistency group
  but was not previously counted as a candidate.
- All current candidate wording was already present in the active Korean
  after the prior application batch. The only CSV change in this pass was the
  supported partial correction at `34047`; the unresolved meaning of
  `the First` was not changed.

## Candidate Decisions

| ID(s) | Decision and cross-check |
| ---: | --- |
| `34000` | Confirmed the complete `Master Mitharan Immunity Trim` pairing while preserving its quality prefix; the distinct `Flawless` label at `34952` remains separately worded and is already fully paired. |
| `34015`, `34023`, `34041`, `34062`, `34093`, `34124`, `34144`, `34175`, `34211` | Confirmed the complete standalone title, character label, objective, or title pairing without changing the Korean wording beyond the already-applied source annotations. |
| `34029` | Confirmed `소탕` for eliminating hostile Marauders; it avoids the political-cleansing sense of `숙청`. |
| `34037`, `45625` | Confirmed the consistent complete name and rank, `브롬 병장(Sergeant Bromm)`. |
| `34058` | Confirmed the complete rank and name, `파라글렌 사부(Master Farraglen)`. |
| `34073` | Confirmed `Traveler` as the named class/role and its English pairing. |
| `34081` | Confirmed `serve you well` as being useful or helpful, not personally caring for the player. |
| `34097` | Confirmed the question asks who the opponent is, matching both Japanese and Chinese. |
| `34113` | Confirmed the line does not establish the brother's relative age; the current wording avoids adding `older brother`. |
| `34129`, `34131`, `34134` | Confirmed the named weapon `Makhaira`, Magnon's source spelling, and Hanrik's name pairing without imposing a new Korean transliteration. |
| `34152` | Confirmed the Aster-family reference; already reconciled and counted with the linked family group. |
| `34167` | Confirmed `지점 업무 안내서` for the Motus Mining branch handbook; the same term is already present and was not counted in its earlier consistency-only review. |
| `34181` | Confirmed `신탁자(Oracle)` against the Hallidite quest's established within-asset terminology; no global Prophet change is implied. |
| `34204` | Confirmed removal of the repeated “once in a while” idea; the spoken line remains conversational. |
| `34220` | Confirmed `비탄의 집(House of Sorrows)` as the faction named in the surrounding quest context. |
| `34223` | Confirmed the complete personal name `Ventrinio Descilini` and natural Korean name order. |
| `34240` | Confirmed the idiomatic growth meaning and the `Nina` pairing without changing the informal journal voice. |
| `34244` | Confirmed the intended-to-happen meaning while preserving the speaker's hesitation and sentence break. |
| `53754`, `55233` | Confirmed the complete epithet and name, `사냥꾼 알로프(Aloff the Hunter)`, in both the standalone label and dialogue. |

## Partial Correction And Holds

`default:34047` now reads `스케이스(Scaith) 군대`, using the family spelling
already established by `First Scaith`, `Codex Scaith`, and `Faitir Scaith`.
The entry's English, Japanese, and Chinese sources support the Scaith army
reference. Its separate `the First` wording remains unresolved because the
four-language evidence does not establish a formal title or identity.
Accordingly, the row remains `overall=uncertain` and is not added to the
candidate-pool subtotal.

`default:34952` remains outside the candidate subtotal because its overall
status is uncertain. Its complete `Flawless Mitharan Immunity Trim` pairing
is already present; this pass does not resolve the separate item-meaning
question.

The historical candidates `34027`, `34155`, `34156`, `34192`, and `34245`
remain unchanged because their later ledger dispositions are `not-issue`.
The reports documenting those asset-specific reviews are linked in the
review ledger.

## Verification

- Newly counted candidates: 27 in-range IDs plus linked IDs `45625`, `53754`,
  and `55233`; `34152` was previously counted. This pass adds 30 unique
  candidates. Reconciliation is now 2,097 / 4,015 (52.23%), with 1,918
  remaining.
- The CSV preservation tool edited only ID `34047`. The active CSV still has
  65,135 ordered IDs and its UTF-8 BOM; newline inventory is 71,838 CRLF,
  244 LF-only separators, and no bare CR.
- All 65,135 review-ledger fingerprints validate. The generated quest asset
  index, asset catalog, and all-ID catalog match their checked-in files.
- CSV-preservation tests: 11 passed. Dialogue-context index tests: 9 passed.
- No speaker identity or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

See the four-language sequential review at
[`34000`-`34249`](dialogue-context-default-34000-34249-revalidation-20261112.md),
the prior application batch at
[`33500`-`35999`](dialogue-context-edit-batch-20261114-33500-35999.md),
the Scaith spelling decision at
[`D-21884`](named-scope-review-D21884-20261020.md), and the decision manifest
[`34000`-`34249`](dialogue-context-final-edits-followup-34000-34249-20261114.json).
