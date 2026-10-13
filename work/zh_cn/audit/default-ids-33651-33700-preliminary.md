# Preliminary Language Scan: `default` IDs 33651-33700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33651-33700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33651 | `브리건드 홀 동굴` for `Brigand Hall Caverns` | Determine whether `Brigand Hall` is a proper location name or a descriptive “brigand hall”; retain the speaker's exasperated reaction. | Korean transliterates the name and preserves the reaction. Chinese translates the components literally; the row alone does not establish the map-name convention. | Low |
| 33653 | `첫 서약자들의 전당` for `Hall of the Firstsworn` | Confirm the group/place name and whether the Hall is where the object was originally forged and must be reforged; preserve the speaker's hesitation. | Korean retains both forging events and uncertainty. The proper name and `Firstsworn` term need corpus consistency review. | Medium |
| 33665 | `슈콜리아 아르카나` for `Scholia Arcana` | Standardize the institution's Korean name across the corpus while retaining this standalone label. | Korean transliterates the English proper name, whereas Japanese and Chinese translate it as an arcane university/academy. Historical entries repeatedly flag the institution's display form. | Medium |
| 33667 | five-line war prophecy | Preserve all five source lines, the war-engine image, Gadflow's name, and the contrast with the former peace; check the elevated/prophetic register and line-by-line syntax. | Korean retains the five-line structure and central claims. The wording is poetic and compact, so its precise relation between the fourth and fifth lines remains a literary review candidate. | Medium |
| 33668 | `봉헌물` / `기도` for `gift` / `Orison` | Confirm whether `Orison` names a specific prayer/rite and whether the gift is a ritual offering; standardize Lyria, Tirin, Temple, and Priestess titles. | Korean interprets the gift as an offering and Orison as a prayer. Japanese preserves `Orison` as a term, while Chinese says prayer; the historical audit leaves the rite's exact sense open. | Medium |
| 33669 | `텐더(Tender)` / `델버(Delver)` | Verify whether `Tender` and `Delver` are formal roles/titles and standardize their Korean display; preserve the joint witness with the Weeping King and Caelrod. | Korean retains both English terms parenthetically rather than translating them. The historical log specifically calls these lore roles out for review; Chinese translates them descriptively. | Medium |
| 33674 | `에스윈 시장이 ... 나와 베오른을 처음 데리고 내려왔어` for `Mayor Eswin brought me and Beorn down first, out of Ironfast Keep` | Resolve what “brought ... down” means (recruited, escorted, removed, or brought from the Keep) and what `first` modifies; retain that pay and enemy strength are both described as weak. | English is ambiguous, Japanese says Eswin hired the two, and Chinese says he knocked them down/drove them out. Korean follows a literal “brought us down first” reading. The historical audit explicitly leaves this event unclear. | High |
| 33681 | `여름 궁정` / `남은 페이들` | Standardize `Court of Summer` and confirm the remaining Fae reference; preserve the Varani's grievance and their proposed overthrow/forced mobilization. | Korean follows the English faction and political claims; the court and group forms remain terminology candidates. | Medium |
| 33690 | `{*2Abilities}` payload in the tutorial | Preserve both `{LINE_LEFT}` wrappers and the `{*2...}` token identity/order; determine whether the localized payload should be Korean, consistent with the Japanese and Chinese references. Also review ability-tree and active/passive terminology. | The Korean keeps both line markers and the same token wrapper/order as English, but leaves `Abilities` in English. Japanese and Chinese localize the payload. The English source also contains the typo `where as`; Korean does not reproduce that typo. | Medium |
| 33696 | `아리아드` for `The Ariad` | Confirm whether this is a named unit/faction and whether a Korean group marker should be part of the label. | Korean transliterates the proper name. Japanese adds `隊` (“unit/team”), while English and Chinese do not make the group type explicit. The historical log includes Ariad among names requiring context. | Medium |
| 33700 | `이사의 정원에 있는 샘` for `the Font in the Gardens of Ysa` | Verify whether `Font` is a named source/fountain and standardize it and the three sacred sites; preserve that Esharra's power enters the world at these locations. | Korean conveys the list and power relation, but renders `Font` generically as a spring. Japanese also generalizes the Ysa location, while Chinese treats the locations as sacred sources. Historical notes identify the Font and Esharra terminology for review. | Medium |

IDs 33652, 33654-33664, 33666, 33670-33673, 33675-33680, 33682-33689,
33691-33695, and 33697-33699 generally retain the English meaning on this
first reading. Proper names, lore, voice, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33600-33799 was checked against
  this batch. It explicitly records the five-line prophecy at 33667,
  `Orison` (33668), the `Tender`/`Delver` roles (33669), the Eswin/Beorn
  ambiguity (33674), and the Court of Summer, Ariad, marker payload, and Font
  terminology in this range.
- At ID 33690 the runtime wrappers and order are structurally retained; the
  localized English label inside the wrapper is recorded separately as a
  payload-localization candidate, not a missing-token finding.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33651-33700 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33667 retains
  the four newline characters of its five-line poem.
- At ID 33690, both `{LINE_LEFT}` markers and the `{*2...}` wrapper remain in
  matching order in all locales; the wrapper payload text is localized
  differently.
- No gameplay-value discrepancy was detected. Chapter and part numbers are
  expressed with locale-appropriate numeral styles.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33651-33700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33701.
