# Preliminary Language Scan: `base` IDs 2200-2299

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 2200-2299.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2236 | 돌의 봉헌물 | Continue the `Votive` equipment-family question; determine whether these are physical charms/accessories or generic offerings. | Japanese describes an accessory and Chinese a votive charm; Korean `봉헌물` may name the act/object of offering rather than the item. This repeats IDs 2008 and 2051; resolve the family together using inventory context. | Medium |
| 2264 | 보관함 | Check whether `Footlocker` should identify a portable trunk/large personal chest rather than a generic storage container. | English names a footlocker; Chinese explicitly says a military trunk, while Japanese only says box. Korean `보관함` is broad and may omit the container type. Confirm its in-game object/category. | Low |
| 2268, 2290 | 강철 뒤축 / 리넨 뒤축 | Review the recurring `Heel` equipment labels as a family. | Chinese renders these as footwear, while Korean `뒤축` can mean only the heel/back part of a shoe. Compare with `Chainmail Heel` at ID 1935 and item-slot/category context. | Medium |
| 2289 | 캐일드(Caeled) 해안 | Align the proper-name spelling with the active `default` form `케일드 해안(Caeled Coast)` at ID 1032. | The same location appears across resource files with different Korean vowels (`캐일드` versus `케일드`). English, Japanese, and Chinese confirm the same place; retain both current forms for a corpus-wide name decision. | Medium |
| 2294 | 틸 형제(Brother Til)의 수집품 | Confirm whether `Collection` is a set of collected objects or a donation/fundraising collection. | English is ambiguous; Japanese and Chinese use “collection” in a way that may refer to collecting donations. Korean chooses personal belongings. Check the item's in-world use and compare the related `Til's Collection` title. | Low |

## Other Checks

- ID 2253 (`Simple Shaft`) repeats the equipment-component question recorded
  throughout the `Shaft` family; IDs 2268/2290 likewise repeat the `Heel`
  family question.
- ID 2246 (`Til's Collection V`) and ID 2294 (`Brother Til's Collection`)
  should be read together; no single-object interpretation is approved here.
- The remaining inspected names and equipment labels preserve their primary
  English meaning. Parenthetical name display remains inconsistent and is not
  normalized in this pass.

## Batch Status

IDs 2200-2299 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
