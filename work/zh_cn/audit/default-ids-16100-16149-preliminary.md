# Preliminary Language Scan: `default` IDs 16100-16149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16100-16149.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16100-16101 | Dark Maze / Blackened Hall / Caer Elatha / Crossing / Missives | Verify the place/institution names and whether Missives are documents or another quest object; preserve that the speaker reached the entrance. | Korean names the maze and hall, and preserves the quest to find Missives. At 16100 it says the speaker arrived at the entrance, while Chinese says they passed through it; English/Japanese describe coming across/to the entrance. | Medium |
| 16102 | `{*1Shrines}` / `{LINE_SPACE}` -> `성소` | Preserve both markers and confirm the player-facing term for Shrine. | Korean retains the localized wrapper and line-space token in order; the explanation of temporary deity-specific bonuses remains intact. | High |
| 16103-16105 | Damage Resistance While Dodging / MiniMerchant / Fae Knowledge | Align combat terminology and determine whether MiniMerchant is player-facing or an internal asset label. | Korean retains the +35% stat, while `미니 상인` adds a space to the concatenated source label; the UI context is not supplied. | Medium |
| 16107-16108 | black coral reefs / permanent Mana Regeneration / Altar of Betrayal | Preserve the lore image and exact permanent +1 benefit; verify the altar name and journey-step wording. | Korean retains the reefs threatening to engulf the island and the permanent regeneration value; it calls the Altar the journey's second step, while Chinese calls it the second stop. | Medium |
| 16110 | Crilgarin, Knave of Coins -> `동전의 협잡꾼` | Determine whether Knave of Coins is a tarot rank/title or an insult and standardize the epithet. | Japanese gives a “lord of gold coins” reading and Chinese uses “coin rogue”; Korean selects “knave/swindler,” so the title sense is unresolved. | High |
| 16111-16114 | Caeled Coast / Blood and Steel / Godstorm / Primos | Verify names and title forms, preserve the missing-papers need, and determine whether Primos is a rank, group, or leader. | Korean retains the story, numbered title, definitive Godstorm work, and petition attempt. Chinese interprets Primos as leaders; Japanese transliterates it as a name/title. | Medium |
| 16115-16116 | Star Camp / `KandrianCoveSwimEntrance` | Standardize Traveler and Star Camp forms; determine whether the concatenated location key should remain an internal label. | Korean localizes the readable camp greeting but expands the concatenated source key into spaced Korean words. Other locales also translate the key, so its player-facing status remains unclear. | Medium |
| 16118-16120 | Tyr Magnus / Khamazandu / Erathi / Red Idward | Verify proper-name/rank forms and preserve the claim that Khamazandu was too clever to kill. | Korean retains the prologue, Khamazandu's epithet and imprisonment, and Red Idward's belief that the speaker is dead; references vary in names and whether imprisonment followed inability or a decision not to kill. | Medium |
| 16121-16122 | Bastion of Rock / Quake / Stun / Mana | Align ability terminology and preserve every value, trigger, and line break. | Korean retains +20% Quake damage, 25% chance of a 3-second stun on the final hit, and +12 Mana cost on a separate line. | High |
| 16124-16126 | Allestar / Culn / Besin / Fahrlang | Verify names and preserve the account of the research and the copied path. | Korean retains the relocation, continued work that produced monsters, thanks on behalf of Culn, and Besin following Fahrlang step by step. | Medium |
| 16128 | traitors' blood / land growing again | Preserve the speaker's collective identity and clarify whether the land image is literal or restorative metaphor. | Korean retains hunting the last traitors of the speaker's kind and the image of their land growing again; the source leaves the growth metaphor open. | Medium |
| 16134 | blood `layout` -> `흩어진 모양` | Clarify how the blood's arrangement supports recency and likely-death inferences. | Korean renders “layout” as the scattered pattern and retains the conclusions that the person passed recently and may soon die; the physical evidence is unexplained. | Medium |
| 16135-16136 | Asker's Alley / Zungar Shaft | Verify the place-name types and standard Korean forms. | English calls the place an alley, Japanese a tavern, and Chinese a valley; Korean follows the English type. Zungar Shaft remains a separate proper-name question. | High |
| 16138 | `Prodigy` -> `신동` | Determine whether this one-word label means a gifted person, a feat, or an ability/category. | Korean chooses the person-sense “child prodigy”; the isolated label does not identify its UI context. | Medium |
| 16139-16140 | Winter Court / Gadflow / Tuatha | Standardize Court terminology and preserve the causal claim about the Tuatha's rise. | Korean retains Gadflow's corruption of the Court through talk of a new god and the Tuatha arising from that poison; the source may be figurative lore. | Medium |
| 16143-16145 | vivisection / Druinkard / Quarters | Preserve the threat and flirtatious register; determine whether Quarters is a slum, residence, or institutional district. | Korean accurately retains the intended subject alive for vivisection, transliterates Druinkard rather than translating it, and calls the Quarters a slum. Japanese/Chinese imply other kinds of district or residence. | High |
| 16146-16149 | merchant / Sell / World of Amalur / silver salvage | Preserve the shameful realization and clarify what “good silver” and “salvaging it” refer to. | Korean retains the merchant deception and UI labels; at 16149 it calls the material silver and payment gold coins, while the salvage object's antecedent depends on context. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16100-16116, 16118-16122, 16124-16128,
  16134-16136, 16139-16140, 16143-16149 against all four active locale rows.
- The source-context, name, title, and UI questions remain open. No historical
  note authorizes a translation change.
- Cross-batch consistency candidates include Missives, the Crossing,
  Crilgarin/Knave of Coins, Caeled Coast, Godstorm, Primos, Traveler,
  Kandrian, Khamazandu, Erathi, Quake, Asker's Alley, Zungar, Winter Court,
  Druinkard, and Quarters.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. ID 16102 retains `{*1}` and `{LINE_SPACE}`;
  ID 16122 retains its two-line effect layout and all values. No structural
  exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16100-16149 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16150-16199.
