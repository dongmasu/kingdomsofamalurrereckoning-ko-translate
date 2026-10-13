# Disposition and Edit Batch: `default` IDs 2600-2649

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2600-2649.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- These decisions are a working editorial disposition, not final independent
  linguistic approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2600 | `Found Cassera` quest state | `카세라(Cassera) 찾기` -> `카세라(Cassera)를 찾았다`; English and Chinese indicate the quest update is complete, unlike Japanese. | D-455: accepted |
| 2605 | Lowercase `bolgan` | Unchanged; the Korean parenthetical preserves the English source's lowercase form. | D-456: not an issue |
| 2612 | Hero and Maid | Unchanged; whether `Maid` is the named Maid of Windemere remains unresolved across locales. | D-457: uncertain |
| 2617 | Heir / summoner apposition | `그의 지팡이만 있으면 정당한 후계자가 될 수 있어. 최고의 소환사로.` -> `그의 지팡이만 있으면 정당한 후계자이자 최고의 소환사가 될 수 있어.` | D-458: accepted |
| 2629 | The Opponent, climax paragraph | Corrected the agent and relation: Taruk destroys Theron's village; the Mairu appear to defeat their aggressor, but at a cost. | D-459: accepted |
| 2630 | Maid of Windemere | Unchanged; the speaker's named-title reference and Korean form remain uncertain. | D-460: uncertain |
| 2632 | `dove` address | Unchanged; codename/title versus common form of address is unresolved. | D-461: uncertain |
| 2639 | Seer's-reign rhyme/rumor | Unchanged; preserve the supported rumor while deferring a voice-preserving Korean rhyme and the line's exact nuance. | D-462: uncertain |
| 2643 | Scholars' positions in the Basilica | Unchanged; `Scholars` may be an institution/rank, and its canonical Korean treatment is unresolved. | D-463: uncertain |
| 2644 | Quiet culling rumor | Unchanged; `숙청` and the disappearance threat convey the English meaning, supported by Chinese. | D-464: not an issue |
| 2646 | `tested by time and fire` | `세월과 시련을 견뎌 낸 사랑` -> `세월과 불길의 시험을 견뎌 낸 사랑`; retain the source's fire metaphor. | D-465: accepted |
| 2647 | `gladiator` address / Champion's Manor | `투기장 챔피언, ... 챔피언 저택` -> `검투사, ... 챔피언의 저택`; distinguish the addressee from the named manor. | D-466: accepted |
| 2648 | `longlegs` | Unchanged; whether this is a creature type/name or a generic epithet remains unresolved. | D-467: uncertain |

The five accepted `Texto` edits are authorized by D-455, D-458, D-459,
D-465, and D-466. D-453 (`default` 2589, `The Midden`) remains uncertain;
it was rechecked as a carried historical question and left unchanged.
Same-numbered historical findings for other resource types were not applied.

## Structural Verification

- All four locale CSVs parse to 65,135 rows with identical complete
  `default` ID order. All 50 IDs in this range are present in all locales.
- Embedded line-break counts match across locales except at ID 2629:
  Japanese has four breaks; English, Chinese, and Korean have five. This
  pre-existing layout difference is documented and preserved.
- Runtime-marker identities and order match at ID 2611; its translated
  marker contents remain intact.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings, including embedded line breaks. No row, key, variant, or sidecar
  was changed.

## Checkpoint

- Decisions recorded: D-455-D-467.
- Cumulative dispositions: 129 accepted, fifty-two `not an issue`, and
  286 uncertain.
- Next range: `default` IDs 2650-2699, using
  [`default-ids-02650-02699-preliminary.md`](default-ids-02650-02699-preliminary.md).
