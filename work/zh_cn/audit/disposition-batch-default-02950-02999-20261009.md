# Disposition and Edit Batch: `default` IDs 2950-2999

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2950-2999.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- This is a working editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2953 | Rathir / old castle self-correction | Unchanged; Korean preserves the retraction and bawdy preference. | D-563: not an issue |
| 2957 | Akara-Tor / captain friend | Unchanged; canonical spelling and relationship context remain provisional. | D-564: uncertain |
| 2958 | Well seeking its own scent | Unchanged; English is tautological and the sought scent is not named. | D-565: uncertain |
| 2964 | Declarative identification of the Beckoned | `당신이 부름받은 자인가요?` -> `당신이 부름받은 자군요. 미지의 땅에서 온 축복받은 방문객이군요.` | D-566: accepted |
| 2968 | Fateless One / Twist of Fate / Special Deliveries | Unchanged; markup is preserved, while terminology remains subject to global alignment. | D-567: uncertain |
| 2971 | `Lower` UI label | Unchanged; action/direction/category meaning is unresolved without UI context. | D-568: uncertain |
| 2976 | Firstsworn / Oathblade award | Unchanged; formal rank and proper-name forms need terminology review. | D-569: uncertain |
| 2983 | Gallows End / “Fish, pray, eat” | Unchanged; Korean retains the source's dismissive sarcasm. | D-570: not an issue |
| 2988 | `Chamber of Trade` | Unchanged; English/Chinese and Japanese differ on commerce versus tax office. | D-571: uncertain |
| 2991 | `lily-giglet` / `mummer's farce` | Unchanged; the insult and figurative reading are not conclusive across locales. | D-572: uncertain |
| 2995 | `Delvers` | Unchanged; named group versus common role remains unclear. | D-573: uncertain |

The single accepted decision authorizes only the listed `Texto` edit.
The other ten findings are disposition-only.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical complete
  ID order; IDs 2950-2999 are present once.
- The four indexed markup spans at ID 2968 and `{LINE_SPACE}` /
  `{LINE_LEFT}` at ID 2979 remain unchanged; the 7 GB value and line layout
  are preserved.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No key, row, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-563-D-573.
- Cumulative dispositions: 139 accepted, eighty `not an issue`, and
  354 uncertain.
- Next range: `default` IDs 3000-3049, using
  [`default-ids-03000-03049-preliminary.md`](default-ids-03000-03049-preliminary.md).
