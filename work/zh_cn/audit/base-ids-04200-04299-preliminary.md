# Preliminary Language Scan: `base` IDs 4200-4299

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 4200-4299.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for disputed names, locations, and item types and
  reconciled historical `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4202 | 페이 사냥꾼의 각반 | Align the technical armor term for `Chausses` with `Greaves` only after confirming whether the game treats them as distinct equipment types. | English distinguishes `Chausses` from `Greaves`; Japanese uses the same greave-like term for both. Korean currently uses `정강이받이` and `각반`, which may be a useful distinction or inconsistent terminology. | Medium |
| 4212 | 유적의 지팡이 | Resolve whether `Ruin` means a ruined place or destruction/doom. | This repeats the historical question. Japanese/Chinese suggest ruins, while German/Spanish/French/Italian/Russian generally suggest destruction/doom. Korean follows the place reading without item context. | Medium |
| 4213 | 엔더의 불꽃 | Determine whether `Ender` is a proper name or an agent/thing that ends something; retain the name question. | This repeats the historical ambiguity. Japanese leaves the English phrase unchanged; Chinese reads it as “Ender's fire,” while European/Russian locales translate or transliterate it differently. | Medium |
| 4224 | 웬딩 하우스(Wending House) | Confirm whether `Wending House` is a proper organization/place or a literal house in Wending. | English/Japanese preserve a name-like phrase; Chinese and European locales translate it as a house/home or settlement. Korean preserves traceability but leaves the entity type unclear. | Medium |
| 4231 | 재앙 파멸자(Scourgebane) | Confirm whether `Scourgebane` is a weapon/name or a descriptive “bane of scourges,” and avoid a potentially redundant Korean compound. | Chinese supports “scourge's bane”; Japanese reads “punishment”; sibling locales vary. Korean's `재앙 파멸자` is understandable but may describe an agent rather than an item property/name. | Medium |
| 4235 | 페이의 원 | Determine whether `Circle` names an organization, ritual circle, or group of Fae. | English capitalization and Japanese transliteration leave it open; Chinese and European locales translate it literally as a circle. Korean chooses the geometric sense. | Medium |
| 4237 | 크립시스(Crypsis)의 장화 | Decide whether `Crypsis` is a proper set/material name or “camouflage/concealment,” and retain the name uncertainty. | Japanese transliterates the name; Chinese and several sibling locales interpret it as camouflage/concealment. The Korean proper-name reading is plausible but not established. | Medium |
| 4250 | 칸드리안 물품 | Confirm whether this is merchandise from Kandrian or a shop/place called `Kandrian Goods`. | English/Chinese say goods; Japanese and Italian interpret it as a shop. Korean follows the merchandise reading but the item/location category remains unclear. | Medium |
| 4252 | 우라노스(Uranos)의 망치 | Preserve the exact English spelling `Ouranos` in the bilingual form and verify whether `Maul` is a maul/warhammer rather than a generic hammer. | The English source spells `Ouranos`; the Korean parenthetical changes this to `Uranos`. Japanese reads the weapon as an oar-like “all,” while Chinese and European/Russian locales identify a heavy hammer. | High |
| 4263 | 바람 | Confirm whether `The Wind` is a title/name or ordinary “wind,” and whether the English should be shown for traceability. | English capitalization and Japanese's explicit “The Wind” support a named reading, while Chinese and other locales translate it literally. Korean does not distinguish the title sense. | Medium |
| 4269 | 드베르가(Dverga)의 지도 - 위안 곶(Cape Solace) | Decide the canonical Korean form for both names, especially `Cape Solace`, and reconcile it with other active occurrences. | English/Japanese preserve the place name; other locales translate “Cape” and “Solace,” while the active Korean translates it as `위안 곶`. Elsewhere the Korean draft often transliterates `Cape Solace`, so this is a corpus-wide naming inconsistency rather than a row-local fix. | High |
| 4298 | 무두질한 가죽 뒤축 | Confirm whether `Heel` is a shoe/footwear item or a crafting component. | Most locales call this footwear/shoes; Russian explicitly says a footwear blank. Korean `뒤축` names only the shoe's heel and may be a wrong component reading. | High |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 4212-4213, 4215-4216,
  4224, 4231, 4235, 4237, 4250, 4252, 4263, 4269, and 4298 against the
  active Korean and source locales. The ruin/name, tier, faction/place,
  weapon, and footwear questions remain open or provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` item/location rows.

## Other Checks

- IDs 4249 (`Gem Cutting Handwraps`) and 4213 (`Ender's Fire`) are translated
  in Korean although English/Japanese retain English strings; their names
  remain candidates for the corpus-wide policy on English traceability.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4200-4299 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
