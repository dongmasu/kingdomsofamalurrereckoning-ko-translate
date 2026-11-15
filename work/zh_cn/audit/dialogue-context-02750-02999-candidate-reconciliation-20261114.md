# Candidate Reconciliation: IDs `2750`-`2999`

- Date: 2026-11-14.
- Rechecked all 12 current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, the active Korean CSV, and their linked review
  reports.
- Three in-range candidates received source-supported corrections; nine were
  retained because their supported wording was already present.
- One exact-source duplicate row outside the range was aligned with the
  corrected objective. Four unique CSV rows changed.
- No speaker or playback order was inferred from asset association.

## Applied Corrections

At `2792`, the Motus Mining context makes `this dump` the mine being operated.
The earlier Korean treated the place as something that itself “runs,” which
was unnatural and obscured the offer to help improve operations. The revised
line says the speaker can help run the mine more efficiently than Edgar Aron
managed.

At `2945`, `Rescue Julia Tam` now uses the established action-form objective
`줄리아 탐(Julia Tam) 구출하기`. The exact same English, Japanese, and Chinese
objective occurs at `34720`, so that row was aligned as well.

At `2958`, Japanese explicitly identifies the scent as Leechwood, and the
quest's magical Wandering Well is rendered `샘` elsewhere. The revised line
names `리치우드(Leechwood)` and uses `샘`, while preserving the casual register.

## Retained

- `2799` already uses `표식 없는 무덤`, matching `base:587`.
- `2820` already pairs the complete title `The Bursar's Collectors Have
  Come`.
- `2846` already says Caledus's tempered indifference is imbued in the
  subject, and pairs the full title `Archsage Caledus`.
- `2853` already uses the concise UI label `수염자국 농도`.
- `2871` already pairs both `Smecky Music Studios` and `Prague`.
- `2885` already uses the established military `복무 소집 통지서(Notices of
  Duty)` wording and retains the names and City Watch pairing.
- `2915` already uses `조제법`. All 16 linked references to Nanne's formula
  in the SQ12 report were checked; they consistently use `조제법`.
- `2959` already offers the discount naturally in plain speech.
- `2999` already uses conversational wording for the speaker's modest
  qualification.

## Verification

- All 12 in-range candidates have recorded decisions in the manifest.
- Only the Korean `Texto` fields for `2792`, `2945`, `2958`, and related
  duplicate `34720` changed; only their four source fingerprints were
  refreshed.
- The full review ledger, index/catalog reproducibility, both regression
  suites, CSV record/order/BOM/newline checks, and CRLF-aware diff check pass.
- Candidate reconciliation covers 175 of 4,015 current candidates (4.36%).
  The remaining candidate pool is incomplete.
- No commit was made.
