# Preliminary Language Scan: `default` IDs 12850-12899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12850-12899.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12851 | `A tinker tinkers` → `땜장이는 ... 땜질을 하지` | Preserve the deliberate wordplay and determine the established Korean craft/job term. | Korean retains the repeated root/wordplay and the repair/new condition. The exact occupational label remains open. Historical question remains open. | Medium |
| 12853 | `I ‒ I have to admit` | Preserve the speaker's hesitation/stammer and exhausted voice. | Korean uses an ellipsis (`나도... 인정해야겠어`) instead of the repeated “I”; the hesitation remains, but its stammer form is softened. | Low |
| 12854 | `your grace` / House of Ballads | Confirm the Korean honorific for the addressee's status and the House title. | Korean uses `전하`, which assumes royal status; English says `your grace`, while Japanese omits the honorific. Historical question remains open. | Medium |
| 12861 | `The Telling` / claiming a song | Determine whether The Telling is a named Fae tradition/institution and what it means to claim one of its songs. | Korean retains it as `전승(The Telling)` and renders `claim` as taking possession. Historical question remains open. | Medium |
| 12865 | `Adept` → `숙련자` | Verify whether Adept is a formal magical rank and choose its established Korean title. | The character's name and title remain traceable, but the isolated label does not establish the rank hierarchy. Historical question remains open. | Medium |
| 12866 | `The Circle` / `holding vigil` | Determine whether Circle is a named order and whether its vigil is ceremonial or a guard/watch. | Korean uses `서클` and says they keep watch while awaiting the Champion. Japanese and Chinese differ in how they describe the watch. Historical question remains open. | Medium |
| 12870 | `{*1inventory}` / `{*1backpacks}` | Verify the Korean UI terms while retaining the emphasis/control wrappers and their order. | Korean uses `소지품` and `배낭`; both localized `{*1...}` wrappers and their sequence are preserved. Historical question remains open. | Medium |
| 12874 | `Gallows End` → `교수대의 끝` | Align with the established place-name convention and avoid introducing another literal rendering. | The project-wide scan found many competing Korean forms for Gallows End; this row adds another literal form. The canonical Korean name remains a terminology decision. | High |
| 12876 | `Savant Engar` → `석학 엔가르` | Confirm Savant as a formal rank/title and align its Korean form with established usage. | Korean preserves the title and character reference, but the project's rank glossary is unresolved. Historical question remains open. | Medium |
| 12880 | `dustling` / `open tale` | Determine whether dustling is a standard insult and whether an “open tale” means an unclaimed House of Ballads role/story. | Korean renders dustling as `먼지벌레` and the open tale as a story without an owner; both are plausible but depend on Fae/House context. Historical question remains open. | Medium |
| 12881 | English/Chinese `No` versus Japanese `ああ` | Retain the English/Chinese negative response pending dialogue context. | Korean begins with `아니`, matching English and Chinese; Japanese reads as affirmative. Historical question remains open. | Medium |
| 12884 | `On this day, I see you` | Determine whether this is a ceremonial greeting, a meeting, or recognition, and retain its register. | Korean uses a respectful ceremonial-sounding “I see you today here”; the isolated line does not settle the idiom. Historical question remains open. | Medium |
| 12887 | `keep your business quiet` | Preserve the discreet tavern tone and clarify whether this means keeping dealings secret. | Korean asks the stranger to keep their business from others' ears, consistent with the Chinese reading and stronger than Japanese's “forget work.” Historical question remains open. | Medium |
| 12888 | `preparing commentary` → `해설을 준비하고 있어` | Confirm event/arena narration and keep this consistent with the parallel line at ID 12746. | Korean uses the event-commentary reading at both IDs 12746 and 12888. Historical question remains open. | Medium |
| 12891 | `Maid of Windemere` → `윈더미어의 시녀` | Align the capitalized, lore-specific title with the project glossary. | Korean preserves the Maid title and place name. Other source versions vary between maid/young woman readings. Historical question remains open. | Medium |
| 12893 | Wyvyrn Gifre / Great House / lower and upper city | Verify the family/place spelling and how the named city locations attach to the chalice and ring. | Korean preserves the lower-city tavern and upper-city estate but reads `Great House` as `대저택`; the references vary between an estate and a prominent family. Historical question remains open. | Medium |
| 12897 | `unbind gems` → `보석을 분리해` | Confirm the game's Korean verb for removing/unbinding socketed gems and whether this is a service offered here. | Korean preserves the offer and uncertainty about whether it helps in this situation. Historical question remains open. | Medium |
| 12898 | Peter's letter to `Pa` / Chaos King | Confirm the addressee relationship and title, and retain the tired, regretful letter voice and lineation. | Korean preserves the salutation, all key events, and all 11 embedded line breaks. Historical question remains open. | Medium |
| 12899 | `engage in diplomacy` | Confirm the in-game menu context and whether this asks which faction/leader to negotiate with. | Korean preserves the question and diplomacy action; the intended selection context is not visible in the row. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12851, 12854, 12861, 12865-12866,
  12870, 12876, 12880-12881, 12884, 12887-12888, 12891, 12893, and
  12897-12899 against the active Korean and all three source locales. They
  remain open.
- Added current-pass consistency candidate at ID 12874 after comparing this
  row with the corpus-wide Gallows End name variants.
- ID 12870 retains both localized control wrappers in order; ID 12898 retains
  all 11 source line breaks.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range. The letter
  at ID 12898 retains its 11 embedded breaks.
- Runtime-token wrappers/classes and order match; no structural or
  marker-order exception was found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12850-12899 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12900-12949.
