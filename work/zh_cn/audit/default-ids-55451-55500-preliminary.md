# Preliminary Language Scan: `default` IDs 55451-55500

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 55451-55500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and literary formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 55451 | `월즈(Wolds)` / Freemen | Preserve the speaker's rough, gloating voice and verify the faction/region terms. | Korean retains that several Freemen were driven out of the southern Wolds and keeps the false start from “most” to “the only fun.” | Medium |
| 55453 | Circle of Engard / House of Valor / Fae rites | Confirm the formal organization names and that the rites were lost with the House of Valor. | Korean states the Circle strives to recover rites that disappeared with House of Valor; the source locale spellings/translations vary. | Medium |
| 55456 | Gelphyne / Kest / Sparrows | Preserve the welcoming atmosphere and distinguish buying/selling from card dealing and the Sparrows' comings and goings. | Korean assigns commerce to Gelphyne, cards to Kest, and movement to the Sparrows; Chinese instead paraphrases the place as warm and hospitable. | Medium |
| 55457 | `한 사람의 잔혹 행위 따윈 중요치 않아` | Clarify the comparison implied by “the atrocities of one are nothing” and retain the goddess's instruction to wait for the addressee. | Korean follows the surface statement; the row gives no context for whose atrocity is being minimized or relative to what. | Medium |
| 55462 | `어둠을 두려워하라` for `Fear the darkness` | Confirm whether this is a warning/command or a broad label and retain the terse imperative. | Korean follows the English imperative; Japanese says darkness is dangerous, while Chinese directly says to fear it. | Low |
| 55464 | `Belen's Testament Summoner` | Verify whether Summoner is a role/enemy label associated with the death cult and use the canonical faction name. | Korean preserves the compound role/title; Japanese shortens it to Belen Summoner, while Chinese makes the cult name explicit. | Medium |
| 55470 | Eathe Dunbert / rogue / Red Marches / cistern | Review the “rogue” role, death-cult name, and the revenge/poisoning objective as one coherent quest summary. | Korean uses `무법자` for rogue and preserves the family murder, cistern, and Tomb of Fyragnos sequence. Japanese says thief and Chinese says a heroic outlaw, so the role nuance remains open. | High |
| 55473 | Sustained Ability / Mana pool tutorial | Preserve the three localized `*1` payloads, `{LINE_SPACE}`, and the fixed portion of total Mana consumed until the ability is turned off. | Korean localizes marker payloads while retaining marker identities/order and the sustained-resource explanation; all four locale strings have the same marker sequence. | High |
| 55480 | Tuatha war / Gallows Tree passage | Preserve the three-line structure and the deliberate sacred/profane contrast in “turning sanctity into putrescence.” | Korean keeps the bodies displayed across the land, the Gallows Tree, and the bloated/corrupt image. The “sanctity” transformation is rendered as turning sacredness into something rotten; historical review flags this imagery and the tree name. | High |
| 55488 | Mystic Hammer / Eagonn / Fahrlang / Gwyn Anwy | Preserve that this is what remains of the hammer and the parallel Niskaru-Lord scheme, then direct the player to Ironfast Keep. | Korean follows the fragmentary quest-log sequence and retains the names; the historic source uses `what remains` rather than a whole hammer. | Medium |
| 55493 | `{1}{2}` reset-cost prompt | Preserve both substitution tokens in order, the refund explanation, irreversibility warning, and confirmation question. | Korean retains the two adjacent tokens and all UI consequences; English, Japanese, and Chinese have the same placeholder sequence. | High |
| 55494 | Billis Aideh / house repairs | Confirm that the blacksmith can perform whatever repairs the player wants to their house and standardize Billis's name. | Korean preserves the service inquiry and the house-repair context; source locales vary in Billis's transliteration. | Medium |
| 55496 | optimistic challengers / finals versus defeating “us” | Preserve the speaker's reluctant but blunt warning that reaching the finals is not the same as beating the team. | Korean retains the concession about the listeners' optimism and the distinction between the two achievements. | Low |
| 55497 | Fellfire Bloom / Circle of Engard / Alserund / Narca | Preserve Florion's belief that the flower can help remove the Narca curse from Alserund. | Korean retains the item, recipient, organization, region, and curse; names remain provisional. | Medium |
| 55498 | `마음의 평화도 얻었지` for `His peace was made` | Confirm whether this means he had made peace with death, rather than simply becoming calm. | Korean says he gained peace of mind; the prior clauses say he wanted to embrace death and was ready. Japanese/Chinese similarly describe a settled/peaceful state. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Freemen, Wolds, Circle of
Engard, House of Valor, Gelphyne, Kest, Sparrows, Beckoned, Didenhil, Blood
Plague, Belen's Testament, Phasmer, Tirnoch, Eathe Dunbert, Red Marches,
Fyragnos, Alfar, Mystic Hammer, Eagonn, Fahrlang, Niskaru Lord, Ironfast
Keep, Gwyn Anwy, Mitharan Strengthening Rivets, Garaner Vernt, Billis Aideh,
Florion, Fellfire Bloom, Alserund, Narca, and Edman.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `55450-55549`.
  Relevant prompts include Ettin Slave and the Freemen/Wolds/House of Valor
  terms (55450-55453), Eathe Dunbert's `rogue` role and Belen's Testament
  (55470), and the Gallows Tree imagery (55480). The same range also flags
  Fyragnos and related place-name consistency.
- ID 55450 is the historical range boundary and was included in the
  preceding active report. It is not repeated here.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 55451-55500 once
  and in identical ascending order.
- Physical line-break counts match; the Gallows Tree passage at 55480
  retains its three-line layout.
- At 55473, `{*1...}` payload text is localized while marker identities/order
  and `{LINE_SPACE}` match. `{1}{2}` at 55493 is preserved exactly.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 55451-55500 received one preliminary reading; its candidates were
reconciled in
[`disposition-batch-default-55451-55500-20261010.md`](disposition-batch-default-55451-55500-20261010.md).
That working disposition accepted corrections at IDs 55451 and 55480,
recorded 7 uncertain findings, and marked 41 IDs `not an issue`. This
remains preparatory work, not independent final Reviewer approval. Continue
at `default` ID 55501.
