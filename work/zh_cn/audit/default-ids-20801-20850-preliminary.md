# Preliminary Language Scan: `default` IDs 20801-20850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 20801-20850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 20802 | Litany Altar / `연도 제단` | Determine whether the five offerings are litanies, books, verses, or another collectible. | English says “five” to place at the altar; Japanese identifies five litany books, while Korean says five verses. | High |
| 20804 | Oratory / `기도실` | Confirm whether this is a prayer room/chapel or a public-speaking hall. | Wencen's name and the context support a religious building; Korean chooses a prayer room, while Chinese uses a word for an auditorium. | Medium |
| 20813 | House of Ballads / Maid / `발라드 가문` / `시녀` | Align the faction and Maid title with established lore terms. | Korean uses a recurring House name and Maid rendering, but the Maid title is repeatedly flagged as potentially misleading. | Medium |
| 20815 | Animation Speed Multiplier / `애니메이션 속도 배율` | Confirm whether this is an internal parameter or player-facing setting. | Korean is a direct UI-style label; historical audit leaves audience/context open. | Low |
| 20820 | Travelers / `여행자들` | Preserve whether this is the named faction or generic travelers. | English capitalizes Travelers; Korean uses an unmarked plural, while the line reports what others claim about their values. | Medium |
| 20822 | cursed weapon drains life force / `생명력` | Confirm the affected resource and retain the per-attack trigger. | Korean preserves the repeated attack trigger and partial life-force loss; the exact game-stat label remains a glossary question. | Medium |
| 20824 | Kollossae / `콜로세` | Align the people's Korean name and retain the stoneworking claim. | The active draft also uses `콜로새`/`콜로새족`; historical audit flags the inconsistency. | High |
| 20826 | Trial of Commencement / `입문의 시련` | Determine whether Commencement means initiation, beginning, or graduation. | Korean selects initiation; the Chinese reference calls it a graduation trial. | High |
| 20829 | Shattertier / “hunt the hunter” | Confirm the place name and retain the deliberate hunt-word repetition. | Korean preserves both the location name and the compact reversal; exact Shattertier form remains unverified. | Medium |
| 20830 | capitalized `Our house` / `우리 가문` | Confirm whether House is the named Fae faction or the speaker's family. | English capitalizes `Our`; Korean uses `가문`, which preserves ambiguity but not an explicit faction form. | Medium |
| 20832 | Mana Regeneration recipe | Preserve the three ingredients, quantities, and list layout; verify reagent names. | Korean retains all three names and values (3, 2, 1), with the same blank-line and line-break structure. | High |
| 20834 | Magic Block Efficacy / `마법 방어 효율` | Identify the defensive mechanic and align the stat label. | English says “Block,” Chinese says “parry,” and Korean uses broad “magic defense”; exact mechanic is unresolved. | High |
| 20839 | Weapon Attacks / Parry / localized marker | Align weapon and combat terms and preserve the upgrade wrapper. | Korean retains the `{*1...}` wrapper, line break, three weapon names, and parry-triggered special attacks. | Medium |
| 20840 | Gallows End / `갤로우즈 엔드` | Align this place spelling with the project's canonical form. | The active corpus contains several competing Gallows End spellings; Korean's form is one of the documented variants. | High |
| 20849 | ring / `broken, and alone` | Preserve the parallel memories and emotional sense of “broken.” | Korean retains the ring's beauty, departure to war, and his injured/alone return; the Chinese version instead suggests he returned penniless. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 20802, 20804, 20813, 20815, 20822,
  20824, 20826, 20829, 20834, 20839, and 20849 against the active four-locale
  rows. The questions remain open; none authorizes a translation edit.
- Cross-checked Kollossae and Gallows End forms against the active corpus;
  both remain unresolved consistency issues.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 20801-20850 exactly
  once and in identical order.
- Physical line-break counts match, including the recipe at ID 20832.
- Runtime marker identities/order match at ID 20839; localized wrapper text
  differs as expected.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 20801-20850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
20851.
