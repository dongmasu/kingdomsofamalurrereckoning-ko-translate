# Candidate Reconciliation: IDs `38000`-`38249`

- Date: 2026-11-14.
- Rechecked all 14 in-range candidate IDs against English, Japanese, Chinese,
  active Korean, and relevant prior reviews.
- English anchored meaning; Japanese guided voice/register and Chinese
  supported the comparison. No speaker or playback order was inferred from
  asset membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `38012` | Retained | The active text already uses the natural `엮인 무늬` wording. |
| `38015` | Retained | The active text already pairs the full source compound `Greater Niskaru, Balor`; `상급` remains a local consistency choice, not a global grade decision. |
| `38023` | Corrected | Replaced the calque `여신 에테네의 접촉을 받았으며` with `여신 에테네(Ethene)와 접촉했고`. Did not import the Japanese-only pact detail. |
| `38028` | Retained | The active text already expresses that the Faeblades take their name from the Fae who made and mastered them. |
| `38084` | Corrected | Recast the coarse insult as natural Korean while retaining the contempt in `dross and dung`. |
| `38095` | Corrected | Recast the opaque `난 존재라고 불러` as `난 살아가는 방식이라고 생각해`, supported by Japanese `生き方の問題` and Chinese `生活`, while retaining the anarchy contrast. |
| `38100` | Held | The wording can be narrative prose or conversational exposition; the row does not establish a speaker or register. No voice change was guessed. |
| `38128` | Retained | The active text already expresses that surviving on Gallows End is harder than surviving a shipwreck. |
| `38144` | Corrected | Recast the awkward apposition as `투린(Turin), 그 젊은이` and preserved the request for his scroll. |
| `38174` | Corrected | Added the exact `Fate-Weaver` pairing and rendered the source's emphatic imperative directly. |
| `38187` | Corrected | Paired the explicitly self-identified name `Alrette` and the named place `Cranalt`; preserved the current local Cranalt spelling. |
| `38192` | Retained | The active text already naturally describes the letter's steady, artistic handwriting. |
| `38205` | Retained | `주인님께 다가가게 둬선 안 된다` already conveys the urgent warning without an awkward literal construction. |
| `38234` | Corrected | Paired `Apullos`; retained the speaker's skeptical claim that he would have the listener believe he can repair armor better than new. |

## Format-Only Rows And Holds

- `38139` now pairs the source spellings `Pyrderi` and `Phorian Strait`.
  The Korean `피르데리` and the conflict with the established
  `프라이데리(Pryderi)` remain unresolved; no canonical spelling is inferred.
- `38166` now pairs the exact source spelling `Selia Twayn`. The
  `Selia`/`Seila` source discrepancy remains unresolved.
- Existing meaning/context holds `38066`, `38102`, and `38246` remain
  unresolved. Their source or reply context does not support a safe rewrite.

## Verification

- Reconciled 14 candidate IDs: seven were edited, six were already supported,
  and one remains held. None had been counted in earlier application
  manifests. The two format-only updates at `38139` and `38166` were not
  counted as additional candidates. Cumulative reconciliation is 2,408 /
  4,015 (59.98%), with 1,607 remaining.
- Changed Korean `Texto` at seven candidate IDs and the two format-only rows;
  refreshed only those nine `source_fingerprint` fields.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,838 CRLF
  sequences, 244 LF-only separators, and no bare CR.
- All 65,135 ledger fingerprints, index/catalog reproduction, 11 CSV
  preservation tests, nine dialogue-context tests, and the CRLF-aware diff
  check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
