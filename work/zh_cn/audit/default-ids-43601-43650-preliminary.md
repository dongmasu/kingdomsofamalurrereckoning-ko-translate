# Preliminary Language Scan: `default` IDs 43601-43650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43601-43650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43603 | House of Ballads members and their song / `발라드 가문의 구성원은 저마다 노래 하나씩에 등장한다` | Standardize House of Ballads and confirm whether each member has a song about them or is literally featured in a song. | English says each has a song “associated with them”; Korean makes the relation “appears in a song,” a plausible but somewhat narrower reading. Locale phrasing varies. | Medium |
| 43604 | Crystal War; culpable / `수정 전쟁`; `책임을 느낀다` | Preserve the speaker's regret and responsibility without changing the meaning to personal guilt. | All locales express responsibility/remorse after failing to stop the war; the source says “culpable,” and Korean's phrasing is natural but slightly less direct. | Medium |
| 43605 | Charm / `부적` | Confirm the established inventory term for this item. | English is generic `Charm`; Japanese says amulet and Chinese says talisman. Korean's `부적` is plausible; item identity is unresolved. | Low |
| 43606 | bottle / `병` | Preserve the comic pause and reveal that the grand adventure is inside the bottle. | Korean retains the staged pauses and reveal; Japanese has a different pause order, while Chinese agrees with the English setup. | High |
| 43607 | Kollossae / `콜로새` | Standardize the people-name and preserve the speaker's denial of having approached the giants. | English/Korean say the speaker has not gone near them; Chinese changes this to not wanting to approach. Proper-name forms vary. | Medium |
| 43611 | block/parry prompts / `막기`, `쳐내기` | Confirm the official Korean distinction between blocking and parrying and retain each operation on the correct marker. | Korean assigns `막기` to both block markers and `쳐내기` to parry. English supports this distinction; Japanese repeats its block label before parry, and Chinese uses a different block/parry mapping. The `{1}` button variable and three localized `*1` markers remain in source order. | High |
| 43614 | Opening a Vein / `광맥 개척` | Confirm this mining/action label against established Korean gameplay vocabulary. | Historical review flagged the term. English is an unusual metaphor; Japanese says searching for a vein, Chinese opening one, and Korean uses a concise mining interpretation. | Medium |
| 43615 | “move out of his shadow” / `그의 그늘에서 벗어나` | Preserve the unnamed male antecedent; do not import a name from a reference locale without contextual confirmation. | English leaves the person unnamed; Japanese supplies a name, while Chinese/Korean retain a pronoun. Korean keeps the motivation and later discovery sequence. | Medium |
| 43618-43619 | Zungars/Darkvaris; Wencen's inner circle / `중가르족`, `다크바리족`; `웬센의 측근`, `모임` | Standardize faction names and clarify whether Wencen's inner circle is a formal group or a relationship network. | English/Korean retain both groups seeking the treasure and the inner circle's collapse. The historical audit leaves the organization type unresolved. | Medium |
| 43620 | known debtors / `상습 채무자` | Avoid adding habitual/repeat behavior unless “known” is established to mean repeat debtors in context. | English says “known debtors”; Korean says habitual debtors. Japanese and Chinese describe known debtors without the explicit “habitual” implication. | High |
| 43623 | Patron / `수호신` | Confirm whether this capitalized label is a deity title, character role, or game term and align it with the glossary. | Japanese and Chinese both interpret it as a guardian deity; Korean follows them, while English leaves the single capitalized word ambiguous. | Medium |
| 43626 | four-line land/song poem | Preserve the four-line stanza and review the “rolled up” song / earth's bones imagery for poetic naturalness. | All four locales retain four lines. Korean keeps the harvested-song, bones-of-earth, stripped/shivering, and dying-magic images. | Medium |
| 43629 | Togh Farm / `토그 농장` | Verify the farm's canonical spelling against the setting glossary. | English spells `Togh`; Japanese and Chinese transliterations vary. Korean follows English closely. | Low |
| 43632 | three staffs; Cradle of Summer; Lord Callor; Emaire | Preserve the count of three and standardize the named location/person forms. | Korean retains the reforging, return objective, and northwest direction; the numeric count is written in words in all locales. | Medium |
| 43638 | “crack the mayor's locks” / `시장의 자물쇠를 따고` | Keep the lockpicking sense and the joke that drinking increases the speaker's courage. | Korean renders “crack” as picking the locks, matching the surrounding context and Japanese/Chinese. | High |
| 43646 | “This books is illustrated...” / `이 책에는 ... 삽화가 실려 있다` | Treat the English plural as a source typo unless broader context shows multiple books. | English has the grammatical mismatch `This books`; Japanese/Korean use singular and Chinese describes one illustrated book. | High |
| 43647 | Summer's End - Chantry / `여름의 끝 - 성소` | Confirm whether Chantry is a named institution and use the approved Korean faction/religious-site term. | The source capitalizes `Chantry`; Korean renders it generically as sanctuary. Historical audit explicitly leaves the institution-vs-generic meaning open. | Medium |
| 43650 | Murmurs / `웅얼거림...` | Confirm whether this is a sound/effect label or dialogue fragment and keep the label concise. | Korean and Japanese suggest muttering/murmuring; Chinese says whisper. | Low |

IDs 43601-43602, 43608-43610, 43612-43613, 43616-43617, 43621-43622,
43624-43625, 43627-43628, 43630-43631, 43633-43637, 43639-43645,
43648-43649 generally retain the English meaning on this first reading.
Names, UI terminology, register, and recurring terms remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43611-43624 was checked for
  block/parry labels, Opening a Vein, Zungars/Darkvaris, Wencen's inner
  circle, debtor policy, Patron, and Piercing Damage.
- The historical notes for 43626, 43629, 43632, 43637, and 43647 were
  checked for poem lineation, farm/person/place names, Gardens of Ysa, and
  the unresolved Chantry term.
- The poem and named terms remain provisional; the historical notes do not
  constitute approval of the active Korean.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43601-43650 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales. ID 43626 has
  four lines in each locale.
- At 43611, the `{1}` variable and three localized `*1` style markers retain
  their IDs and order. Their visible payloads differ by locale; Korean's
  block/parry distinction follows the English operation sequence.
- The `+20%` value at 43624 matches in all locales. No hidden formatting
  characters were found in this range.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43601-43650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43651.
