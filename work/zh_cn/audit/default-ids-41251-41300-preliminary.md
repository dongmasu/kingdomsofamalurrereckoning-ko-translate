# Preliminary Language Scan: `default` IDs 41251-41300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 41251-41300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 41251 | Saturnyn / `사투르닌` | Confirm canonical proper-name spelling. | The four locale forms differ substantially; the sentence's intent to kill Saturnyn is clear. | Medium |
| 41253, 41255 | Nanne Hanri; Argine, Queen of Staves | Standardize names and the `Queen of Staves` title. | Korean preserves the title but locale transliterations vary. | Medium |
| 41254 | `before... I spill... your blood ‒` / completed Korean threat | Preserve the interrupted, faltering threat and source dash rather than supplying a completed final cadence. | English, Japanese, and Chinese leave the utterance trailing; Korean ends with an exclamation mark and makes it a complete threat. | High |
| 41256 | four-paragraph intimate passage | Check voice, imagery, and lineation in context without changing the four-paragraph structure. | Korean retains the sequence of embrace, memory, clothing, and hours together. English/Japanese/Chinese differ in some physical imagery and duration detail; all four preserve the paragraph breaks. | Medium |
| 41257 | Tulan / `툴란`; Chinese U+FEFF | Confirm the place-name spelling and record the invisible formatting character in the Chinese source string. | Korean transliterates the location. The Chinese source text contains an embedded U+FEFF after `图兰`; it is not visible in ordinary display. | Medium |
| 41258 | `animating inert objects through magic induction` | Check the technical term and preserve the comparison with the Templars. | Korean conveys magical animation of inanimate objects and asks whether the addressee shares the Templars' interest. | Low |
| 41262 | staff that can `shock the unjust` / `불의한 자를 충격에 빠뜨리는` | Confirm whether `shock` means electrical damage or moral/retributive shock. | Korean selects the ordinary “startle/shock” sense; the staff context and Japanese “divine retribution” leave the intended effect nuanced. | Medium |
| 41263 | Brother Mason / mission Alms Master / Brother Egan | Confirm the institution and office terminology. | Korean preserves the greeting, aid offer, and Egan's missing status; locale translations of the mission office differ. | Medium |
| 41264 | St. Eadric source fragment | Retain the visibly unfinished English sentence and confirm how its continuation joins the next text. | English ends after “to”; Korean marks the missing continuation with an ellipsis instead of inventing it. | High |
| 41265 | Relentless Assault cost | Resolve the cross-language gameplay-value conflict before any edit. | English, Chinese, and Korean say 25 Mana; Japanese says 45 Mana. Duration (6 seconds) and armor reduction (50%) agree. Korean follows English. | High |
| 41266 | `Gnomish Trireme` / `노움 삼단 노선` | Confirm the Korean ship-type term and standardize Gnomish. | Japanese explicates a three-banked oared galley; English uses `Trireme`, whose “three” is lexical. Korean `노선` can read as a route/line rather than an ancient ship. | Medium |
| 41267-41268 | lunar gardens; Scholia Arcana | Standardize the named garden and institution. | Korean preserves the perpetual night and the institution's interest in the phenomenon; locale forms for Scholia Arcana differ. | Medium |
| 41270-41271 | Whitestone; master-at-arms; Dregshore; Cape Solace | Confirm place/name forms and the formal armory position. | Korean preserves the wanted-bandit contract and the recruitment rationale for Ollie; canonical spellings and the office equivalent remain provisional. | Medium |
| 41274 | `anything more than that` / `그저 그것일 뿐` | Identify the antecedent of “that” from context. | Korean preserves the limitation until escape but the referent cannot be recovered from this row alone. | Low |
| 41275 | `Break` / `파괴` | Determine whether this is a pause/break control, a destructive action, or another internal label. | Chinese renders pause; English/Japanese retain `Break`; Korean selects destruction. The isolated label does not establish the UI context. | High |
| 41279 | bed ward / `미묘한 수호 마법`; source `dispell` | Confirm the established ward/dispelling terms and retain the tentative observation. | Korean preserves the trance-like appearance, subtle ward on the bed, and possibility of dispelling. English has the source spelling `dispell`; no source edit is made. | Medium |
| 41284, 41288 | Master Makers; House of Sorrows | Standardize named groups and established Korean terminology. | Korean renders the former as `명장들` and the latter as `비탄의 가문`; group/title status and recurring forms need integrated review. | Medium |
| 41285 | Vigor Broadshield / `바이거 브로드실드`; Chinese U+FEFF | Confirm name transliteration and record the hidden formatting character. | Korean transliterates both name components; the Chinese source contains U+FEFF between the two name parts. | Medium |
| 41289 | `Come through this whole` / `이 구멍을 통과하면` | Preserve the likely source typo as a documented candidate, not a confirmed correction. | Context points to `hole`/passing through a hole, while English says `whole`; Korean follows the likely intended route and the historical note already flags the typo. | High |
| 41291 | `blessed apprentice` / `재능 있는 수습생` | Check whether “blessed” is literal or an honorific for a talented apprentice. | English says blessed; Japanese/Chinese say talented. Korean follows the latter interpretation and preserves the repair instruction. | Medium |
| 41295-41297 | House of Valor; school-victory line; kite shield | Confirm faction terminology and the final shield subtype term. | Korean preserves the inspiration, audience, and harp emblem. `kite shield` is rendered literally as `연 모양 방패`; check established equipment vocabulary. | Medium |
| 41298-41299 | insults and shouted commands | Check that the rough register and urgency fit the speakers. | Korean retains the insult and command to bring down the tower; the locale references differ slightly in insult intensity. | Low |
| 41300 | Delving Hall / `탐사 회관` | Confirm whether this is a named location and standardize the translation. | Isolated place label; Japanese suggests an “Hall of Inquiry” sense while Chinese is literal. | Medium |

IDs 41252, 41259-41261, 41273, 41276-41278, 41280-41283, 41286-41287,
41290, 41292-41294, and 41300 generally retain the English meaning on this
first reading. Proper names, established terms, register, and plot references
remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed notes for 41250-41349 were checked, especially the four-
  paragraph intimate passage, St. Eadric fragment, Relentless Assault cost,
  Gnomish Trireme, Scholia Arcana, Master Makers, the bed ward, and the
  `whole`/`hole` question at 41289.
- The English/Japanese/Chinese/Korean Mana costs at 41265 were compared
  directly; the Japanese-only 45 value is recorded, not silently normalized.
- No official Korean manual-based terminology claim is introduced here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 41251-41300 once
  and in identical order.
- Embedded line-break counts match across all four locales, including the
  four paragraphs at 41256 and two lines at 41265. No runtime-marker
  discrepancy was detected.
- At 41265, duration is 6 seconds and armor reduction is 50% in all locales;
  Mana cost is 25 in English, Chinese, and Korean, versus 45 in Japanese.
- The Chinese source contains invisible U+FEFF characters in the strings at
  IDs 41257 and 41285. They are recorded as source-format observations only;
  no source or working CSV was changed.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 41251-41300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 41301.
