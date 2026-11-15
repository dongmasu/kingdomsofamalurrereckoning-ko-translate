# Candidate Reconciliation: IDs `4250`-`4499`

- Date: 2026-11-14.
- Rechecked all ten current `overall=candidate` IDs in the interval against
  English, Japanese, Chinese, active Korean, and linked review records.
- Six in-range rows were corrected; four findings were already reflected in
  the current Korean text.
- Related rows `60012` and `61986` were checked with their in-range
  counterparts; only `60012` needed a correction and will count in its own
  numeric range.
- No individual speaker or playback order was inferred from asset membership.

## Applied Corrections

- `4293`: `Long Overdue` belongs to the quest about recovering and returning
  Brother Til's books. The Japanese `期限超過` supports the overdue/return
  deadline sense; the title is now `한참 연체된 책들(Long Overdue)`.
- `4315`: replaced the isolated, stiff `이제야 알겠군` with `이제야 알겠어`,
  matching the conversational register already used in the same line and
  supported by Japanese.
- `4383`: rendered lowercase `tender` as the same asset's generic
  `관리인`, yielding `관리인의 후계자` rather than the less idiomatic
  `돌보는 이의 후계자`. This is distinct from the capitalized rank
  `Tender`.
- `4390`: added the complete title pairing
  `끝없는 황폐(The Perpetual Desolations)`. The exact English duplicate at
  `61986` already has the same paired Korean title.
- `4426`: corrected the Korean parenthetical to the established
  `이드리스 테오넨(Idris Theonen)`. The English row misspells the name as
  `Idiris`; the same asset's NPC symbol and the other language/source rows
  support `Idris`.
- `4480`: separated the people and personal name as
  `알마인(Almain) 알라드(Alard)`, matching the established form at `53189`.

The same `Idris Theonen` correction was applied at `60012`, another row in the
same quest context.

## Retained

- `4311` and `4337` already contain the supported corrections from the
  earlier `4000`-`4999` edit batch.
- `4422` already uses the complete `마스터 벨른(Master Belne)` form applied
  in the earlier `2500`-`2749` follow-up.
- `4446` already uses `하트바인`; related references `24448` and `25441`
  were aligned in the earlier `24250`-`24499` edit batch. The separate
  `hollow of Gorguath` question at `41178` remains unresolved.

## Verification

- All ten in-range candidates have decisions in the accompanying manifest.
- Korean `Texto` fields changed only at `4293`, `4315`, `4383`, `4390`,
  `4426`, `4480`, and related row `60012`; only those seven ledger
  fingerprints were refreshed.
- The complete ledger, context index/catalog, CSV-preservation tests,
  context-index tests, row structure, newline inventory, and CRLF-aware diff
  check passed.
- Sequential candidate reconciliation now covers 247 of 4,015 candidates
  (6.15%); 3,768 remain unreconciled.
- No commit was made.
