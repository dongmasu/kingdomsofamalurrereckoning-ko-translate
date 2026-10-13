# Preliminary Language Scan: `base` IDs 4700-4799

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 4700-4799.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales and reconciled historical `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4718 | 혼돈의 추 | Confirm whether `Plumb` is a plumb bob/weight or an English source typo; preserve the item context before settling the name. | English says `Plumb`, Japanese reads it as plum, and Chinese says lead. Korean's `추` matches a weight, but the unusual item name remains unresolved. This repeats the historical question. | Medium |
| 4720 | 애스커의 골목 | Confirm whether `Asker's Alley` is a named alley/location or a tavern; do not infer the Japanese reading without context. | English says `Alley`; Japanese interprets it as a tavern, and Chinese keeps the alley reading. Korean follows English/Chinese. This repeats the historical question. | Medium |
| 4736 | 산호 조각 | Confirm whether `Coral sliver` means a coral fragment or an unusual coral/silver material name. | English and Japanese retain “sliver”; Chinese reads “silver,” likely conflating the words. Korean follows the English “fragment” sense. This repeats the historical question. | Medium |
| 4743 | 받이 | Determine whether `Receptacle` means a container or the botanical receptacle/flower part; use an identifiable Korean noun once the item context is known. | Japanese uses a botanical term; Chinese takes the generic “receptacle” sense. Korean `받이` is broad and unnatural as a standalone item label. This repeats the historical question. | Medium |
| 4769 | 틸(Til)의 모금품 VIII | Confirm whether `Collection` is a donation/collection event or a numbered collection/series, and retain the proper-name relation. | English says `Collection`; Japanese reads a collection/series, while Chinese says donations. Korean chooses fundraising/donations. This repeats the historical question. | Medium |
| 4770 | 주변 풍경의 유리 | Identify what `Glass of Ambient` denotes and preserve it as a specific artifact/item name if appropriate. | English phrase is unusual; Japanese calls it a view glass and Chinese a full-area mirror. The Korean literal “glass of surrounding scenery” is difficult to identify and may obscure the item's function. This repeats the historical question. | High |
| 4794 | 장인급 독 방호 | Confirm the effect behind `Venomguard` and whether `Master` is the correct Korean quality tier. | English/Chinese say a master-tier venom guard, while Japanese describes large-tier poison protection. Korean follows English/Chinese; the mechanic and rank still need item context. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 4718, 4720, 4736, 4743,
  4769, 4770, and 4794 against the active Korean and source locales. The
  weight, location, material, botanical item, collection, Glass artifact,
  and Venomguard/rank readings remain open or provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` items.

## Other Checks

- ID 4708's `Chantry` is rendered as `예배당`; preserve the established
  religious-institution wording until its lore-specific usage is settled.
- IDs 4758 (`Poisony Dev Bow`) and similar strings preserve an explicit
  developer marker instead of silently deleting it.
- The remaining inspected equipment, place, ingredient, and crafting-part
  labels had no additional high-confidence semantic mismatch in this pass.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4700-4799 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
