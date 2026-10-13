# Preliminary Language Scan: `default` IDs 20651-20700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 20651-20700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 20652 | Gnome Effie / Byrnes | Retain the source's suspicion without turning it into a settled accusation. | Korean preserves the warning about Effie's covetous look and the speaker's distrust of Byrnes. | Low |
| 20657 | Mitharu / `Take what I have` | Preserve the shift from refusing gold to offering possessions and prayer. | Korean keeps both actions and the prayer promise; Mitharu spelling remains a glossary check. | Medium |
| 20660 | Keep Armory / `요새 무기고` | Determine whether Keep is a named fortress or generic keep. | Korean uses the generic `요새`; the historical question remains open. | Medium |
| 20665 | Ynadon / Red Legion / `desires` | Clarify whether the term means a divine wish, command, or goal. | Korean uses `위나돈의 뜻`, preserving the speaker's justification for choosing another path. | Medium |
| 20666 | `fateful stand` / `king of Moon` | Clarify whether Moon is a named place/title and how the rebel became its king. | Korean retains the unusual “king of the Moon” image without adding a camp or realm not named in English. | Medium |
| 20667 | Chapter / sagecraft lectures | Align the institutional branch and Sagecraft terminology. | Korean uses `학회 지부` and `마법물품 제작`; the historical audit flags both the capitalized Chapter and the official craft term. | High |
| 20668 | `A newcomer.` / `새로 왔나 보군.` | Check whether the Korean question-like phrasing matches a neutral label/fragment. | English is a short nominal fragment; Japanese is a question. Korean also reads as a question, so UI/dialogue context may matter. | Low |
| 20678 | Demo Mode / Debug to Agarth | Retain as a possible developer/debug label; do not assume it is player-facing. | The row explicitly contains an internal debug instruction. | High |
| 20680 | Two-stage attack description | Preserve each attack's distance, damage categories, duration, costs, and layout. | Korean keeps both stages, all numeric values, and the same four line breaks as the source. | High |
| 20685 | capitalized `Counsel` / `고문단` | Determine whether this means an individual adviser, a council, or a named group. | Korean selects a collective advisory body; English capitalization and the choice conflict require context. | Medium |
| 20687 | Dren's twin sister / immunity | Preserve the final question rather than silently converting it to an assertion. | English ends “She was immune to his power?” and Japanese also asks; Korean states that she was immune. Chinese also uses a declarative ending. | High |
| 20690 | Relentless Assault / `renewed vigor` | Confirm the skill name and whether vigor is health, stamina, or another resource. | Korean preserves the localized upgrade marker and says attacks restore some `활력`; resource meaning remains open. | Medium |
| 20693 | Motus Mining / `slave ship` | Retain the labor-exploitation simile without making a literal claim. | Korean preserves the dismissive comparison to a slave ship and distinguishes the two employers. | Low |
| 20696 | Dren, Defender of Pride / `오만의 수호자` | Align Pride with the House/faction terminology without prematurely selecting a canon form. | Korean's `오만` is one of several Pride renderings; prior reports already record `긍지`, `용맹`, and other House variants. | High |
| 20697 | Quarry: Bloodgrin / `블러드그린` | Confirm whether this is a map label or location name and standardize Bloodgrin. | Korean retains the quarry label but the proper-name spelling is unverified. | Medium |
| 20700 | Beggar's Bluff / Tirin's Rest | Align both place names and the quest-journal action. | Korean retains the murder and reward objective; Tirin's Rest appears elsewhere as both `티린의 쉼터` and `티린의 안식처`. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 20652, 20657, 20660, and 20665-20667,
  20678, 20680, 20685, 20687, 20690, 20693, and 20697 against the active
  four-locale rows. Their questions remain open; no historical note
  authorizes a translation edit.
- Cross-checked `Boggart` spellings in the active corpus. The isolated UI
  label at ID 20661 is `처치한 보기`, while creature references elsewhere
  include `보가트` and `보기트`; retain this as a high-priority consistency
  candidate rather than normalizing it here.
- Cross-checked `Defender of Pride` with prior House of Pride findings and
  Tirin's Rest variants; canonical forms remain undecided.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 20651-20700 exactly
  once and in identical order.
- Physical line-break counts match, including the multiline ability at
  ID 20680.
- Runtime marker IDs/order match at ID 20690; the upgrade label is localized.
- Numeric values at ID 20680 match across all four locales.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 20651-20700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
20701.
