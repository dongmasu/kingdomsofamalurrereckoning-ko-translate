# Preliminary Language Scan: `default` IDs 22101-22150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 22101-22150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 22104 | Anokatos / malformed knowledge of gods' will | Determine whether “malformed” means distorted knowledge, mistaken doctrine, or inability to understand divine will. | Korean says the knowledge of the gods' will is “뒤틀려,” close to distorted; English is unusual and context is limited. | Medium |
| 22106 | Scholar Hugues / patron | Verify Hugues's canonical Korean name/title and whether patron means sponsor or benefactor. | Korean retains the missing scholar, tower attack, speaker's concern as patron, and request to find him. | Medium |
| 22108 | Garrison / Walls / Livrarium | Align the three capitalized place/building names and determine whether Walls is a district or fortification. | Korean uses “주둔지,” names Walls and Livrarium in parentheses, and preserves their relative age. | Medium |
| 22111 | Oleander Sinclair / potion / dead man | Preserve the speaker's comic self-correction and clarify whether “landed on” means literally falling onto the corpse. | Korean retains the potion, mistaken identity, nearby mine, landing/falling on the dead man, and emphatic correction. | Medium |
| 22112 | prattling / mad man | Preserve the rhetorical reproach without making the speaker's target or action more specific. | Korean renders it as not being able to leave a madman's rambling alone. | Medium |
| 22118 | Relentless Assault / `{20%}` / `35 Health` | Align ability/Health terminology and preserve trigger condition, chance, and amount. | Korean preserves 20%, 35 Health, the active-duration condition, and one line break; it places `35` before `+20%`, while English lists chance before amount. | High |
| 22120 | Flashing Blade 4 | Confirm whether 4 is a rank, level, or part of the ability label and standardize the ability name. | Korean transliterates the ability concept and retains level 4. | Medium |
| 22121 | `Sr. QA Project Manager` | Determine whether this is an intentional player-facing title or a debug/test string; retain/expand `Sr.` consistently. | Korean expands the abbreviation to “선임” and preserves QA. | Low |
| 22125 | smokescreen / stun / blind enemies to your presence | Preserve the stun, brief concealment, and poison-on-upgrade effects without conflating them. | Korean includes all three effects; “blind them to your presence” is rendered as hiding the player's appearance. | Medium |
| 22126 | Castellan | Standardize the rank and preserve the order to kill every Castellan after the named target. | Korean retains both the first target and the “not one left” force. | Medium |
| 22127 | Quays / Bracken Bay / Klurikon | Align district and bay names and retain the trade, shelter, and distance reasons for safety. | Korean describes northern docks, merchant ships, Bracken Bay, and distance from Klurikon. | Medium |
| 22129 | `his shadow` / unexpected discovery | Identify the unnamed “his” only if context resolves it; preserve the repeated pauses and unexpected encounter. | Korean retains the speaker's wish to leave his shadow, prove their worth, and the two reflective pauses. | Medium |
| 22130 | Domus Politica | Decide whether to retain the Latin institutional name or translate its function; align with earlier occurrences. | Korean transliterates “도무스 폴리티카” and keeps the Latin name in parentheses. | Medium |
| 22135 | `I am no one` / Adept / Scholia Arcana | Determine whether “I am no one” is self-effacement and align the rank and institution names. | Korean says “난 아무것도 아니야,” then preserves magic study as an Adept, husband, and two children. | Medium |
| 22137 | Sverri Kura / High Commander / Pledgeshields | Verify name forms and the chain of command; standardize Pledgeshield as a rank. | Korean preserves taking orders from the High Commander and passing them to the Pledgeshields. | Medium |
| 22144 | Wencen / the House | Confirm that “the House” means House of Ballads and preserve the unusual “many moons” duration. | Korean names House of Ballads and says the king has been away for many months. | Medium |
| 22145 | Mitharu / benevolent gifts | Align Mitharu and preserve the welcoming, devotional register. | Korean retains the invitation and enjoyment of gifts from benevolent Mitharu. | Medium |
| 22146 | downloadable content / restart warning | Preserve the restart requirement, loss of unsaved progress, and runtime line-space token. | Korean retains the DLC requirement and restart prompt; `{LINE_SPACE}` is present in the same position. | High |
| 22148 | Livia / gap in her armor | Preserve the sympathy and the figurative vulnerability implied by the gap in armor. | Korean retains sympathy for Livia and renders the gap as a discovered weakness. | Medium |
| 22149 | `Activity - Training Dummy` | Determine whether Activity is a UI category, animation name, or internal event label. | Korean translates it as “활동 - 훈련용 허수아비”; Japanese uses “action,” Chinese “action” as well. | Low |
| 22150 | master builder of Gravehal Keep | Clarify whether this is an emerging title or a request for permission; retain the speaker's hesitation and self-correction. | Korean preserves the future role and polite “if you please / if you see fit” qualification. | Medium |

## Historical Audit Reconciliation

- Rechecked archived source-keyed questions for IDs 22104, 22106, 22108,
  22111, 22118, 22120-22121, 22125-22127, 22129-22130, 22135, 22137, 22144-
  22146, 22149-22150 against the active four-locale rows.
- The prior items remain open candidates. ID 22118 preserves both numeric
  values; their Korean word order differs from English and is explicitly
  recorded rather than treated as a missing value.
- Cross-checked Anokatos, Scholar Hugues, Garrison, Walls, Livrarium,
  Oleander Sinclair, Relentless Assault, Bloodgrin, Scholia Arcana,
  Castellan, Quays, Bracken Bay, Klurikon, Domus Politica, Sverri Kura,
  Pledgeshield, Wencen, House of Ballads, Mitharu, and Gravehal Keep against
  recurring usage. Official-manual text search remains unavailable; term
  confirmation is pending integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 22101-22150 exactly
  once and in identical order.
- ID 22118 has one line break and preserves `+20%` and `35` in all locales.
- ID 22146 preserves `{LINE_SPACE}` in all locales.
- No key, row-order, line-break, runtime-marker, or missing-value
  discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 22101-22150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
22151.
