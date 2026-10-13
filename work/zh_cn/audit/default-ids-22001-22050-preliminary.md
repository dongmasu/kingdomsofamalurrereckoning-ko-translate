# Preliminary Language Scan: `default` IDs 22001-22050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 22001-22050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 22001 | Weeping King / Midden / transformed people | Identify the people and what “something more” means in House of Sorrows lore; do not invent the transformation. | Korean names the Weeping King and Midden and describes the people becoming “better beings.” English leaves “something more” unspecified; Japanese also makes it positive, while Chinese keeps it open. | High |
| 22008 | Khamazandu / `the Deceitful One` | Align the Niskaru Lord's name and epithet with prior references. | Korean uses Khamazandu and “기만자”; all locales preserve the epithet's meaning with different name forms. | Medium |
| 22009 | `hight cliffs` / refugee spies | Retain the intended “high cliffs” meaning despite the English typo, and preserve the speaker's refusal to trust rumors. | Korean renders high eastern cliffs and the reported spies, then rejects rumor and suspicion. | Medium |
| 22014 | Mel Senshir / Rathir / `within its walls` | Resolve the source's unclear syntax about which city/walls are meant and why those events are of little use. | Korean reads events within both cities' walls as unhelpful to the speaker's group; Japanese and Chinese parse the sentence differently. | High |
| 22015 | Lou Winfreigh / Troll | Verify the name and preserve that defeating the troll restored safe fishing. | Korean follows the English intent despite the source typo `deafeated`; Japanese also has a source typo but preserves the outcome. | Medium |
| 22018 | `Found a taste for gnome` / Capstan | Preserve the omitted subject and the report that an unspecified creature has started eating gnomes. | Korean leaves the subject implicit and attributes the report to Capstan. | Medium |
| 22020 | Winter Court / Summer Court | Preserve the separate claims about trusting Winter Court judgment and Summer Court noninterference. | Korean retains both clauses and does not collapse the courts into one judgment. | High |
| 22021 | `of Lightning Attenuation` | Keep this as a truncated affix/item fragment until its parent term is known; align “attenuation.” | Korean renders “번개 감쇠의,” preserving the unfinished form. | Medium |
| 22023 | Thresh's lair | Standardize Thresh and its lair term with ID 21951/21838 and recurring creature usage. | Korean uses `쓰레시(Thresh)` and “소굴”; locale spellings diverge. | Medium |
| 22024 | Tuatha / Fae / essence / rebirth | Preserve the Tuatha as an immortal radical offshoot and the return-home/rebirth lore. | Korean retains each claim and marks “die” as quoted/nonliteral. | High |
| 22026 | `prizes` / treatises / Octienne's diary | Determine whether “prizes” means loot/recovered finds and preserve the contrast that only the diary has true value. | Korean opens with “아주 많이 있지!” but does not explicitly name the “prizes”; it retains the treatises, autopsy analyses, and diary as the sole valuable item. | Medium |
| 22031 | Maid of Windemere / Wencen / Court of Enchantment | Verify names and court terminology; preserve that the woman claims to have abducted both the king and the court. | Korean follows the English entities and correctly attributes the abduction claim to the woman. Japanese calls her a heroine and uses a different group description. | High |
| 22032 | `Shut up and JAM` | Determine whether JAM is a mode/title or wordplay rather than an instruction to work. | Korean preserves `JAM` untranslated and retains the blunt command. | Low |
| 22037 | Rite / Circle of Engard | Align the Rite and Circle names with recurring organizational terms. | Korean retains completion of the Rite and the return/report objective. | Medium |
| 22040 | `{3}`, `{1}`, `{2}`, `{4}` | Preserve every placeholder and its meaning/order; resolve the source's percentage fragment in context. | Korean preserves English order `{3}`, `{1}`, `{2}`, `{4}`. Japanese instead orders `{3}`, `{2}`, `{1}`, `{4}`; all four markers are present in each locale. | High |
| 22042 | Dark Huntress / `her grace` / blade in shadow | Determine which phrases are formal titles and preserve the staged introduction. | Korean introduces the “blade in the shadow” and “Dark Huntress” with an honorific; capitalization/title boundaries remain uncertain. | Medium |
| 22045 | Kollossae / burden of wilderness | Clarify whether the wilderness's burden is literal or figurative while retaining the transformation into mindless brutes. | Korean says the wilderness's harshness overwhelmed them and let it turn them into unreasoning beasts. | Medium |
| 22046 | malformed `What do I?` / auroch insult | Preserve the source's interrupted outburst, insult, self-correction, and apology rather than silently repairing it. | Korean keeps the interruption and apology; the English opening is fragmentary and Japanese differs in its first question. | High |
| 22049 | valuables / storage for a price | Preserve the offer to keep possessions safe in exchange for payment. | Korean retains both the storage offer and explicit price condition. | Medium |
| 22050 | `Carry on.` | Determine from context whether this means “continue” or “go ahead/leave.” | Korean says “계속 가,” which reads as continue onward; the isolated English UI/dialogue fragment does not resolve the use. | Low |

## Historical Audit Reconciliation

- Rechecked archived source-keyed questions for IDs 22000-22001, 22008-22009,
  22014-22015, 22018, 22020-22021, 22023-22024, 22026, 22031-22032, 22037,
  22040, 22042, and 22045-22046 against all active locale rows.
- The historical issues remain open candidates. The malformed English at
  22009, 22015, and 22046 was not silently normalized in the Korean draft.
- Cross-checked Weeping King, Midden, House of Sorrows, Khamazandu, Scholia
  Arcana, Rathir, Thresh, Tuatha, Fae, Maid of Windemere, Circle of Engard,
  Dark Huntress, Kollossae, Auroch, and JAM against recurring source use.
  Official-manual text search remains unavailable; terminology confirmation
  is pending integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 22001-22050 exactly
  once and in identical order.
- ID 22011's `#NAMED_ICON_PAUSE#` is identical in all locales.
- ID 22040 preserves all four placeholders. Korean follows English marker
  order; Japanese's `{2}`/`{1}` order difference is recorded, not normalized.
- No embedded line breaks or missing numeric values were found in this batch.
- No key, row-order, or Korean runtime-marker discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 22001-22050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
22051.
