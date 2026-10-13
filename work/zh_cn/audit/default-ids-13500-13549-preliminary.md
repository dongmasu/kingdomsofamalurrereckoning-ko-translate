# Preliminary Language Scan: `default` IDs 13500-13549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13500-13549.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13500 | `The White At War` -> `전쟁터의 백색` | Identify whether “White” names a person/group or refers to a visual image before finalizing this fragmentary title. | English capitalization is inconclusive; Korean retains an equally fragmentary title. Historical question remains open. | Medium |
| 13502 | Cape Solace / master-at-arms | Use the established Cape Solace spelling and confirm the military office title. | Korean has `초솔러스 곶`, while the active corpus predominantly uses `케이프 솔러스(Cape Solace)`. `무기 담당관` is also less specific than the established `무기 교관` candidate. | High |
| 13503 | `#NAMED_ICON_MOUSE_BUTTON_1#` / dark sigil | Preserve the icon token exactly and keep the instruction's condition/result clear. | The exact token appears once in all four locales. Korean retains the cursor-over-sigil condition and the ward explosion consequence. | Low |
| 13507 | `make their living with the sword` -> `칼을 팔아 생계를 꾸려` | Review a likely meaning shift: the English idiom means earning a living by using a sword, not selling swords. | Japanese and Chinese say they live/work by the sword; Korean says they sell swords for a living. The following reference to what the gnomes did does not require a merchandise reading. | High |
| 13510 | Telogrus -> `텔로그루스` | Keep the established proper-name spelling. | The current form matches the predominant active-corpus rendering. Historical question remains open. | Low |
| 13511 | `Fellfire Pit` -> `펠파이어 구덩이` | Confirm whether this is a named arena/place and align the place-name construction. | English treats it as a capitalized location; Korean transliterates Fellfire and translates Pit. | Medium |
| 13512 | Fae `reverie` -> `몽상` | Determine whether reverie is a formal Fae practice/state and whether it means meditation, trance, or dreamlike reverie. | Japanese says meditation; Chinese says fantasy/reverie. Korean's `몽상` may suggest idle daydreaming and should be checked against lore context. | Medium |
| 13514 | Sagecrafting with Chaos Magic | Retain the established Sagecraft term and verify the relation between Sagecrafting and Chaos Magic. | Korean uses the established `마법물품 제작` form and says it is done using Chaos Magic. Japanese/Chinese phrase the relation differently. | Medium |
| 13520 | Longsword stats / `+6` / `+15%` | Preserve both bonuses, their values, weapon scope, and the source line break. | Korean retains `+6` physical damage and `+15%` damage with longswords. The single embedded line break matches all locales. | Low |
| 13524 | `Your points... are fierce!` -> `네 점수... 대단하군!` | Determine whether points means arguments, a score, or a point of view. | English is isolated; Japanese/Chinese/Korean diverge in how they interpret `points`. The score reading in Korean remains provisional. Historical question remains open. | High |
| 13525 | Phasmer -> `패즈머` | Align the name with recurring active occurrences. | This row uses `패즈머`, while the active corpus predominantly uses `파스머(Phasmer)`. Historical question remains open. | High |
| 13526 | House of Ballads -> `발라드의 집` | Preserve the project's established faction/House name. | The active corpus commonly uses `발라드의 집(House of Ballads)`; this row omits English parenthetical marking but matches the Korean term. | Low |
| 13529 | `Keeps one virile` -> `정력도 유지` | Confirm whether the joke intentionally means sexual potency or general vigor. | The dry-dungeon-air setup is suggestive and Chinese explicitly mentions virility; Korean chooses the sexual-potency sense. | Medium |
| 13534 | Preordained thugs | Confirm the faction form and whether `thugs` is an insult or a literal subordinate group. | Korean preserves the insult and names the Preordained. Historical question remains open. | Medium |
| 13536 | Scavs -> `스캐브` | Verify the official creature name and maintain the target count of 50. | Japanese transliterates the creature; Chinese uses a descriptive insect name. Korean keeps the count and a creature-style transliteration. | Medium |
| 13539 | The Beckoned -> `불려온 자` | Align the capitalized role/title with its canonical project rendering. | Korean uses the provisional title; English capitalization suggests a formal role. Historical question remains open. | Medium |
| 13549 | The Crows -> `크로우즈` | Confirm the established name of this arena team and distinguish it from ordinary crows. | Korean preserves English parenthetically; the isolated label does not prove whether this is a team name. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 13500, 13510, 13524-13525, 13534,
  13539, and 13549 against active Korean and all three source locales. They
  remain preliminary questions; no historical disposition was treated as
  approval.
- Added current-pass candidates at ID 13502 (Cape Solace spelling),
  ID 13507 (swordsmanship versus selling swords), ID 13512 (Fae reverie
  terminology), ID 13529 (virility/vigor), and ID 13536 (Scavs term).
- ID 13503 retains `#NAMED_ICON_MOUSE_BUTTON_1#` exactly once in every
  locale. ID 13520 retains both numeric bonuses and its line break.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range; the only
  embedded line break is at ID 13520.
- Brace, dollar, and hash-token signatures match, including the mouse-button
  icon at ID 13503. No marker-order or structural exception was found.
- Active Korean CSV hashes match the recorded baseline; no active CSV was
  edited.

## Batch Status

IDs 13500-13549 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13550-13599.
