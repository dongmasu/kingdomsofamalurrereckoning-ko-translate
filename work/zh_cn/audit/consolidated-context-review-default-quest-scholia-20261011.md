# Consolidated Context Review: Repeated `default` Labels

- Date: 2026-10-11
- Scope: two exact-source clusters previously swept into uncertain decisions:
  47 quest-status labels and eight standalone `Scholia Arcana` labels.
- Method: join English, Japanese source, Chinese source, and active Korean by
  `ID_Linha`; compare repeated source text across IDs and reconcile existing
  accepted terminology decisions. English governs meaning; Japanese and
  Chinese are cross-checks.
- Result: 55 previously uncertain keys reclassified: four accepted edits,
  51 `not an issue`. No gameplay-only claim was inferred.

## Repeated Quest-Status Labels

D-18205 reclassifies the following unchanged labels as `not an issue`:

| English label | IDs | Count |
| --- | --- | ---: |
| `Quest Complete` | 23861, 28225, 28264, 28500, 28810, 29021, 29070, 29078, 29233, 29249, 29298, 29629, 29788, 29935, 30154, 30185, 30437, 30441, 30896, 30975, 31079, 31150, 31517, 31693, 31787, 31830, 31923, 32004, 32139, 32195 | 30 |
| `Quest Failed` | 25234, 25648, 25696, 27844, 28042, 28210, 28259, 28635, 28807, 29515, 29552, 31142, 31147, 31530, 31561, 31731, 31926 | 17 |

For all 47 IDs, the English, Japanese, and Chinese rows give the same status
label, and the active Korean is respectively `퀘스트 완료` or `퀘스트 실패`.
The labels are standalone UI strings; the broader uncertainty groups'
unrelated name, lore, and narrative questions do not apply to these rows.
No CSV cell changed for this decision.

## `Scholia Arcana`

Prior accepted decisions establish the Korean proper-name form
`스콜리아 아르카나`, including D-1397, D-3146, D-6297, D-6368, D-9985, and
later reuse decisions. Japanese and Chinese describe the institution as an
academy/university, while English consistently supplies its proper name.
The exact English label is identical at all eight reviewed IDs.

D-18206 authorizes only these four `Texto` replacements:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 8780 | `아르카나 학회` | `스콜리아 아르카나` |
| 9530 | `알카나 대학` | `스콜리아 아르카나` |
| 24295 | `아르카나 학술회` | `스콜리아 아르카나` |
| 29458 | `슈올리아 아르카나` | `스콜리아 아르카나` |

D-18207 marks these four already-canonical labels `not an issue`, without
changing them:

| ID | Retained Korean |
| ---: | --- |
| 4199 | `스콜리아 아르카나(Scholia Arcana)` |
| 6341 | `스콜리아 아르카나` |
| 12199 | `스콜리아 아르카나(Scholia Arcana)` |
| 13870 | `스콜리아 아르카나(Scholia Arcana)` |

Existing English-parenthetical styling was preserved per row. This review
does not impose a new global parenthetical policy or settle unrelated
institution/building terminology in longer sentences.

## Verification and Totals

The active default CSV changed only the four listed Korean `Texto` cells.
Byte comparison against the pre-edit backup confirmed no other bytes changed.
The UTF-8 BOM, 65,135 ascending IDs, and existing record separators remain
intact.

| Checkpoint | Result |
| --- | --- |
| Pre-edit SHA-256 | `72dd2be711abc43b037f6560e55518823452f147ebb4b6f9d68bc17bcce806f7` |
| Post-edit SHA-256 | `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21` |
| Byte-identical backup | `/private/tmp/ko-translate-backups/20261011/before-context-cluster-20261011/locatexts_zh_cn.koalocatext_default.csv` |

Cross-resource totals through D-18207 are 1,910 accepted, 22,961
`not an issue`, and 13,651 uncertain (38,522 total); next decision: D-18208.
These remain working dispositions, not independent final linguistic
approval. Other uncertain named-entity, item-category, voice, and
gameplay-context clusters remain open.
