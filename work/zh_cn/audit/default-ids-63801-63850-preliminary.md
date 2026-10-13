# Preliminary Language Scan: `default` IDs 63801-63850

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63801-63850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63805 | Motus Mining / Apotyre | Verify the canonical place spelling and preserve the specific search targets (abandoned mines and offices) behind the company's sudden departure. | Korean retains the company departure and investigation objective; locale transliterations of `Apotyre` differ. | Medium |
| 63810 | Brother Wulf / `울프 수사` | Confirm whether `Brother` is a formal religious title and whether `수사` is the established rendering. | English and Japanese retain “Brother”; Chinese uses a monastic title; Korean renders it as `수사`. | Medium |
| 63811 | Overgrown Thicket / `우거진 덤불` | Resolve the source/locale location mismatch before standardizing this place label. | English and Chinese describe an overgrown thicket, while Japanese says a forest cave. Korean follows English/Chinese. | High |
| 63813 | Nan and Harlan poem | Review the source typo “gray as as” and the repeated “last echo of our leaving” refrain; verify that Nan/Harlan are names. | Korean preserves all six verse lines and the repeated refrain. English contains the duplicated `as`; other locales adapt the image differently. | High |
| 63817 | Sorrows / `House of Sorrows` | Determine whether `Sorrows` is a faction/place title, a power, or a generic force. | English capitalizes the plural name; Japanese says “power of sorrow,” Chinese “power of sadness,” while Korean expands it to `House of Sorrows`. | High |
| 63818 | `{3}`, `{2}`, `{1}`, `{4}` effect string | Preserve the localized placeholder order and confirm the stat/effect label associated with `{2}` and `{4}`. | Korean follows Japanese order `{3}`, `{2}`, `{1}`, `{4}`; English and Chinese place `{1}` before `{2}`. Placeholder identities and the percentage values are retained. | High |
| 63820 | Varani history / `바라니` | Review the long lore entry against official Korean terminology, especially people/place names, meritocracy wording, gender-neutral ship roles, and the Luck concept. | Korean preserves all three sections and their nine embedded breaks, the migration/history claims, clothing, seafaring society, and superstition details. Several source terms require glossary consistency review. | High |
| 63822 | Faehunter | Confirm whether this is a formal title/creature name and retain the image of mortal hatred of the Fae taking embodied form. | Korean keeps the compound as a parenthetical name and translates the embodiment metaphor; Japanese and Chinese likewise treat it as a named hunter. | Medium |
| 63823 | Court of Enchantments / `마법 궁정` | Verify the canonical Korean institution/title and preserve the grandmother's childhood storytelling frame. | English names Wencen's Court of Enchantments; Korean retains the court and heroic-story reading. Other locales use a heroic hall/institution. | Medium |
| 63831 | Queen of Cups / Moon Camp | Clarify whether “Happy we were in the years we were wed, yet sad we were in the hours” contrasts a happy marriage with a recent separation, and whether Queen of Cups is a title or metaphor. | Japanese explicitly says the marriage recently broke down; English and Chinese leave the temporal contrast poetic. Korean preserves a title-like rendering and the happiness/sadness contrast without fixing the event. | High |
| 63836 | Captain Canwen / “moved ahead without me” | Resolve whether Canwen deliberately left the narrator behind or simply advanced ahead; retain the narrator's justice-over-victory priority. | English and Chinese say she moved ahead/left the narrator; Japanese suggests she should be ahead. Korean follows the English reading. | High |
| 63839 | Oleyn poem / “nature's tooth” | Review the image “a sharp and silent, simple truth” and the humility/knighthood contrast without flattening the verse. | Korean retains all eight line breaks and the stanza gap. The source's compressed metaphor is obscure; Japanese and Chinese interpret the truth line differently. | High |
| 63841 | Ivan Hugues / attack objective | Preserve the causal sequence: Ivan drew raiders away from innocent worshippers, died, and the player investigates the body, perpetrators, and motive. | Korean retains the protection attempt, death, and both investigation targets. The referenced attack context remains outside this row. | Medium |
| 63843 | Mitharans / `미사루 신도들` | Determine whether `Mitharans` denotes worshippers, a people, or another named group. | English, Japanese, and Chinese use a demonym-like plural; Korean specifically identifies followers of Mitharu. | High |
| 63845 | Hyperian / Arkes | Keep the agency and death relation explicit: Hyperian rejects Arkes, kills him and his followers, then seals itself away. | Korean retains this order; its connective could be read as the followers dying alongside Arkes, so verify the object grouping against the full narrative. | Medium |
| 63846 | sigil-stones | Preserve that two additional stones, beyond the one in front of the speakers, grant passage. | Korean retains both the count and the access function; the current context does not specify how the stones operate. | Low |
| 63847 | tragedy-story invitation | Preserve the likely sarcastic tone in the speaker's “busy schedule” jab and offer to entertain with tales of tragedy. | Korean keeps the pointed invitation and tragic-story irony; Japanese and Chinese use similarly ironic phrasing. | Medium |
| 63850 | Chernobog / “fiery blood” | Preserve the explanation that Chernobog fights only worthy opponents and dismisses insufficiently thrilling challengers as flies. | Korean retains the ferocity test, fiery-blood image, and fly metaphor. The phrasing is idiomatic rather than a literal blood effect. | Low |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the Apotyre investigation, village leadership, contract turn-in,
Lina Ardeen's stolen item, Alfar military title, the crew-song reference,
the Hyperian antechamber, Gallows End/Requiem, the sigil-stone count, and
the short UI/dialogue strings. Proper names and lore terms remain
provisional. Findings are not confirmed corrections.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 63750-63849 against
  the relevant rows in this batch, including Apotyre, Brother Wulf,
  Overgrown Thicket, the Nan poem, Sorrows, the placeholder order, Varani,
  Faehunter, Court of Enchantments, Queen of Cups, Canwen, the Oleyn poem,
  Ivan Hugues, Mitharans, Hyperian/Arkes, sigil-stones, and the tragedy
  dialogue.
- Also checked the historical entry beginning at ID 63850 for Chernobog.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63801-63850 once
  and in identical ascending order.
- Embedded newline counts match for every row, including the Varani entry
  (63820), the Nan poem (63813), and the Oleyn poem (63839).
- ID 63818 preserves the localized placeholder order `{3}`, `{2}`, `{1}`,
  `{4}` in Korean; this differs from the English/Chinese sequence and is
  documented rather than normalized.
- No translation CSV edit was made.

## Batch Status

IDs 63801-63850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63851.
