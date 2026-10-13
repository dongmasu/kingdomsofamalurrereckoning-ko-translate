# Preliminary Language Scan: `default` IDs 6500-6549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6500-6549.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6502 | `Fulcrum` → `지렛받침` | Confirm the official item-part term; do not globally normalize without reviewing the item family. | English names a Mitharan item component; the current Korean is a literal rendering whose fit as an item part remains uncertain. | Medium |
| 6506 | `The Kings of the South stood` → `남쪽의 왕들이 일어섰고` | Retain the poetic ambiguity for the consolidated literary pass; “stood” may mean stood/rose in this compressed history. | English says “stood,” Japanese says the kings rose, and Chinese more literally says they stood. Korean follows the Japanese-like rising sense. | Medium |
| 6521 | `Heel` → `뒤축` | Confirm the canonical equipment-part term and keep it consistent with related Mitharan item names. | The isolated crafting component may be a heel/foot part; the current literal form is plausible but not established by the references. | Medium |
| 6527 | `Bone Wall` → `뼈의 벽` | Treat as a possible named location rather than an ordinary wall; verify through quest context and naming convention. | Another English row identifies Bone Wall as the place where bounties/contracts are posted; Japanese describes a notice board, while Chinese retains the literal name. | Medium |
| 6544 | `Guardian` → `수호자` | No clear Korean defect found; correct the historical open-question label from `Warden` to `Guardian` when reconciling that record. | The English source says `Guardian`, and Japanese/Chinese use guardian/protector terms. Korean `수호자` follows the active source; the historical question's source term is mismatched. | High |
| 6549 | `weapon's Core` → `무기의 핵심부` | Consider the established item term `핵` for a capitalized weapon Core; confirm the intended UI/lore label before changing. | English capitalizes `Core`; Japanese and Chinese also say core. Other active Korean rows use `혼돈 무기의 핵` for Chaos Weapon Core. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6502, 6505-6506, 6515,
  6517, 6519, 6521, 6527, 6529-6530, 6535, 6540, and 6544.
- ID 6544's historical note says `Warden`, but the English source row is
  `Guardian`; Korean agrees with English and the supporting references.
- The numeric wording at ID 6506 (“one” in Japanese) and ID 6538 (“two of
  us” in Japanese) does not change the source meaning; recipe quantities
  `2, 1, 2, 1` at ID 6507 and the `01` label at ID 6535 are preserved.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- No line-break or runtime-marker identity/order mismatches were found.
- Numeric values match across locales; localized number wording is
  semantically equivalent.
- No active CSV structure or text was changed.

## Batch Status

IDs 6500-6549 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
