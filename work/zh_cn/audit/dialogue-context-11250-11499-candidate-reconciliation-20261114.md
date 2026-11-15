# Candidate Reconciliation: IDs `11250`-`11499`

- Date: 2026-11-14.
- Scope: all eight current candidates in the range, checked against English
  meaning, Japanese voice/register/layout, Chinese supporting evidence, active
  Korean, and linked terminology/context records.
- Seven candidates are corrected: four edits were already present and
  reverified, and three were applied in this pass. The remaining candidate,
  `11326`, already uses the supported `처형인(Headsman)` form.
- Three related `Headsman` occurrences were aligned. The exact English term
  appears at 26 IDs in the active default source; all now use the same Korean
  term and English pairing.
- Asset association was not used to infer individual speakers or playback
  order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `11315` | Previously applied, confirmed | The stacked `고귀하신 ... 폐하` was reduced to the established royal title and one honorific, `지고왕(High King) 폐하`. |
| `11326` | Confirmed | `처형인(Headsman)은 어디서 찾을 수 있지?` is natural and paired. A full exact-source scan found the same term consistently used for this named adversary. |
| `11359` | Corrected | Recast the repeated, ungrammatical `페이란 페이란` construction as `온갖 페이(Fae)가 다 있어`; the full line now expresses the wish to leave if possible naturally. |
| `11360` | Previously applied, confirmed | The letter explicitly says the assistant may be resurrected. `되살려` makes that meaning clear while preserving the letter's voice and existing paragraph breaks. |
| `11365` | Corrected | Changed the imperative `시그라(Sigra)에게 돌아가라` to the concise quest-objective form `시그라(Sigra)에게 돌아가기`. |
| `11382` | Previously applied, confirmed | The journal now specifies the future caravans coming down the mountain path, as the English source says. |
| `11438` | Corrected | Replaced the awkward marked directive with conversational `새 숙소에 얼른 자리 잡아`; the possible reassignment to Castle Yolvan remains intact. |
| `11476` | Previously applied, confirmed | The relic pieces are now the explicit object of scattering and hiding. The warning's three paragraphs and four embedded line breaks are preserved. |

## Related Consistency

- `Headsman` is the same named Winter Fae in these source rows. IDs
  `43201`, `55398`, and `57045` were aligned to `처형인(Headsman)`. The
  ambiguous pronoun relation in `43201` was otherwise left unchanged.
- The full exact-English occurrence set is `1136`, `4007`, `11326`, `11684`,
  `15965`, `18118`, `21512`, `23251`, `24624`, `32518`, `32955`, `33252`,
  `37286`, `37436`, `37936`, `39934`, `40758`, `43201`, `44377`, `45706`,
  `48290`, `48832`, `52054`, `55398`, `57045`, and `63612`. All 26 now use
  the same paired Korean form.
- Refreshed only the six changed IDs' `source_fingerprint` values:
  `11359`, `11365`, `11438`, `43201`, `55398`, and `57045`. The four
  previously applied rows already had current fingerprints.

## Verification

- All eight in-range candidates are reconciled; cumulative sequential
  candidate reconciliation is 694 / 4,015 (17.29%), with 3,321 remaining.
- The full review ledger validates all 65,135 reviewed IDs.
- The generated quest-asset index and both catalogs reproduce exactly.
- CSV preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838
  CRLFs, 244 LF-only separators, and no bare CRs.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was changed.
