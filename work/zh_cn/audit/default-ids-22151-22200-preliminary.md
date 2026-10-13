# Preliminary Language Scan: `default` IDs 22151-22200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 22151-22200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 22152 | Maisie's Luck / ring | Verify the named ring and preserve the speaker's belief that it never failed them. | Korean retains the lost-ring regret and “메이지의 행운” name. Other locales differ in spelling and quotation style. | Medium |
| 22154 | Eyes of Tirnoch / tracking device | Identify the large tracking object if context supplies it and align its canonical name. | Korean retains the pursuers, named Eyes, instruction to smash it, and resulting end of pursuit. | Medium |
| 22155 | Sagrell's tale / House seat / mortal | Align Sagrell and the Court/House seat with lore terminology; preserve the certainty that a mortal cannot fill it. | Korean retains the twisted tale, need for help, permission to stay, and prohibition on a mortal taking the seat. | Medium |
| 22158 | Shadow Walk | Confirm whether this is a skill/ability name and align it with existing Shadow Walk references. | Korean uses “그림자 걷기”; Japanese says “path of shadow,” while Chinese uses a “shadow step” form. | Medium |
| 22160 | Alabastra / House of Vengeance / meeting location | Resolve the malformed English phrase “near in front of” without inventing a more specific entrance. | Korean says they will meet at the House's front gate/entrance, while Japanese says in front of it; English location syntax is redundant. | High |
| 22164 | vaults / client / gnomish use / Bursar | Interpret the malformed “client ‒ gnomish use only” notice and identify the Bursar's rules. | Korean reads the vaults as client/gnome-only and retains the rule notice; English punctuation and syntax are malformed. | High |
| 22165 | Court of Enchantments / single seat | Confirm whether this is the formal court name and how the seat relates to its membership. | Korean follows English; Japanese instead refers to the House of Ballads' hero seat. | High |
| 22166 | Telling / distortion | Align Telling with recurring fate/story-cycle terminology and preserve the charge of unnatural distortion. | Korean uses “전승(Telling)” and retains the speaker's condemnation. | Medium |
| 22168 | Magnus / `will get his` / couple more wins | Preserve the idiom that Magnus will get his due and that two more victories bring him within reach. | Korean says Magnus will pay and two more wins will let them capture him. | Medium |
| 22173 | ability tutorial / `{1}`-`{5}` | Preserve the pull-and-hold instruction, ability wrappers, line-space token, and ordered controls. | Korean retains `{1}`, both localized `{*1...}` wrappers, `{LINE_SPACE}`, and `{2}`-`{5}` in order. | High |
| 22175 | Jakin / gambling rats | Retain the claim that newcomers usually die and the contrast between limited audience knowledge and gamblers' knowledge. | Korean preserves Jakin, most gladiators, and the gamblers knowing, though it recasts the audience clause as not everyone knowing. | Medium |
| 22176 | Fight Board / Arena's pen | Align the board and arena terms and preserve the challenge for gladiators willing to face penned monsters. | Korean retains the courageous-gladiator condition and challenge opportunity. | Medium |
| 22178 | Tree of Valor | Determine whether this is a literal tree, skill tree, or named menu node. | Korean uses “용맹의 나무”; the isolated label does not identify its UI/world context. | Low |
| 22183 | `OLD Fateshift Weapon Buff` | Determine whether OLD is an obsolete/debug label or should be presented as “old”; align Fateshift terminology. | Korean uses “구형 운명 전환 무기 강화,” preserving the legacy/old sense but potentially implying an obsolete weapon. | Medium |
| 22185 | Three Winds Crutch / riddle | Verify the place name and intended three-to-four wind wordplay. | Korean retains the quoted riddle, named junction, and uncertainty. | Medium |
| 22186 | Strand / Prince of Passion / Princess Luna | Verify titles/names and avoid over-interpreting “take as his own”; preserve five-line verse layout. | Korean retains all five lines and the rescue, but explicitly calls Luna his lover where English is less specific. | High |
| 22190 | Goddess of Mercy / purging the player's kind | Preserve the threat's escalation with each step into the speaker's homeland. | Korean retains the awakening, each step, approach to their world, and threat to purge the player's people. | High |
| 22191 | Ayten / Castor / Fynwick Iver / `put down` | Verify names and retain the bounty for stopping Castor without specifying a method. | Korean preserves escalating attacks, Castor's boldness, and Fynwick Iver's payment offer. | Medium |
| 22192 | Gemstone | Determine whether this is a venue/tavern name rather than a literal gemstone. | Korean uses “젬스톤(Gemstone)” and preserves the meeting behind it. | Medium |
| 22197 | little cult / city walls | Determine whether “cult” names a formal faction and retain the speaker's dismissive tone. | Korean says “작은 교단” and preserves the plotting behind the city walls. | Medium |
| 22199 | Arick / burned farm / former neighbors | Verify Arick's form and preserve the accusation that former friends abandoned the family after the farm burned. | Korean retains the neighbors/friends, farm fire, and abandonment. | Medium |

## Historical Audit Reconciliation

- Rechecked archived source-keyed questions for IDs 22152, 22155, 22158,
  22160, 22164-22166, 22168, 22170, 22173, 22175-22179, 22183, 22185-22186,
  22190-22192, 22195, 22197, and 22199 against the active four-locale rows.
- The prior issues remain open candidates. ID 22186's “lover” wording and
  ID 22160's entrance specificity are recorded as questions, not confirmed
  errors.
- Cross-checked Maisie's Luck, Eyes of Tirnoch, Sagrell, Alabastra, House of
  Vengeance, Bursar, Telling, Magnus, Sun Stone, Jakin, Fight Board, Arena,
  Tree of Valor, Fateshift, Three Winds Crutch, Strand, Luna, Goddess of
  Mercy, Ayten, Castor, Fynwick Iver, Gemstone, and Arick against recurring
  source usage. Official-manual text search remains unavailable; terminology
  confirmation is pending integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 22151-22200 exactly
  once and in identical order.
- ID 22173's ability wrappers, `{1}`-`{5}` controls, and `{LINE_SPACE}` match
  in identity and order.
- ID 22186 has four embedded line breaks in all locales, preserving five
  verse lines.
- No key, row-order, line-break, runtime-marker, or numeric-value
  discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 22151-22200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
22201.
