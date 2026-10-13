# Preliminary Language Scan: `default` IDs 16250-16299

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16250-16299.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16250 | Ambassador Mandolph -> `맨돌프 대사` | Verify the ambassador's name form against other appearances. | Korean preserves the title and name bilingually; locale phonetic forms vary. | Medium |
| 16251 | Three Winds Crutch -> `세 바람 목` | Determine whether this is a route, landform, or village feature and confirm the proper-name rendering. | English and Chinese describe an entrance outside the village; Japanese adds meeting “at night,” unsupported by English, Chinese, and Korean. Korean preserves the location and distance. | High |
| 16252 | Kiftal / Witchknight Anira / Cann-Rane | Verify names and preserve the potion/barrier mechanism and release of inhabitants. | Korean retains the ingredient quest, magical barrier, Anira's rule, and intended liberation. | Medium |
| 16256-16257 | `dreg` / summoned entity / Grim / Phasmer / Crilgarin | Preserve the insult and determine how the speaker learned the plan. | Korean renders `dreg` as a direct insult and says the speaker observed enough of the three named figures to learn the plan; Chinese instead says the speaker knows them. | Medium |
| 16261-16262 | stealth critical damage / Dagger / Faeblade / Mitharan Rallying Grip | Align stealth/critical and item terminology and preserve all bonus values. | Korean retains +40% critical damage and +90% dagger/Faeblade sneak-attack damage on separate paragraphs; the item category at 16262 remains unclear. | High |
| 16263 | Athyll / water-light / well / balance | Preserve the cryptic verse and all line breaks without resolving its metaphor prematurely. | Korean retains the three-line quoted passage and blank paragraph break; locale references vary in the light, souls, water flow, and final “balance moved” imagery. | High |
| 16264 | `Trading's done in the Pryderi` | Determine whether Pryderi is a market, organization, or place and whether the line says trade is complete there. | Korean says trade ends at Pryderi; Japanese instead directs the addressee to the Pryderi trading company, while Chinese says trading is completed. | High |
| 16268 | `$TR_Shell.cutter_wager$` wager prompt | Preserve the exact runtime variable and verify the displayed gold/wager phrasing. | Korean retains the variable byte-for-byte and in the same position, with the game invitation and gold label. | High |
| 16271 | Ohn's Stand / Lorca-Rane | Verify whether Stand is a fort, outpost, or settlement and standardize the names. | Korean preserves the destination and confidence that the person will be found there; locale renderings vary on the place type and names. | Medium |
| 16276 | `intimidating friend` -> `무서운 친구` | Preserve the playful reassurance without making the address sound hostile. | Japanese uses a rugged/imposing sense; Korean's `무서운` may imply frightening rather than imposing, despite the friendly context. | High |
| 16281-16285 | hermit blacksmith / Calan Mcleod / Basilica / Alabastra | Verify names and retain the accusation that the addressee's people killed the master's teacher/owner. | Korean preserves the location reveal, the slain man on the floor, responsibility attributed to “your people,” Basilica as academy/shrine, and the Alabastra lead. | Medium |
| 16287-16290 | Peace Edict / Cloudcrest / permit piracy / portals of knowledge | Align decree/place terms, clarify `permit piracy`, and preserve the doors/portals metaphor. | Korean reads permit piracy as `통행증 밀매` (permit trafficking); Japanese suggests forging permits and Chinese says pirated permits. The knowledge-gate metaphor is retained with `관문`. | High |
| 16291 | Scarlet Flowstone / Scarwood Bark / Bloodroot / Essence of Fate | Standardize alchemy/ingredient terms and preserve all quantities and paragraph layout. | Korean retains all four reagents in order with quantities 3, 2, 1, and 1, plus the blank-line separation. | High |
| 16295-16298 | Cradle of Summer / Dustling / Syllareta / Teers / Warsworn / Pride of Pryderi | Verify names and determine whether Pride of Pryderi is a group/business or an abstract title. | Korean retains the Dustling's taboo, Syllareta's survival, Teers' oath and medal, and the Pride title; Japanese interprets the last as the Pryderi trading company. | Medium |
| 16299 | Archsage's mind | Preserve the command to leave the Archsage's mind and clarify whether “mind” is literal, magical, or a mental space. | Korean translates the phrase literally as leaving the Archsage's mind; the isolated command does not resolve the setting. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16251-16252, 16256-16257, 16261,
  16263-16264, 16268, 16271, 16276, 16281-16285, 16287-16291, and 16295-16298
  against all four active locale rows.
- Name, category, terminology, and context questions remain open. The
  Japanese-only “at night” detail at 16251, the sense of `intimidating` at
  16276, and the permit-piracy interpretation at 16289 are additional
  preliminary observations; no note authorizes a translation change.
- Cross-batch consistency candidates include Dokkalfar, Fate, Three Winds
  Crutch, Kiftal, Anira, Cann-Rane, Phasmer, Crilgarin, Faeblade, Mitharan,
  Pryderi, Ohn's Stand, Lorca-Rane, Basilica, Alabastra, Peace Edict,
  Cloudcrest, Warsworn, and Pride of Pryderi.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. ID 16261 preserves the blank paragraph and
  both bonuses; ID 16263 retains its quoted verse layout; ID 16268 retains
  `$TR_Shell.cutter_wager$`; ID 16291 preserves the recipe lines and values.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16250-16299 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16300-16349.
