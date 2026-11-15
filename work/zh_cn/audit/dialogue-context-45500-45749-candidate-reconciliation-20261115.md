# Candidate Reconciliation: IDs `45500`-`45749`

- Date: 2026-11-15.
- Rechecked all eight current correction candidates against English,
  Japanese, Chinese, the active Korean CSV, and linked terminology uses.
  English anchors meaning; Japanese is the primary reference for voice and
  register; Chinese is supporting evidence.
- No translation change was needed in this range.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `45511` | Retained. `사냥은 잘돼 가?` is a natural conversational rendering of `How goes the hunt?`. |
| `45539` | Retained. The active Korean already uses the conversational wording proposed in the prior report and preserves the gentle prayer-like reassurance without assigning a speaker. |
| `45615` | Retained. The active Korean already condenses the boast while preserving that the speaker was decades younger than prior envoys and now assigns chores. |
| `45625` | Previously reconciled and counted in the `34000`-`34249` pass as a linked candidate. The active `브롬 병장(Sergeant Bromm)` follows the complete name-and-rank format; do not count it twice. |
| `45698` | Retained. `진심을 담아,` is a natural formal closing for `Sincerely,` and agrees with Japanese `誠意を込めて`; the paragraph and signature layout is preserved. |
| `45706` | Retained. The current row pairs both `처형인(Headsman)` and `타인힐(Tinehil)`. Earlier scoped occurrence checks also confirmed these forms; no individual speaker is inferred. |
| `45720` | Retained. `금지 물품도 취급해` naturally says the vendor carries prohibited goods and does not turn the statement into an instruction. |
| `45731` | Retained. The current sentence already uses the natural place and creature references `아카사(Acatha)의 침수된 평원` and `머건(Murghan)`, preserving the contrast between the former and current threats. |

## Evidence-Limited Holds

The six existing holds remain open and unchanged: `45504` (register and
deference), `45535` (Basilica text type), `45536` (conflicting farewell
meaning), `45674` (religious form of address), `45688` (credits or role-label
localization status), and `45701` (whether Red is a person or faction).

No speaker or dialogue order was inferred from asset associations. The
complete `Sergeant Bromm` label at `45625` was not counted a second time.

## Changes and Verification

- Reconciled seven newly counted range candidates; `45625` was already
  reconciled in an earlier linked-candidate pass.
- No Korean CSV row or ledger fingerprint changed.
- The full 65,135-ID ledger fingerprint check, index and both catalog
  reproducibility checks, nine dialogue-context tests, 11 CSV-preservation
  tests, CSV structure/order/BOM/newline checks, and CRLF-aware diff check
  passed.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
