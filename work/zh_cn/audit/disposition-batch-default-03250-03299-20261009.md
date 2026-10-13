# Disposition and Edit Batch: `default` IDs 3250-3299

- Decision date: 2026-10-09.
- Scope: findings in the preliminary report and all source-keyed historical
  questions for `default` IDs 3250-3299.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Fifteen candidates were dispositioned: one accepted, one `not an issue`,
  and thirteen uncertain. Only the accepted `Texto` cell below was edited.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3256 | `Persuadour` title/term | Unchanged; the coined label's exact role and force are not established. | D-655: uncertain |
| 3257 | English `stealth` display label inside indexed marker | `{LINE_CENTER}{1}을 눌러 {*1stealth} 모드로 전환하세요.` -> `{LINE_CENTER}{1}을 눌러 {*1은신} 모드로 전환하세요.` | D-656: accepted |
| 3260 | Wencen / the Court / House of Ballads | Unchanged; the exact identity of the Court remains lore-dependent. | D-657: uncertain |
| 3262 | Predatory veil/belly image | Unchanged; the deliberately compressed comparison varies across sources and has no exact supported rewrite. | D-658: uncertain |
| 3266 | Three match partners and names | Unchanged; roles map to the correct people, but canonical spellings remain unestablished. | D-659: uncertain |
| 3267 | Ametair / Aergase and the road to the boots | Unchanged; both name forms and the odd destination relation need lore context. | D-660: uncertain |
| 3268 | Eight-line Faehunter poem / `chausses` | Unchanged; the poem's equipment term and compressed final image need integrated review. | D-661: uncertain |
| 3270 | Counsel / Cipher / Hyperian identities | Unchanged; the names and Counsel's role remain unresolved. | D-662: uncertain |
| 3271 | `Scavenger's Luck` | Unchanged; the gameplay category and canonical rendering of `Scavenger` are unknown. | D-663: uncertain |
| 3283 | `Family Arms` | Unchanged; weapon versus heraldic-emblem reading is unresolved. | D-664: uncertain |
| 3286 | Gwalchmai name | Unchanged; canonical Korean transliteration is not established. | D-665: uncertain |
| 3288 | Dren / `his house` / `it could never fall` | Unchanged; home, family, and named-House readings remain possible. | D-666: uncertain |
| 3290 | `divine and local providence` | Unchanged; English, Japanese, and Chinese differ on the exact source of aid. | D-667: uncertain |
| 3297 | `Traveler, by vocation` | Unchanged; profession versus Travelers-faction identity remains ambiguous. | D-668: uncertain |
| 3299 | Artan Caid's dispelling specialty / Rathir Chapter | Unchanged; broad `마법 해제` is supported by English and Chinese, while Japanese narrows it to curses; no correction is warranted. | D-669: not an issue |

Same-numbered `base` questions, including Boggart-Mask Buckler, Domus
Politica, potion/item terms, and Sagecraft Altar, were kept separate from
these `default` rows.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical ID order;
  IDs 3250-3299 are present once.
- The accepted edit changes only the Korean display label in `Texto`; the
  `{LINE_CENTER}`, `{1}`, and `{*1...}` marker structure and row keys are
  preserved. UTF-8 BOM and CRLF record endings are intact.
- The eight poem line breaks at ID 3268 and all uncertain cells are
  unchanged.

## Checkpoint

- Decisions recorded: D-655-D-669.
- Cumulative dispositions: 156 accepted, 104 `not an issue`, and 409
  uncertain.
- The `default` disposition cursor now covers IDs 0-3299. Resume with IDs
  3300-3349 and their preliminary report.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
