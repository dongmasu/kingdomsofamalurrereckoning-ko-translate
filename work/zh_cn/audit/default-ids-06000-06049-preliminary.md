# Preliminary Language Scan: `default` IDs 6000-6049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6000-6049.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6001 | `Shieldbrother` → `방패 형제` | Confirm whether this is a formal greeting, companion title, or faction rank; preserve the address register. | English/Chinese treat it as a shield-brother title, while Japanese renders a generic companion. Korean follows the literal title reading. | Medium |
| 6002 | `{*1[Passive]}` / Staff passive | Localize or confirm the visible `[Passive]` label inside the wrapper, preserving wrapper ID `*1`; retain the staff-damage effect. | Japanese/Chinese localize the label, but Korean leaves it in English. The wrapper identity and order are unchanged; body text correctly says the skill increases Staff damage. | High |
| 6004 | `Preordained` → `예정된 자들` | Confirm whether this capitalized word names a faction/group or means people destined by Fate; compare with earlier occurrences. | English is a standalone capitalized label, Japanese/Chinese give destiny-related terms. Korean uses a plural descriptive reading. | Medium |
| 6007 | Oleyn / Maid verse | Preserve the compressed verse-like relation among the plague village, cure, and the Maid as Oleyn's test; standardize the Maid title. | English uses semicolon-separated poetic syntax; Korean converts it to prose but retains the cure as Oleyn's task and the Maid as her test. | Medium |
| 6009 | `Flawless Mitharan Prosperous String` → `완벽한 미사란 번영의 실` | Keep the item components provisional; clarify whether `Prosperous` names a modifier/material property. | The isolated crafting name is opaque across all languages. Korean preserves the material and modifier without inferring a game effect. | Low |
| 6013 | `gallivanting` / `pit` / Arena | Preserve the dismissive tone and clarify whether the pit is a staging area below the Arena; do not change the forced entry sequence without context. | The sources differ on where Magnus went and how the team entered. Korean retains that the player was away, guards went to the pit, and the team was forced into the Arena. | Medium |
| 6014 | Great Father / Reverie / General Masterson epitaph | Review the appositional epitaph syntax and the sense of `Reverie`; preserve the memorial address and Alfar Army title. | English is compressed and Japanese/Chinese interpret the haunting “face” differently. Korean retains the Great Father, the Tuatha association, and General Masterson, but the relation among titles remains unclear. | Low |
| 6016 | `seal on the Sorrows` / new vessel | Confirm whether the plural `Sorrows` is a force/group or the House of Sorrows; preserve the leak into Amalur and collection into a vessel. | English/Japanese/Chinese all describe a released seal and something bleeding into Amalur. Korean renders Sorrows as `비탄` and leaves the vessel unspecified. | Medium |
| 6020 | `The Font` / `Lyceum Grove` | Confirm the formal name/type of the Font and Grove; keep the distinction between possession and control. | English calls it the Font, Japanese substitutes a named spring, and Chinese says sacred spring. Korean follows English and keeps both magical functions distinct. | Medium |
| 6026 | `with Bows` → `활 사용 시` | Preserve as an isolated UI/category fragment and check whether it modifies an adjacent skill/effect. | All versions are fragments; Korean makes the bow condition explicit without adding a subject. | Medium |
| 6032 | Eight-line Ahnrun / Draug / Solsvard poem | Preserve English lineation and review `blood-pall and fasting`, the hunt, and named entities together. | English, Chinese, and Korean have seven explicit line breaks (eight lines); Japanese has six (seven lines), combining material. Korean follows English structure. The meaning of the Draug pursuit phrase remains uncertain. | Medium |
| 6036 | `Great Scale` / `reverie` → `위대한 저울` / `몽상` | Confirm whether Great Scale is a named concept and whether Reverie is a waking dream/state rather than ordinary daydreaming. | English/Japanese/Chinese identify a mysterious force and interrupted Reverie; Korean follows the metaphor while keeping both terms literal. | Medium |
| 6038 | `Shocking damage` → `감전 피해` | Keep the official damage-type term consistent and distinguish shocking damage from stun. | English says Shocking damage can affect nearby enemies; Chinese explicitly mentions stunning, while Japanese/Korean focus on chaining damage. Korean follows English/Japanese and preserves the large-group tutorial. | Medium |
| 6044 | `Argine, Queen of Staves` → `홀의 여왕 아르진` | Confirm whether `Staves` means staffs or the tarot/card suit; standardize Argine's name and title. | Japanese/Chinese translate it as a staff queen; Korean uses `홀`, which can suggest a card suit. The isolated name does not resolve the intended title. | Low |
| 6048 | boots urge the wearer to hunt | Preserve the boots' agency and the curse-like compulsion to take blood/life; retain the “all creation as prey” conclusion. | English/Japanese/Chinese all personify the boots as driving the wearer. Korean explicitly keeps the boots as the cause and the wearer as agent. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6001-6002, 6004, 6007,
  6009, 6013-6014, 6016, 6020, 6026, 6032, 6036, 6038, 6044, and 6048
  against active Korean and matching source rows.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- The `*1` wrapper identity/order at ID 6002 is retained; its localized label
  text differs across locales as noted above.
- ID 6032 has a source line-break discrepancy: Japanese has one fewer break;
  Korean matches English and Chinese.
- No other explicit line-break mismatches were found in this range.
- No active CSV structure or text was changed.

## Batch Status

IDs 6000-6049 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
