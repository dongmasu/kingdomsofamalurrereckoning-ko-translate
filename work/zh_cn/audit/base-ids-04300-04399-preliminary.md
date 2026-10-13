# Preliminary Language Scan: `base` IDs 4300-4399

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 4300-4399.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked German, Spanish, French, Italian, and Russian for disputed terms
  and reconciled historical `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4327 | 부서진 표지 | Confirm whether `Ruined Sign` is a physical signboard or a damaged marker/seal, and name the object accordingly after checking its in-game context. | English says `Sign`, Japanese uses `印` (“mark/seal”), and Chinese says “destroyed marker.” Korean `표지` is broad and may not identify a signboard. | Medium |
| 4336 | 방어구 | Determine whether this row labels armor equipment or the defensive stat `Armor`; retain the source disagreement until context is known. | English, Chinese, and German/Spanish/French/Italian use “armor”; Japanese explicitly says `防御力` (“defense”), while Russian specifies a chestpiece. The Korean equipment reading is plausible but not settled by the strings alone. | Medium |
| 4347 | 대회계원의 것 | Preserve the possessive fragment and confirm what text it joins before adding or changing a head noun. | English is the incomplete fragment `The Grand Bursar's`; Japanese and Chinese also provide title-like/possessive fragments. Korean does not invent a missing object, but the final composition needs UI-context checking. | Medium |
| 4366 | 해양강의 장점 | Standardize the Korean treatment of `Seasteel` against the related material entry at `default` ID 2111 (`씨스틸(Seasteel) 꾸러미`). | English and sibling locales identify a sea-steel material; Japanese says “sea iron.” The current Korean meaning is understandable, but translating the name here and transliterating it elsewhere is inconsistent. | Medium |
| 4384 | 부관 섄 게센(Shan Gethen)의 무덤 | Confirm the canonical Korean military rank for `Lieutenant`; do not follow the Chinese “general” rendering without corroboration. | English, German, Spanish, French, Italian, and Russian say lieutenant; Japanese has a different subordinate/vice-captain reading and Chinese says general. `부관` is broader than a specific lieutenant rank. This repeats the historical question. | High |
| 4386 | 상급 추적자의 비약 | Confirm the item category and compare the full `Master`/`Minor`/`Greater Tracker's Draught` set before finalizing its name. | English and German/Spanish/French call it a draught/potion; Japanese calls it a map, and Chinese is ambiguous. The Korean potion reading is supported by most references, while the Japanese mismatch and the related tiered item names remain unresolved. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical `base` questions for IDs 4336, 4384, and 4386
  against the active Korean and source locales. The `Armor` category/stat
  distinction, Lieutenant rank, and `Tracker's Draught` item category remain
  open or provisional.
- Same-numbered historical `default` questions were kept separate from these
  `base` item/category rows.

## Other Checks

- `Seasteel` at ID 4366 is a corpus terminology-consistency concern; it does
  not authorize changing either this row or `default` ID 2111.
- The remaining inspected item, location, title, and UI labels had no
  additional high-confidence semantic mismatch in this pass.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4300-4399 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
