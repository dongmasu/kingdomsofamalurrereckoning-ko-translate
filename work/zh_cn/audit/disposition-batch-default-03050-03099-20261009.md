# Disposition and Edit Batch: `default` IDs 3050-3099

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 3050-3099.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- This is a working editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3056 | Arcadium / Hospitalis Quarters / charity or cheaper custom | Unchanged; source error and competing readings are unresolved. | D-585: uncertain |
| 3059 | Page Lilligild / chain for speaking with dignitaries | Unchanged; formal role and item function need context. | D-586: uncertain |
| 3062 | Hierophant / feminine tomb reference | Unchanged; Korean follows the English pronouns and threat. | D-587: not an issue |
| 3064 | `Blunderguts` | Unchanged; name versus comic insult is unresolved. | D-588: uncertain |
| 3066 | Deliberately broken boast | Unchanged; the Korean retains the source's halting taunt. | D-589: not an issue |
| 3068 | `the rest of us` | `우리 나머지` -> `우리 같은 다른 페이들`; clarify the contrast and remove the calque. | D-590: accepted |
| 3069 | `Grand Champion` | `대그랜드 챔피언` -> `그랜드 챔피언`; remove the redundant mixed form. | D-591: accepted |
| 3074 | Murghan / Scavs | Unchanged; canonical enemy names remain open. | D-592: uncertain |
| 3075 | Six heroic epithets | Unchanged; exact lore names and referents need global reconciliation. | D-593: uncertain |
| 3076 | Main Menu / Options tutorial | Unchanged; verify UI terms and marker order in the separate structural pass. | D-594: uncertain |
| 3077 | `Aye, good day` | `그래, 좋은 하루야.` -> `그래, 안녕.`; use a natural greeting. | D-595: accepted |
| 3079 | Lower / three-point result | Unchanged; Japanese and Chinese support the high/low game outcome. | D-596: not an issue |
| 3082 | Silent Choir | Unchanged; faction-name convention remains open. | D-597: uncertain |
| 3084 | `Others don't weigh me down. Much.` | `...별로는.` -> `...뭐, 아주 조금 빼면.`; preserve the dry understatement naturally. | D-598: accepted |
| 3087 | Mitharan `liths` | Unchanged; the monument/object type is unresolved. | D-599: uncertain |
| 3092 | Baldo Bergmann / Revival / Warsworn | Unchanged; names and faction spelling remain provisional. | D-600: uncertain |
| 3096 | The Widow | Unchanged; proper-entity status and Korean title form need lore-wide alignment. | D-601: uncertain |
| 3099 | `kerchief` | `손수건 하나 팔게.` -> `스카프 하나 팔게.`; correct the item type. | D-602: accepted |

Five accepted decisions authorize only the listed `Texto` cells. The
remaining 13 are disposition-only.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical complete
  ID order; IDs 3050-3099 are present once.
- The long tutorial at ID 3076 retains every indexed label and all
  `{LINE_LEFT}`, `{LINE_SPACE}`, and `{LINE_INDENT}` markers in order.
- No key, row, variant, line break, or sidecar was changed. The Korean CSV
  retains its UTF-8 BOM, semicolon delimiter, and CRLF record endings.

## Checkpoint

- Decisions recorded: D-585-D-602.
- Cumulative dispositions: 146 accepted, eighty-six `not an issue`, and
  370 uncertain.
- Next range: `default` IDs 3100-3149, using
  [`default-ids-03100-03149-preliminary.md`](default-ids-03100-03149-preliminary.md).
