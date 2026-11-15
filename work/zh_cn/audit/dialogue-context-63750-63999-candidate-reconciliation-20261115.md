# Candidate Reconciliation: IDs `63750`-`63999`

- Date: 2026-11-15.
- Rechecked three earlier candidates against the active Korean text and
  English, Japanese, and Chinese sources.
- Corrected `63778` and `63981`; `63864` already uses a supported short form.
- The five previously accepted corrections at `63771`, `63794`, `63845`,
  `63852`, and `63990` remain present.
- The older duplicate candidate at `58994` was already reconciled and is not
  counted again.
- English anchors meaning, Japanese is the primary reference for voice,
  register, and phrasing, and Chinese is supporting evidence.

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `63778` | Corrected | `감시 중` can mean actively conducting surveillance. English `Under Watch`, Japanese `監視下`, and Chinese `监视之下` all mean the player is under surveillance. Changed the title to `감시 아래(Under Watch)`. |
| `63864` | Retained | `서신을 어떻게 훔칠 수 있지?` is a concise, unambiguous short reference to the Missives. The full book title remains paired as `세이블의 서신(Missives of Sable)` elsewhere; no unsupported title wording was added here. |
| `63981` | Corrected | Added the missing material-name pairing as `곰가죽(Bearhide) 꾸러미`, using the established Korean material form. |

## Related Consistency Checks

- The exact-English group for `Bundles of Bearhide` is `4967`, `20537`, and
  `63981`. English, Japanese, and Chinese are identical across all three;
  aligned all three Korean rows to `곰가죽(Bearhide) 꾸러미`.
- The exact-English group `25576`, `58994`, and `63906` has identical
  English, Japanese, and Chinese. All three active Korean translations now
  match as `벨렌의 성약단(Belen's Testament)`. The `58994` correction was
  already reconciled in the `25500`-`25749` pass.
- All five earlier accepted corrections named above are present. No
  additional change was needed.
- No speaker attribution or dialogue order was inferred from asset links.

## Holds And Formatting

- The 45 evidence-limited holds and 21 report-only questions in the
  sequential range report remain unresolved; this pass does not infer lore,
  speaker identity, or dialogue order.
- Existing embedded line breaks, runtime markers, and localized marker
  ordering were preserved.
- No immutable source CSV, extracted game asset, or game binary was changed.

## Result And Verification

- Three existing candidates were newly reconciled: two corrections and one
  retained finding. The previously reconciled `58994` candidate was not
  counted twice.
- Cumulative reconciliation is `3,497 / 4,026` (`86.86%`), with `529`
  remaining.
- Four Korean rows changed: `4967`, `20537`, `63778`, and `63981`. Only
  their `Texto` fields changed, and only their ledger `source_fingerprint`
  fields were refreshed.
- All 65,135 ledger fingerprints validate. The index and both catalogs
  reproduce; all 11 CSV-preservation tests and nine context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No commit was made.
