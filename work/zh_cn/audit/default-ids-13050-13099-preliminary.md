# Preliminary Language Scan: `default` IDs 13050-13099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 13050-13099.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 13050 | `attack and then fade into the swamps` | Clarify whether the attackers disappear after an attack or after the fighting is over, while retaining that this is reported rumor rather than confirmed fact. | Korean says they attack and then vanish into Klurikon's swamps; English/Chinese support that sequence, while Japanese says they vanish after battle. Historical question remains open. | Medium |
| 13055 | `Hirelings` / Ironfast / Shieldring Keep | Confirm Hireling as a formal role and standardize the two recruiting names. | Korean says Ironfast is not hiring `고용병` and directs the listener to Shieldring Keep; Japanese says trainee mercenaries and Chinese says mercenaries. Historical title/name question remains open. | Medium |
| 13059 | grandmother's stories / `my way out` | Preserve the link between the woman's belief and the speaker's escape without inventing the omitted circumstances or plan. | Korean retains the stories about creatures changing people into animals and that her belief provided an escape route. The exact deception or escape remains unstated in all references. Historical question remains open. | Medium |
| 13061 | siege success / warriors' vanity / challenge | Clarify whose challenge the champion might fear and preserve the warning that this would worsen the warriors' vanity. | Korean says the warriors are already conceited after the siege and that their view of the champion's fear would aggravate it. The referents remain context-dependent. Historical question remains open. | Medium |
| 13062 | Erathi magic / `older than these lands` | Verify Erathi as a people/culture and preserve the speaker's uncertainty about whether the magic predates the Fae. | English is grammatically irregular (`what even older than the Fae`); Korean follows the likely sense, saying it may be older than the Fae. Japanese instead mentions Fae-land itself. Historical question remains open. | Medium |
| 13067 | `forcing average locks` | Confirm this is a lockpicking tutorial about guaranteed success on average-difficulty locks and use the canonical difficulty term. | Korean preserves both the average tier and guaranteed success when forcing the lock. Historical question remains open. | Medium |
| 13068 | Gadflow / `won't be reborn` | Verify Gadflow's Korean name and whether the statement concerns reincarnation in the Fae cycle or simply returning to life. | Korean preserves the speaker's uncertainty about Cydan's confidence and says Gadflow will not be born again. Chinese says he will not revive; the lore mechanism is unresolved. Historical question remains open. | Medium |
| 13072 | `{*1[Passive]}` / Greatsword | Retain the localized passive wrapper and line break, and confirm the official Korean UI terms for passive skill and Greatsword. | Korean retains `{*1[지속 효과]}`, the line break, and the greatsword strength effect. Historical terminology question remains open. | Medium |
| 13073 | `the First` / Tala-Rane ritual | Determine whether the First is a named ancestor, predecessor, or title and retain the urgent disagreement. | Korean uses `선대자`; Japanese says “first-generation/first,” while Chinese says ancestor. The ritual and Tala-Rane are retained. Historical question remains open. | Medium |
| 13074 | Maura Chalin / wrath / Tuatha | Preserve the threat's contrast: the Tuatha have not yet experienced the speaker's wrath, but the listener will. | Korean retains the challenge and threat. Proper-name spelling and scene context remain open. Historical question remains open. | Medium |
| 13078 | `for EA Games Label` → `EA Games 레이블용` | Determine whether this is internal metadata or player-facing text before deciding whether to translate it. | The string is a fragment and all source-language copies retain the English phrase; Korean translates it as “for EA Games label.” Historical question remains open. | High |
| 13084 | Tarion / Pledgeshield Fenan / Warsworn orders | Verify Fenan's title/rank and whether Tarion believed she was acting under Warsworn orders. | Korean preserves the key-copy account, the belief about Warsworn orders, and the return/report objective. The faction/rank terms remain provisional. Historical question remains open. | Medium |
| 13091 | `Terenia` → `테레니아` | Verify this character-name spelling against other occurrences in the active corpus. | Korean retains the quest instruction and the English name in parentheses; historical name check remains open. | Low |
| 13093 | `No one shall harm the Scion` → `아무도 사이온을 해치지 못하게 하겠다` | Keep `Scion` aligned with the corpus-wide office/title decision and check whether the Korean's implied speaker vow adds agency absent from the source. | The Korean uses the common provisional `사이온` form, but the corpus contains other Scion renderings. The source states that no one shall harm the Scion; Korean can be read as “I will not let anyone harm” them. This is a preliminary nuance question. | Medium |
| 13095 | Pledgeshield Grunberg / abandoned house | Confirm the rank form and whether both the strange lights and disturbing noises come from inside the abandoned house. | Korean preserves Grunberg's report of seeing lights and hearing ominous sounds at the house. The formal title remains a corpus-wide terminology question. Historical question remains open. | Medium |
| 13096 | Alfar / early weapon prototype | Distinguish Alfar from Almain and check whether the Alfar are meant to use the weapon or manufacture it. | English says the speaker hopes to develop a weapon the Alfar can “bring against” the common enemy; Korean says a weapon the Alfar can make. This may shift combat use to manufacture. The race distinction is retained. Historical question remains open. | High |
| 13097 | `Lorestone` → `로어스톤` | Confirm the established Korean collectible name and keep it consistent. | Korean uses the recurring provisional `로어스톤` form. Historical terminology question remains open. | Low |
| 13098 | `Sorcerer - BubbleShield Only` | Determine whether this is a test/development label and whether BubbleShield is a formal ability name. | Korean translates the class and retains a transliterated shield label; player-facing status is unknown. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 13050, 13055, 13059, 13061-13062,
  13067-13068, 13072-13074, 13078, 13084, 13091, 13095-13098 against the
  active Korean and all three source locales. They remain open.
- Added current-pass nuance candidate at ID 13093 after comparing the
  source's impersonal prohibition with the Korean's implied speaker vow.
- ID 13070 retains `{LINE_CENTER}` and `{1}` in order; ID 13072 retains its
  localized passive wrapper and line break; ID 13081 retains
  `$Canneroc_NQD.upgrade_cost$`.
- ID 13075 uses the project's established `Finesse` form `재주`. ID 13088's
  `머건` form aligns with the provisional Murghan stem recorded in earlier
  audits; neither observation resolves the broader terminology review.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-token signatures match; no structural or marker-order exception was
  found.
- No numeric or token-content anomaly was detected in the scoped structural
  checks.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline; no
  active CSV was edited.

## Batch Status

IDs 13050-13099 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 13100-13149.
