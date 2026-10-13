# Preliminary Language Scan: `default` IDs 10000-10049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10000-10049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring terms in
  the active Korean corpus.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10000 | Gnarsh / Alyn Shir / Nyralim | Align recurring names and preserve the completed defeat and thwarted-plan meaning. | Korean says Gnarsh's plans were thwarted and keeps Alyn Shir's request to speak. `니라림` differs from recurring `니랄림(Nyralim)` at IDs 390, 1499, and 6501; Alyn Shir also has several active Korean spellings, while this row's `앨린 시어` matches ID 9864. | High |
| 10002 | `Service` / `Orison` / Lyria | Confirm whether `Service` is a formal rite and whether `Orison` means prayer, a prayer text, or a named practice. | Korean preserves the obligation to serve Lyria, but `봉사다` can sound like ordinary service and `오리슨` is only transliterated. Japanese and Chinese also differ in how they render the religious terms. | Medium |
| 10004 | `Mastery of Arms` / `Weapon Mastery Abilities` | Align the mastery and ability labels with the game's skill/menu terminology. | Korean retains the unlock-all scope and weapon mastery concept; the exact UI labels remain a terminology question. | Medium |
| 10008 | hoped the player would come → `네가 올 줄 알았어` | Preserve hope/anticipation rather than certainty. | English says “I hoped you would come”; Korean says the speaker knew the player would come. Japanese emphasizes waiting, while Chinese also keeps hope. | High |
| 10010 | Witch Knight Anira / Master Makers / Cann-Rane | Confirm the title, proper names, and whether `Master Makers` is a formal rank; retain the barrier and operation objectives. | Korean preserves the barrier's defeat, freeing the three makers, ending Anira's operation, and depriving Gadflow of an officer. The craft title and several proper-name spellings remain provisional. | Medium |
| 10017, 10040 | capitalized `The Telling` → `이야기` | Align this recurring Fae concept with `전승(The Telling)` where it denotes the named tradition, while preserving the surrounding metaphor. | The active corpus uses `전승(The Telling)` in related lore (for example IDs 7399, 7449, and 7526). Both rows translate the capitalized concept as ordinary `이야기`; confirm whether that is intentional in context. | High |
| 10020 | `Thou` / `Thee` / `Beckoned` | Preserve the ceremonial archaic address and determine whether `Beckoned` is a formal group/title. | Korean retains Anokatos, Arkes, the Beckoned, and Secandra, but the source's compressed invocational syntax and capitalization leave the role relationship uncertain. Japanese and Chinese also segment the address differently. | Medium |
| 10026 | `misled you` → `오해하게 해서` | Preserve whether the speaker admits misleading/deceiving the listener rather than merely causing a misunderstanding. | English says “I misled you”; Japanese explicitly uses a deceive/lie verb. Korean `오해하게 해서` can soften this to causing a misunderstanding. | High |
| 10034 | Beggar's Bluff / `send them on their way` | Keep the objective ambiguous unless context confirms whether it means persuading, expelling, or defeating the group. | Korean says to make them leave and preserves the promised gold. English does not specify the means; Japanese supplies an expulsion reading, while Chinese is unclear. | Medium |
| 10036 | `Memory Walk` / ambassador's daggers | Confirm the route's canonical name and preserve the instruction to take both daggers. | Korean renders the route as `추억의 길` and the imperative as `빼앗아 와`; Japanese supports taking the daggers by force, while the place-name treatment remains unresolved. | Medium |
| 10037 | Nix poem / “never suspecting it was still the same” | Review the plot meaning and all ten verse lines together; do not silently resolve the source's compressed/ambiguous second line. | Korean renders the line as `자기 모습이 달라진 줄은 꿈에도 모르고` (“not realizing its appearance had changed”), while English says it was “still the same.” Japanese is also not a decisive semantic match. The poem retains all nine line breaks. | High |
| 10039 | prison both contains and protects Ciara Sydanus | Preserve both sides of the prison's function and verify the antecedent/context for “us.” | Korean keeps the contrast: it confines her and protects her from the speakers. No change is indicated without broader quest context. | Medium |
| 10047 | `the sod's clothes` → `그놈 옷` | Preserve the speaker's claim to the clothes without inventing who owned them or why. | Korean retains the dismissive insult and ownership claim; the source is too context-poor to determine whether this is a joke, loot claim, or dialogue fragment. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 10000-10004, 10010, 10017,
  10020, 10022, 10028, 10034, 10036-10037, 10039-10040, and 10047
  against the active English, Japanese, Chinese, and Korean rows.
- Added active-row semantic checks for IDs 10008 and 10026, and recurring
  Korean corpus comparisons for `Nyralim` and `The Telling`.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts, brace-token sequences, and runtime
  markers match across all four locales throughout this range. ID 10037
  retains all nine line breaks in each locale.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat name and term questions above as settled.

## Batch Status

IDs 10000-10049 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
