# Preliminary Language Scan: `default` IDs 46201-46250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46201-46250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46201 | payment and `$VMC_NQD.cost$` | Preserve the runtime amount and Gold unit; retain the polite payment offer. | All four locales contain the same cost variable and payment meaning. | High |
| 46202, 46227-46228, 46234, 46240 | Mordus-Torr, Castle Gastyr, Medgar Krast, Renerit, Matt Gray | Check canonical spellings and apply the eventual bilingual-name convention consistently. | Korean retains English spellings in parentheses for some names but not others; the project-wide display convention remains unresolved. | Medium |
| 46203 | “cold” / `매정하다` | Revisit whether the Korean can preserve the source's cruelty meaning and possible literal “cold” wordplay. | English, Chinese, and the historical audit retain the cold/cruelty association; Japanese renders cold-heartedness. Korean conveys cruelty but loses a possible pun. | Medium |
| 46210 | Hierophant and revenge | Check the referent and causal phrasing in context before changing the line. | Korean retains the future-sight possibility and revenge motive; the isolated English syntax leaves the referent of “whoever it is” broad. | Medium |
| 46214 | “show some initiative” | Preserve the teasing invitation and the speaker's delayed initiative without adding a new proposition. | Korean follows the English contrast. Japanese instead shifts to “spend time together,” so English remains the semantic anchor. | Medium |
| 46216 | cook / quartermaster | Retain the two job possibilities and the speaker's confidence in their cooking. | Korean follows English; Japanese has a divergent ship-steering reading for the second job. | Medium |
| 46219-46220 | ten volumes; “a thing or two”; fifth memorial stone | Keep the quantity and the fifth-stone detail; review the idiom without losing its light conversational tone. | Korean preserves ten books and the fifth stone. The historical audit specifically flags the “a thing or two” idiom; the English can be both idiomatic and lightly literal. | Medium |
| 46221 | `And Then There Were None` / `그리고 아무도 없었다` | Check whether this is a literary allusion/title and whether the established Korean title is intended. | Korean is a natural rendering and matches the familiar Korean title form, but row context is not enough to determine whether the source intentionally alludes to the work. | Low |
| 46229 | Ballads Sanctuary / `발라드 성소` | Verify whether this is a named site and align it with the established `House of Ballads` terminology. | English names “Ballads Sanctuary”; Japanese describes the sanctuary of the House of Ballads, while Chinese and Korean use a shorter form. | Medium |
| 46232 | `{LINE_SPACE}` and `{1}` loot prompt | Preserve both control tokens and the two-sentence tutorial structure. | All four locales retain the same token identities, sequence, and line break. | High |
| 46239 | higher/three wager | Keep the three and the win condition; verify the game mechanic only with scene context. | All locales preserve the number and higher-wins outcome. The historical audit leaves the “three” gambling reference open. | Medium |
| 46243-46246 | Sir Elswin, Ohn, Westroad Prison, Rathir | Check canonical names/title forms and maintain name-marking consistency. | Korean preserves the locations and honorific meaning; `Rathir` is rendered as `라시어`, consistent with prior provisional usage. | Medium |
| 46249 | artifact's control over water leaving Cranalt | Reconcile the direction of water flow against game context before disposition. | English, Chinese, and Korean say water flows out of Cranalt; Japanese says it flows into Cranalt. Korean follows the English semantic source. | High |

IDs 46204-46209, 46211-46213, 46215, 46217-46218, 46222-46226,
46230-46231, 46233, 46235-46238, 46241-46242, 46247-46248, and 46250
generally retain the English meaning on this first reading. Names and game
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entries for IDs 46150-46249 and
  46250-46349. The current range is explicitly flagged for the `cold`
  wordplay at 46203, payment variable at 46201, ten-volume description at
  46219, fifth memorial stone and “a thing or two” at 46220, loot tutorial at
  46232, and high/three wager at 46239.
- The historical audit also groups names and terms in this range, including
  Hierophant, Red Legion, Telogrus, House of Ballads, Apotyre, Rathir,
  Cranalt, and several character names. No historical note was treated as
  an approved correction.
- ID 46249 has a source-language direction disagreement: Japanese says
  water flows into Cranalt, while English, Chinese, and Korean say it flows
  out. Retain as a context-dependent source question.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46201-46250 once
  and in identical ascending order.
- All four locales preserve matching line-break counts.
- Runtime-token identities and counts match across locales, including
  `{LINE_SPACE}` and `{1}` at ID 46232; no special whitespace or hidden
  formatting discrepancy was found.
- The payment variable, ten-volume quantity, fifth memorial stone, wager
  value `3`, and all other numeric content are retained.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 46201-46250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 46251.
