# Preliminary Language Scan: `default` IDs 63401-63450

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63401-63450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63401 | Almain / Deod Dungaras | Verify the person's canonical spelling and reuse the established Korean people-name form. | Korean asks whether the player met an Almain named Deod Dungaras; locale phonetic spellings vary. | Medium |
| 63402 | rough seas / “able hands” | Preserve the reassurance that the passengers are in capable hands without inventing the identity of the crew. | Korean says “we'll protect you,” making the speaker's group explicit; English leaves the capable hands unspecified. | Medium |
| 63403 | Dark Harbor shipbuilder hammer | Keep the original shipbuilding purpose and the conditional surprise that it works as a weapon if the wielder can lift it. | Korean retains the heavy-hammer joke and conditional use. Confirm the named location form and whether this is item flavor text. | Medium |
| 63408 | Eye of Lyria / Year of Waking Knives | Verify the historical sequence: late Middle Kingdoms relic, believed lost in the Year of Waking Knives during Rathir's early Arcana. | Korean preserves the period and loss date but reorders the clauses; both the relic title and named year need lore/glossary confirmation. | High |
| 63410 | exhibition matches / gamblers | Preserve the board listing contests and the uncertainty that makes them attractive to bettors. | Korean retains both ideas and the conversational register. | Low |
| 63411 | “Only one head” | Preserve the darkly comic survival line and the speaker's relief. | Korean interprets this as losing only one head; English says the gods' mercy left only one. Chinese makes the near-death reading explicit. Scene context is needed. | Medium |
| 63413 | sagecrafting / House of Ballads | Verify the crafting service term and the form of address `your grace`. | Korean uses `마법물품 제작` for sagecrafting and `전하` for the honorific. Japanese calls it gemcraft; the official project glossary should settle the profession. | High |
| 63414 | `Lords of Valor` / `발러의 군주들` | Check whether this is a formal group, title, or card/category label. | The row is an isolated plural title and the locale renderings differ substantially. | Medium |
| 63417 | “it fell quickly” / `빨리 함락` | Identify the referent of `it` and preserve the pragmatic claim that a quick fall would let everyone continue their lives. | Korean follows the military sense “fall/capitulate”; the object and affected group are unstated. | Medium |
| 63419 | `Sidhe` / `시드들` | Determine whether the question concerns the Sidhe people or the Faelands. | Korean asks how the player finds the Sidhe; Chinese interprets the Faelands, while Japanese also treats Sidhe as a people. The English alone remains ambiguous. | High |
| 63420 | hollow of Amman / Hour of the Setting Sun | Verify both named-lore terms and retain the elevated direct address to Wencen's greatest friend. | Korean preserves the poetic address but renders `hollow` as `공허`, which may imply a void rather than a physical cave/hollow. | High |
| 63421 | transaction requirements | Preserve the formal explanation that the addressee cannot meet required conditions. | Korean follows English and Japanese without naming the requirements. | Low |
| 63422 | Blacksmithing skill book | Preserve the permanent bonus and the condition that the reader receives it. | Korean retains the effect. The source's “dozens of techniques” is omitted as `dozens`, though `many techniques` remains implied through the book's contents. | Medium |
| 63425 | Hillared | Verify the place/person name and preserve family duty taking precedence over reunion. | Korean retains the conflict; other locales use different phonetic forms. | Medium |
| 63428 | enclave / `거주지` | Clarify whether the Fae-held enclave is a named settlement, camp, or generic enclosure. | Korean keeps the captivity and inability to leave but generalizes the specific “enclave” to a residence. | Medium |
| 63429 | violet-cage journal / Rotelos clan | Preserve the long entry's supplies, fear of resting, treasure's pull, masonry skill, and confidence against the clan's challenge. | Korean follows the narrative and Japanese-derived single-record layout. English and Chinese append a standalone final period after a newline (`\\n.`); JA/KO have no embedded break or separate punctuation. This is a source-format exception, not a row-order issue. | High |
| 63430 | purchasable Alfar titles | Verify whether `titles` are social ranks, character labels, or a shop category. | Korean's short label follows the English; Chinese similarly says titles are for sale. | Medium |
| 63431 | Gossamer End upgrade | Confirm whether Gossamer End is a location/property and retain the action-label form. | Korean calls it an improvement/upgrade; Japanese specifically says renovate. | Medium |
| 63435 | Hierophant's retreat / `은신처` | Verify the intended institution/location term and preserve Grim's reason for assigning the speaker. | English says retreat, Japanese says hideout, and Chinese says the Hierophant's place of seclusion. Korean follows the infiltration reading but may sound like a hideout. | High |
| 63439 | Court of Enchantments / `마법 궁정` | Confirm the canonical proper-name form and Hallam the White's location. | Korean semantically renders the Court; the term is capitalized and likely a named location. | Medium |
| 63443 | Chaos weapon-core tutorial | Preserve the four localized `{*1...}` labels, crafting alternatives, `{LINE_SPACE}{1}`, and their order. | All locales retain four localized marker spans and the continuation control in sequence. Korean translates each label and keeps the two paragraph separations. | High |
| 63448 | Cape Solace / Akara | Preserve the three reasons for worship: safety, sustenance, and sense of purpose. | Korean renders sustenance as livelihood and purpose as purpose in life, retaining the triad. | Low |
| 63449 | boggart infection threat | Preserve the escalation from one manageable boggart to ten or twenty and eventual town-wide infection. | Korean accurately retains the numbers and threat. | Low |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the alchemy-lesson prompt, exhibition notice, plate armor, book
bonus, Gossamer End action, South Sewers route label, war-state fragment,
quest completion, and the boggart warning. Findings remain provisional.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 63350-63449, including
  the Dark Harbor hammer, Eye of Lyria/Year of Waking Knives, sagecrafting,
  hollow of Amman/Hour of the Setting Sun, violet-cage journal, Hierophant's
  retreat, and localized Chaos-core tutorial markers.
- The historical note spans IDs 63350-63449; entries outside this batch
  were not counted as reviewed here.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63401-63450 once
  and in identical ascending order.
- Embedded newline counts match except ID 63429: English and Chinese have
  one trailing newline before a standalone period; Japanese and Korean have
  no embedded newline.
- ID 63443 preserves four `{*1...}` spans followed by `{LINE_SPACE}` and
  `{1}` in matching order.
- No translation CSV edit was made.

## Batch Status

IDs 63401-63450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63451.
