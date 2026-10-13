# Consolidated Context Review: `default` IDs 23451-23500

- Review date: 2026-10-11.
- Scope: the twelve uncertainties remaining in IDs 23451-23500 after the
  cross-range `Knave of Coins` review at D-18633 resolved ID 23460.
- Result: all twelve resolved (one accepted edit, eleven `not an issue`).

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18634 | 23461 | Tuatha Deohn / Amethyn / escaped quotes | not an issue | Korean retains the faction, fortress, and prophecy. Backslash-escaped quotation marks recur throughout the active Korean resource, including IDs 3381, 3446, 14818, and 14981; this is an established serialized-text convention, not evidence of a translation error. |
| D-18635 | 23463 | Hierophant's blessing / riches | not an issue | The offer to train the listener to find riches and the blessing are preserved. `대사제(Hierophant)` conveys the role and retains the exact source term. |
| D-18636 | 23465 | Cynric family / Whitestone / Apotyre | not an issue | The family's crimes, their end, the Whitestone population, and the entire Apotyre region remain explicit; names are paired with their English spellings. |
| D-18637 | 23466 | Rogue 01 Reckoning | not an issue | The literal label is translated consistently with English and Japanese. Whether the resource is internal/test text or player-facing does not establish a defect in the Korean wording. |
| D-18638 | 23468 | Emberwood / seasteel / beachstone | not an issue | All five listed materials, their island availability, and the safety caveat remain. Korean translates the descriptive compounds and retains the named Emberwood spelling. |
| D-18639 | 23469 | Testament / poison and cistern | not an issue | English's Testament reading controls despite the Japanese/Chinese Belen divergence. The Korean identifies the target followers and retains the poisoning and cistern actions; ID 23116 / D-18551 uses the same English-led source policy. |
| D-18640 | 23474 | Moon Camp | not an issue | Repeated Traveler-camp context confirms this is a named camp; `달빛 야영지` is a direct, readable rendering of the English compound. |
| D-18641 | 23478 | Motus Mining Interest | accepted | Change `모투스 광업 조합` to `모투스 광업 회사`, reusing the company reading accepted at ID 14591 / D-4421. English describes the organization as necessary to build Adessa; Japanese also identifies a company. |
| D-18642 | 23481 | stalwart Jottun / great Hero | not an issue | English's steadfast/strong `stalwart` is rendered as `굳센`; the Jottun's survival and the Hero's return remain. Japanese's servant reading does not override English, while Chinese supports loyalty. |
| D-18643 | 23485 | “This translation was a fun read” | not an issue | Korean preserves the literal meta-reference and positive reaction. Uncertainty about whether it is test or in-world text does not change the sentence's meaning. |
| D-18644 | 23487 | faltering quote / escaped quotes | not an issue | Korean preserves the repeated false start, hesitation, and dry reply. The backslash-escaped quotation marks follow the same active-resource convention noted at ID 23461 and are retained unchanged. |
| D-18645 | 23499 | Darkvari father-to-son map | not an issue | The map's generational transfer from father to son and the family's hidden treasure locations are preserved; Japanese and Chinese also identify a family. |

ID 23460 is resolved under D-18633 and is not recounted here. The earlier
working dispositions at IDs 23451-23500 are reconciled in
[`disposition-batch-default-23451-23500-20261010.md`](disposition-batch-default-23451-23500-20261010.md).

## Edits and Verification

Only active Korean `Texto` at ID 23478 changed in this range:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23478 | `모투스 광업 조합(Motus Mining Interest)` | `모투스 광업 회사(Motus Mining Interest)` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-motus-interest-23478-D18641/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`1bfcfcb90cffd9eeb7012840e884c2391d0e7a40ae29dfbbb9764370349bf806`.
Post-edit SHA-256:
`948c47834e4f0bd68b03a25b09e6947ad850d488cb265b84e121840a26fb0d90`.
Byte comparison against the backup confirms only ID 23478 changed. The
UTF-8 BOM, 65,135 data rows, 72,011 CRLF endings, and 73 pre-existing
bare-LF endings remain. English, Japanese source, Japanese-derived Korean,
Chinese, and active Korean each contain IDs 23451-23500 once and in identical
ascending order. Values at ID 23455, percentages/damage/duration at 23484,
and the `2층` value at 23500 remain intact. The quote escapes at IDs 23461
and 23487 were preserved; no runtime marker or line-break discrepancy was
introduced.

The full 23451-23500 uncertainty set is resolved: ID 23460 is covered by
D-18633, and this range's twelve remaining keys add one accepted and eleven
`not an issue`. Totals are 2,076 accepted, 23,534 `not an issue`, and 12,914
uncertain (38,524 counted). Active default SHA-256:
`948c47834e4f0bd68b03a25b09e6947ad850d488cb265b84e121840a26fb0d90`.
Next D-18646 at ID 23501.

These are working dispositions, not independent final linguistic approval.
