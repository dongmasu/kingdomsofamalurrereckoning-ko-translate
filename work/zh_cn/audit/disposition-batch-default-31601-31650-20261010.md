# Disposition Batch: `default` IDs 31601-31650

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  31601-31650, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, historical notes, and recurring
  terminology.
- Decisions: one accepted, four `not an issue`, and eight uncertain.
- CSV changes: ID 31601 only.

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 31601 | Five English payloads inside `{*1...}` wrappers | Accepted: localize the displayed time, region names, pause action, and conversation label as `45분`, `오다라스`, `달렌타스`, `일시 정지`, and `대화`. Japanese and Chinese localize the same payloads; established Korean corpus spellings are used. All five wrapper identities and their source order remain unchanged. |
| 31602 | Apparent source typo `They seem themselves` | Not an issue: Korean already conveys the likely intended self-identification as resistance fighters/rebels, supported by the sentence context. |
| 31610 | `old ‒ well` restart | Uncertain: hesitation is retained, but the omitted noun/referent remains unknown. |
| 31621 | Hammer `kick, hook, and smash` | Uncertain: the three-part move sequence is retained, but the exact `hook` move and canonical ability label are not settled across locales. |
| 31628 | `lovely` address and possessive threat | Uncertain: Korean retains the intimate, ominous sequence; character voice requires surrounding dialogue. |
| 31631 | `#NAMED_ICON_GRAY_PS3_R1#` | Not an issue: the exact token is preserved and matches all four locales. |
| 31636 | `Bone Wall` / `본 월` | Uncertain: English and Chinese identify Bone Wall, but Japanese gives a materially different quest-board reading; the in-game referent is unresolved. |
| 31642 | `Well? On your way with you.` | Uncertain: the Korean follows the English dismissal, but the source is awkward and other locales diverge in pragmatic force. |
| 31644 | Chapter IV bawdy deception story | Uncertain: the roles, comparison, heading, and blank-line layout are retained; literary register remains for integrated review. |
| 31649 | Impatient challenge about Varani in Ysa | Uncertain: the broad intent is conveyed, but punctuation/pragmatics and canonical names need context alignment. |
| 31601-31650 | Four-locale row order, line breaks, runtime wrappers, named-icon token, and chapter layout | Not an issue: IDs and order match; wrappers and icon token are retained, and line-break counts match, including the chapter/story separation. |
| Remaining ordinary text in IDs 31601-31650 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported wording defect was identified beyond the accepted localization and context-sensitive findings. |
| Other named terms in IDs 31601-31650 | Apostasy / Arcaneid / Blood Plague / Scholia Arcana / House of Sorrows / Hierophant Shrine and related terms | Uncertain: formal-name status, canonical spellings, and faction/institution terminology need integrated glossary review. |

## Verification

- English, Japanese, Chinese, and Korean source rows for the findings above
  were directly compared and reconciled with historical open questions.
- ID 31601 now reads:
  `이제{*1 45분} 동안 {*1오다라스}를 {*1달렌타스} 지역에서 탐험할 수 있습니다. 데모를 {*1일시 정지}하거나 {*1대화} 중일 때는 타이머가 멈춥니다. NPC와 대화할 때는 서두르지 마세요.`
- All five `{*1...}` wrappers retain their identity and order. UTF-8 BOM,
  72,046 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256 is
  `51fc78b9055f189a82511af6b8cd6ef93cb02d5e9b1855aa12d05ab18f7847aa`.
- Register totals after this batch: 962 accepted, 3,544 `not an issue`, and
  5,744 uncertain (10,250 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 31651; 33,484 `default` IDs remain.

These working dispositions are not independent linguistic approval.
