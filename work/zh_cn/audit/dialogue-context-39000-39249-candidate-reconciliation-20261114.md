# Candidate Reconciliation: IDs `39000`-`39249`

- Date: 2026-11-14.
- Rechecked all 23 in-range candidate IDs against English, Japanese, Chinese,
  active Korean, and relevant existing reviews. English anchored meaning;
  Japanese guided voice and register; Chinese was supporting evidence.
- `39122` had already been counted with the linked `36748` candidate and is
  not counted again. Linked candidate `60527` was reviewed with the
  Bloodseeker item series and newly counted.
- Asset associations were not used to infer individual speakers or playback
  order.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `39028` | Corrected with linked duplicate | Strengthened the corruption into a ruin while retaining the sunny-place and winding-ruin images. Exact-source duplicate `34308` now matches. |
| `39042` | Confirmed | `맨돌프 대사(Ambassador Mandolph)` already pairs the complete title and name. |
| `39055` | Corrected | Standardized the equipment-crafting objective to `대장기술로 장비 하나 제작하기`. |
| `39063` | Confirmed | `발레논트(Valenont) 마을` already pairs the named village. |
| `39072` | Confirmed | `오디 중사(Sergeant Odi)` already pairs the complete rank and name. |
| `39076` | Corrected | Added `Mayor` to the name-title pairing while retaining Revival as the location affiliation. |
| `39082` | Corrected | Paired the lore terms as `발라드(Ballads)` and `발라드(Ballad)` without changing the explanation. |
| `39090` | Corrected | Changed the potentially event-focused `무슨 일이야?` to `무슨 볼일이지?`, matching the purpose question in Japanese and Chinese. |
| `39118` | Corrected with linked duplicate | Paired the full title as `아오드의 폐허(The Ruin of Aodh)`; exact-source duplicate `774` now matches. |
| `39122` | Corrected; previously reconciled | Paired `스프라이트 창궐(Sprite Infestation)` and aligned exact-source duplicate `36748`. This candidate was counted in the earlier `36500`-`36749` reconciliation. |
| `39140` | Corrected | Added the established `스케이스(Scaith)` family pairing and smoothed the family-member phrase while retaining the written declarative register. |
| `39144` | Corrected | Added `와이번 가문(Wyvyrns)`; the existing Gifre family pairing and casual register remain. |
| `39165` | Corrected with linked duplicate | Added `에드윈(Edwin)` only, as that is the name used in this source. Exact-source duplicate `44619` now matches. |
| `39177` | Confirmed | `불의 전당(Hall of Flames)` was already paired. |
| `39185` | Corrected | Removed unsupported honorification in the brief farewell: `즐거운 여행 되길.` No speaker identity was inferred. |
| `39189` | Confirmed | `캐너록 입문서(A Canneroc Primer)` already pairs the complete book title. |
| `39204` | Confirmed | `블러디 본즈(Bloody Bones)` was already paired; the line's plain conversational voice is retained. |
| `39214` | Corrected | Paired the complete title as `에라셀 제국(Empire of Erathell)`. |
| `39222` | Confirmed | `바튼(Barten)` is already paired and the description remains natural. |
| `39232` | Confirmed | `틸레라(Tilera)` matches the established form used by its other occurrences. |
| `39233` | Confirmed | `아이작 손(Isak Thorn)` already pairs the complete name. |
| `39238` | Corrected with linked item series | Standardized `Bloodseeker` to base's `피추적자`, rendered `Shaft` as base's `축`, and paired the complete source item name. |
| `39239` | Corrected | Added the full opponent name pairing `레무스 블러드호크(Remus Bloodhawk)`; the Crows pairing and announcement remain intact. |

## Linked Consistency Groups

- `The spiders make their home...`: IDs `34308` and `39028` have identical
  English, Japanese, and Chinese sources and now use identical Korean.
- `The Ruin of Aodh`: IDs `774` and `39118` now use the same complete title.
- `Sprite Infestation`: IDs `36748` and `39122` now use the same complete
  title; `39122` is not recounted.
- The Eye of Amman return entry: IDs `39165` and `44619` have identical
  sources in all four languages and now use identical Korean.
- The Bloodseeker component series was checked against `base`: `Shaft` is
  `축`, `Handle` is `손잡이`, and `Fulcrum` is `지렛목`. IDs `39238`,
  `56058`, and `60527` now use `피추적자` consistently and each carries the
  complete English item title. `60527` was counted as one newly reconciled
  linked candidate.

## Preserved Holds

The existing evidence-limited holds at `39128`, `39159`, `39191`, `39196`,
and `39197` remain unresolved; no location, UI meaning, occupation, speaker,
or scene was inferred.

## Verification

- All 23 in-range candidates were adjudicated. `39122` was already counted;
  linked candidate `60527` was newly counted. This adds 23 unique candidates
  and brings cumulative reconciliation to 2,486 / 4,015 (61.92%), with 1,529
  remaining.
- Fourteen in-range rows were corrected; the other nine already matched
  their supported wording. Twenty Korean rows changed overall, including
  six linked consistency rows. Only those 20 ledger fingerprints were
  refreshed.
- Exact-source duplicate groups were checked across all four languages.
  Item terminology and component names were compared with the `base` rows.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR.
- Full-ledger fingerprints, index/catalog reproducibility, 11 CSV-preservation
  tests, nine dialogue-context tests, CSV structure checks, and the
  CRLF-aware diff check passed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
