# Disposition and Edit Batch: `default` IDs 2500-2549

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2500-2549.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- These decisions are a working editorial disposition, not final independent
  linguistic approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2500 | Murghan | Unchanged; creature/group identity and canonical Korean form remain open. | D-427: uncertain |
| 2501 | St. Eadric's | Unchanged; the institution type is not established by English and the references differ. | D-428: uncertain |
| 2503 | Aisling Twelve Fingers | Unchanged; keep the translated epithet and source name while pronunciation/display convention remain open. | D-429: uncertain |
| 2511 | Gwalchmai | Unchanged; Korean transliteration remains provisional. | D-430: uncertain |
| 2519 | `dustling` | Unchanged; exact pragmatic force and species/address status remain unresolved. | D-431: uncertain |
| 2520 | Possible sarcasm in the “smarter people” line | Unchanged; praise versus irony needs scene context. | D-432: uncertain |
| 2521 | Apotyre | Unchanged; canonical Korean name form remains unresolved. | D-433: uncertain |
| 2524 | Testament / Marches | Unchanged; the wording is supported, but faction and region naming remain open. | D-434: uncertain |
| 2527 | Cycle, the First: The Dverga | Unchanged; whether `Cycle` is a lore era or heading is unresolved. | D-435: uncertain |
| 2542 | Duplicated `held` and siege/dam metaphor | Unchanged; Korean conveys the supported image without repeating the English source typo. | D-436: not an issue |
| 2543 | Interrupted “threads are—” thought | Unchanged; the incomplete thought is preserved without invention. | D-437: not an issue |
| 2544 | `stretch my neck` | `날 교수대에 세우려 했어` -> `내 목을 매달려고 했어`; make the hanging threat explicit. | D-438: accepted |
| 2548 | Pledgeshield | Unchanged; formal rank and canonical Korean form remain unresolved. | D-439: uncertain |

The single accepted `Texto` edit is authorized by D-438. Same-numbered
historical findings from other resource types are not applied to these
`default` rows.

## Structural Verification

- All four locale CSVs parse to 65,135 rows with identical complete
  `default` ID order.
- All 50 IDs in this batch are present in all four locales; line-break counts
  match. `{LINE_SPACE}` at ID 2510 is preserved.
- No numeric gameplay values occur in the range.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No row, key, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-427-D-439.
- Cumulative dispositions: 123 accepted, forty-eight `not an issue`, and
  268 uncertain.
- Next range: `default` IDs 2550-2599, using
  [`default-ids-02550-02599-preliminary.md`](default-ids-02550-02599-preliminary.md).
