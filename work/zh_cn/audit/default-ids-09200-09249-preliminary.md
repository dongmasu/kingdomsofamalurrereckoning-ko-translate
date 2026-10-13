# Preliminary Language Scan: `default` IDs 9200-9249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9200-9249.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9204 | “Make it quick. Make it painless. He of all people deserves as much.” | Preserve the request for a quick, painless death and the speaker's respect, without making the absent situation more explicit than the source. | English, Japanese, and Chinese imply a merciful death. Korean retains the implication and the reason for the request; the target/context remains unstated. | Medium |
| 9205 | `Well of Souls` → `영혼의 샘` | Confirm the established Korean name and preserve the distinction between rebuilding the body and returning the intact spirit. | All locales describe body reconstruction and the spirit's return; Korean follows the meaning. The proper location name should align with earlier Well of Souls entries. | Medium |
| 9207 | `No questions asked` → `질문은 받지 않아` | Clarify that the seller buys and sells without asking questions, rather than refusing to answer questions. | English and Japanese mean the speaker conducts transactions without asking; Korean can mean “I don't accept questions,” shifting who asks. Chinese also supports the no-inquiry reading. | High |
| 9210 | `#NAMED_ICON_360_B#` glyph tutorial | Preserve the runtime icon exactly and retain the timing rule: a miss reseals every glyph. | The icon token is identical in all four locales and stays in the same position. Korean preserves the break/reseal instructions and failure consequence. | High |
| 9212 | Traveler theft / Irion and estranged wife | Preserve the distinction between completing every requested theft and failing to reunite Irion with his estranged wife; retain the first-person journal voice. | Korean states that all requested items were stolen but the relationship objective failed, matching the English structure and the historical audit. | High |
| 9219 | `Hall of Appointments` → `약속의 전당` | Verify whether this is a named venue and align it with other hall/location names rather than assuming a literal appointment room. | English capitalizes the location; Japanese reads “Hall of Appointments,” Chinese “Appointment Hall,” and Korean uses a traceable literal translation. | Medium |
| 9225 | `They` scattered throughout the Teeth of Naros | Keep the referent unnamed unless surrounding context identifies the items/people being searched for. | English and Korean use an unspecified plural; Japanese and Chinese do likewise. The search request is preserved without adding a noun. | Medium |
| 9228 | Leanashe's twelve-line poem | Preserve all twelve lines, the accusations, impaled body, and offal image; check whether the Korean line 9 should retain the rhetorical “Will you not witness their loss?” question. | All four versions have twelve lines. Korean keeps the gruesome imagery and repeated questions, but `그들이 잃은 것을 보지도 못한 채` shifts that line toward a statement about not seeing what they lost. | Medium |
| 9230 | `Warden's Bridge` → `워든스 브리지` | Confirm the capitalized location's canonical Korean form and keep it consistent across map/objective references. | English names a location; Japanese and Chinese translate the title literally, while Korean transliterates it. Historical audit leaves the place name open. | Medium |
| 9232 | `Trigger Leanashe` → `리어나시 작동` | Classify this as an internal event/debug trigger or player-facing label before deciding whether to localize it. | English and Japanese retain a trigger-like label; Chinese and Korean translate “trigger.” It may be developer metadata rather than displayed text. | Medium |
| 9234 | `the bargain ... is about to pay off` → `대가를 치르게 될` | Verify whether the bargain is about to take effect/produce its result or whether someone is about to pay a price; retain the threat of Tirnoch's wrath. | English `pay off` is semantically ambiguous in context. Korean chooses “pay the price”; Japanese and Chinese read as the deal reaching settlement/success. | Medium |
| 9244 | Heart of Sibun / Brigand Hall Caverns / Tine / Castellan Grian Shane | Verify the artifact, location, person, and rank spellings; preserve the discovery, theft, and investigation sequence. | Korean retains that the relic was stolen from an ancient Warsworn vault and that investigation begins at Helmgard with Grian Shane. Proper-name forms remain provisional, as noted historically. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9204-9205, 9210, 9212, 9225,
  9228, 9230, 9232, and 9244 against the active rows.
- Confirmed that the icon token at ID 9210 and all twelve poem lines at
  ID 9228 are present; these structural observations do not approve wording.
- Added current-row meaning questions for IDs 9207, 9219, and 9234.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales. ID 9228
  has eleven embedded line breaks (twelve poem lines) in each locale.
- Runtime marker/control-token structure matches; ID 9210 preserves
  `#NAMED_ICON_360_B#` exactly.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9200-9249 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
