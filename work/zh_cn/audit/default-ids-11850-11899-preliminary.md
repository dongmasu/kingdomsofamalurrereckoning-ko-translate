# Preliminary Language Scan: `default` IDs 11850-11899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11850-11899.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11852 | `It's a lovely arrangement` → `참 근사한 배치` | Determine whether “arrangement” means a physical arrangement, agreement, or another pleasing setup. | Korean follows a spatial/setup reading; Chinese does too, while Japanese reads it as a pleasing rule/order. The scene is not supplied. Historical notes already flag the ambiguity. | Medium |
| 11854 | `In Brother Fallon's memory` → `팰런 형제의 기억을 떠올리면` | Clarify whether this means “in memory of” Brother Fallon or based on his remembered instruction; verify the name form. | Korean reads it as recalling Brother Fallon before recommending all three shrines. Japanese/Chinese also leave the memorial-versus-memory relation unclear. Historical notes already flag it. | Medium |
| 11857 | `war collections` → `전쟁 모금품` | Verify whether these are war donations/fundraising collections or collected war goods; retain the theft allegation. | Korean says someone is stealing war fundraising goods. Japanese and Chinese also interpret the phrase as donations/support for the war, while English alone could be read more broadly. | Medium |
| 11864 | Beckoned / battle comparison | Retain the encouragement to approach the task like battle and align the Beckoned title with the broader glossary. | Korean preserves the assurance of success and direct address. The title remains provisional across the corpus; no local semantic problem is established here. | Medium |
| 11868 | Dulstan / Summer and Winter Courts | Verify the historian's spelling and preserve that the notes are a partial account of the only battle between the Courts. | Korean retains both Courts and the “only battle” claim. English/Japanese/Chinese support the relation but vary on names and the exact collective term. Historical notes already flag the lore entry. | Medium |
| 11869 | `$DLC1_LordOfTheKeep.MYFA_ALLOWANCE$` / `#NAMED_ICON_GOLD#` | Preserve both runtime tokens exactly and in source order. | Korean retains the allowance variable followed by the named gold icon. All four locales have the same exact token strings and order. | High |
| 11873 | Court of Enchantments → `마법의 궁정` | Keep the established active form provisionally; verify the faction/court distinction in the consolidated terminology pass. | Korean matches a recurring active form, including IDs 2630 and 4149. The isolated label does not resolve whether `궁정` or another institutional term is preferred. | Medium |
| 11879 | Sidhe → `시데` | Align with the competing active form `시드(Sidhe)` without treating frequency alone as proof of the canonical pronunciation. | This row uses `시데(Sidhe)`. The active CSV contains both `시드(Sidhe)` and `시데(Sidhe)` forms; the latter is less frequent in this resource. Chinese translates the term descriptively and Japanese uses a phonetic form. | High |
| 11881 | `The Scion` → `계승자` | Determine whether this is a named character, formal title, or generic heir before choosing a Korean term. | Korean translates it as “successor/heir.” The English capitalized label, Japanese/Chinese transliterations, and no surrounding context leave the referent open. Historical notes already flag the title. | Medium |
| 11883 | `If he can come apart so easily` → `그토록 쉽게 무너질 수 있다면` | Determine whether “come apart” means physical defeat, emotional collapse, or being broken in another sense; preserve the speaker's fear for everyone else. | Korean uses “collapse/fall apart.” Japanese says be easily defeated, Chinese suggests collapse, and English is metaphorical. Historical notes already flag the ambiguity. | Medium |
| 11884 | `foolish slab of flesh` → `멍청한 살덩이` | Preserve the deliberately demeaning insult without making it sound like neutral description. | Korean follows the English image literally. Japanese also uses a thick-cut meat insult, while Chinese generalizes it to “fool.” The unusual force appears intentional. | Medium |
| 11889 | Dverga / sagecrafters → `드베르가` / `마법물품 제작자` | Preserve the group's name and use the project's established craft term. | Korean retains that the Dverga are clever sagecrafters and aligns the profession with the recorded `마법물품 제작` terminology. Historical consistency does not indicate a local error. | Medium |
| 11895 | `{*1[Passive]}` / Mark of Flame | Preserve the localized-label wrapper, following newline, and ability effects. | Korean keeps `{*1...}` before the line break and retains Burning effects plus Mark of Flame damage. All four locales have one embedded line break and the same normalized localized-label marker class/order; the label content is localized. | High |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11852, 11854, 11868, 11881, and 11883.
  They remain open; historical candidates were not treated as approved.
- Counted active `Sidhe` forms in the Korean `default` CSV: `시드(Sidhe)`
  occurs 39 times and `시데(Sidhe)` 18 times. This documents variation,
  not a pronunciation decision.
- Confirmed ID 11869's allowance variable and gold icon are byte-for-byte
  identical and ordered consistently across all four locales.
- Confirmed ID 11895's localized-label marker and one embedded line break
  align structurally across all four locales.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and normalized runtime-marker
  class/order signatures match across all four locales in this range.
- ID 11869 contains the same variable and named-icon token sequence in every
  locale. ID 11895 contains one localized-label marker and one line break in
  every locale. No structural exception was found.
- Official Korean manual terminology could not be independently searched
  during this pass. Active CSV hashes match the recorded baseline; no active
  CSV was edited.

## Batch Status

IDs 11850-11899 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 11900-11949.
