# Preliminary Language Scan: `default` IDs 55051-55100

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55051-55100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and quantities.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55054 | `역병 방패(Plagueshield)` | Confirm whether `Plagueshield` is a named consumable/remedy or a literal shield, and use its established item-name form. | The dialogue says Astrid will run out of it; the English capitalizes the term, while Korean currently renders it as a generic “plague shield.” Chinese also translates the term literally. | High |
| 55060 | Oleyn's eight-line verse and epithets | Preserve the stanza break and establish consistent forms for `The Pure`, `Lady of the Light`, `Knight of Golden Knot`, and `Cureseeker`. | Korean retains the blank stanza separator and all eight verse lines. The rendering of `Golden Knot` and `Cureseeker` is literal; Japanese and Chinese also vary in how they treat the epithets. | Medium |
| 55061 | `감시자들(Watchers)` | Determine whether `Watchers` is a named faction/group or ordinary guards and apply capitalization/parenthetical naming consistently. | The English uses a capitalized plural name and says they stand guard. Korean preserves the English name; Japanese and Chinese also describe guards/watchers. | Medium |
| 55063 | `미사루의 경화된 결속구` | Verify the established crafting-component terminology for `Mitharan Hardened Bindings`. | Korean retains the full material/item name, but the compound can be read as a generic fastening rather than a named component. | Medium |
| 55068 | `Cape Solace` | Retain the place-name interpretation and check for corpus-wide spelling consistency. | English, Japanese, and Korean identify Cape Solace; the Chinese source instead has `慰藉斗篷` (“mantle/cloak of solace”), a likely source-locale discrepancy. | High |
| 55073 | `House Anwon` / `Seafoam` / `Lady` | Confirm Seafoam's status as a place/tavern and preserve the warning's social restrictions and the “her wine” implication. | Korean follows the English prohibition against being seen at Seafoam and the warning about the Lady's wine. Japanese explicitly calls it a tavern; the English leaves the venue type implicit. | Medium |
| 55074 | `스트래턴의 연극에 배역 배정하기` | Confirm the intended game action for `Cast Straton's Play`. | Korean interprets `cast` as assigning roles in a play; Japanese uses the same casting/role-assignment sense. | Low |
| 55078 | Octienne/Jorielle hierarchy; `Livrarium` | Keep the aide, two Templars, confession requirement, and destination roles distinct; standardize the institution name. | The Korean quest summary preserves the sequence and hierarchy. The place is transliterated as `리브라리움`; the exact official Korean form remains a terminology question. | Medium |
| 55080 | Chakram modifiers `+2` and `+5%` | Preserve both separate stat lines and their association with Chakrams. | Korean has two lines and retains both values and the weapon association; all four locales preserve two modifier lines. | High |
| 55083 | Clyeth Arne / Dolve Arne | Keep the requester and destination distinct, and verify the Korean spellings against other occurrences. | The English first mentions Clyeth Arne and then Dolve Arne as the recovery location; Korean preserves two separate names and the later entry into Dolve Arne. | Medium |
| 55089 | `it` / fate and life beginnings/endings | Resolve the pronoun's referent from surrounding dialogue before considering an explicit Korean noun. | Korean retains `그걸` without identifying the force being changed, as do the English, Japanese, and Chinese rows. | Medium |
| 55090 | `Hierophant`, `Travelers`, `Argine`, `Sun Camp` | Confirm consistent office, faction, and place-name forms, especially the singular Hierophant's role among the Travelers. | Korean preserves all four named concepts and the contrast between the Travelers and Sun Camp; the Chinese translation uses “high priest” for Hierophant. | Medium |
| 55091 | `Arcadium` | Determine whether this is a proper place/name rather than an arena label; preserve the established form. | Japanese and Korean transliterate `Arcadium`, while Chinese translates it as “arena.” The source-keyed historical note flags this name. | High |
| 55095 | `Maisie's Luck` / `Revival` | Preserve the ring name and determine whether Revival is a named settlement/location; retain the bad-luck wordplay. | Korean treats Revival as a place and retains the ring's name. Japanese and Chinese also make the location explicit, while the English line alone leaves its type unstated. | Medium |
| 55098 | `it opens to welcome you` | Preserve the ancient Erathi sealing and the surprising present opening without assigning an unsupported agent. | Korean keeps the place as the grammatical subject opening to welcome the player; Japanese and Chinese likewise leave the mechanism unexplained. | Low |
| 55099 | `Dunehead site` | Confirm whether this is a named worksite and keep it distinct from any Dunehead location or mine name. | Korean says work resumes at the Dunehead site; Chinese specifies a mine, while English leaves the type open. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Edmure, Astrid, Plagueshield,
Oleyn, Mitharan, Lou Winfreigh, Cape Solace, House Anwon, Seafoam, Straton,
Keurig, Octienne, Jorielle, Livrarium, Clyeth Arne, Dolve Arne, Skald,
Lachlan's Balm, Omnibus Arcana, Hierophant, Travelers, Argine, Arcadium,
Maisie's Luck, Revival, Erathi, and Dunehead.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `55050-55149`.
  Relevant prompts include Plagueshield (55054), the Oleyn verse and
  epithets (55060), Watchers (55061), Mitharan Hardened Bindings (55063),
  House Anwon/Seafoam (55073), Straton's Play (55074), the Octienne/
  Jorielle hierarchy and Livrarium (55078), Clyeth/Dolve Arne (55083),
  Chaos Realm/Skald (55085), the referent of `it` (55089), Travelers/
  Hierophant/Argine (55090), Arcadium (55091), Maisie's Luck/Revival
  (55095), and Dunehead (55099).
- ID 55050 is the opening boundary of the historical range and was recorded
  in the preceding active report. It is not repeated here.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55051-55100 once
  and in identical ascending order.
- Physical line-break counts match across all four locales; the Oleyn poem
  retains its blank stanza separator and the two Chakram stat lines.
- Runtime markers, numeric values, and percentages match in identity and
  order, including both Chakram modifiers at 55080 and `+6%` at 55093.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 55051-55100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 55101.

## Disposition Cross-Reference

The working disposition pass is recorded in
[`disposition-batch-default-55051-55100-20261010.md`](disposition-batch-default-55051-55100-20261010.md):
10 IDs remain uncertain, 40 are `not an issue`, and no CSV correction was
accepted. This is an in-progress disposition, not independent final approval.
