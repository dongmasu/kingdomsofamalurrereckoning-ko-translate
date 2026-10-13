# Preliminary Language Scan: `default` IDs 10850-10899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 10850-10899.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 10850 | the Unbound / their souls seek us out | Preserve the faction/people reference and the stated wait for their souls. | Korean identifies the Unbound as `속박받지 않는 자들` and retains the message and waiting sequence. The precise meaning of their souls seeking the group remains lore-dependent. | Medium |
| 10852 | Trellis / `dustling` / sacred walk | Confirm the location type and whether `dustling` is a species label, insult, or generic address. | Korean uses `먼지 인간`, preserving the diminutive/othering address; English and Chinese retain a dustling-like form while Japanese omits it. | Medium |
| 10854 | Menetyre → `메네타이어` | Align the place-name spelling with recurring Menetyre rows. | Korean matches the established `메네타이어` spelling; Japanese and Chinese use different phonetic approximations. | Low |
| 10857 | `FAIL LINE` | Keep the internal/test string unchanged unless player-facing context is established. | Korean preserves the English test label, while Chinese translates it as failed dialogue. The resource's visibility is unknown. | High |
| 10860 | name `redeemed` → `명예가 회복된` | Confirm whether the condition means restored reputation/honor or a literal name-related redemption. | Korean follows Japanese's honor reading and preserves all three conditions before the spear is handed over. | Medium |
| 10861 | odd/even card draw | Confirm the game rule and retain the repeated alternatives. | Korean preserves the odd/even question and repetition; the actual card-drawing rule is not available in the row. | Medium |
| 10863 | `Circlet of Arkes` → `아르케스의 머리띠` | Verify the artifact's canonical item name and whether `Circlet` should be a circlet rather than a generic headband. | Japanese uses a circlet transliteration and Chinese a ring/circlet form. Korean's `머리띠` is broader and may lose the named equipment type; the return and Kollossae restoration objective is otherwise retained. | High |
| 10865 | Anokatos / followers / Primos | Preserve the escort request and the fact that the Primos personally asked for the speaker. | Korean retains both the reluctance to refuse and the personal request; the destination and relationship among the parties remain context-dependent. | Medium |
| 10867 | Beckoned / conduit or messenger | Preserve both sides of the explicit lore question. | Korean asks whether the Beckoned connects gods and mortals or is merely their messenger, without choosing an answer. | Low |
| 10870 | room sides as a `Scale` / death manipulates it | Confirm whether Scale is a named device and what using death means in the puzzle. | Korean preserves the room-as-scales mechanism and the need to use death, but renders Scale generically as `저울`. | Medium |
| 10872 | `7 - 9` | Retain the unexplained numeric range without assigning units. | Korean preserves the exact numbers and separator. | High |
| 10873 | Chernobog / bolgan champion's eye | Align the proper-name and creature/title forms; preserve its sale-value function. | Korean identifies the eye as Chernobog's and retains the bloodthirsty bolgan and valuable-collector context. | Medium |
| 10876 | “use other people's houses while they are away” | Preserve the ironic trespassing confession without making it sound like permission was granted. | Korean says the speaker “borrows” the houses, which can imply permission; the joke depends on the contradiction between denying theft and using homes uninvited. | High |
| 10882 | Alfar Merchant Navy / Hanged Men | Confirm whether `Hanged Men` is a named pirate crew and preserve the recruitment notice's target. | Korean renders the group as `살인마 교수형단 선원들`; Japanese and Chinese also treat it as a named hanging/pirate crew. English capitalizes the name. | High |
| 10884 | Scholia Arcana | Retain the established Korean institution name. | Korean uses `스콜리아 아르카나`, matching recurring active usage, and preserves the tools/items supplied to its members. | Low |
| 10885 | chime / ruin / Windstones | Confirm the chime's history and whether Windstones names a magical formation or place. | Korean preserves the reported removal during construction and the speaker's unsuccessful test on the Windstones. | Medium |
| 10890 | `{*1Punishment}` / `{*1Savage Wing}` | Verify the established ability names while preserving both marker wrappers and damage behavior. | Korean localizes both marker payloads and retains the statement that the special attacks can apply damage over time in addition to base damage. | Medium |
| 10891 | `My results?` | Keep the result type unspecified. | Korean preserves the short question without supplying what was measured or achieved. | Low |
| 10893 | `Surrender my Heart` → `내 마음을 바치다` | Determine whether this is an action, title, or emotional statement. | Korean gives a plausible literal reading; the isolated string does not establish its UI or narrative use. | Medium |
| 10894 | Hero's hapless servant / Beckoned | Preserve theatrical self-deprecation and formal deference; confirm the capitalization/category of Hero. | Korean retains the speaker's servile role-play and deferential challenge, with an appropriately formal register. | Medium |
| 10895 | Ventrinio Descilini / Templar Octienne | Align both names and order/rank terminology with other research-lab references. | Korean preserves the past collaboration and sponsored-project relationship; the proper-name spellings remain provisional. | Medium |
| 10898 | `other pieces` | Do not identify the missing object. | Korean keeps the question broad as “other pieces,” matching the English lack of a referent. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 10852, 10857, 10861, 10863,
  10865, 10867, 10870, 10872-10873, 10876, 10882, 10884-10885,
  10890-10891, 10893-10894, 10895, and 10898 against the active rows.
- Compared `Scholia Arcana`, `Windstones`, and Menetyre forms with other
  active occurrences. No global terminology change is authorized.
- No translation change is authorized.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean with
  identical keys and order.
- CSV-record line-break counts and normalized runtime-marker classes/order
  match across all four locales. ID 10890 retains both localized
  `{*1...}` wrappers in source order.
- The `7 - 9` value at ID 10872 and variable/label structure in nearby UI
  strings are retained.
- No active CSV structure or text was changed. Active CSV hashes remain the
  checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; names and terms above remain unsettled.

## Batch Status

IDs 10850-10899 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 10900-10949.
