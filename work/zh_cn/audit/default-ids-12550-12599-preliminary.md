# Preliminary Language Scan: `default` IDs 12550-12599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12550-12599.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12550 | `our sister` → `우리 여동생` | Clarify whose sister is meant and whether she could have persuaded the deceased not to defend the road. | Korean specifies a younger sister; Japanese also says younger sister, while English and Chinese do not specify relative age. Historical question remains open. | Medium |
| 12552 | `your observers` / `in the open` | Continue the question from ID 11785: identify the observers and clarify what counts as “in the open.” | Korean says the watchers will not act where people can see. Japanese says they may target the addressee in an open space; Chinese also uses public-setting wording. Historical question remains open. | Medium |
| 12553 | prison sentence / XP | Verify the exact gameplay rule and official Korean term for the experience-point penalty. | Korean preserves the crime, arrest, possible imprisonment, escape condition, sentence, and XP loss. Historical question remains open. | Medium |
| 12554 | `get the spear to the front` → `창을 전선으로 가져가야 해` | Check whether this means taking the spear to the battlefront or simply moving forward. | English and Chinese explicitly say “to the front”; Japanese says only that they must proceed forward. Korean follows the English/Chinese reading. | Medium |
| 12571 | Basilica Gnostra / Manoise / Louis / Frostbreak Sea Chronology | Verify the names/title and the expedition-selection wording; do not assume Louis is younger than Manoise. | Korean says `동생`, specifying a younger brother, while Japanese says `兄` (older brother); English and Chinese only say “my brother.” The text also says “nominated,” which may mean selected. Historical question remains open. | High |
| 12574 | `The Herald of Winter` → `겨울의 전령` | Resolve the season/title conflict against context and the English source. | English and Chinese say Winter; Japanese instead says a herald of the Summer Fae. Korean follows English. Historical question remains open. | High |
| 12575 | shards belonging to the wife / she wants them back | Clarify why the speaker wants to dispose of items that belong to his wife and which she wants returned. | Korean preserves the apparent contradiction and the heavy pack. Japanese and Chinese retain the same tension. Historical question remains open. | Medium |
| 12576 | castaway / captain / ungrammatical `Your the one what...` | Preserve the speaker's informal voice and unfinished thought without silently treating the source grammar as reliable. | Korean smooths the nonstandard English to “네 얘긴 들었어” and retains the trailing interruption. Japanese/Chinese also normalize the grammar. Historical question remains open. | Medium |
| 12580 | `The Hanged Men` → `교수형자들` | Determine whether this is a named group/title or a literal label, and align its Korean name accordingly. | English capitalizes the phrase, Japanese interprets it as a pirate band, and Chinese renders hanging ghosts. The isolated label does not settle the referent. | Medium |
| 12582 | `pull a fast one` / `rattled` | Clarify who attempted to trick whom and who is now unsettled. | Korean retains the Champion as the likely trickster and the addressee as having rattled him, but the source leaves the attempted action implicit. Historical question remains open. | Medium |
| 12586 | short blades / `Take mine` | Confirm whether one dagger or multiple weapons are being awarded. | English shifts from plural short blades to singular `mine`; Korean gives one dagger, while Chinese uses plural wording. Historical question remains open. | Medium |
| 12591 | `Scholarship` → `장학금` | Determine whether this label means a stipend/scholarship, academic study, or another UI category. | Korean chooses the financial-aid sense; Japanese says research/study and Chinese says scholarship. Historical question remains open. | Medium |
| 12593 | `Argine, Queen of Staves` → `지팡이의 여왕 아르진` | Determine whether this is a tarot-like card/title, faction rank, or character epithet; verify the name form. | Korean preserves the queen/title structure. Japanese and Chinese differ in name spelling, and the row gives no context for the title's role. Historical question remains open. | Medium |
| 12596 | Chaos Realm tutorial / localized `{*1...}` heading | Verify official Korean terms and retain all control-marker wrappers, paragraphs, and their exact order. | Korean preserves three instructional paragraphs and all `{LINE_LEFT}`, `{LINE_SPACE}`, and localized `{*1...}` markers. Marker wrapper/order signatures match the other locales; translated heading contents differ as expected. Historical question remains open. | Medium |
| 12597 | Mystic Hammer / Eamonn / Eagonn / Niskaru Lord | Verify name spellings and whether the weapon alone halted the spell and returned the Niskaru Lord to prison. | Korean preserves the weapon's unique ability and the sequence. English and Japanese agree on the claim; Chinese supports it. Historical question remains open. | Medium |
| 12599 | `the Widow` → `위도우(Widow)` | Determine whether Widow is a named creature/title and align it with earlier quest references. | Korean retains the English name in parentheses and the objective to end its attacks on Canneroc. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12550, 12552-12553, 12571, 12574-12576,
  12582, 12586, 12591, 12593, 12596-12597, and 12599 against the active
  Korean and all three source locales. They remain open.
- Added current-pass questions at IDs 12554 and 12580 after comparing
  conflicting source readings and the isolated title label.
- ID 12596 retains its localized control-marker sequence and paragraph
  structure. No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-marker wrappers/classes and order match after accounting for
  localized `{*1...}` contents; named and numeric values remain present.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12550-12599 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12600-12649.
