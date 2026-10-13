# Preliminary Language Scan: `default` IDs 36001-36050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 36001-36050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and the historical source-keyed questions.
- Read-only preliminary candidates, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 36004, 36013 | `아르카디움`, `명장들` | Confirm Adessa's financial hub versus the Arcadium and Master Makers as formal place/group names. | English distinguishes large merchant transactions from Arcadium activity. Chinese calls Arcadium an arena, while English/Japanese/Korean leave it named. | Medium |
| 36014 | four map tutorial panels | Standardize Faelands/World Map/Fast Traveling/Local Map/Mini-Map labels while preserving the indoor/combat restriction, discovery conditions, and north-locked orientation. | All four sections and their `{LINE_LEFT}`, `{*2...}`, `{LINE_SPACE}` marker sequences match in English/Japanese/Chinese/Korean; Korean retains the instructional details. | Low |
| 36015 | `다른 입구 찾기` | Retain the English entrance reading; Japanese alone says another exit. | English `Find another entrance`, Chinese entrance, and Korean entrance agree; do not adopt the Japanese direction for the quest objective. | Low |
| 36017, 36019-36020 | Galafor Plain, Hierophant/`대사제`, Ariad | Confirm historical/lore names and standardize the Hierophant title with the same person's earlier `히에로펀트`. | English names Orieator/Varlaine and the Snaketail Grotto quest. Korean calls the Hierophant `대사제` at 36019 while elsewhere transliterating the formal title. The objective sequence and battle inscription are retained. | Medium |
| 36024 | Rotelos/Nerotelos and the colored lock | Confirm three wings, violet-first choice, and whether `paranoid in their labors` refers to trap design rather than merely energetic concealment. | English describes the falling cage and three color-coded parts; Korean retains one break and all three sections but calls the family `집요했던` in hiding treasure. | Medium |
| 36028, 36031 | Belne, Ashmoor Clan, Esklad spelling | Align recurring persons and proper place names with earlier entries. | English at 36031 spells Esklad; Korean `에스클라드` differs from the earlier `에스크라드` at 35155. Both rows refer to Adessa context, but confirm identity before settling one form. | Medium |
| 36036 | `그녀가 무사한지만` | Note the English typo `know she that she` and retain the city-departure restriction without imitating the typo. | English/Japanese/Chinese and Korean convey the speaker wants assurance that she is unharmed but is forbidden to leave after serving the city well. | Low |
| 36042 | `약하고 다친 이들을 잡아먹으며` for `preying on` | Verify whether the villain literally eats the weak or only exploits/victimizes them. | English `preying on` is ambiguous; Japanese/Chinese say victimizing or targeting. Korean `잡아먹으며` narrows it to eating, which the line does not establish. | High |
| 36046-36047 | Varani king's shield; restore the hunt | Standardize Varani/barrow and lord/hunt lore, retaining the elemental protection of the soft gold. | English says the shield can be fought with despite its precious metal, and the dead figure may rise again to restore the hunt. Korean keeps both premises. | Medium |

IDs 36001-36003, 36005-36012, 36016, 36018, 36021-36023,
36025-36027, 36029-36030, 36032-36035, 36037-36041,
36043-36045, and 36048-36050 generally retain English meaning on
this first reading. All names and role-specific voices remain open.

## Historical Audit Reconciliation

- The source-keyed historical log has an IDs 36000-36199 section;
  the active rows were compared against its questions and the three
  reference locales. No prior issue inventory was treated as approval.
- `preying on` at 36042 and the local Esklad name discrepancy at
  36031 are preliminary candidates, not approved CSV edits.

## Other Checks

- All four files contain IDs 36001-36050 once in identical order.
  Only ID 36024 has one embedded break, preserved across the locales.
- ID 36014 retains four panel headings and all map-layout marker
  identities/order. No runtime-token order mismatch occurs in the
  50-row range.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 36001-36050 received one preliminary reading. Findings remain
open candidates. Continue at `default` ID 36051.
