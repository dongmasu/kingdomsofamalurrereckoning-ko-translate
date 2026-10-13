# Preliminary Language Scan: `default` IDs 20251-20300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 20251-20300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 20251, 20254, 20256, 20265, 20269, 20278-79, 20287, 20291 | Gwyn Anwy, copy/original key, `icen` gem, Rathir-above, Gaea, Ariad, Kollossae, Wending, Breath of Arba, Bhaile/Winter Court | Confirm names, distinct people/place/group readings, and item terminology. | Korean preserves the key's copy/original distinction and the quest sequence; name and lore spellings remain historical glossary candidates. | Medium |
| 20258 | Blood Doge / `혈통독` | Align this title with the same source term at ID 20141 and verify its Korean form. | ID 20141 renders `Blood Doge` as `피의 도제`; ID 20258 uses `혈통독`, which is inconsistent and reads unusually in Korean. | High |
| 20270 | Blevins House / `블레빈스 가문` | Confirm whether House names a family/faction or a physical residence. | Korean selects the family reading; Japanese and Chinese lean toward a house/building. | Medium |
| 20286 | Mitharan Spiritweave Mitt / `미사란 영혼결 무릎 장갑` | Verify the item type and body-part term. | English `Mitt`, Japanese `ミット`, and Chinese `手套` point to a hand covering; Korean says “knee glove.” | High |
| 20289 | Scholia Arcana / `아르카나 대학` | Confirm the institution's established Korean name and whether its proper name is being over-generalized. | English names the institution; Korean uses “Arcana University,” while the historical audit calls for its official name. | Medium |
| 20203, 20209, 20227, 20234, 20242-43, 20246, 20293-95, 20299 | Grand Bursar, developer/UI labels, trade goods, service/allegiance, Family Arms, House of Pride, Litanies, unnamed `it` | Retain context-dependent readings and confirm project terminology without silently resolving source ambiguity. | Relevant distinctions are recorded in the historical audit; Korean generally follows the English meaning, while `Family Arms` remains ambiguous between weapons and heraldry. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 20251, 20254, 20256, 20258, 20262,
  20265, 20269, 20277-79, 20284, 20286, 20289, 20291, and 20293-95, 20299
  against the active rows. They remain preliminary; no historical note
  authorizes a translation edit.
- Confirmed that ID 20284 preserves the mutually exclusive delete/continue
  choices with saving disabled; ID 20295 leaves the object of `it` implicit.
- The repeated `Blood Doge` inconsistency and the `Mitt` body-part question
  were also checked directly against the other locale rows and prior draft.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 20251-20300 exactly
  once and in identical order.
- Physical line-break counts and normalized runtime-token class/order
  signatures match across all four locales.
- IDs 20219 and 20222 preserve their localized skill/bullet markers and
  values: +30% mitigation; trigger chance 70% below 25% Health; 20% restore;
  +70% Damage for 10 seconds; and 300-second cooldown.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 20251-20300 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` ID 20301.
