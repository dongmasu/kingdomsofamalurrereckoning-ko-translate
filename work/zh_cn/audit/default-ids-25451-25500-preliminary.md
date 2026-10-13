# Preliminary Language Scan: `default` IDs 25451-25500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25451-25500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25451-25453 | “work things out” / families and loved ones / repeated ground clue | Clarify whether “work things out” means reconcile; preserve the speaker's shame and repeated ground hint without revealing a specific plant/object. | Korean reads reconciliation and retains the intentionally repetitive “ground” clue. | High |
| 25454-25458 | “of Ice Aversion” / Bareth / Cydan / holy king / Cipher | Identify whether ID 25454 is a fragmentary item suffix; standardize the two names and Cipher term. | Korean renders `얼음 저항의` as a fragment and uses `성왕`/`암호 장치`; context is required before completing the suffix. | High |
| 25460 | Force | Confirm whether this is a control/action label rather than a stat or abstract attribute. | Korean says `힘으로 열기`, matching Japanese's “force open”; Chinese gives only “strength.” | Medium |
| 25462 | Unseelie Houses / Prismere / Gadflow | Standardize faction, substance, and name forms while preserving the corruption-versus-purity framing. | Korean uses `안실리 가문`, `프리즈미어`, and `가드플로`; related occurrences have other Korean spellings. | High |
| 25464-25467 | Pall of Eadric / Vox Victorium / Cillian Keen / linebreakers | Identify whether Pall is a named relic/title; standardize organization, person, and elite-infantry role names. | Korean uses `장막`, transliterates Vox Victorium, and describes the shield-wall-breaking infantry as `돌파병`; references differ on the Pall and military-role terms. | High |
| 25468 | Brother Wulf crystal journal | Preserve the dated diary's four paragraph divisions and deterioration sequence; verify “mission” versus chapel terminology and the source's disposal question. | Korean retains Thursday, all four paragraph sections, Wulf's physical/spiritual decline, the research questions, and the writer's prayer. English contains grammatical errors (“when does take notice,” “how I can I get dispose”). | High |
| 25469-25471 | House Anwon / Chaos Rifts / Start Round 3 | Standardize the House form and keep the round label consistent with other arena/UI labels. | Korean retains the family, rift-closing objective, and numeral `3`. | Medium |
| 25473 | property ownership prerequisite | Preserve that assistance is unavailable until the speaker owns property. | Korean retains the condition and polite refusal; the exact property requirement is contextual. | Medium |
| 25474-25475 | “Dove” / contradictory “give you what I want” / Pledgeshield Zotikus | Determine whether “Dove” is a term of address and whether the source means “give you what you want”; standardize Zotikus's rank/name. | English literally says “I have to give you what I want,” while Korean preserves that wording. Japanese rewrites the exchange; its title reading for Zotikus differs from the English/Chinese compound. | High |
| 25477-25482 | Praetorian / Detyre / Staff attack / Keepers | Standardize the rank, region, weapon control instructions, and faction/role terminology. | Korean retains the hold-and-release Staff attack and the question about the Keepers; name/title forms vary. | High |
| 25484 | Plagueshield Tincture | Verify the recipe/quest item's canonical name and distinguish tincture from a generic potion or protection item. | Korean uses `역병 방호제`; other locales transliterate or describe a Plagueshield tincture. | Medium |
| 25485 | `$NQD_City_Adessa.upgrade_price$` | Preserve the exact city-upgrade variable and its placement in the price prompt. | All four locales retain the same variable and gold label. | High |
| 25486 | “ails, fails, or irks you” | Preserve the playful three-part sales pitch without implying every failure is a medical ailment. | Korean retains all three categories but the English alliterative wordplay cannot map directly. | Medium |
| 25487 | Orla Devlin / wild Fae / cursed grove | Preserve the druid's attribution that settlers' mistreatment prompted retaliation and that destroying cursed roots can dispel the nature magic. | Korean retains the full causal claim and remedy; verify the name and local flora/fauna terms. | High |
| 25490, 25492 | Fellfire Pit / Arena | Standardize the named pit and distinguish living/working in the Arena from growing up as a child there. | Korean uses `펠파이어 구덩이` and retains the fighter's history and crowd-pleasing motive. | Medium |
| 25496-25498 | Khamazandu / Pryderi | Verify name spellings and whether Pryderi is a place, person, or mercantile organization. | Korean adds `상회` (“trading company”), matching Japanese's merchant-company reading, while English and Chinese leave the referent less explicit. | High |
| 25499 | Clay/Leather/Metal/Wood Materials | Preserve all four categories, the count 25 for each, and their order. | Korean retains four lines and all quantities. | High |
| 25500 | Eritrea | Preserve the country-name reading and standardize localization/transliteration. | English/Japanese/Korean use the country; Chinese uses a phonetic rendering. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 25450-25458, 25462,
  25464-25471, 25473-25475, 25477-25482, 25484-25487, and 25490-25499
  against the active locale rows. House names, repeated ground clue, item
  fragment, Cipher, Unseelie/Prismere, Pall, Vox Victorium, linebreakers,
  Brother Wulf's journal, “Dove,” Pledgeshield, Praetorian, Detyre, Staff
  attack, Keepers, potion terms, name causes, Arena, and material labels
  remain open candidates.
- Cross-checked recurring forms for Houses of Pride/Vengeance, Bareth,
  Cydan, Cipher, Unseelie, Prismere, Gadflow, St. Eadric, Vox Victorium,
  Cillian Keen, Brother Wulf, Mitharu, House Anwon, Chaos Rifts, Detyre,
  Keepers, Plagueshield, Orla Devlin, Fellfire Pit, Khamazandu, Pryderi,
  and the crafting-material categories.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25451-25500 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales. ID 25468 retains
  four dated/diary paragraph sections; ID 25499 retains four material lines.
- Runtime-token signatures match, including
  `$NQD_City_Adessa.upgrade_price$` at ID 25485. No marker identity/order
  mismatch was found.
- All counts and list order are retained. No structural exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25451-25500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25501.
