# Preliminary Language Scan: `default` IDs 16050-16099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16050-16099.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16050 | Beckoned / “our works still waits” | Preserve the title and the unfinished-task exchange without perpetuating the source's grammar error. | English has a subject-verb agreement error; Japanese and Chinese interpret this as their task not being finished. Korean follows that meaning and phrases the last question as “what can I help with?” rather than literally “what do you need?” | Medium |
| 16052 | Telemachus Rasp / Scholia Arcana / Gloamthicket / Acatha / Banshaen Priestess | Verify names, institution/rank terms, and preserve the dungeon visit and attack relationship. | Korean retains the instructor's request, destination, target, and attacks on visiting initiates; spellings differ across locales. | Medium |
| 16053-16054 | Greatsword bonuses / Elemental Cloak / Frostbreak Sea | Preserve both bonus values and verify item, sea, and ascetic-mage terminology. | Korean retains `+12` physical damage and `+20%` damage, plus the protective/concealment inscriptions and cloak provenance. “Ascetic mages” is expanded to mages living ascetically. | Medium |
| 16058-16062 | Dennrit Rond / Victory Games | Standardize the character and event names; preserve the fighting-days exchange and postponement reason. | Korean keeps the addressee's old vow, reconsideration, and the bandit-caused postponement; spellings and event rendering are recurring consistency candidates. | Medium |
| 16063 | Glendara Wood / Mission / Plagueshield | Clarify the route and whether `bring the Plagueshield yourself, if you must` is an item instruction or a faction/lore reference. | Korean preserves the route and renders the last clause as taking the Plagueshield personally if necessary; the isolated context does not settle the object type. | Medium |
| 16064 | `wring the ones on this side` | Confirm that “wring” is a threat to kill/strangle and preserve the speaker's violent register. | Japanese explicitly says kill the people on this side; Korean says it will twist their necks, retaining the threat with a more specific method. | High |
| 16065-16068 | Crilgarin / House / abomination / crudok / Jottun Killed | Align proper-name, faction, creature, and combat-label forms. | Korean preserves the woman's ostracism and exploitable power, the crudok accusation, and the Jottun kill objective; `House` remains a capitalized but unspecified institution/family. | Medium |
| 16070-16075 | Dream Bracer / House of Valor / Well of Souls | Verify item/lore terms and clarify what “she” and the experimental “surprise” refer to. | Korean retains the House's fall, her disappearance, and a useful experimental result, without inventing the result's identity. | Medium |
| 16077 | Hierophant / acquiescing to another's will | Preserve the critique of constrained freedom and the service paid for wisdom. | Korean retains both benefit and high cost, using `굴복하는` for acquiescence; Hierophant remains a recurring title candidate. | Medium |
| 16078-16079 | Varani Longship / General Orieator biography | Standardize Varani vessel terminology and confirm the sense of “definitive biography.” | Korean uses `장선` for Longship and `결정판 전기` for definitive biography; the latter is supported by the Japanese and Chinese sense of an authoritative biography. | Medium |
| 16082-16083 | Kandrian / Tree of Valor / beast of many vines / Kora Petal | Verify names and preserve the distinction between a beast made of vines and one merely covered by vines. | At 16083 Korean says `덩굴로 뒤덮인 짐승` (“beast covered with vines”); English says “beast of many vines,” and Japanese more clearly describes a beast composed of vines. The hunt and sigil activation remain intact. | High |
| 16087-16090 | Isle of Eamonn / Aurenda / Canyon Hill Mine / Phorian Strait | Verify place-name forms and preserve the projection/summoning outcome and ten-year invasion timing. | Korean retains the projection's disappearance, dispersal of summoned wild Fae, western-coast location, and ten-year reference; names vary across locales. | Medium |
| 16091-16092 | Mayor Skoria / Halcyor / the Crossing | Verify names and whether the Crossing is a named location/post. | Korean retains the mayor's cheer and the guard's commitment to remain until replacements arrive; Japanese interprets the Crossing as a named place while Chinese says a checkpoint. | Medium |
| 16094 | Neophyte Seon Agdan -> `수련생 세온 아그단` | Align Scholia Arcana rank terminology and verify the name spelling. | Japanese reads a trainee rank and Chinese an apprentice; Korean uses `수련생`. | Medium |
| 16096 | thousands who know nothing | Preserve the fragmented emphasis that even uninformed people share the gratitude. | Korean retains the speaker's gratitude, the collective “we,” and the thousands unaware of the player's actions. | Medium |
| 16097 | utility potion / Chaos Essence (2) / Black Cohosh (1) | Align potion and ingredient terminology and retain recipe quantities and paragraph spacing. | Korean preserves the movement-speed effect, both reagents and quantities, the blank paragraph break, and the final-line layout. | High |
| 16099 | lack of Fate / nature / evaluation | Preserve the distinction between Fatelessness prompting the summons and not representing the player's whole nature. | Korean retains both propositions and the need for evaluation; English, Japanese, and Chinese differ slightly in how directly they express the final assessment. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16050, 16052-16054, 16063-16068,
  16070-16075, 16077-16079, 16082-16083, 16087-16090, 16092, 16094,
  16096-16097, and 16099 against all four active locale rows.
- Name, title, terminology, and context questions remain open. The explicit
  neck-twisting interpretation at 16064 and the “covered by vines” wording at
  16083 are additional preliminary candidates; no note authorizes a change.
- Cross-batch consistency candidates include Beckoned, Scholia Arcana,
  Banshaen, Elemental Cloak, Frostbreak Sea, Plagueshield, Crilgarin,
  crudok, Jottun, House of Valor, Well of Souls, Hierophant, Varani, Kandrian,
  Kora Petal, Ljosalfar, and the Crossing.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. The two Greatsword bonus lines at ID 16053
  remain separate; ID 16097 preserves the blank-line recipe layout and both
  quantities; no runtime-token exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16050-16099 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16100-16149.
