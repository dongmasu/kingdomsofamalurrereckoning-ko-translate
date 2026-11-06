# Translation Edit Addendum - 2026-11-06

## Outfit and Apparel labels

- Checked `default:7718` (`Outfit`) and `default:43004` (`Apparel`) against all available English, Japanese, Chinese, German, French, Spanish, Italian, and Russian rows. The Korean source labels are both `의상`.
- The locale references generally indicate clothing or attire: Japanese uses `服装` for `Outfit`, Chinese uses `套装`/`衣服`, and German, French, Italian, and Russian use clothing/attire terms. Japanese alone renders `Apparel` as `アーマー`; this conflicts with English and most other locales.
- The official game manual lists Armor as its own inventory category. Neither English label explicitly says Armor, so the evidence supports clothing/attire rather than specifically protective armor.
- Retained `의상` for both short labels: it is a natural broad rendering here, and the isolated strings do not establish separate UI categories that require distinct Korean terms.

## Weapon and armor terminology

- Applied the approved weapon-class terms throughout source-matched `default` rows: `Longsword` → `장검`, `Greatsword` → `대검`, `Dagger` → `단검`, `Hammer` → `망치`, `Greathammer` → `대형 망치`, `Longbow` → `장궁`, `Staff` → `지팡이`, and `Chakram` → `차크람`.
- Applied the approved exceptions `Sceptre` → `셉터` and `Faeblade(s)` → `페이블레이드` in `base` and `default`, including item labels, equipment descriptions, weapon skills, and class lists. Excluded the poetic/metaphorical `scepter` at `default:138` and `56581`, and unrelated text such as `홀더`.
- Standardized source-matched `Leggings` to `레깅스` (3 `base` and 10 `default` records) and `Circlet` to `서클릿` (1 `base` and 5 `default` records). The armor-type list is `Helm` → `투구`, `Circlet` → `서클릿`, `Cuirass` → `흉갑`, `Robe` → `로브`, `Gauntlets` → `건틀릿`, `Leggings` → `레깅스`, `Greaves` → `정강이 보호구`, `Chausses` → `각반`, and `Boots` → `장화`.
- A full source-ID cross-check found and corrected residual `Greaves`/`Chausses` mix-ups at `base:1338:11` and `base:48:11`, plus 11 `default` Greaves rows (`15644`, `18108`, `18610`, `19505`, `22509`, `22717`, `33532`, `45642`, `51922`, `64029`, and `64884`). Greaves and Chausses remain distinct terms; Boots were not changed.
- Corrected particles affected by the terminology changes and standardized `Greathammer` as `대형 망치`, without changing unrelated occurrences of similar Korean words.
- Verified edited rows against English IDs and variants. The `base` record IDs and line-ending counts and the `default` record IDs and mixed line-ending counts were unchanged; `base` parsed successfully and all four line-ending-preservation tests passed.

## Bolgans' Bane equipment labels

- Compared `base` IDs `810`, `989`, `4259`, and `4364` with the English, Japanese, and Chinese source rows. Each source names a specific equipment label in variant `11`.
- Added the complete English equipment names in parentheses: `Cuirass of Bolgans' Bane`, `Greaves of Bolgans' Bane`, `Gauntlets of Bolgans' Bane`, and `Chausses of Bolgans' Bane`.
- Preserved the existing Korean wording. The English labels identify the source items and do not resolve the Korean possessive or meaning of `Bolgans' Bane`.
- Verified the four IDs against the English CSV, confirmed all 4,845 parsed `base` records remain present, and passed all four line-ending-preservation tests.

## Remnant equipment series

- Compared the five `base` armor labels (`1261`, `1444`, `1900`, `3202`, and `4045`) with the English source. Added the four missing names: `Remnant Greaves`, `Remnant Chausses`, `Remnant Cuirass`, and `Remnant Gauntlets`; the existing `Remnant Helm` label at `3202` was retained.
- Also added `Remnant Plate` to `default:58448`, a matching standalone equipment label in the same set.
- Preserved the existing Korean wording and row variants.
- Verified all five `base` labels against the English CSV and confirmed the 4,845 parsed `base` records remain present. Confirmed the `default:58448` label against its English source; all four line-ending-preservation tests passed.

## Kukui Tree

- Compared `base:34:11` across English (`Kukui Tree`), Japanese (`ククイノキ`), Chinese (`库库伊树`), and Korean.
- Hawaiʻi DLNR identifies kukui as the Hawaiian name and candle-nut tree as the common name; Kew's Plants of the World Online lists kukui among the common names of `Aleurites moluccanus`. This is a plant species' common name, not a unique person or place name. Sources checked 2026-11-06.
- Added the exact English source label, `Kukui Tree`, to the Korean row. No other English `Kukui` occurrence was found in the source CSVs.
- Verified `base:34:11` against English, confirmed all 4,845 parsed `base` records remain present, and passed all four line-ending-preservation tests.

## Warding Lining component

- Compared `base:38:11` with English `Master Warding Lining`, Japanese `マスター・ワーディングライニング`, and Chinese `大师封印内衬`.
- Game crafting references describe a lining as an armor component and Warding as an elemental-resistance effect. Replaced the unclear transliteration `워드` with the established Korean term `원소 저항`, retaining the source label: `장인급 원소 저항 안감(Master Warding Lining)`.
- The exact stat value for this Master-tier item was not established; no percentage or numerical effect was added. Sources checked 2026-11-06: the game manual and Kingdoms of Amalur crafting-component references.
- Verified the updated `base:38:11` against English, confirmed all 4,845 parsed `base` records remain present, and passed all four line-ending-preservation tests.

## Snakeroot

- Compared `base:4832:11` with English (`Snakeroot`), Japanese (`スネイクルート`), and Chinese (`蛇根草`).
- Botanical references use `snakeroot` as a common name for multiple plants, not as a unique species name. The game item label does not identify a more specific plant, so no species was inferred.
- Added the exact English item label: `스네이크루트(Snakeroot)`.
- Verified the target ID and variant against the English source and confirmed all 4,845 parsed `base` records remain present. Sources checked 2026-11-06: Kew Plants of the World Online and botanical references on snakeroot common-name usage.

## Greaves, Chausses, and Boots

- Replaced `정강이받이` with the clearer `정강이 보호구` in all 34 `base` rows whose English source is `Greaves`. Updated the four corresponding `default` uses at IDs `1930`, `4766`, `14301`, and `57283`.
- Source review distinguishes `Greaves` (lower-leg armor) from `Chausses` (mail leg armor/leg coverings) and `Boots` (footwear). Updated `default:39353`, whose English text says `chausses`, from `정강이받이` to `각반`; `Boots` translations remain unchanged.
- Sources checked 2026-11-06: Getty Art & Architecture Thesaurus and Royal Armouries for `Greaves`; Fitzwilliam Museum terminology for `Chausses`.

## Rose Court and Onyx Tower

- Compared `default:24342`, `31825`, and `45092` with the English source. `Rose Court` was consistently translated as `장미 궁정`; added `(Rose Court)` at all three occurrences.
- `Onyx Tower` appeared once as `흑옥탑` and twice as `오닉스 탑`. Standardized all three to `오닉스 탑(Onyx Tower)`.
- `Dominus` and `Magister` each occur once, together at `default:31825`; added `(Dominus)` and `(Magister)` to their Korean renderings.
- Distinguished the separate place name `Salon Magisterium`, found in `default:28030`, `32381`, `32965`, and `35870`; it is not the title `Magister` and was not changed in this scoped review.
- Verified all three edited IDs against English and confirmed the complete `default` record count was preserved. All four line-ending-preservation tests passed.

## Health terminology and Cora Banick dialogue

- Changed `default:20690` from recovering `활력` to recovering `체력`. English says “renewed vigor”; Japanese explicitly identifies the restored resource as `体力`, and Chinese also describes restoring life force. The upgrade marker and sentence structure remain unchanged.
- Changed `default:30018` to conversational 반말: `대장기술이나 연금술에 관심 있어? 우리 작업대는 마음껏 써도 돼.` This matches Cora Banick's informal line at `default:20323` and the casual Japanese source while preserving the existing workbench interpretation.
- Retained `활력` at `default:39166` as explicitly directed by the user.
- Verified the three IDs against the active CSV and English/Japanese/Chinese references. No other rows were targeted.

## Meropis name pairing

- Compared all Korean `메로피스` occurrences in the active `base` and `default` CSVs with the English source.
- Added `(Meropis)` to all 17 previously unpaired occurrences in `default`, including repeated mentions within a row and two repeated `Discoverer of the island of Meropis...` strings with no populated ID. Existing paired occurrences in `base` and `default` were retained.
- Verified the edited IDs against their English source rows and checked CSV record structure and line-ending preservation.

## Jory name pairing

- Compared every active Korean `조리` candidate with its matching English `default` row. Excluded ordinary `조리법` uses and the distinct name `Jorielle`.
- Added `(Jory)` to 12 previously unpaired mentions at `default:9974`, `1170`, `20250`, `23428`, `31821`, `33180`, `40319`, `41123`, `41939`, `49303`, `51412`, and `57893`. Rendered the full name at `20250` as `조리 데이스(Jory Dace)`; added the pairing to the second mention in `1170`.
- Retained existing English pairings in the other Jory rows.
- Verified the changed rows against English and checked CSV structure and line-ending preservation.

## Warsworn name pairing and review

- Cross-checked all 410 English `Warsworn` rows across `base` (14) and `default` (396) against the Korean CSVs. All had a Korean Warsworn rendering.
- Found one direct name mention without an English pairing at `default:17098`; added `(Warsworn)`. Compound labels already carrying the full English title in parentheses were retained without redundant additions.
- Compared `default:17098` with English, Japanese, and Chinese. The Korean meaning and dialogue were accurate; only the name pairing was missing.
- Rechecked the full source-matched set for missing pairings and verified the default CSV structure and line-ending preservation.

## Troll type name pairing

- Compared all English `default` rows containing named troll types with the active Korean rows. Added full English type names at 25 IDs, including `Mountain Troll`, `Rock Troll`, `Silverback Troll`, `Silvermane Troll`, `Chaos Troll`, `Prismere Troll`, `Stowaway Troll`, `Ice Troll`, and `Mithros Icy Troll`.
- Preserved the distinct source name `Mithros Prismere Troll` at `default:42332`; standardized the shortened Korean `산 트롤` at `default:23224` to `산악 트롤`. The generic `Troll` references and the `Two Knights and a Troll` title were excluded.
- Verified each changed type against its English source row, confirmed the default CSV record count and ID order, and checked that the UTF-8 BOM and CRLF line endings were preserved.

## Ability category and tree terminology

- Standardized direct Might, Finesse, and Sorcery ability-category wording by removing the inconsistent `계열` at `default:34502`, `55223`, and `35397`. In `35397`, added the English names inside the existing display wrappers: `힘(Might)`, `재주(Finesse)`, and `마법(Sorcery)`.
- Rendered explicit Ability Tree references as `능력 트리` at `default:33690`, `33991`, `47472`, and `51888`, distinguishing tree references from direct category labels.
- Kept `마법 계열` for Sorcery-based weapons at `default:8510`, `46988`, and `47873`; those entries describe weapon types, not abilities in the Sorcery tree.
- Compared all changed IDs with their English and Japanese source rows, preserved display-wrapper tokens, and checked CSV structure and line endings.
