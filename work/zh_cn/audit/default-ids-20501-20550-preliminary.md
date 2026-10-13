# Preliminary Language Scan: `default` IDs 20501-20550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 20501-20550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 20502 | Weeping King / Sorrows / Winter | Identify the House and distinguish the Sorrows from Winter as allegiances, powers, or factions. | English contrasts devotion to the Sorrows with Winter; Japanese names a “power of lament,” while Chinese uses spirit-like terms. Korean makes it the House of Sorrows, adding a faction reading. | High |
| 20509 | `Goliath` / `The Ancient` | Determine whether Goliath is a personal name/title and confirm the Root Golem's epithet. | English calls him “the Goliath” and says the golem is “known only as” The Ancient; the Korean proper-name parentheses and `고대자` remain plausible but unresolved. | Medium |
| 20512 | Oathblade Kirby / Warsworn | Confirm the rank and faction terminology. | Korean `서약검` and `전쟁맹세단` retain the two concepts; Japanese uses a different rank formulation, while Chinese also treats Oathblade as a title. The English source repeats “with” in “speak with with Katarina.” | Medium |
| 20516 | `$SQ62.poison_cost$` | Preserve the variable and verify its displayed amount/unit convention. | The exact runtime variable is retained; English and Chinese attach the gold label differently. | High |
| 20517 | `Charm Duration [DO NOT USE]` | Keep the unused/developer warning distinguishable from player-facing text. | Korean preserves the warning as `[사용 금지]`; the other locales localize the warning wording, so this is an intentional localized-label difference, not a missing runtime token. | High |
| 20528 | `Alfar` / `알파르(Alfar)` | Determine whether this is a distinct people name or an abbreviated reference to Ljosalfar. | Korean preserves the English form; do not conflate it with the established `료스알브` without lore evidence. | Medium |
| 20531 | Bleeding / Poison / Shadow Flare | Align status/ability terms and retain the two distinct percentage effects. | Korean preserves +30% Bleeding/Poison effects and +20% Shadow Flare damage; `그림자 섬광` differs from `섀도 플레어` in earlier rows. | High |
| 20532 | House of Pride / `오만의 집` | Reconcile this House name with the project's inconsistent forms. | The same active draft uses `용맹의 집` at ID 20293, `긍지의 집` at 13303, and several other variants; the current `오만의 집` is another distinct form. | High |
| 20536 | Curse developer-facing scene note | Check whether the explanatory scene description belongs in a player-facing localization table. | English explicitly narrates a self-destruct event and the Korean follows it; this may be an internal/test string rather than dialogue. | Medium |
| 20539 | Court of Enchantments / `마법의 궁정` | Confirm the named court's canonical Korean form and preserve the all-Fae praise. | `마법의 궁정` is a recurring established draft form, but the historical audit records Japanese/Chinese naming conflicts and the wider corpus has competing literal renderings. | Medium |
| 20543 | Rathir / `라시르(Rathir)` | Confirm the project's canonical transliteration. | This spelling is frequent in the active draft and historical audit, but the corpus contains conflicting legacy spellings that need terminology-level disposition. | Medium |
| 20547 | Maid of Windemere / `윈더미어의 시녀` | Determine whether `Maid` is the named lore figure or an ordinary servant, and align title treatment. | Historical entries repeatedly flag this title; the current form is consistent with many earlier rows but may suggest a domestic role. | Medium |

## Historical Audit Reconciliation

- Rechecked the archived open questions for IDs 20502, 20509, 20512, 20517,
  20528, 20536, 20539, 20543, and 20547 against the active four-locale rows.
  The recorded questions remain open; none authorizes a translation edit.
- Cross-checked House of Pride forms at IDs 13303 and 20293 and the
  established `마법의 궁정`, `섀도 플레어`, and `라시르(Rathir)` usage.
- These are preliminary candidates and consistency questions, not approved
  corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 20501-20550 exactly
  once and in identical order.
- Physical line-break counts match for all 50 rows.
- Runtime variable `$SQ62.poison_cost$` matches exactly at ID 20516.
- The `[DO NOT USE]` warning at ID 20517 is localized in each language; it is
  recorded as a localized-label exception rather than a runtime-token defect.
- The +30%/+20% values at ID 20531 are preserved.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 20501-20550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
20551.
