# Preliminary Language Scan: `default` IDs 26801-26850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26801-26850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26801-26805, 26807-26825, 26827-26836, 26838-26839, 26842-26850 | Dialogue, quest, and concise UI/item strings | Recheck register, short-label context, and proper-name conventions during integrated review. | Korean generally retains the English meaning and Japanese tone. ID 26802 preserves the parent's regret about military service; ID 26821 retains the rhetorical “sister” address; ID 26834 preserves the no-return warning after death. | Medium |
| 26805-26806, 26808-26811, 26815, 26821-26824, 26828, 26830-26833, 26837-26838, 26846-26849 | Aster family / Mitharan Clarity Rivets / Midden / Weeping King / Arhaus Vorm / Dverga / Mathlon / Ansilla / Caverns of Ingress / Tuatha / Hartwen / Bonewhite Forest / Alabaster Wall / Prismere / Trueshield / Sparrows / Caerwyn | Align faction, race, character, place, creature, and item names with the terminology inventory and name-display convention. | The source-keyed history groups most of these terms for standardization. The English item label at 26806 spells `Clairty` (likely a source typo); Korean renders the apparent intended `Clarity` as `명료화`. Preserve the source anomaly in the audit rather than silently treating this spelling as a Korean defect. | High |
| 26806, 26812, 26815-26816, 26820, 26831-26832, 26840-26845 | Rivet item name / brawl count / Dverga pieces / From Parts Unknown / Develop / miner / Convict's Cavern / Freezing and Ice Barrage / fire stats / equipment rating / mine upgrade | Preserve gameplay/item mechanics and decide whether the wording is an established label or a generic description. | ID 26840 preserves +75% Freezing duration and +30% Ice Barrage damage; ID 26841 preserves +30 Fire Damage and +75% Fire Damage. ID 26844 accurately describes defense rating for armor and total weapon damage. The phrase `Dverga pieces` is rendered `드베르가 유물`, a context-dependent inventory term. | High |
| 26824, 26828, 26834, 26837-26838, 26843, 26847 | Ansilla dolls / Caverns of Ingress sigil stones / death-return rule / Bonewhite Forest poem / “concerned parties” / soldier aftermath / Sparrows | Preserve story relationships, stanza structure, marker referents, and source grammar anomalies. | The doll account retains that they were last seen with Lady Ansilla when her family was killed by the bolgan. The Bonewhite Forest passage preserves its six actual embedded line breaks and sequence: peace, Gadflow's devastation, Tuatha axes, Tirnoch's spires, and the current war. English has source grammar errors at 26843 and 26847; Korean follows their intended meanings. | Medium |
| 26838, 26844, 26847 | “concerned parties” / defensive and weapon values / Sparrows under threat | Retain the English meaning where Japanese or Chinese departs, and keep numeric/UI labels exact. | At 26838, Korean `관계자들` follows English's ambiguous “concerned parties”; Japanese specifies Watchers, which is not imported without English support. ID 26847 preserves that the Sparrows face a threat, without relying on Chinese's generic sparrow wording. | High |

## Historical Audit Reconciliation

- The preserved question log groups Aster family, Mitharan Clarity Rivets,
  Midden/Weeping King, Arhaus Vorm, Bare-Handed Brawl, Dverga pieces,
  Ansilla dolls, Mathlon, Dalentarth, Convict's Cavern, Tuatha, Apotyre
  Miner, and Hartwen.
- It also records the return-from-death rule, Bonewhite Forest/Alabaster
  Wall/Prismere poem, Watchers, “concerned parties,” Freezing/Ice Barrage,
  fire-damage values, and armor/weapon rating.
- These historical entries remain issue inventory, not formal approval.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26801-26850 exactly
  once and in identical order.
- Actual embedded line-break counts and extracted runtime-token signatures
  match. ID 26837 has six actual embedded line breaks in every locale.
- At ID 26840, the 75% and 30% values match all locales. At ID 26841, +30
  and +75% Fire Damage values match all locales.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 26801-26850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26851.
