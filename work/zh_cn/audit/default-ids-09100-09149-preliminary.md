# Preliminary Language Scan: `default` IDs 9100-9149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9100-9149.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9105 | `I'll rent the bed` / `$NQD_Village_Whitestone.m_inn_cost$` | Preserve the lodging interaction and exact cost variable; check whether “bed” is the intended in-game option label. | English says bed, Japanese says room, and Korean says bed. The game variable is present unchanged and in the same position. | Medium |
| 9107 | `House of Vengeance` → `복수의 전당` | Determine whether `House` is a political/familial faction or literal hall; align it with other House names and the cosmological `Great Cycle` term. | English and Japanese present a House of Winter Fae; Korean uses `전당` and `위대한 순환`, while the dominant Korean rendering of Great Cycle elsewhere is `대순환`. Historical audit records the House-role ambiguity. | High |
| 9111 | `Missives of Sable` described as a book → `세이블의 서신` | Check whether this is a named book/collection and align its title with IDs 8975 and 9095, which also use `Missives of Sable`. | English explicitly calls it “the book”; Korean `서신` suggests letters. Japanese calls it a book with a different title, and Chinese names a book/scroll. | High |
| 9114 | Duel `second` → `내 편에 설 조력자` | Retain the formal duel role (a second/attendant) rather than reducing it to a generic ally; ensure the joke about drinking/revelry remains. | English, Japanese, and Korean identify the missing duel second; Chinese misreads it as having no time. Korean's `조력자` is understandable but its formal role remains to be decided. | Medium |
| 9118 | `Squire Coran` → `종자 코란`; “doesn't want to complete his task” | Confirm `Squire` as a formal rank and preserve that Coran is reluctant to complete an assigned delivery task, not merely unwilling to accept it. | English says he does not want to complete the Death Notices task; Korean says he does not want to take/undertake it. Japanese says he dislikes the task. Rank renderings differ across locales. | Medium |
| 9121 | `longlegs` → `장다리들` | Preserve the gnomes' condescending label for non-gnomes without assigning an unstated race. | The term is a dismissive nickname in a gnome speaker's warning. Korean retains the long-legged image and threatening register; its precise referent remains open. | Medium |
| 9125 | `magic of the departed spirits` → `떠난 영혼들의 마법` | Keep the crafted object's source vague unless context identifies the spirits or the item. | English and Korean do not name the object or the spirits' relation to it; Japanese and Chinese likewise leave it unspecified. | Medium |
| 9131 | `the Elund, their voice` → `엘룬드, 그들의 목소리` | Preserve the Elund title/spokesperson role while resolving whether the speaker is the only publicly known member or is known by that title. | English syntax permits both readings; Japanese and Chinese support a unique known representative. Korean retains the title and voice metaphor. | Medium |
| 9132 | `he is slipping away from me` → `그마저도 점점 내 곁을 떠나고 있어` | Keep the loss urgent but do not specify whether the son is ill, endangered, or emotionally distant. | English omits what is happening to him; Japanese frames renewed family loss, while Korean preserves the metaphor without diagnosing the cause. | Medium |
| 9136 | Fateweaver `focus` → `매개체` | Confirm whether `focus` is a specific magical implement or a generic channeling medium; standardize Fateweaver/threads-of-fate wording. | English is broad, Japanese says lens, Chinese says focus, and Korean uses generic `매개체`. The card preference is preserved. | Medium |
| 9137 | Maid's enchantment / `the Telling` → `시녀의 마법` / `이야기` | Align the Maid title with IDs 9026 and 9137 context and align capitalized `the Telling` with IDs 8954 and 9071. | Japanese identifies the Maid of Windemere and treats the Telling as a fixed tradition; Korean uses generic `시녀` and `이야기`, continuing the earlier terminology question. | High |
| 9138 | `Grinning Vane` → `활짝 웃는 베인` | Confirm whether this is a named creature/character or a descriptive epithet; use a consistent rendering if it is a proper name. | English capitalizes both words; Japanese retains Vane as a name and translates “grinning,” while Chinese renders the full phrase literally. | Medium |
| 9144 | `Followers of Vraekor dwell within` / fire affinity | Keep the location and the scope of “they”/“other creatures” unresolved unless surrounding context identifies them. | English omits the location after `within` and leaves some scope ambiguity; Korean retains the same broad relation and the fire-affinity claim. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9107, 9111, 9114, 9118, 9121,
  9125, 9131-9132, 9136, and 9144 against the active rows.
- Compared `the Telling` at ID 9137 with its earlier occurrences at IDs 8954
  and 9071; the generic Korean `이야기` remains an open consistency question.
- Added current-row checks for the lodging variable at ID 9105 and the
  `Grinning Vane` name at ID 9138.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales.
- Runtime-marker IDs/order and other control tokens match in this range.
  The variable `$NQD_Village_Whitestone.m_inn_cost$` at ID 9105 is preserved.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9100-9149 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
