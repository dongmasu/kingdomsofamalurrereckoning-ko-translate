# Preliminary Language Scan: `default` IDs 59501-59550

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59501-59550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59501 | Seasonal farming almanac; Seaflax, Sativa, Sparrowgrass, Spritesfoil, Star Thistle, Eel Petal, Paling Wand, Adarus Hollow | Preserve the four seasonal sections, planting/harvest sequence, 29 embedded newlines, and all named plants and places. Confirm plant and wand terminology in the wider glossary. | English, Japanese, Chinese, and Korean preserve the same instructions and lineation. Japanese explains Sparrowgrass as an asparagus etymology, unlike English's explicit claim that it is unrelated to sparrows; Korean follows English and retains the plant name phonetically. Several plant and Hollow terms remain provisional. | Medium |
| 59502 | Bertran / `늘 동물을 좋아했는데` | Retain the intended claim that Bertran has always liked animals while noting the malformed English `was always had`. | Korean follows the apparent intended English meaning; Japanese and Chinese do likewise. | High |
| 59504 | Warsworn / `워스원` / heavy two-handed maul | Confirm the Warsworn faction form and distinguish the weapon's two-handed maul type from an axe. | English and Chinese identify a maul, while Japanese calls it an axe. Korean says a two-handed iron club, retaining the maul sense; Warsworn spelling remains inconsistent across the corpus. | Medium |
| 59508 | Unbound / `언바운드`; “we protect our own” / `우리 편을 지켜` | Align Unbound and retain the contrast between exemption from ordinary men's rules and protection of one's own group. | Korean keeps the contrast and protective assertion. “우리 편” is a natural but somewhat broad rendering of “our own”; the faction term remains provisional. | Medium |
| 59511 | `+10% 혼돈 적에게 받는 피해 저항` | Preserve the 10% damage-resistance value and clarify the modifier's scope in the integrated terminology pass. | All four locales encode +10% resistance against Chaos enemies; the English source alone has a space after `+`. No value discrepancy was found. | High |
| 59512 | Fate / `운명의 흐름`; experiences / `경험치` | Confirm whether “experiences” intentionally means experience points (XP), rather than experiences in a broader sense. | Japanese explicitly uses XP and the ability context supports that reading; English and Chinese retain the broader word. Korean resolves it as game XP. | Medium |
| 59514 | Deep Slumber / Reverie / `백일몽` | Preserve the warning not to disturb sleepers in Reverie except for dire need, and align Reverie with established setting terminology. | Korean retains the warning and exception. The two English terms are distinct, with Deep Slumber capitalized and reverie lowercased; the Korean wording renders the latter descriptively. | Medium |
| 59521 | Master's Pick / `대가의 곡괭이` | Reassess `Pick` as a lockpicking tool, not a mining pick; compare with the other Master's Pick occurrence at ID 59399 and historical ID 5766. | The line says the item opens locks, and Japanese/Chinese explicitly identify a lockpick. Korean's `곡괭이` normally means a mining pick and conflicts with that function. This is a high-confidence likely item-type mismatch; the final item name remains open. | High |
| 59522 | Faelands / `패란즈`; Travelers / `트래블러` | Carry forward the corpus-wide Faelands and Travelers naming questions without normalizing this row in isolation. | Korean preserves the land/law/king contrast and the group's freedom of movement. `패란즈` matches other active forms, but the historical corpus has alternate renderings. | Medium |
| 59527 | Storm Bolt / `{*1[강화]}` | Verify the established Korean skill name and retain the hold-button instruction and localized upgrade marker. | All four locales have one localized upgrade marker and one following line break; Korean preserves the instruction to summon lightning and strike nearby enemies. | Medium |
| 59528 | `$TR_Shell.minn_wager$` | Preserve the wager variable and Gold label exactly. | The runtime variable is identical in all locales and remains in the same position. | High |
| 59530 | Order / `교단`; earned rank | Clarify the Order's identity and what rank/title the speaker earned by preventing schism and disarray. | Korean preserves the stated reason and that the rank was earned years ago. The exact Order and rank terminology remain historical context questions. | Medium |
| 59531 | Amman the Clever / `영리한 페이 장난꾸러기 아만` | Confirm the epithet/name order and retain the chain from Amman's keys to Yolvan's locked chests and the treasure. | Korean preserves the trickster, multiple keys, matching locked chests, and the speaker's intent to take the valuables. The phrase ordering is awkward enough to merit a readability check; the name/title remains provisional. | Medium |
| 59538 | Hierophant / `히에로판트`; “bringing a war front to” | Clarify whether the army is meant to wage war on the Hierophant or bring a front to the Hierophant; preserve the speaker's uncertainty (“or something like that”). | English is awkward. Japanese and Chinese read this as declaring/bringing war against the Hierophant, while Korean follows the English “front” wording. The target and the Hierophant's role remain unresolved. | High |
| 59541 | Arden's Hut / `아든의 오두막`; A. S. | Preserve the note's invitation, urgency, and initials while checking whether A. S. is a deliberate signature. | English, Japanese, and Korean give initials; Chinese expands the signature to a name. Korean retains the source initials and the first-meeting location. | Medium |
| 59544 | Argine / `아르진`; Hierophant | Preserve that the arrangement keeps money coming in and that Argine thanks the Hierophant, without resolving the antecedent of “it” beyond context. | Korean preserves the income and gratitude. English leaves the income source implicit; Japanese and Chinese also retain a broad pronoun/reference. | Medium |
| 59549 | Centurion Rank / `백인대장` | Confirm whether this is a formal rank or appointment and align it with prior Centurion references. | English calls it Centurion Rank, Japanese describes promotion, and Chinese calls it a title. Korean preserves the appointment but does not make the rank/title distinction explicit. | Medium |
| 59550 | Secandra / `세칸드라` | Align the proper-name spelling with other active Secandra occurrences. | All four locales preserve the compliment that Secandra noticed the addressee because they are strong; the Korean spelling remains a corpus-wide consistency question. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional terminology includes Bertran, Warsworn,
Unbound, Chaos, Fate, Deep Slumber, Reverie, Master's Pick, Arrivus Engine,
Faelands, Travelers, Rhyderk, Emaire, Order, Amman the Clever, Yolvan,
Hierophant, Arden, Nyralim, Ysa, Argine, Centurion, and Secandra.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entries for IDs `59450-59549` and
  `59550-59649`.
  Applicable questions include the seasonal almanac and its plant/calendar
  terms (59501), Bertran's malformed source (59502), Warsworn/Unbound (59504,
  59508), the Fate/XP reading (59512), Deep Slumber/Reverie (59514),
  Master's Pick/Arrivus Engine (59521), Storm Bolt (59527), Amman the Clever
  and Yolvan (59531), the Hierophant (59538), Arden's Hut and signature
  (59541), the income antecedent (59544), Centurion rank (59549), and
  Secandra's spelling (59550).
  These are open prompts, not accepted corrections.
- Rechecked related historical terminology for Faelands and the Master's
  Pick. The same likely tool-type issue is recorded at ID 59399 and in the
  earlier ID 5766 note; no corpus-wide replacement is authorized.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59501-59550 once
  and in identical ascending order. Each full `default` file has 65,135
  records with matching key order.
- Embedded newline counts match throughout the batch. ID 59501 has 29
  embedded newlines in each locale; the localized markers at 59518 and
  59527 and the wager variable at 59528 are present in the corresponding
  structural positions. The +10% value at 59511 is preserved.
- Original scan's recorded checkpoint hashes (not current active values):
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- The subsequent disposition pass applied only the accepted corrections
  documented in
  [`disposition-batch-default-59501-59550-20261011.md`](disposition-batch-default-59501-59550-20261011.md).

## Batch Status

This document remains a preliminary scan, not independent final approval.
The findings were dispositioned in
[`disposition-batch-default-59501-59550-20261011.md`](disposition-batch-default-59501-59550-20261011.md):
three accepted corrections, 35 `not an issue`, and 14 uncertain findings
(two overlap accepted IDs). Continue at `default` ID 59551.
