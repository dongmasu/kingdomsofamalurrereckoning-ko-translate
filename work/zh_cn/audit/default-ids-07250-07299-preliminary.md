# Preliminary Language Scan: `default` IDs 7250-7299

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7250-7299.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable questions from `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7257 | four-line Carver poem | Retain the four English lines in Korean; note the Japanese source has one fewer embedded line break. Review the poem's image and rhythm together. | English, Chinese, and Korean each have three line breaks; Japanese has two. Korean follows the English line layout and the historical audit's four-line scope. | Medium |
| 7266 | `special elements usable in alchemy` → `특별한 원소` | Confirm whether `elements` is a game ingredient/category name or means alchemical materials; Japanese uses a materials term. | The item description refers to finding elements usable in alchemy. `원소` may suggest chemical elements, while the Japanese reference is broader. | Medium |
| 7280 | `The Trellis` → `트렐리스` | Confirm whether this is a proper place/venue name or an ordinary trellis; the Chinese/Japanese interpretations diverge. | English capitalization suggests a name, Japanese reads as a gathering place, and Chinese reads as a trellis. | Medium |
| 7281 | `Gameplay placeholder` → `게임플레이 자리표시자` | Confirm whether this debug/development label is player-facing and should be translated, or retained as an internal identifier. | All sources identify it as a placeholder; the active Korean translates it literally. | Medium |
| 7284 | `The Burn` → `불탄 땅` | Check whether this is a named place/event before treating `Burn` literally; keep the candidate provisional. | English capitalization and the Japanese port-name reading suggest a proper name; Chinese is closer to a named burned place. | Medium |
| 7285 | `never their intention to treat you lightly` → `가볍게 대할 생각은 없었으니까요` | Preserve the warning while clarifying whether this means the Templars intend to take the addressee seriously or will treat them harshly. | The English is semantically unusual; Japanese implies they will not be gentle, while the Chinese can mean they will not look down on the addressee. | Medium |
| 7286 | `($DLC2_SQ09.key_cost$ Gold)` → `($DLC2_SQ09.key_cost$ Gold)` | Translate the visible currency label to the project's Korean UI term (likely `골드`) while preserving the runtime token exactly. | English/Japanese/Chinese localize the currency word; Korean leaves `Gold` in English. The variable itself is retained. | High |
| 7291 | `I hope you find Idylla well` → `이딜라가 잘 지내길 바라` | Translate the idiomatic welcome/well-wishing meaning, e.g. `이딜라에서 잘 지내길 바라` or `이딜라가 마음에 들면 좋겠어`. | Japanese says “hope you like Idylla”; the English means a good stay/experience, not that the city itself is doing well. Korean attaches `잘 지내다` to the city. | High |
| 7298 | `Impulse` → `충격` | Confirm the ability's UI term; consider `파동` or another consistent term for each Wrath impulse. | English treats each Impulse as a repeated ability event; Japanese calls them waves. `충격` may be mistaken for electric shock. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 7253-7257, 7263, 7265, 7269,
  7276, 7278, 7281, 7284-7286, 7289, 7291, 7293, 7298, and 7299.
- ID 7255 correctly preserves that the player has arrived too early for
  entry and must find Bisarane. ID 7263 retains the incomplete source's
  divine-spark/fragments relationship without adding a new actor.
- ID 7278 keeps the bottle contents unidentified and retains the Alfar Army
  ownership mark. The awkward warning at 7285 and the `Gameplay placeholder`
  at 7281 remain unresolved.
- ID 7299 retains the organization/name relation provisionally; whether
  `Motus Mining Interests` is a formal organization name remains open.
- Historical candidate wording is evidence only and does not authorize edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Localized runtime-marker identities/order, other brace tokens, and named
  icon markers match across all four locales. ID 7286 preserves
  `$DLC2_SQ09.key_cost$` unchanged.
- The exact values and order in ID 7298 are retained: 55 Physical Damage per
  impulse, 360 on the final hit, 130 Mana, and +10 per impulse.
- ID 7257 is the only line-break-count difference in the batch: Japanese has
  two embedded breaks; English, Chinese, and Korean have three. The Korean
  four-line poem follows English meaning and the Chinese layout.
- No active CSV structure or text was changed.

## Batch Status

IDs 7250-7299 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
