# Dialogue Context Translation Edit Batch: IDs `32250`-`32499`

- Date: 2026-11-14.
- Rechecked current English, Japanese, Chinese, and Korean text, including
  full sentences, paired names, and formatting. English anchored meaning;
  Japanese guided voice and layout; Chinese was supporting evidence.
- Applied 10 in-range corrections and three directly related consistency
  corrections, changing 13 unique `default` IDs.
- `32309` was retained: the current Korean is accurate and already uses a
  consistent plain written register. No speaker or playback order was
  inferred.

## In-Range Corrections

| ID | Correction |
| ---: | --- |
| `32265` | Paired the first mention as `불과 피의 밤(Night of Fire and Blood)` and retained the Korean event name later in the passage. |
| `32283` | Aligned `Castor` with the established `캐스터` spelling and added `(Castor)`. |
| `32298` | Changed the action objective to the established `첫 번째 정착지 찾기` form. |
| `32310` | Recast the lever instruction to explain naturally that the knob must be set to specific directions in a particular order. |
| `32327` | Paired the named Fate card as `계곡(The Valley)`. |
| `32342` | Paired Crinneus and both cited book titles, and smoothed the complete sentence into a natural conversational register. |
| `32365` | Paired both `아말도르(Amaldor)` and `스베리 쿠라(Sverri Kura)`; changed the stiff description to say that he leads the war effort. |
| `32376` | Paired the named card as `헥스(Hex)`, matching its exact-English duplicate `22272`. |
| `32414` | Completed the title pairing as `드레판 대장님(Captain Drefan)` while retaining the respectful address. |
| `32439` | Recast the help text naturally as `{*1이정표}가 있는 {*1기술}은...`; both localized markers and their order are preserved. |

## Related Consistency Corrections

| Group | IDs and result |
| --- | --- |
| The Valley | Rewrote the full explanation at `38453` around the named card `계곡(The Valley)` while preserving its three-sentence meaning. |
| Castor | Aligned the standalone title at `35147` as `캐스터의 분노(Castor's Wrath)`. |
| Hex | `22272` and `32376` now pair `헥스(Hex)` consistently. The Japanese lines differ in register, so their Korean wording was not otherwise unified. |

## Retained Findings And Holds

- `32309` already expresses the contract failure accurately in plain written
  Korean; no polite-register shift remains in the current row.
- `32325` remains provisionally `머드홀드 패스팅(Mudhold Fasting)`. The
  related entries `32740` and `54487` confirm that *fastings* are Dverga
  underground passage structures, but do not establish a project-approved
  Korean rendering for this named location.
- Evidence-limited findings `32447`, `32380`, `32421`, and `32422` remain
  unresolved rather than guessed.

## Verification

- Across this batch and the adjacent `32000`-`32249` batch, refreshed only
  the 38 changed IDs' `source_fingerprint` fields. The complete 65,135-ID
  ledger validates.
- The `default` CSV retains its UTF-8 BOM, 65,135 ordered records, 71,842
  CRLF record endings, and 244 LF-only record endings.
- Existing line breaks at `32265` were preserved. The localized marker
  order at `32439` is unchanged.
- Index and both catalogs reproduce; all 20 CSV-preservation and
  context-index tests pass; the CRLF-aware diff check is clean.
- Source CSVs, extracted assets, and game binaries were not changed. No
  commit was made.

The next sequential application range is `32500`-`32749`.
