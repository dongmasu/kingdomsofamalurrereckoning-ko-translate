# Preliminary Language Scan: `default` IDs 54751-54800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 54751-54800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 54757 | `Champion` / `챔피언` | Confirm whether this is the established title/name and distinguish it from an ordinary champion or guardian. | Korean follows English and Chinese; Japanese instead says “guardian.” This is a source-locale terminology conflict. | Medium |
| 54759 | `전승` for `the telling`; Maid of Windemere | Preserve that the speaker has repeatedly been captured and escaped in the Telling, but fears this instance may end differently; standardize the Maid title. | Korean retains the repeated capture/escape and changed-outcome concern. Japanese substitutes a divergent “valiant woman” title; Chinese also has a generic “maiden.” | Medium |
| 54760 | `샘(Font)` improves Kerrinan's `예지력` | Confirm whether the capitalized Font is a formal source of power and whether it specifically improves her sight/foresight. | Korean gives “sight” a foresight reading; English says only sight, while Japanese and Chinese likewise suggest a special Font. The exact sense is lore-dependent. | Medium |
| 54763 | `부활` for `Revival` | Determine whether this is a named camp, event, UI state, or the generic concept of revival; align the Korean display term. | Korean translates the word literally, while Japanese transliterates and Chinese identifies a revival camp. The isolated label does not resolve its function. | Medium |
| 54764 | `콜로새 민족사 제2부` | Keep the second-part designation, and verify the formal Kollossae name and book-title convention. | Korean preserves the source's description of the second part of a history and does not invent a separate historical period. | Medium |
| 54765 | Mercantile potion recipe / four ingredients | Preserve the Alchemy Workbench instruction, temporary skill increase, reagent identities, quantities `2/2/2/1`, and five-line layout. | All four locales retain the same four reagent quantities and line breaks. Korean preserves the Sativa Fibers name rather than Chinese's flax interpretation; official ingredient terminology remains to be confirmed. | High |
| 54767 | `Leanashe` / `리어나시` | Confirm whether `Leanashe` is a proper creature/name or should be interpreted as the mythic snake-woman term used by other locales. | Korean transliterates the source label; Japanese and Chinese interpret it as a mythological being. The single label does not settle the intended lore entity. | Medium |
| 54771 | `Spring Grim Onwig` / `봄의 그림 온위그` | Determine whether the English is a malformed task/title string or a season modifier plus the character name; do not normalize without context. | Korean reads `Spring` literally as “spring” and transliterates Grim Onwig. Japanese and Chinese instead render an instruction to release Grim from prison, a substantial source-locale divergence. | High |
| 54773 | `내 동생 태디어스` for `my brother, Thaddeus` | Preserve the sibling relationship without adding younger age unless the context establishes it. | English only says brother; Korean specifically says younger brother. Japanese and Chinese do not settle the age. | Medium |
| 54781 | `Destiny Unbound: {1} times` | Preserve the `{1}` placeholder identity/order and the repeated-count label. | All locales retain the same `{1}` marker and count position. The Korean title term remains a corpus-wide terminology candidate. | High |
| 54783 | health-steal potion recipe / four ingredients | Preserve the temporary health-steal effect, all reagent identities/quantities `3/3/2/1`, and list structure. | The four locales have identical physical line-break counts; Korean preserves all four quantities and the effect. Ingredient spellings remain glossary candidates. | High |
| 54785 | `Captain of the Watch` / `감시대장` | Confirm the official role name and preserve the speaker's incredulity and invocation of Lyria. | Korean retains the question and invocation; the capitalized title may have an established faction-specific Korean rendering. | Medium |
| 54788 | Almain reward / rescued Dokkalfar noble | Preserve the rescued noble as the source of the reward and the Almain as recipient; confirm whether `these` refers to one or multiple objects. | Korean expresses the rescue-for-reward relation and pluralizes the received items. English `these` also supports a plural object, while Japanese uses a singular demonstrative. | Medium |
| 54794 | `secret Orbocant skipper` / `비밀 전령선` | Clarify whether `skipper` means a vessel or its captain and preserve the relationship between the stolen hilt, Elund of Rathir, and Dead Kel sinking it. | Korean interprets the phrase as a secret messenger ship. English can use `skipper` for a small vessel, while Chinese interprets it as a secret captain/member of a council; the source phrase is contextually unusual. | High |
| 54797 | `notices` / `공고문` | Determine what notices are being delivered and whether the request concerns recruitment/conscription notices. | Korean keeps the generic notice meaning. Chinese expands the phrase to conscription notices; English and Japanese do not explicitly name their subject. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Terms remain provisional, including Tuatha, Alfar, Droser,
Prismere, Champion, Maid of Windemere, Fateweaver, Font, Mercantile,
Sativa Fibers, Sky Blossom, Bloodroot, Essence of Fate, Leanashe,
Rathir, Grim Onwig, Thaddeus, Korrinna, Niskaru, Gem Lattice,
Shieldring Keep, Calder Vonn, Observers, Winter Court, Court of
Enchantments, Almain, Dokkalfar, Dead Kel, seasteel, Orbocant, Scion,
Livrarium, and Birth Candle.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `54750-54849`.
  It specifically flags the Kollossae history label at 54764 and the
  Secandra/Arkes/Anokatos narrative later in the range. Current rows 54751-
  54800 were also compared against the English, Japanese, Chinese, and
  Korean active CSVs.
- ID 54750 is the historical range's opening boundary and was included in
  the preceding active report. It is not duplicated here.
- Historical questions remain preliminary prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 54751-54800 once
  and in identical ascending order.
- Physical line-break counts match throughout, including both four-reagent
  recipes at IDs 54765 and 54783.
- `{1}` at ID 54781 and recipe quantities are preserved; no marker-identity
  discrepancy was found.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

This document records a preliminary scan, not independent final approval.
Its findings were dispositioned in
[`disposition-batch-default-54751-54800-20261010.md`](disposition-batch-default-54751-54800-20261010.md):
one accepted correction, 34 `not an issue` IDs, and 15 uncertain IDs.
Continue at `default` ID 54801.
