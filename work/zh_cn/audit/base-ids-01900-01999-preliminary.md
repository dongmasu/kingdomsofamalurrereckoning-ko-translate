# Preliminary Language Scan: `base` IDs 1900-1999

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 1900-1999.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1905 | 기술서(현자술) | Replace `현자술` with the official-manual term for `Sagecraft`, `마법물품 제작`, if the project keeps the manual's terminology. | The source is `Skill Book (Sagecraft)`. The official Korean manual's established term is `마법물품 제작`; this existing draft uses a different semantic rendering. This also matches the historical audit note for this ID. | High |
| 1908 | 페이랜드 | Use the manual's established `Faelands = 패란즈` form. | English names `The Faelands`; the current `페이랜드` differs from the official Korean manual and the historical audit's explicit terminology note. | High |
| 1935 | 사슬 갑옷 뒤축 | Verify the equipment part/category for `Chainmail Heel` and choose a natural item label. | English and Japanese retain a heel/heel-piece term, while Chinese reads as chainmail footwear. Korean `뒤축` can suggest only the back part of a shoe; inspect the inventory category before deciding. | Medium |
| 1948 | 공론장 | Confirm whether `Forum` is an in-world gathering place, public square, or discussion forum. | English is context-poor; Japanese says `公会堂` (assembly hall), Chinese says `广场` (square/plaza), and Korean selects the discussion-forum sense. Use the location/UI context. | Low |
| 1965 | 도적 구역 | Recheck whether `Brigand's Quarter` names a hideout/encampment rather than a district. | Japanese describes a bandit hideout and Chinese a bandit camp; Korean's `구역` can imply a generic district. The isolated English item/location label needs context. | Low |
| 1984, 1990 | 상급 충전 축 / 장인급 도살 축 | Continue the family-level `Shaft` terminology check. | These are further equipment names in the recurring `Shaft` family. Korean `축` can be read as an axis; compare related IDs 1230, 1304, 1357, 1757, 1804, 1849, and 1876 with their inventory categories before choosing one family term. | Medium |
| 1998 | 미타루(Mitharu) III | Use the official-manual form `미사루` for the deity `Mitharu`, pending a documented exception. | The English, Japanese, and Chinese identify the deity Mitharu; the Korean uses `미타루`, while the official manual gives `Mitharu = 미사루`. Other rows in the active corpus also vary, so do not normalize globally from this single finding. | High |

## Historical Audit Reconciliation

- The historical notes for IDs 1905 and 1908 were rechecked against the
  active rows and official-manual glossary; both candidate conflicts remain.
- The repeated `Fulcrum` items at IDs 1922, 1943, and 1959 use the same
  Korean `지렛목` construction as related entries. Their component sense
  remains a family-level terminology question, not a new isolated defect.
- ID 1938 (`Elm Shock Rod`) supports a tree-material reading for the related
  `Ash Shock Rod` at ID 1894; that earlier candidate remains context-dependent
  rather than a confirmed error.

## Other Checks

- IDs 1902 (`Gunnar Frode's Key`), 1904 (`Tala-Rane`), 1915 (`Carasta's
  Contract`), 1928 (`Mel Senshir Prison Key`), 1932 (`A Shard of Nyralim`),
  1945 (`Pteryx Vanes`), 1951 (`Shardfall`), and 1993 (`Father Etair's Desk`)
  preserve their apparent names and item senses; spellings and bilingual
  display remain subject to the corpus-wide name convention.
- ID 1927 (`Sylvanite Plumb`) plausibly uses the plumb-bob sense (`다림추`);
  no mismatch was established without item context.
- The remaining inspected labels preserve their main English meaning; no
  additional high-confidence mismatch was found.

## Batch Status

IDs 1900-1999 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
