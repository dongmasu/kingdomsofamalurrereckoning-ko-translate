# Candidate Application Reconciliation: IDs `47500`-`47749`

- Date: 2026-11-15.
- Rechecked the 15 current ledger candidates against the active Korean rows,
  English, Japanese, Chinese, and cited context findings.
- Ten unique candidates were newly counted. Five had already been counted:
  `47508`, `47572`, and `47662` in the `46000`-`51999` missing-candidate
  reconciliation, and linked candidates `47675` and `47741` in the
  `20000`-`20249` reconciliation.
- `47651` was mentioned in an earlier `The Burn` consistency group, but was
  not included in that report's reconciled candidate IDs; this district-name
  candidate is counted here once.
- The Stage 4 proposal for `47729` does not match the current row or ledger:
  the Korean already says the assassin is weakened by battle, and the ledger
  marks the row `not-issue`. It is cleared as a stale proposal and excluded
  from the candidate tally.
- `47742` was corrected from “valley” to “cave,” supported by English,
  Japanese, Chinese, and the related Brunuath cave entry.
- No speaker or playback order was inferred from asset associations.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `47508` | Previously held | `Collections` conflicts with Japanese `献金` and the donation context. Keep the existing hold; do not guess between collections and contributions. |
| `47565` | Retained | `물리치면 ... 들어갈 수 있다` correctly presents defeating Elswin as enabling entry, not as an obligation. |
| `47572` | Previously retained | `크로싱(The Crossing)의 수호자들(Keepers of the Crossing)` is already consistent with the established location name. |
| `47614` | Retained | The standalone label correctly pairs `포모러스 휴그(Fomorous Hugues)`. |
| `47651` | Retained | `퀘이(Quays)`, `번(The Burn)`, and `상층 도시(Upper City)` all carry the English district labels without changing the sentence grouping. |
| `47658` | Retained | `지속 소모: 최대 마나의 15%` makes the maximum-mana denominator explicit; the source line break is preserved. |
| `47662` | Previously corrected | `와일다 브랜던(Wilda Brandan)` was already added in the linked-candidate follow-up. |
| `47675` | Previously reconciled | `피의 총독(Blood Doge)` matches the title decision recorded with its linked occurrences. |
| `47696` | Retained | The standalone exclamation correctly reads `투아사 데온(Tuatha Deohn)!`. |
| `47712` | Retained | `그대의 힘은 실로 막강하니` clearly attributes the immense power to the addressee. |
| `47734` | Retained | `비탄의 힘(Sorrows)` preserves the named Fatesworn force rather than reducing it to ordinary sadness. |
| `47741` | Previously reconciled | `프리홀드(Freehold)` was included in the earlier linked-location consistency group. |
| `47742` | Corrected | Japanese `洞穴` and Chinese `洞穴`, along with the related Brunuath cave entry, support `브루누아스 동굴(Brunuath Hollow)`. |
| `47745` | Retained | The merchant/establishment is paired as `셈블(Cemble)`; the invitation remains natural and politely phrased. |
| `47749` | Retained | Both named characters are paired as `그룬버그(Grunberg)` and `볼턴(Bolton)` in the journal-style entry. |

## Cleared Proposal

| ID | Disposition |
| ---: | --- |
| `47729` | The older proposal objected to wording about recovering from battle wounds. The active row now says `전투로 약해진 동안`, which expresses being weak from battle without adding an injury. Its ledger status is `not-issue`; it is not counted as an active candidate. |

## Separate Evidence-Limited Hold

`47542` remains held because the English, Japanese, and Chinese sources
conflict about whether the Alfar warship crew were on leave from, fled from,
or sailed from Mel Senshir. The existing Korean is retained provisionally.

## Verification

- Only `default:47742` was changed, using
  `tools/replace_text_preserve_eol.py`; only its ledger fingerprint was
  refreshed.
- The candidate tally adds ten unique IDs and does not recount the five
  previously reconciled IDs: `3,206 / 4,027` (`79.61%`), with `821`
  remaining.
- See the machine-readable
  [decision manifest](dialogue-context-final-edits-followup-47500-47749-20261115.json).
