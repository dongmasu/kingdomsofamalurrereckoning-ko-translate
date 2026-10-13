# Preliminary Language Scan: `default` IDs 6050-6099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6050-6099.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6051 | `Confront Angharad Glyndowr` → `대면하기` | Check whether quest `Confront` requires a stronger “confront/challenge” sense than neutral face-to-face meeting. | English/Japanese/Chinese all indicate a confrontation; Korean's `대면` may soften the objective. | Medium |
| 6052 | `Master Farraglen Raw Prismere` → `생 프리즘미어` | Confirm the crafting-material name and whether `Raw` is a grade/name or generic descriptor; standardize Prismere. | All sources say to bring raw Prismere to Master Farraglen. Korean follows English components, but `생 프리즘미어` and spelling require glossary review. | Medium |
| 6054 | `Singing Nell` → `노래하는 넬` | Confirm whether this is a nickname/title and standardize Ayten. | English/Japanese identify a recluse's journal; Chinese interprets Nell as a singer. Korean retains the epithet and location. | Medium |
| 6055 | `the Well` → `영혼의 샘(Well)` | Use the established `Well of Souls` name if this shorthand is confirmed; preserve the quoted appraisal. | English says “the Well,” while Chinese expands it to Well of Souls and Japanese says simply the Well. Korean includes the likely full name parenthetically. | Medium |
| 6059 | `Corialia Scathe's dark crusade` → `어두운 성전` | Keep the term provisional: `crusade` may mean a campaign, while Japanese/Chinese imply reform or experimentation. | English frames it as a dark crusade; the other versions diverge. Korean follows English literally. | Medium |
| 6060 | `Death's Cryptic Hand` → `죽음의 비밀스러운 손` | Confirm whether this is a named artifact/personification and preserve the ceremonial “presenting” register and title. | The source calls it the instrument of immortals and “her eminence”; Japanese/Chinese parse the opening differently. Korean retains the title-like form. | Medium |
| 6063 | `licks of the rock` → `바위를 조금 핥아 보게` | Retain the strange hospitality offer until its cultural/material context is known; do not silently normalize the rock reference. | All sources preserve the unusual rock-licking offer. Korean keeps the literal oddity and friendly invitation. | Low |
| 6064 | `quite fair` → `피부가 희고` | Confirm whether `fair` describes pale skin or beauty; retain red hair, cheek tattoo, and three-day search. | English is ambiguous; Japanese says beautiful, Chinese/Korean describe fair/pale appearance. | Medium |
| 6072 | `Steward of Tinctures and Elixirs` / `Font` | Preserve that the title is self-invented but the work is vital; confirm tincture and magical-source terminology. | English/Japanese/Chinese agree on the speaker's deliberately meaningless title and important Font-testing role. Korean retains that contrast. | Medium |
| 6075 | `You shouldn't be able to do that` → `그런 일은 할 수 없어야 해` | Preserve disbelief (“that should be impossible”), not a claim that the player personally lacks ability. | Korean correctly keeps the rhetorical reversal in both clauses and matches English/Japanese. | High |
| 6076 | `Scavs` / `Frostbreak Sea` → `스캐브` / `프로스트브레이크 해` | Confirm creature taxonomy and the proper region name; preserve that they arrive from the south and prey on cargo and crew. | English/Japanese/Chinese agree on the creature's non-native status and ship infestation. Korean follows the source and keeps the threat. | Medium |
| 6080 | `Tirnoch!` → `티르노크를 위하여!` | Check whether this is an invocation “for Tirnoch” or merely the shouted name; English/Chinese do not include “for.” | Japanese explicitly says “for Tirnoch,” which Korean follows. The added purpose is not present in English. | Medium |
| 6084 | `Anokatos' Counsel` → `아노카토스의 참모` | Determine whether Counsel is an individual adviser, a group, or counsel/advice; retain the plan to learn from them. | English capitalizes Counsel; Japanese says adviser and Chinese says staff/strategist. Korean chooses `참모`. | Medium |
| 6085 | Experience potion recipe / four reagents | Preserve the five line breaks and quantities 3/2/2/1; verify official ingredient names. | All four CSVs have five explicit line breaks and matching quantities. Japanese/Chinese/Korean ingredient forms vary, but Korean follows the English ingredient identities. | High |
| 6090 | `The seasons of the Summer Court are numbered` → `남은 계절은 얼마 없어` | Retain the idiom that the Court's time may be limited; do not read it as a literal count of seasons. | Japanese/Chinese explicitly say time remains short; Korean conveys the same impending decline. | High |
| 6093 | `55% chance to siphon health` → `체력 흡수 확률 55%` | Confirm whether the effect is health steal/life drain or a named combat modifier; preserve the 55% value. | English/Japanese/Chinese agree on the 55% chance and health-siphon effect. Korean retains the value. | Medium |
| 6094 | Desert Runner / Rattlesnake fable | Preserve distinct speakers, the repeated requests, and the moral around wings/freedom; retain paragraph and line breaks. | English, Japanese, Chinese, and Korean all retain eight explicit line breaks. Korean preserves the refusal and the Rattlesnake address. | High |
| 6095 | `NNN` | Leave unchanged as a developer/test placeholder unless placeholder localization is explicitly decided. | All four locales contain the same `NNN`. | High |
| 6096 | `with Level 1 Familiar` → `레벨 1 사역마와 함께` | Align `Familiar` with the project's summon/companion mechanic terminology. | English/Japanese/Chinese refer to a level-1 Familiar; Korean uses `사역마`, a plausible mechanic term. | Medium |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6052, 6055, 6059-6060,
  6063, 6072, 6075-6076, 6084-6085, and 6090, 6093-6096 against active
  Korean and matching source rows.
- Same-numbered questions for other resource types were kept separate.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts and brace-delimited runtime-marker identities
  match across all four locales.
- Recipe quantities at ID 6085 match in order; ID 6094 preserves eight
  explicit line breaks in every locale.
- No active CSV structure or text was changed.

## Batch Status

IDs 6050-6099 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
