# Preliminary Language Scan: `base` IDs 650-749

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 650-749.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Checked applicable project terms in the official Korean manual glossary.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 681 | 페퍼 약제사의 조합약 | Consider a natural name order such as `약제사 페퍼의 조합약` if `Pepper` is the apothecary's name/title. | English `Apothecary Pepper's Concoction` and Chinese place the apothecary/title before Pepper; the current Korean can parse as “Pepper the apothecary.” English is retained in neither the Korean text nor parentheses here. | Medium |
| 690 | 비취 유골함 | Confirm whether `Jade Urn` is specifically funerary; reconcile with the broader `Urn` concern at ID 549. | English and Japanese use a general urn/jar, while Korean narrows it to a funerary ash container. | Medium |
| 721 | 개량된 변위 장식 | Recheck the item-property term `Displacing` alongside `base` ID 102. | The current literal `변위` is opaque without knowing the item's effect; Japanese transliterates it and Chinese uses a displacement/replacement sense. | Low |
| 738 | 기술서(은신 감지) | Use the official-manual form `숨겨진 물건 찾기` for `Detect Hidden`, pending any documented UI-specific exception. | The project glossary explicitly gives `Detect Hidden = 숨겨진 물건 찾기`; current `은신 감지` changes the sense from finding hidden objects to detecting stealth. | High |
| 748 | 활성화의 보석 | Verify the intended effect of `Galvanizing` and align it with the related affix at ID 33. | Japanese suggests strengthening, Chinese suggests electrification, and English is polysemous. Korean chooses “activation”; the item's mechanic is needed before settling a term. | Low |

## Other Checks

- ID 714 follows the official glossary for `Ward` (`워드`).
- IDs 583 and 621 use `여름 궁정` and `발라드 가문`, respectively; retain them as evidence in the cross-corpus `House of ...` naming decision.
- IDs 569 (`Century Plant`) and 701 (`Sorrogweth Fungus`, in a later batch) should not be conflated; `용설란` is a recognized plant name for this row.

## Batch Status

IDs 650-749 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
