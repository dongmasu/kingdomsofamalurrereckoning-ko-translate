# Preliminary Language Scan: `default` IDs 47651-47700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47651-47700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47651 | Quays / Burn / Upper City / `퀘이` / `번` / `상층 도시` | Confirm whether `the Burn` is a named harbor/district rather than a generic “burnt” area; preserve the list of city districts and landmarks. | English capitalizes the names; Korean transliterates Quays and Burn, while Japanese interprets them as port/harbor districts. The historical notes explicitly flag `Burn` as a name question. | Medium |
| 47656 | Wyl / mysterious gauntlets / `신비한 건틀릿` | Verify the name `Wyl` and the exact equipment category found in the well. | Korean preserves the Alfar fishing village, ruins, bones, and well location; the historical log asks about both the proper name and item type. | Medium |
| 47658 | Sustained Cost / `마나 15%` | Preserve +10% Critical Hit Damage and the separate sustained-cost line; determine whether the 15% is based on maximum Mana. | All locales retain +10% and 15% on separate lines. Japanese explicitly says maximum Mana; English, Chinese, and Korean do not specify the base. Korean follows the English ambiguity. | Medium |
| 47661 | House of Valor / `발러 가문` | Determine whether this is a formal Fae faction/House or a family, and retain the Circle of Engard's goal of restoring lost rites. | Korean renders House as `가문`; English capitalization and the source do not establish whether this is a political faction, lineage, or other institution. | Medium |
| 47662 | last lord / Wilda Brandan / unacknowledged child | Preserve the claim that the last lord had a young mistress and refused to acknowledge their child; clarify the historical/lore referents. | Korean retains the affair and disavowed child. The historical log flags the account as lore-dependent; `last lord` and the identity of the people remain open. | Medium |
| 47663 | Hierophant / `대사제` | Confirm the established title/formula for the prayer that the Hierophant keep, bless, and watch over the addressee. | Korean preserves the three blessings and gratitude. Japanese uses “Guide,” and Chinese says “High Priest,” so the title and formula differ across references. | Medium |
| 47665 | misspelled `FaceAccesory` / `얼굴 장신구` | Translate the apparent UI category without silently reproducing the source typo as a Korean term. | English misspells “Accessory”; Japanese and Chinese render a face-accessory category. Korean translates the apparent meaning. | High |
| 47669 | Ethene, Goddess of Wisdom / `에테네, 지혜의 여신`; localized `*1` race list | Preserve the goddess title, all three race names, and the localized marker payload. | All locales retain one `*1` marker in the same order. Korean retains Almain, Ljosalfar, and Dokkalfar; canonical forms remain terminology candidates. | Medium |
| 47672 | The Thigh Diaries / `허벅지 일기` | Confirm whether this capitalized phrase is an intentional title/joke or a literal diary label. | Korean translates the phrase literally; the historical notes ask whether it is a deliberate title. | Medium |
| 47675 | Blood Doge / `혈통공작` | Verify the title/pun and whether `Doge` should be retained as a rank rather than reinterpreted as a hereditary duke. | Korean combines “bloodline” and “duke”; the English announces a `Blood Doge`, and the historical notes explicitly flag the title. | Medium |
| 47677 | amphora / Orison / `암포라`, `오리슨` | Clarify whether Orison is a ritual, quest/task, or other formal term while preserving the amphora-to-fountain action. | Korean retains pouring the amphora's water into the fountain and returning to the Priestess for the second task. The source/context does not define Orison. | Medium |
| 47684 | first four tiers of unlocked Might/Finesse/Sorcery abilities / `힘, 재주, 마법 능력` | Confirm official attribute/ability terminology and retain +1 across the first four unlocked tiers. | Korean preserves the +1 and tier scope but uses generic `힘, 재주, 마법`; the exact gameplay category labels need glossary review. | Medium |
| 47686 | Child of Dust / `먼지의 아이` | Confirm whether this is a formal title/name and reuse its canonical form. | Korean retains the address and the claim that the addressee is remarkable among their kind; the historical notes flag the title. | Medium |
| 47690 | Savant Aethan Engar / `현자 에이선 엥가르` | Determine whether `Savant` is a rank/title or descriptive epithet and confirm the name forms. | Korean uses the generic `현자` (“sage”); English capitalization and the historical notes leave the rank/title status open. | Medium |

IDs 47652-47655, 47657, 47659-47660, 47664, 47666-47671,
47673-47674, 47676, 47678-47683, 47685, 47687-47689,
47691-47699, and 47700 generally retain the English meaning on this first
reading. Proper names, UI labels, and gameplay terminology remain subject
to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47650-47749. It flags
  `Burn`, Wyl/gauntlets, House of Valor, the last lord and child account,
  `FaceAccesory`, Blood Doge, Orison, Child of Dust, Savant, and other
  corpus-wide names/terms in this range.
- The 15% Sustained Cost at 47658 remains a mechanic question: only Japanese
  specifies maximum Mana. The Korean preserves the English wording and
  value without resolving the base.
- ID 47669 retains the `*1` marker and race list. No terminology candidate
  was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47651-47700 once
  and in identical ascending order.
- All four locales preserve the one embedded line break in ID 47658.
- ID 47669 preserves one `*1` marker in the same order in all locales.
- The +10% Critical Hit Damage, 15% Mana, and +1 ability values are
  retained. No special hidden whitespace or row-structure discrepancy was
  found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 47651-47700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47701.
