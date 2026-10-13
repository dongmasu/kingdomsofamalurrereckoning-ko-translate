# Preliminary Language Scan: `default` IDs 27751-27800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27751-27800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27751-27754, 27756-27760, 27763-27769, 27772-27774, 27776, 27778-27785, 27787-27795, 27797-27799 | Dialogue, lore, objectives, names, and item text | Recheck voice, terminology, names, and line-level context in the integrated pass. | Korean generally follows the English meaning and Japanese tone. The vacancy in the House of Ballads, the second-map objective, and the story fragments are retained without structural changes. | Medium |
| 27755 | `400` Lightning Damage / `35` Shocking Damage / `145` Mana | Preserve the two damage types, exact values, area qualifier, and cost line. | All locales retain 400, 35, and 145 in the same relationship. Korean preserves the one embedded line break and translates the damage/cost labels. | High |
| 27762, 27765, 27800 | Reckoning wrappers / `$STR0 $STR1` / `(Socketed)` | Preserve placeholder identity/order and markup wrappers; check localized payloads and suffix display in the integrated UI review. | Normalized marker identities/order match across the four locales. The Korean localizes Reckoning/unraveling payloads and the `Socketed` suffix; the two string variables remain unchanged and in source order. | High |
| 27756 | `발라드 가문에 빈자리가` | Confirm that “vacancy” means an open House seat/role rather than an unoccupied physical place. | English and Japanese refer to the House of Ballads not having a vacancy; Chinese explicitly says no empty seat. Korean's `빈자리` is plausible but could read as a physical vacancy without the faction context. | Medium |
| 27762 | `운명이 풀리기 시작합니다` for `fates will begin to unravel` | Check consistent terminology for fate unraveling and the localized Reckoning mode. | The marker payload is intentionally localized and the action is conveyed. Historical notes flag Reckoning wrappers and their payloads for structural/terminology review; no token-order issue was found here. | Medium |
| 27771 | `말하지 마라. 네 친구 델프처럼 멍청하다고.` | Preserve the idiomatic threat “Don't tell me you're as thick...” rather than reading it only as a literal instruction not to speak. | English and Chinese use “Don't tell me”; Japanese recasts it as an insult about dullness. Korean's wording can be read literally before the insult, though the overall demand and threat remain clear. | Medium |
| 27777 | `하이 풀겐(High Fulgen)` / three Bolgan Masters | Confirm whether High Fulgen is a person/title or a place, and retain the count of three. | English's possessive permits a proper-name reading, while Japanese and Chinese render it as a highland/location. Korean transliterates it and preserves three masters; keep the entity unresolved. | Low |
| 27788 | `경쟁력 있는 상품을 경쟁력 있는 가격에` | Preserve Astor's deliberate sales-pitch repetition and check the source wordplay in Korean. | English repeats “competitive” for both merchandise and prices. Korean repeats `경쟁력 있는`, retaining the rhetorical parallel. | Medium |
| 27796 | `어두운 곳에서 눈에 띄지 않으면서` | Check whether `dim light` means low-light conditions rather than darkness, and keep the item-property sentence natural. | Korean describes concealment in a dark place. English and Chinese specify dim lighting; Japanese similarly describes twilight. The sense is close, but the current phrasing may imply complete darkness. | Medium |
| 27800 | `(장착됨)` for `(Socketed)` | Confirm the established localized equipment-suffix convention and ensure it remains attached to the two variable names. | English and Japanese leave the suffix in English, Chinese and Korean localize it. `$STR0` and `$STR1` are preserved in order, with no structural change. | Medium |

## Historical Audit Reconciliation

- The 27700-27799 source-keyed inventory flags Bristletongue, the vacant
  House seat, Reckoning wrappers, the Templar/Tome, Gwalchmai's rooms, High
  Fulgen, the Roman-numeral label, Astor's wordplay, ordinary stones, the
  hunt spirit, Sagecraft, and the dark-light boot description.
- The following 27800-27899 inventory also lists the `Socketed` suffix.
  These are terminology and context questions, not approved edits.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27751-27800 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. ID 27755's numeric values and line break are preserved;
  IDs 27762 and 27800 retain marker/variable identities and order.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 27751-27800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27801.
