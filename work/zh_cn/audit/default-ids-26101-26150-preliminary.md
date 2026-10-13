# Preliminary Language Scan: `default` IDs 26101-26150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26101-26150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26101, 26134 | `Beckoned` | Choose and standardize the Korean title/address form during the terminology pass. | This batch uses `부름받은 자`; other work rows have used `선택받은 자`. The historical audit explicitly flags consistency, so neither form is treated as approved here. | High |
| 26103-26108, 26115-26118 | Hollowlands / Edgar Aron / Varen Seawine / Narca / Erathell / Emaire / Halcyor / Courdan Passant / Bruten | Verify names and place conventions and preserve the observer-contact objective. | Korean follows the source on Hollowlands, names, and the effort to contact Bruten's mysterious observers; transliterations vary by locale. | Medium |
| 26106, 26110, 26123, 26148 | Ynadon / Muse of Fate / Fateless One / Scion | Align deity, title, and lore terms with the established glossary. | The localized `{*1...}` availability wrapper at 26106 is present in all locales with the same marker identity/order; its enclosed wording is intentionally localized. Korean retains Ynadon, the Muse, Fateless One, and Scion references. | Medium |
| 26109, 26113, 26121 | Tuatha prisoners / dustling / “Look what the dust brought in” | Preserve the threat/ultimatum and the dust-related creature/address wordplay. | Korean retains the execution threat and renders `dustling` as `먼지 아이`; the insult's established form remains a consistency question. | High |
| 26126-26129, 26135-26140 | House of Ballads / Warsworn / Weave / Galafor Plain / War of Parries / Orieator's Lance / Dverga / Tirin's Rest / Alfar | Standardize faction, metaphysical, historical, and people/place terms; preserve the military service account. | Korean retains the repeated “served” emphasis and honor claim. The `War of Parries` and `Orieator's Lance` names need lore/name verification. | Medium |
| 26112, 26138 | combat effect / Health and Resistance values | Preserve exact numeric values and line breaks. | The pull effect keeps 14 meters, 15 Physical Damage, 8 Piercing Damage, and 20 Mana; the two-line bonus keeps +8% Health and +5% Elemental Resistance. | High |
| 26142, 26145-26149 | Ethene / Kollossae / Fomorians / Belen / Akara / new Scion | Verify proper-name spellings and the intended reference in the cryptic Belen line. | Korean preserves the single-line verse-like wording at 26146 and the signs/portents sequence at 26148; English's Akara pronoun is gender-neutral in Korean. | High |
| 26150 | Ljosalfar history, appearance, and society | Review the long lore chapter as a whole and standardize race, place, deity, religious-order, and title names. | Korean retains the chapter's three sections and all paragraph breaks. Its “descended from” wording as “split from” and several transliterations should be compared with the English and established glossary during integrated review. | High |
| 26153 | period-only string | Preserve the empty/minimal source value while checking locale punctuation conventions. | English, Japanese, and Chinese use ASCII `.`, while Korean uses `。`; content is otherwise the same one-character punctuation string. | Low |

## Historical Audit Reconciliation

- Rechecked the source-keyed questions for IDs 26100-26199. Beckoned,
  Hollowlands and names, Ynadon, dustling, faction/lore names, military
  history, Belen, and the Ljosalfar chapter remain candidates.
- Cross-checked recurring forms for Edgar Aron, Varen Seawine, Narca,
  Erathell, Emaire, Halcyor, Courdan Passant, Ynadon, Muse of Fate,
  Fateless One, House of Ballads, Warsworn, Weave, Dverga, Tirin's Rest,
  Alfar, Ethene, Kollossae, Belen, Akara, and Scion.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26101-26150 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales, including the
  multi-section Ljosalfar chapter at ID 26150.
- Runtime marker identity/order matches; the localized contents of the
  `{*1...}` wrapper at ID 26106 differ by design.
- The 14-meter combat range and all damage/Mana and percentage values are
  preserved. No structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 26101-26150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
26151.
