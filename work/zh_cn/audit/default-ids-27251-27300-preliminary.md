# Preliminary Language Scan: `default` IDs 27251-27300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27251-27300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27251-27277, 27280-27286, 27288-27290, 27293-27300 | Dialogue, lore, quest, and concise UI/item text | Recheck register, idiom, names, and terminology during integrated review. | Korean generally retains English meaning and Japanese tone. ID 27280 keeps the votive-driven wall condition; ID 27300 retains the ring's Archsage rank and honor function. | Medium |
| 27264, 27269, 27273, 27275, 27278-27280, 27284-27288, 27300 | Pteryx / Chaos Critter / Hireling / Great Cycle and fonts / skill and title labels / votives / Great General / Fall of Valor / Luminitsa / Archsage | Standardize creature, faction/rank, cosmology, item, ability, and title terms. | These are capitalized or setting-specific names and labels. Historical questions cover the 27275 cosmology/fonts, ability/UI labels, votives, Fall of Valor, Pteryx, and title/status terminology; preserve them as open candidates. | Medium |
| 27278 | `+300% Critical Hit` -> `치명타 피해가 반드시 300% 증가` | Verify whether the bonus applies to critical-hit damage, critical-hit chance, or a guaranteed critical hit after Evasion. | Korean explicitly says critical-hit damage increases by 300%, a narrower mechanic than the English label. Japanese describes a guaranteed triple critical hit, and Chinese says guaranteed `+300%` critical, so the exact effect remains unresolved. | High |
| 27287 | `Accept #NAMED_ICON_360_A#` -> `수락 #NAMED_ICON_360_A#` | Check whether the space before the controller/icon marker is required by UI presentation. | Marker identity and order match all locales. English and Korean include a space before the marker; Japanese and Chinese do not. This is a display-spacing question, not a wrapper/order failure. | Low |
| 27291 | “I took over his job, and his heart” -> `그의 일자리를 물려받았고, 그의 마음도 얻었어` | Preserve the deliberate ambiguity between succeeding to someone's role, gaining their affection, and the later predator/prey context. | Korean makes “his heart” read as winning his affection. The following lines discuss stalking and looking prey in the eye before it dies; the historical log leaves the intended emotional/romantic reading unresolved. | High |
| 27292 | Two-attack stat block | Preserve each attack's target area/projectile count, damage types and values, durations, mana costs, and blank-line structure. | Korean retains Attack 1's 6-meter stagger, 12 Physical Damage, and 15 Mana; Attack 2's five projectiles, 65 Piercing and 12 Bleeding Damage over 6 seconds, and 20 Mana. Every locale has four actual embedded line breaks. | High |
| 27255, 27275, 27287, 27292 | commendation / fonts / named icon / numeric combat values | Confirm the established label meanings without modifying structural tokens or source values. | The `#NAMED_ICON_360_A#` marker is intact at 27287; the two-attack values and costs at 27292 match. At 27275 Korean renders the Great Cycle and plural Font as named cosmology terms, consistent with the open question. | High |

## Historical Audit Reconciliation

- The source-keyed historical log covers the Plant Snapper, Revival Prison,
  Trellis, Tree, minimap and options markers, Reckoning UI, Pteryx,
  votives, Fall of Valor, attack effect, and the ambiguous phrase at ID 27291.
- It explicitly asks whether ID 27291 means taking over the previous owner's
  romantic affection or inheriting an emotional role. It also flags the
  Great Cycle/fonts at 27275 and the named-title clusters at 27284-27288.
- These entries remain issue inventory, not approved translation decisions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27251-27300 exactly
  once and in identical order.
- Actual embedded line-break counts and runtime-token identities/order match.
  ID 27287 retains `#NAMED_ICON_360_A#`; the Korean space before it is noted
  separately as a display-format question.
- The `+300%` value at 27278 and all damage/duration/cost values at 27292 are
  preserved. No unexpected Unicode format character was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27251-27300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27301.
