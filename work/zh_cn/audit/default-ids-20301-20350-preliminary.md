# Preliminary Language Scan: `default` IDs 20301-20350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 20301-20350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 20305, 20309, 20315-17, 20320-21, 20325-27, 20333-35, 20345, 20348 | Dannestar, Gale Crossing, Narca, Preordained, Hyperian, vault/darker times, Bloodbane, Delvers, Fate Magic, Culn, Ariad, Centurion's Key, Captain Mys | Confirm names, roles, place types, and established faction/skill terms against the glossary and game context. | These terms have historical open questions; Korean generally follows English while preserving named entities and task intent. | Medium |
| 20307 | `make the feeling mutual` | Preserve the retaliation/reciprocal-hostility implication without inventing a plan. | Korean makes the hostile intent explicit as causing the enemy to view the group as an enemy; this is supported by context but more explicit than the idiom. | Medium |
| 20310 | `I'm done hearing requests` | Confirm the speaker's refusal to keep accepting requests. | Korean conveys the refusal; Japanese is similar, while Chinese reads the line as completing an interrogation request. | Low |
| 20318 | tribute variable / gold icon | Preserve the runtime key and named icon byte-for-byte. | All four locales retain `$DLC1_Diplomacy.tribute_amount_small$ #NAMED_ICON_GOLD#` unchanged. | High |
| 20324, 20339 | Lead Character Artist / Press Start to Enter | Confirm whether the credit should be localized and whether “Start” maps to the actual UI input label. | Korean localizes the role and translates Start as `시작`; Japanese retains the credit and button wording as English. | Medium |
| 20336 | `They amuse me` / `그들은 흥미로워` | Check whether the line means they entertain the speaker or merely interest them. | English can imply amusement; Japanese says interesting and Korean follows that broader interest reading, while Chinese retains amusement. | Low |
| 20343 | `+2 to All Skills` / `+2 모든 기술` | Preserve the +2 amount and all-skills scope; confirm the established Korean stat label. | Korean matches all locales on value and scope; “기술” versus the game's preferred skill terminology remains open. | Low |
| 20347 | `berk` / `멍청아` | Check the insult's force and register in the speaker's voice. | Korean preserves an insult, but the slang strength may differ from the colloquial English. | Low |
| 20350 | `he didn't make it` / `그는 살지 못했어` | Confirm the intended death euphemism from context. | English and Chinese indicate he did not survive; Korean makes the implication explicit, while Japanese is less specific. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 20305, 20307, 20309, 20315, 20317-18,
  20320-21, 20324, 20327, 20331, 20333-35, 20339-40, 20343, 20345, and 20347
  against the active rows. They remain preliminary; no historical note
  authorizes a translation edit.
- ID 20317 follows the English direction to go up, rather than the more
  specific Japanese suggestion to investigate. ID 20318's tribute variable
  and gold icon are unchanged.
- ID 20343 preserves the `+2` value and applies it to all skills.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 20301-20350 exactly
  once and in identical order.
- Physical line-break counts and normalized runtime-token class/order
  signatures match across all four locales.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 20301-20350 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` ID 20351.
