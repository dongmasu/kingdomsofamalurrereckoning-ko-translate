# Disposition Batch: `default` IDs 65101-65134

- Date: 2026-10-11. Rechecked all 34 Korean rows against English, Japanese
  source, Japanese draft, and Chinese source by `ID_Linha`; reconciled
  historical questions and the prior runtime-price spacing decision.
- One accepted targeted correction, 25 `not an issue` IDs, and eight
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18161 | 65109 | `돈을 내겠어. ($VMC_NQD.cost_mine$골드)` | `돈을 내겠어. ($VMC_NQD.cost_mine$ 골드)` | Add the source-supported space before `골드`, reusing the accepted runtime-price formatting at ID 64685 / D-18134 while preserving the variable byte-for-byte. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18162 | 65101 | The Cillian Keen reference is clear, but both the personal-name and Cape Solace Korean forms differ across sources and remain globally unsettled. |
| D-18162 | 65107 | The high-cost specimen test is retained, but English leaves who sent the specimens and their destination unclear; Japanese and Chinese diverge on the testing relation. |
| D-18162 | 65110 | The meeting objective is clear; `Foes' Hearth` may be a named place and its Korean name/display convention is not established. |
| D-18162 | 65112 | Capitalized standalone `Servant` may be a title or a generic domestic role; no scene context resolves it. |
| D-18162 | 65118 | `Agent of change` may mean an agent/embodiment or a messenger; Japanese supports `사자`, while English and Chinese do not require an emissary reading. |
| D-18162 | 65127 | The guard/meeting instruction is preserved, but Oathblade's formal rank and Gwyn Anwy's Korean name form need terminology alignment. |
| D-18162 | 65132 | English `appended to the box` does not specify inside versus attached outside; Japanese and Chinese differ, so retain the neutral current phrasing. |
| D-18162 | 65134 | `Three Swords` may be a blademaster's name/title or a collective; Chinese's “legendary three swords” differs from the English/Korean reading. |

## Not an Issue

Decision D-18163 records these 25 IDs: 65102-65106, 65108, 65111,
65113-65126, 65128-65131, and 65133. Current meanings, voice, values,
and structure are preserved. ID 65104 correctly translates the intended
vengeance despite the English source misspelling `Vengance`.

## Structural and Historical Reconciliation

- English source, Japanese source, Japanese draft, Chinese source, and active
  Korean each contain 65,135 records with identical unique ascending IDs
  0-65134. All 34 target IDs occur once in each file and in identical order.
- The `default` schema has no `Tipo_Variante` field; no variant sequence
  applies. The CSV separator is semicolon, and `Texto` may contain embedded
  line breaks.
- `$VMC_NQD.cost_mine$` at ID 65109 remains byte-for-byte intact and in the
  same order; only the separating space before `골드` was added. No embedded
  line-break, marker, or numeric-value discrepancy was found in the range.
- Only the active Korean `Texto` cell at ID 65109 changed. UTF-8 BOM,
  65,135 data rows, ID order, and record separators are preserved.
- Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-65101/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `7e4578a43ddb86b9e9a3e5a128ae4e56732b3be53c2f1c82afab50a28066f5cf`.
  Post-edit SHA-256:
  `58d4b88f79266b94f30af1bcb86d1b38d7d5407d859c3effbae49f3cfd51995c`.
- D-18161 records one accepted correction, D-18162 records eight uncertain
  findings, and D-18163 records 25 `not an issue` IDs. Cumulative register
  counts through D-18163: 1,865 accepted, 17,234 `not an issue`, and 12,842
  uncertain (31,941 dispositions); next D-18164.

The contiguous `default` disposition pass is complete through ID 65134.
These are working dispositions, not independent linguistic approval.
