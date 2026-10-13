# Disposition and Edit Batch: `default` IDs 2850-2899

- Decision date: 2026-10-09
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 2850-2899.
- English governs meaning; Japanese supports voice/register and alternate
  readings; Chinese is a secondary cross-check.
- This is a working editorial disposition, not final independent linguistic
  approval. Uncertain items remain unchanged.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 2852 | Personified “the sorrows” | Unchanged; entity versus abstract emotion is unresolved across references. | D-538: uncertain |
| 2853 | `Stubble Intensity` | `수염자국 농도` -> `수염자국 짙기`; use a natural customization label. | D-539: accepted |
| 2855 | `a gift of the earth` / `it` | Unchanged; the antecedent is missing and locales identify different referents. | D-540: uncertain |
| 2856 | `Great Cycle` | Unchanged; defer to corpus-wide lore terminology. | D-541: uncertain |
| 2858 | Gravehal / Dverga / Angsar Solsvard heading | Unchanged; title punctuation and canonical name forms remain open. | D-542: uncertain |
| 2864 | Hierophant / speech levels | Unchanged; references differ on title and register. | D-543: uncertain |
| 2865 | `Salvage the ampulla` | `암풀라 회수` -> `성유병 회수`; Japanese and Chinese identify a sacred-oil vessel. | D-544: accepted |
| 2869 | “gem of the highest water” | Unchanged; Korean correctly conveys finest quality. | D-545: not an issue |
| 2871 | Smecky Music Studios / Prague credit | Unchanged; studio, city, centered marker, and recording relation are preserved. | D-546: not an issue |
| 2875 | Experience sacrifice / “original giving” | Rewrite the second sentence as `이게 최초의 봉헌이었고, 지금도 그녀가 가장 아끼는 제물이야.` | D-547: accepted |
| 2885 | Four Notices of Duty and replacement recipient | Unchanged; counts and reassignment sequence match the sources. | D-548: not an issue |
| 2889 | `$TR_Shell.cutter_wager$ Gold` | Unchanged; variable identity/order and localized currency label are preserved. | D-549: not an issue |
| 2892 | Arba's Dokkalfar staff | Unchanged; meaning and established `도크알브` form are preserved. | D-550: not an issue |
| 2893 | Next sacrifice at the Altar of Betrayal | Unchanged; English and Japanese support the Korean sequence. | D-551: not an issue |
| 2894 | `Rose-of-Shadows` | Unchanged; canonical Korean display form remains unresolved. | D-552: uncertain |
| 2897 | `my liege` blessing | `내 주군께 ... 함께하길` -> `주군께 ... 함께하기를`; address the listener directly. | D-553: accepted |

The four accepted edits are authorized only for the listed `Texto` cells.
The remaining 12 findings are disposition-only.

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical complete
  ID order; IDs 2850-2899 are present once.
- The accepted rows preserve `{LINE_CENTER}` at ID 2871 and
  `$TR_Shell.cutter_wager$` at ID 2889. No numeric value or line break was
  changed.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings. No key, row, variant, or sidecar was changed.

## Checkpoint

- Decisions recorded: D-538-D-553.
- Cumulative dispositions: 137 accepted, seventy-four `not an issue`, and
  342 uncertain.
- Next range: `default` IDs 2900-2949, using
  [`default-ids-02900-02949-preliminary.md`](default-ids-02900-02949-preliminary.md).
