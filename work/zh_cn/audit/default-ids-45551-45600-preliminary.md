# Preliminary Language Scan: `default` IDs 45551-45600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45551-45600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45552 | `Loading Concourse 3!` / `컨코스 3 로딩 중!` | Determine whether this is an internal loading/test label or a player-facing location message; confirm the proper name `Concourse`. | The standalone imperative-like loading notice appears technical. Japanese transliterates Concourse, while Chinese translates it as a diamond-shaped concourse. | Medium |
| 45554 | Gems / Sagecraft skill / `마법물품 제작 기술` | Use the official Korean name for Sagecrafting and preserve that the skill unlocks use of the strongest gems and gem crafting. | Korean says “magic-item crafting skill”; Japanese calls it a jewel skill and Chinese says Enchanting. The English explicitly names Sagecraft. | Medium |
| 45560 | `discenering eye` source typo / `안목 있는 사람` | Preserve the apparent “discerning eye” meaning while keeping the English source typo visible in the audit. | English spells `discenering`; Korean renders an observant/discerning person, consistent with context and Japanese/Chinese. | High |
| 45564 | `unwashed masses` / `천것들` | Preserve the pejorative class description and the sequence of refugees fleeing war, drought, and famine before new laws are made. | Korean uses a strongly dismissive class term and retains all three causes of flight and the lawmaking response. Register/context remain worth checking. | Medium |
| 45570 | unsupported audio-card driver warning | Check whether the wording matches the game's UI terminology and retain the warning that continuing may cause incorrect operation. | Korean preserves the unsupported driver version and consequence; this looks like a technical/system string rather than narrative dialogue. | Medium |
| 45583 | Tilera “fated never to succeed” / `성공할 운명이 아니니 혼자서는 해낼 수 없어` | Preserve the source's claim that Tilera is fated never to succeed and that the player can help, without changing it to success being impossible only when she is alone. | Korean can be read as “not destined to succeed alone,” which narrows the English claim. Japanese/Chinese also describe a doomed inability to succeed, followed by the player's help. | High |
| 45592 | salvage / riches / magnificent death / `인양품` | Confirm the game's intended sense of `salvage` and retain the speaker's dramatic fascination with a magnificent death. | Korean treats salvage as recovered/salvaged goods; the other two questions retain riches and a grand death. The phrase is an isolated rhetorical fragment. | Medium |
| 45594 | Well of Souls research / Templars | Preserve that research is being put on hold because Octienne organized it secretly and other Templars will seek information. | Korean retains the causal sequence and the other Templars' interest. Well of Souls and Templar terminology remain subject to glossary consistency. | Medium |

IDs 45551, 45553, 45555-45559, 45561-45563, 45565-45569, 45571-45582,
45584-45591, 45593, and 45595-45600 generally retain the English meaning
on this first reading. Names, setting terms, and UI labels remain subject to
integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45550-45649 against
  the active rows. The relevant concerns include the Sagecrafting term,
  the source typo at 45560, Fate/Tilera wording, official names, and the
  meaning of the salvage fragment.
- The Chinese-only numeral `1` at 45583 corresponds to “alone” in English,
  Korean, and Japanese; it does not add a second person or change the count.
- The Korean at 45583 remains a preliminary semantic candidate, not an
  approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45551-45600 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 45566 retains
  the 13-second duration, 20% armor reduction, 40 Mana cost, and line break.
- No runtime-marker, numeric-value, or hidden-formatting discrepancy was
  found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45551-45600 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45551-45600-20261010.md`](disposition-batch-default-45551-45600-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45601.
