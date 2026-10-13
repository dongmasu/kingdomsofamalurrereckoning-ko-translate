# Preliminary Language Scan: `default` IDs 27101-27150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27101-27150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27101-27103, 27105-27114, 27117-27124, 27127-27135, 27138-27140, 27143-27150 | Dialogue, lore, quest, and concise UI/item text | Recheck tone, idiom, and recurring names during integrated review. | Korean generally retains English meaning and Japanese tone. Named persons and settings remain candidates for the project-wide terminology pass. | Medium |
| 27104, 27126 | The Widow / Pledgeshield | Standardize whether each is a proper name, title, creature, or rank, and settle the Korean display form. | Korean transliterates The Widow as `위도우` and Pledgeshield as `서약의 방패`; other rows use generic `과부` or forms such as `서약방패병`. Historical questions leave both status and canonical form open. | High |
| 27107, 27110, 27116, 27121-27122, 27150 | Cycle / Dispelling / Codex of Destiny / Stone / Ysa's Summer / fate threads | Align named metaphysical, ability, artifact, and event terms without treating capitalization alone as proof of a proper name. | Korean uses `순환`, `마법 해제`, `운명의 서`, `돌`, `이사의 여름`, and `운명의 실`; the Codex form agrees with established draft use. Historical terminology questions remain open for the Codex, Stone, and Weave concepts. | Medium |
| 27115, 27137 | Ballads Oratory / Font | Confirm the named institution/place and the procession requirement; distinguish the proper `Font` from a generic spring if context requires. | Korean uses `발라드의 기도실` and `샘(Font)`. Japanese identifies the first as the House of Ballads Oratory and treats the second as the named Font; the source-keyed historical log specifically flags both terms. | Medium |
| 27125 | “We're going on ten years” -> `십 년째` | Check whether Korean should retain the source's approximate/approaching-decade nuance rather than assert that ten full years have elapsed. | English uses “going on ten years”; Japanese says ten years have already passed. Korean follows Japanese with `십 년째`. | Medium |
| 27142 | “the crown will emerge” -> `왕관이 모습을 드러낼 거야` | Determine whether `crown` means a royal crown or a tree canopy/crown. | English is ambiguous without context. Korean selects the royal-object sense; the historical log specifically notes the possible tree-canopy meaning and divergent locale readings. | High |
| 27139, 27141, 27146 | collections box / betrayal fragment / Paddy's Materials and Gallery | Preserve the request/object, the unfinished betrayal fragment, and the floor/gallery construction details; check role and item terminology. | Korean retains the donation request, does not invent the missing betrayer in the fragment, and preserves the second-floor Gallery project. | Medium |
| 27149 | `Expedition` -> `원정대` | Check whether this standalone label denotes the expedition itself or the party undertaking it. | Korean selects the group reading; English is a single context-free label and Japanese uses the activity noun. | Low |

## Historical Audit Reconciliation

- Historical questions in the 27100-27199 range include the names/titles
  The Widow and Pledgeshield, Ballads Oratory, the Codex/Stone and Ysa's
  Summer, the Font, and the ambiguous `crown` at ID 27142.
- ID 27100 separately flags `Plasma` for terminology alignment. Korean uses
  `플라스마`; retain it for comparison with related elemental/effect strings.
- Earlier `The Widow` and Pledgeshield reports document conflicting Korean
  forms; those are consistency evidence, not a decision to normalize this
  batch.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27101-27150 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. No unexpected Unicode format character was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27101-27150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27151.
