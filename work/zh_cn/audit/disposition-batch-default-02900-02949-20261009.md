# Disposition and Edit Batch: `default` IDs 2900-2949

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2900-2949.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- This is a working editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2902 | High Roll dice rule | Unchanged; Japanese explicitly confirms the sum and Chinese agrees. | D-554: not an issue |
| 2905 | Zungar land / “turf” | Unchanged; territory reading is plausible, but the name's referent is unresolved. | D-555: uncertain |
| 2913 | `chandlery` | Unchanged; `양초 가게 일` reasonably renders the candle-related trade. | D-556: not an issue |
| 2922 | `the ancient one` / Nyralim | Unchanged; Korean retains the broad English/Chinese reading without asserting Japanese's tree detail. | D-557: not an issue |
| 2925 | `Sliding Blade` | Unchanged; trap versus move/item category is unresolved. | D-558: uncertain |
| 2930 | Templar Jorielle as a patron | Unchanged; patronage duration and terminology/name consistency remain open. | D-559: uncertain |
| 2936 | `Go catch a disease, would you?` | `가서 병이나 옮아 와!` -> `가서 병이나 걸리든가!`; keep the dismissive curse, remove the awkward transmission image. | D-560: accepted |
| 2938 | Belen's will / the Testament | Unchanged; named faction/text versus generic covenant is unresolved. | D-561: uncertain |
| 2947 | Talibor fragment / sarcastic reaction | Unchanged; Korean follows the ambiguous English without adopting the Japanese source divergence. | D-562: not an issue |

The single accepted decision authorizes only the listed `Texto` edit.
The other eight findings are disposition-only.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical complete
  ID order; IDs 2900-2949 are present once.
- IDs 2934 and 2940 retain `+27%` and `+5%`. No runtime marker or line break
  was changed in the edited row.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No key, row, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-554-D-562.
- Cumulative dispositions: 138 accepted, seventy-eight `not an issue`, and
  346 uncertain.
- Next range: `default` IDs 2950-2999, using
  [`default-ids-02950-02999-preliminary.md`](default-ids-02950-02999-preliminary.md).
