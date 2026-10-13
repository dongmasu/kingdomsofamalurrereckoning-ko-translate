# Preliminary Language Scan: `default` IDs 36251-36300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 36251-36300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 36257 | `스틸의 노동자` for `Still Laborer` | Carry forward the source-keyed question whether `Still` is a name or an adjective. | English capitalization and Japanese treat `Still` as a name; Chinese reads it descriptively. Korean chooses the possessive/name interpretation. The isolated label does not settle it. | High |
| 36260 | `위험한 게임` for `Dangerous Games` | Confirm the label/title and retain the English-supported “games” reading. | English, Chinese, and Korean say games; Japanese calls it dangerous hunting. This may be a title or activity name, but the row alone does not establish that. | Low |
| 36262 | `멍청아` for `berk` | Carry forward the historical register question for this insult and retain the speaker's blunt tone. | English uses the colloquial insult `berk`; Japanese omits a direct insult, Chinese uses a fool/idiot term, and Korean uses `멍청아`. The force is plausible but should be checked against the speaker's voice. | Medium |
| 36266 | `연못에 암포라의 내용물 비우기` for `Empty the amphora in the pool` | Resolve whether the objective is to pour out the vessel into the pool or fill an empty amphora. | English and Chinese direct emptying into the pool; Japanese says to fill an empty amphora. Korean follows the English reading. The archived question explicitly leaves the quest action unresolved. | High |
| 36268 | Fae Adar / Burren Cove / Nil Kern / Priestess Corelon / Sanctuary | Standardize the names and confirm whether `Sanctuary` is a named religious location; preserve who holds the gate key and who sent a guard. | English, Japanese, and Chinese differ in the rendered names and institutional wording. Korean follows the English sequence and keeps the distinct gate key, magic-circle password, and guard action. These proper-name choices remain provisional. | Medium |
| 36274 | `달빛 야영지` for `Moon Camp` | Confirm the canonical Korean place name without adding a “moonlight” nuance unless established. | English names `Moon Camp`; Japanese and Chinese use moon/moonlight forms. Korean's `달빛` is plausible but may not match a fixed map name. | Medium |
| 36277 | `아카라의 손길` for `Akara's Touch` | Confirm the established item/ability title and standardize its rendering. | English and Chinese use “Touch,” Japanese says “finger,” and Korean uses “hand's touch.” The source does not identify whether this is an item, ability, or other named entity. | Medium |
| 36282 | `완벽한 미타란 견고한 손잡이` for `Flawless Mitharan Robust Grip` | Review modifier order and the canonical Korean forms for the Mitharan item/quality terms. | Japanese transliterates the full item label, Chinese translates its modifiers, and Korean translates them in sequence. No mechanical effect/value is present to disambiguate the item's construction. | Medium |
| 36285 | `그것들` for `them`; `이 바위섬` for `this rock` | Carry forward the unresolved antecedent for `them` and the nature of the place called “this rock.” | The line says one person must search for “them,” but does not identify what they are. All locales preserve an ambiguous plural; Korean does not invent an antecedent. The escape-vessel requirement remains clear. | High |
| 36286 | `수호자들` for `Tenders`; Cadoroc / Saturnyn | Carry forward the formal House of Sorrows role/group and name-spelling questions. | English capitalizes `Tenders`; Japanese uses a guardian-like term and Chinese a caretaker term. Korean uses `수호자들`, retaining the leader/subordinate relation and the question about Saturnyn's involvement. | High |
| 36287 | `이건 내 것` for `These are mine` | Preserve the unspecified plural object unless surrounding dialogue establishes which items are meant. | English and Japanese leave the referent unstated; Chinese supplies “boots.” Korean retains the ambiguity rather than importing the Chinese-specific object. | Medium |
| 36288 | `카메라 부드럽게 움직이기` for `Camera Smoothing` | Confirm whether this settings label names an effect/setting or an imperative action; retain the camera-smoothing concept. | English and Chinese describe smoothing, Japanese says camera adjustment, and Korean phrases it as “move the camera smoothly.” The exact UI control type is not clear in this isolated label. | Medium |
| 36297 | Alserund / `its doors` / monuments | Carry forward the historical uncertainty about which place's doors the key opens and standardize Alserund. | The source locates the pass south of Alserund, then says the key unlocks “its doors” and other monuments. Korean retains that relation; the specific antecedent is still not named. | High |
| 36299 | `인식하고 있을수록` for capitalized `Aware` | Verify whether `Aware` is the game's detection/awareness state and keep the success-probability direction. | English capitalizes `Aware`, suggesting a mechanic/state. Korean says nearby characters recognize the player more, the same condition that lowers success in all locales. | Medium |
| 36300 | `남쪽의 둥지들`, `화관을 완성하자` for `eyries` / `the wreath assembled` | Carry forward the uncertain meaning of `eyries` and what “see the wreath assembled” requires. | English is syntactically unusual; Japanese describes highland nests and making a flower crown, while Chinese describes nests and collecting materials for a feather crown. Korean preserves the assault objective and flower-crown reading, but the exact target/material remains unclear. | High |

IDs 36251-36256, 36258-36259, 36261, 36263-36265, 36267,
36269-36273, 36275-36276, 36278-36284, 36289-36296, and 36298
generally retain the English meaning on this first reading. Proper names,
UI labels, and lore terms remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 36200-36399 was checked against
  this batch. The entries at 36257, 36262, 36266, 36268, 36285-36286,
  36297, and 36300 were compared directly with all four locale texts.
- The “these” ambiguity at 36287 and the Camera Smoothing UI label at 36288
  are additional candidates from this pass.
- Historical questions are evidence only and do not authorize CSV edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 36251-36300 once
  and in identical order.
- Embedded line-break counts match across all four locales. No runtime-token
  mismatch was detected.
- The `+2% XP` value at 36292 is retained in all four locales. At 36299,
  all locales preserve that increasing nearby-character awareness lowers
  the chance of a successful theft.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 36251-36300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 36301.
