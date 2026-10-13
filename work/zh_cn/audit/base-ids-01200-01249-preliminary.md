# Preliminary Language Scan: `base` IDs 1200-1249

- Review date: 2026-10-07
- Scope: all 50 active `base` rows, IDs 1200-1249.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1206 | 해질녘의 보물 | Reconcile `Eventide` as a place/name versus the common noun “evening.” | The English and Chinese use the name `Eventide`; Japanese transliterates it. `default` ID 641 also treats Eventide as a place/name (`이븐타이드(Eventide)`). Korean's literal `해질녘` may therefore change a proper noun and is inconsistent with the adjacent corpus evidence. | Medium |
| 1207 | 빙결 방해의 보석 | Check the intended item/effect meaning of `Gem of Ice Hindrance` and choose a natural Korean compound. | Japanese suggests an ice-binding gem and Chinese is compressed/ambiguous. Korean is a literal, awkward compound; item context is needed to distinguish hindrance, resistance, or binding. | Low |
| 1227 | 비단 농부의 일지 | Reconcile the established role/name for `Silkfarmer`. | Japanese describes a silk-gathering worker and Chinese a silk-reeling worker. The Korean `비단 농부` reads literally as a farmer of silk and conflicts with the silk-gatherer terminology concern already recorded in earlier `base` batches. | Medium |
| 1230 | 중가르(Zungar)의 축 | Check `Shaft` as a mine passage rather than an axle/axis. | Chinese explicitly uses the mine-shaft sense; Japanese leaves the English unchanged. Korean `축` can mean an axis and may misidentify the mine location. Verify with the in-game map/item context. | Medium |
| 1243 | 프레스터(Prester)의 길 | Resolve the source/reference mismatch for `Prester's Path`. | English and Chinese say “path”; Japanese instead describes a petition/plea board. Korean follows English, which is the semantic anchor, but the entity needs context confirmation before treating this as settled. | Low |
| 1204, 1244-1245 | 천국; 이나 소워스(Ina Sawerth); 오스 테스윈(Othe Theswin) | Check whether `Heaven` is a common noun or a named location, and reconcile person-name spellings/display. | Japanese transliterates `Heaven`, while Chinese translates it literally. The two personal names also differ in Korean spelling from one or more locale references and lack a consistent English-parenthesis pattern. No isolated normalization is authorized. | Low |

## Other Checks

- The remaining inspected item labels generally track English; no additional high-confidence meaning shift was established.
- IDs 1201, 1239 and 1247 repeat the previously noted `Bindings`/equipment-compound question. ID 1232 (`String`) and ID 1237 (`Fulcrum`) may also need inventory-context checks, but their current Korean is plausible.
- Proper-name and faction-name display remains inconsistent; retain these examples for the project-wide convention instead of changing parentheses row by row.

## Batch Status

IDs 1200-1249 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
