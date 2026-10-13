# Preliminary Language Scan: `default` IDs 18850-18899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 18850-18899.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring names, and UI.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 18853 | key / Ghennig | Preserve that the key is required to open an unidentified object in Ghennig, not merely that it seems able to open somewhere. | English says the key “must open something in Ghennig”; Korean `어딘가를 여는 듯한` weakens the certainty and omits Ghennig. Japanese/Chinese keep the location. | Medium |
| 18855 | `Castellan` | Confirm the castle office/rank and whether `성주` is the intended equivalent. | Korean uses `성주`; the historical question notes that Castellan may mean a castle administrator/steward rather than its lord. | Medium |
| 18859 | Cape Solace / `castaway` | Align the cape name and avoid narrowing `castaway` beyond what the setting supports. | Korean uses `솔러스 곶` and `난파선 생존자`; a castaway is shipwrecked/stranded, but the exact event is not specified. Japanese calls the person a castaway without adding shipwreck detail. | Low |
| 18865 | Idylla / Hyperian / cavern temple | Clarify what Hyperian denotes and preserve the building's stated position and intended use. | Korean follows the English “crowns this cavern” with `동굴 꼭대기`; Japanese reverses the spatial relation. The historical question leaves the Hyperian's identity unresolved. | Medium |
| 18867 | `{*1Shields}` / `{*1inventory}` / `{*1armor}` | Verify the localized UI navigation order and labels; retain all wrappers. | All locales contain three `{*1...}` wrappers. Korean displays them as Shields → armor → inventory, while English/Japanese/Chinese order the latter two as inventory → armor. No wrapper is lost; this is a visible localized-label reorder, not a marker-identity/count mismatch. | High |
| 18868 | Ljosalfar / Tuatha | Align the Ljosalfar name with the official glossary. | Korean uses `료스알브`; this matches the official-manual term already recorded in historical notes. | Medium |
| 18869 | `Jersey` | Resolve whether the isolated string is a character/place name or a clothing item before choosing a Korean form. | Korean gives `저지(Jersey)`; the other locales retain the Latin label or transliterate without resolving its sense. | Low |
| 18873 | Private Gautliffe / last survivor | Resolve the gender conflict from game context rather than assuming the Chinese pronoun is correct. | English and Japanese use masculine reference; Chinese uses feminine. Korean says `그가`, aligning with English/Japanese. | Medium |
| 18876 | `Preordained Talismans` | Align the faction name `Preordained` and preserve that the objective is to collect its talismans. | Korean renders it as `예정된 자들`; verify against the project's recurring faction terminology. | Medium |
| 18881 | `the Orison` | Determine whether Orison is a formal rite/name or the generic act of prayer. | English capitalization and Korean/Japanese transliteration suggest a proper term; Chinese treats it as prayer. Historical question remains unresolved. | Medium |
| 18893 | Beckoned / sewer familiarity | Preserve the lightly sarcastic apology and address; check whether omission of `Beckoned` is intentional. | Korean retains the comparison with the masons and apology but omits the explicit address used in English/Chinese. Japanese also omits it. | Low |
| 18895 | New Culn / “see it through” | Confirm whether New Culn is a settlement/group and what shared task “it” refers to. | Korean retains the proper name and shared commitment; English leaves both the entity type and undertaking implicit. Historical question remains open. | Medium |
| 18898 | `Revival` / tent city | Verify whether Revival is a settlement name or a generic encampment/community description. | Korean transliterates `리바이벌`; Japanese/Chinese also treat it as a named camp. English capitalization is supportive but not conclusive. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 18802, 18809, 18815, 18819-20,
  18824, 18834, 18839, 18848, 18855, 18865, 18867, 18869, 18873, 18881,
  18895, and 18898 against the active four-locale rows. The Lorestones,
  deity/follower wording, giant heritage, prophecy, Cursewood, Motus,
  Rose-of-Shadows, Tidal Pools, troll description, Castellan, Hyperian,
  UI tags, Jersey, Gautliffe pronoun, Orison, New Culn, and Revival questions
  remain preliminary.
- Added the key certainty/location concern at 18853 and the Cape Solace /
  castaway scope question at 18859 after direct source comparison.
- Cross-checked the Ljosalfar form at 18868 against the historical official
  glossary note; the Korean `료스알브` is consistent with it.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 18850-18899
  in identical order.
- No key, row-count, or physical line-break difference was found.
- ID 18867 retains all three runtime marker wrappers; the localized labels
  for inventory and armor change visible order in Korean. Other detected
  brace/bracket/angle-token sequences match.

## Batch Status

IDs 18850-18899 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 18900-18949.
