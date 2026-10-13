# Disposition and Edit Batch: `default` IDs 3200-3249

- Decision date: 2026-10-09.
- Scope: findings in the preliminary report and source-keyed historical
  questions for `default` IDs 3200-3249, including historical entries omitted
  from the direct-findings table.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Twelve candidates were dispositioned: two accepted, one `not an issue`,
  and nine uncertain. Only the two accepted `Texto` cells below were edited.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3201 | Battle of Staggers / how Balor was raised | Unchanged; the event name and awaken/summon nuance remain unresolved across sources. | D-643: uncertain |
| 3205 | Indexed `[Passive]` label | Unchanged; whether the English label is display text or part of a runtime token is unresolved. | D-644: uncertain |
| 3212 | `Hospitalis Quarters` | Unchanged; ward versus named district remains unclear, and the earlier occurrence is also unresolved. | D-645: uncertain |
| 3215 | Professor Emeritus Abscondus / Postmortem Studies | Unchanged; the title, academic field, and name parsing need context. | D-646: uncertain |
| 3218 | `Viper Sorcerer` | Unchanged; named enemy type versus descriptive class label remains open. | D-647: uncertain |
| 3223 | `boggart` | Unchanged; canonical creature-name styling is not established. | D-648: uncertain |
| 3227 | Arkes's circlet | `아르케스(Arkes)의 관을 말하는 건가...` -> `아르케스(Arkes)의 서클릿을 말하는 건가...` | D-649: accepted |
| 3230 | House of Valor name consistency | `용맹의 전당(House of Valor)` -> `용맹의 집(House of Valor)` | D-650: accepted |
| 3237 | The Maid / Telling / compromised speaker | Unchanged; the kind of harm and lore-specific terms cannot be settled from this line. | D-651: uncertain |
| 3243 | `I'm sure you do, friend.` | Unchanged; the preceding dialogue needed to identify what is being affirmed is absent. | D-652: uncertain |
| 3246 | `divine information` | Unchanged; `신탁을 전하다` conveys the supported sense of divining/communicating knowledge. | D-653: not an issue |
| 3247 | `Narca affliction` | Unchanged; the affliction's nature and canonical lore name remain unresolved. | D-654: uncertain |

The carried `base`/other-resource questions at IDs 3211, 3229, and 3242 were
not merged into this `default` batch. ID 3223's separate crafting-component
question is also outside this `default` disposition.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical ID order;
  IDs 3200-3249 are present once.
- The two edits change only Korean `Texto`. Keys, row order, delimiters,
  UTF-8 BOM, and CRLF record endings are preserved.
- The indexed marker at ID 3205, the three paragraphs at ID 3201, all numeric
  values, and every uncertain cell are unchanged.

## Checkpoint

- Decisions recorded: D-643-D-654.
- Cumulative dispositions: 155 accepted, 103 `not an issue`, and 396
  uncertain.
- The `default` disposition cursor now covers IDs 0-3249. Resume with IDs
  3250-3299 and their preliminary report.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
