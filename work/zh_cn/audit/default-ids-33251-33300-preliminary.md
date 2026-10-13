# Preliminary Language Scan: `default` IDs 33251-33300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33251-33300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33252 | `집행관` for `Headsman` | Determine whether Headsman is a formal opponent/title or a generic executioner and align the quest label with the prior occurrence at 32955. | Korean translates the term as an executioner/enforcer. Chinese also uses executioner; capitalization and surrounding quest context may indicate a named role. | Medium |
| 33255 | `옛 군인 묘지` / Ommer Vogard and Lyra | Confirm the cemetery's historical/location context and standardize both names; preserve that Lyra was last seen there. | Korean retains the coastal refugee-camp connection, spouse relation, hill overlooking the sea, and last-seen location. The historical question asks for context around the old soldiers' cemetery and named people. | Medium |
| 33259 | `두려움과 매혹` for `dread and fascination` | Preserve both emotions and the leader's distant observation; confirm the Order of Fateweavers' canonical Korean name. | Korean retains the contrast of fear and fascination. The organization name is translated as `운명술사단`; related historical records use several forms. | Medium |
| 33263 | `협박` for `blackmail` | Check whether the accusation specifically means blackmail/extortion rather than a generic threat; retain the value of the speaker's new life and the warning about a knife in the back. | Korean uses a general coercion/threat term. Chinese says extortion/blackmail and English names blackmail explicitly; the precise transaction/context is not in this row. | Medium |
| 33265 | `도시의 아래쪽 터널` for `the Lower Tunnels` | Determine whether Lower Tunnels is a named district/place and preserve the instruction to confront and publicly discredit the false preacher. | Korean translates it as generic lower tunnels; English capitalizes the location-like name, while Chinese calls it the city's sewers. The historical log leaves both the location and preacher's faction open. | Medium |
| 33266 | Aster castle / ancestors' hall | Preserve that the Aster family abandoned the castle, the speaker's ancestors later took it over, and their records say it became their hall; verify ownership/context without adding a family relation. | Korean retains the sequence and possessive perspective. The historical question asks who owned the castle and whether the hall became the speaker's family seat. | Medium |
| 33269 | `+5%` Damage Resistance / `30%` Mana Sustained Cost | Preserve both values, the active-duration condition, the mana-cost label, and separate lines; verify the exact gameplay interpretation in context. | Korean retains +5% resistance while active and a 30% sustained mana cost. All locales preserve both values and the two-line layout; Japanese specifies maximum mana while English does not. | High |
| 33273 | Telemachus Rasp academic memo; Savant/Adept/Neophyte and ward terms | Preserve the satirical denial, accidental-dismemberment anecdote, rising Niskaru sightings, Glendara summoning rumor, and four-break/two-paragraph layout; verify technical ranks and terms without losing the comic understatement. | Korean retains the memo's argument and all key examples. The source itself has awkward phrasing; the institutional titles and ward/arcane vocabulary remain glossary candidates. All locales have four newline characters. | Medium |
| 33279 | `중급 영매` for `Master Medium Morlig` | Confirm whether Master Medium is a formal title/rank and whether “Master” should be reflected as a senior/master status rather than `중급` (“intermediate”). | Korean uses `중급 영매`; Japanese transliterates the title and Chinese says “medium master.” The isolated name does not establish the rank hierarchy. | Medium |
| 33284 | `이상한 물건이지` for `Strange thing, aren't you?` | Check whether the speaker calls the addressee a strange person/one rather than an inanimate object; preserve the explanation of Primal Magic and its weapon channel. | English addresses the listener directly. Korean's `물건` says “object,” whereas Japanese and Chinese describe the addressee as strange. This appears to be a concrete person-versus-object wording candidate. | High |
| 33291 | `맹세방패` for `Pledgeshield` | Confirm whether Pledgeshield is a formal rank/status and standardize its Korean form; preserve that Gwyn and the speaker attained it on the same day. | Korean treats it as a title/status and translates it literally. English capitalization and historical examples support a possible rank, but the official Korean form and progression remain unresolved. | Medium |
| 33294 | Compressed Dead Kel sailor verse | Preserve the warning that Dead Kel's ship brings no solace to a true sailor; verify the compressed rhyme and refrain without adding narrative detail. | Korean retains the sailor/ship/Dead Kel relation in one line. English is terse and Japanese/Chinese reshape the image; the historical log flags this as a compressed rhyme. | Medium |
| 33298 | `the Well` rendered as `샘` | Determine whether Well is the named Well of Souls/location or a generic well; preserve that tunnels feed crystals directly into it and the speaker warned against the danger. | Korean uses a generic “spring/well.” English capitalization suggests a named place; Japanese explicitly says Well of Souls/Prismere, while Chinese stays generic. The historical inventory flags the referent. | Medium |
| 33299 | `처음 모습을 드러낸 흔적` for `first emanations` | Clarify whether emanations are manifestations, physical matter, or signs; preserve that they emerge from the mountain itself and the narrator's qualification. | Korean renders the first emanations as traces/signs that appeared, while Chinese reads them as a manifestation and Japanese as emitted matter. English leaves the technical sense open. | Medium |

IDs 33251, 33253-33254, 33256-33258, 33260-33262, 33264, 33267-33268,
33270-33272, 33274-33278, 33280-33283, 33285-33290, 33292-33293,
33295-33297 generally retain the English meaning on this first reading.
Proper-name spellings, technical terms, and voice remain integrated-pass
candidates; no other distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33200-33299 was checked against
  the active rows. The old soldiers' cemetery and names (33255), dread/
  fascination (33259), blackmail (33263), Lower Tunnels/preacher (33265),
  Aster castle (33266), the +5%/30% effect (33269), academic memo (33273),
  Master Medium (33279), Primal Magic (33284), Pledgeshield (33291), Dead
  Kel verse (33294), Well (33298), and emanations (33299) remain open as
  recorded.
- ID 33269's values and layout match. ID 33273 retains the source's four
  embedded breaks; no paragraph boundary was added or removed.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33251-33300 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33269 has one
  break, ID 33273 has four, and IDs 33294/33299 have none.
- ID 33269 preserves `+5%` and `30%` on the same respective effect lines.
- No runtime-marker mismatch was detected in the range.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33251-33300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33301.
