# Disposition and Edit Batch: `default` IDs 2400-2449

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2400-2449.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- These decisions are a working editorial disposition, not final independent
  linguistic approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2400 | `Hyperian` | Unchanged; entity type and canonical name remain unresolved. | D-396: uncertain |
| 2403 | Repeated Korean topic marker in the Crows line | `너희 크로우즈(The Crows)는 실력은` -> `너희 크로우즈(The Crows)는 실력이`; remove the awkward duplicate particle. | D-397: accepted |
| 2410 | `Gwach Morhen` | Unchanged; canonical Korean pronunciation is unresolved. | D-398: uncertain |
| 2411 | High King Titarion | Unchanged; title and name convention need corpus-wide reconciliation. | D-399: uncertain |
| 2412 | Inside / beneath the Rathir Customs House | Unchanged; the self-correction and location relation are accurately preserved. | D-400: not an issue |
| 2419 | Dvergan map / Alfar writing / Akara-Tor | Unchanged; script distinctions and fragment count are preserved, while canonical names remain open. | D-401: uncertain |
| 2423 | Warsworn | Unchanged; canonical faction/title form is unresolved. | D-402: uncertain |
| 2424 | Amalur's `careful constructs` | Unchanged; the source's abstract prophecy image is retained without unsupported specificity. | D-403: uncertain |
| 2425 | Master Hugues / Mitharan lith | Unchanged; honorific and lore terminology remain provisional. | D-404: uncertain |
| 2426 | `Child of the Dust` | Unchanged; formal epithet versus poetic address is unresolved. | D-405: uncertain |
| 2438 | Hrenloc | Unchanged; canonical Korean name form is unresolved. | D-406: uncertain |
| 2439 | `Trigger Bridge Rats` | Unchanged; player-facing versus internal/debug status is unresolved. | D-407: uncertain |
| 2445 | Brother Giran | `동생 기란` -> `형제인 기란`; remove unsupported younger-sibling age. | D-408: accepted |
| 2445 | Proper names and quest-location terms | Unchanged; retain traceable forms pending global name/term reconciliation. | D-409: uncertain |
| 2448 | `Better to die trying` | `죽을 때까지 해보는 편이 낫지` -> `죽더라도 해보는 게 낫지`; restore the idiomatic meaning naturally. | D-410: accepted |

The three accepted `Texto` edits are authorized by D-397, D-408, and D-410.
Same-numbered findings from other resource types are not applied to these
`default` rows.

## Structural Verification

- All four locale CSVs parse to 65,135 rows with identical complete
  `default` ID order.
- The 50 IDs in this batch are present in all four locales. ID 2437 retains
  `{LINE_CENTER}`, the secondary-weapon marker, and `{1}`. Korean follows the
  English marker order; Japanese and Chinese place `{1}` before the
  secondary-weapon marker to suit their sentence syntax. This source-locale
  ordering difference is preserved rather than normalized.
- The 10% chance and 100 bonus damage at ID 2446, and 75% damage reduction
  at ID 2447, are unchanged.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No row, key, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-396-D-410.
- Cumulative dispositions: 120 accepted, forty-four `not an issue`, and
  246 uncertain.
- Next range: `default` IDs 2450-2499, using
  [`default-ids-02450-02499-preliminary.md`](default-ids-02450-02499-preliminary.md).
