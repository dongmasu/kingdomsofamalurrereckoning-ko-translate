# Preliminary Language Scan: `default` IDs 33701-33750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33701-33750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33701 | `마지막 일꾼들` for `the last of the staff` | Verify whether `staff` means the returning staff/retainers of Seawatch rather than laborers specifically; preserve the rebirth announcement and speaker's address to their liege. | English and Japanese use staff/servants, while Chinese says employees. Korean selects `일꾼들`, which can narrow the group to workers. The exact role depends on Seawatch context. | Low |
| 33711 | `트래블러` for `Travelers` | Standardize the named faction/group form and plural/display convention. | English capitalizes the group name; Japanese transliterates the plural and Chinese translates it. Korean uses a singular transliteration without English in parentheses. | Medium |
| 33718 | `그중 하나인 크루독` for malformed `there is on such a beast, a crudok` | Retain the likely intended “there is one such beast, a crudok” reading, but keep the English source typo documented and do not imply that it was confirmed from game context. | Korean follows the likely intended English correction and identifies a Crudok waiting outside Corgan Hold. The historical audit explicitly records the source typo `on` for `one`. | High |
| 33722 | `죽음의 수수께끼 손, 전하` for `his eminence, Death's Cryptic Hand` | Verify whether Death's Cryptic Hand is a named being/artifact and preserve the mock-ceremonial introduction and title; clarify what “instrument of the immortals” refers to. | Korean preserves the formal introduction but the apposition and title are opaque in isolation. Japanese calls it an executioner, while English calls it an instrument; Chinese is also difficult to parse. | Medium |
| 33724 | `플레이그실드 꾸러미 세 개` for `three parcels of Plagueshield` | Preserve the count and identify whether Plagueshield is medicine, a named substance, or another item; standardize Brother Fallon's title. | Korean retains three parcels and the named item. Japanese writes the same count as digit `3`; the item type remains a corpus-wide terminology question. | Medium |
| 33726 | `체류 의식` for `the lessons of the Sojourn` | Determine whether Sojourn is a named rite/tradition, a journey, or a period of residence; avoid fixing its nature from this isolated line. | Korean chooses a ceremonial “sojourn rite.” Japanese also reads a rite, while Chinese treats it as a pilgrimage/journey. The historical audit includes this term among lore questions. | Medium |
| 33732 | `망가져서 기쁨을 줄 수 없어` for `too damaged to bring joy` | Preserve the speaker's self-effacing rationale for not returning to his wife, but verify whether `damaged` means physically injured, emotionally harmed, or both. | English is figurative/ambiguous; Japanese says he cannot bring happiness in his current state and Chinese explicitly mentions injury. Korean uses broad `망가져서`, which may sound mechanical but avoids specifying an injury. | Medium |
| 33739 | `대사제가 쓰러진 지금` for `now that the Hierophant has fallen` | Clarify whether the Hierophant died, was defeated, or lost office; preserve that Moon Camp needs help as a result. | English `fallen` is ambiguous. Japanese interprets the title-holder as having fallen from office, Chinese says the High Priest has fallen, and Korean's `쓰러진` can suggest physical defeat/death. Historical notes flag this ambiguity. | High |
| 33743 | `우리가 그들을 찾으리란` for `we would find them` | Resolve the pronoun's antecedent before deciding whether it refers to people, places, or objects; retain the speaker's suspicion that Anokatos anticipated the discovery. | The preceding English says “It waits” at the peaks, then switches to plural `them`. Korean explicitly makes the object people (`그들`); Chinese uses an inanimate plural and Japanese avoids repeating the pronoun. Historical audit leaves the antecedent unresolved. | High |
| 33744 | `선견자 운명` / `회피 구르기` for `Seer Destiny` / `roll` | Standardize Destiny and Seer names against established terminology and confirm that `roll` is the game's dodge-roll action; preserve the replacement with a short-range teleport. | Korean makes the gameplay mechanic explicit as an evasive roll. Chinese also identifies rolling; Japanese says dodge. Historical notes specifically call out the Destiny and roll terminology. | Medium |
| 33745 | `상황을 바꾸게 되었는지` for `how I came to change things` | Preserve the offer to explain the speaker's role in changing events without narrowing “things” to the immediate situation unless plot context supports it. | English is deliberately broad; Korean interprets it as changing the situation. Japanese also generalizes it as changing circumstances, while Chinese refers to changing events. | Low |

IDs 33702-33710, 33712-33717, 33719-33721, 33723, 33725, 33727-33731,
33733-33738, 33740-33742, 33746-33750 generally retain the English meaning
on this first reading. Proper names, lore, voice, and display conventions
remain integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33600-33799 was checked against
  this batch. It explicitly records the malformed source at 33718, the
  unresolved `them` at 33743, Destiny/roll terminology at 33744, the
  Hierophant at 33739, and the `murghan` term at 33750. Those open questions
  were compared with the current Korean and all locale references.
- ID 33748's icon token is identical and in the same position in all four
  locales.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33701-33750 once
  and in identical order.
- Embedded line-break counts match across all four locales.
- No runtime-marker mismatch was detected. ID 33748 preserves
  `#NAMED_ICON_GRAY_PS3_SQUARE#` exactly.
- At ID 33724, the quantity three is written as digit `3` only in Japanese;
  all versions preserve the same three-parcel count.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33701-33750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33751.
