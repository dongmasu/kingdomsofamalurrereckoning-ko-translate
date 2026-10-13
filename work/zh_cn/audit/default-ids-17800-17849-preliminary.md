# Preliminary Language Scan: `default` IDs 17800-17849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 17800-17849.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 17802, 17831 | Elund / Elund Carth | Confirm whether the shared name denotes the same person and standardize its Korean spelling. | Korean uses `엘런드` for Elund and `엘런드 카스` for Elund Carth; the identity relation is not explicit in either row. | Medium |
| 17809 | level-up tutorial / `{*1...}` and `{1}` | Preserve all four runtime markers and their order while localizing only supported payload text. | All locales retain level-up, `{1}`, abilities, and skills markers in that order; Korean retains the upgrade instruction. | High |
| 17810 | sagecrafting / Delving Hall | Align the crafting skill and named location. | Korean retains that Raina teaches the skill and is usually in Delving Hall; earlier rows use `마법물품 제작`, while English says Sagecrafting. | Medium |
| 17812 | capitalized `Font` / waning flow | Determine whether Font is a named magical source and align its term. | Korean uses `근원(Font)` and preserves the declining flow; Japanese reads a spring and Chinese a sacred spring. | Medium |
| 17816, 17826 | Cycle / Godstorm / Great Cycle | Standardize capitalization and Korean terminology for the mythic event and Fae cycle. | Korean preserves the champion, broken weapon, and cycle shift; recurring terms have multiple provisional forms. | Medium |
| 17824 | Anella / impetuous / wild ideas | Follow the English meaning provisionally and record the Japanese divergence. | Korean says curious/odd, impulsive, and full of wild ideas, matching English/Chinese; Japanese calls her arrogant and dangerous. | Medium |
| 17827 | Headhunter “heads” | Preserve the deliberate wordplay and confirm whether the quotation marks are intentional. | Korean keeps the quoted plural “heads” and the completion claim; the source uses the same quoted pun. | Low |
| 17831 | Rathir / “of our kind” | Preserve the speaker's uncertainty between origin and long absence. | Korean retains both alternatives and Elund's welcome; name consistency is tracked with 17802. | Medium |
| 17832 | Flame of Rhyderk / Sir Creth / Sir Airmer | Verify names/title conventions and inspect the Korean title's doubled quotation marks. | Korean retains the ballad, two knights, ancient sword, and Lorca Rane location, but renders the title with doubled ASCII quotes. | Medium |
| 17840 | `invisible ammo slow` | Determine whether this is an internal effect/diagnostic label and whether “slow” is an effect or projectile property. | Korean gives a compact literal parenthetical; English has no capitalization/context to resolve the label. | Medium |
| 17843 | Crownhold / Faelands / “moves east” | Preserve the threat and direction without deciding what the source's “here” means. | Korean retains the ambition beyond Crownhold and the eastern advance; the Japanese/Chinese references phrase the Faelands clause differently. | Medium |
| 17844 | “Not if you mean to enter Alabastra” | Resolve the elliptical antecedent before deciding whether the Korean conditional is correctly oriented. | Korean says “unless you intend to enter Alabastra”; the English fragment may mean entry is impossible without something, but the prior clause is absent. | High |
| 17845 | ambition / indifference / imparted qualities | Preserve the two offered effects and their contrast. | Korean retains indomitable resolve from ambition and fearless impartiality/fairness from indifference; no selection is made for the player. | Low |
| 17847 | Oathblade | Verify whether this is a formal Warsworn rank/title and standardize it. | Korean uses `서약검`; Japanese and Chinese use different title readings. The greeting clearly addresses the player by rank. | Medium |
| 17849 | `DISPELLING` | Align the all-caps ability/menu label with the established dispel terminology. | Korean gives `마법 해제`; Japanese/Chinese use curse-removal/dispel terms. Capitalization suggests a system label. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 17802, 17810, 17812, 17816,
  17824, 17826, 17840, and 17845-17849 against the active four-locale
  rows. They remain preliminary questions; no historical note authorizes a
  translation edit.
- Related questions include Elund name consistency, Font, Godstorm/Cycle,
  Spellcloak/Oathblade, and dispelling terminology.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 17800-17849
  in identical order.
- Embedded line-break counts match, including the two-break stat entry at
  17835.
- Localized marker class/order at 17809 matches across all locales, including
  `{1}` in the same position. No structural exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 17800-17849 received one preliminary reading followed by a disposition
pass. See
[`disposition-batch-default-17800-17849-20261009.md`](disposition-batch-default-17800-17849-20261009.md).
Two quote-format corrections were accepted at IDs 17827 and 17832; eight
terminology/name/context findings remain uncertain and unchanged. Continue
disposition work with `default` IDs 17850-17899.
