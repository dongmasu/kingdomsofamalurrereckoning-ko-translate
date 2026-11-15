# Candidate Reconciliation: IDs `32250`-`32499`

- Date: 2026-11-14.
- Rechecked all 12 current in-range candidates against same-ID English,
  Japanese, Chinese, and active Korean. Also checked the linked candidate
  `38453` with the exact-English card-name pair at `22272` and `32376`.
- The supported changes from the existing edit batch are present. No
  additional translation or ledger edit was needed in this pass.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `32265` | Confirmed | The historical event is paired as `불과 피의 밤(Night of Fire and Blood)` at first mention; the second mention uses the same Korean name and all source paragraph breaks remain. |
| `32283` | Confirmed | `캐스터(Castor)` follows the established Korean spelling and preserves the speaker's wry regret. |
| `32298` | Confirmed | `첫 번째 정착지 찾기` uses the neutral action-objective form. |
| `32309` | Retained | The contract-failure notice is accurate and consistently plain; no formal polite ending remains. |
| `32310` | Confirmed | The lever instruction clearly explains setting the knob to specific directions in a particular order. |
| `32325` | Held | English `Mudhold Fasting` conflicts with Japanese and Chinese passage/route readings; the current transliteration remains provisional. |
| `32327` | Confirmed | The named card is paired as `계곡(The Valley)`. |
| `32342` | Confirmed | `Crinneus` and both named books are paired; the full shopkeeper line remains natural and conversational. |
| `32365` | Confirmed | `아말도르(Amaldor) 스베리 쿠라(Sverri Kura)` identifies title and name separately; the sentence naturally describes his role in the war. |
| `32376` | Confirmed | `헥스(Hex)` matches the established card name and the exact-English row `22272`; only the source-supported card name is unified, not the different Japanese register. |
| `32414` | Confirmed | `드레판 대장님(Captain Drefan)` completes the title/name pairing and retains the respectful address. |
| `32439` | Confirmed | The help text is natural Korean; both localized markers remain in the source order. |

## Linked Findings And Holds

- The matching explanatory entry at `38453` uses `계곡(The Valley)`. The
  earlier candidate `22272` already uses `헥스(Hex)`; it was checked as a
  linked duplicate and not counted again.
- Holds `32380`, `32421`, and `32422` remain unresolved. `32447` also remains
  evidence-limited and outside the candidate pool. No speaker or playback
  order was inferred from asset membership, NPC symbols, handler
  serialization, or ID order.
- The two embedded Korean line breaks in `32265` match the corresponding
  source counts; `32342` has no embedded line breaks. At `32439`, both
  localized marker tokens and their order are preserved.

## Application And Verification

- Thirteen candidate IDs were newly counted: the 12 in-range candidates and
  the linked candidate `38453`. No candidate ID in this set had a prior
  candidate-reconciliation disposition.
- The active `default` CSV has 65,135 unique, ordered IDs and a UTF-8 BOM.
  Direct byte inspection found 71,838 CRLF, 244 LF-only, and zero bare-CR
  newline bytes. This differs from the earlier edit-batch report's 71,842
  CRLF figure; this reconciliation did not write to the CSV.
- The full review ledger validated all 65,135 fingerprints. The 11 CSV
  preservation tests and nine context-index tests passed; the index and both
  generated catalogs reproduced; the CRLF-aware diff check passed.
- Candidate reconciliation now covers 1,913 / 4,015 IDs (47.65%), with
  2,102 candidate IDs remaining. Next: `32500`-`32749`.
