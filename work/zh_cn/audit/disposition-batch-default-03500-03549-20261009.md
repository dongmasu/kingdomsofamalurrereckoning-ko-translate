# Disposition and Edit Batch: `default` IDs 3500-3549

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 3500-3549.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Eleven findings were dispositioned: two accepted, two `not an issue`, and
  seven uncertain. Only the two accepted `Texto` cells below were edited.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3502 | Ability-category label `[Active]` | `{*1[Active]}` -> `{*1[사용 효과]}`; ID 8886 uses the same Korean UI label for the same indexed marker. | D-731: accepted |
| 3507 | City elevation / Warren | Unchanged; English and Japanese support the city being raised, but Chinese and the place-name reading differ. | D-732: uncertain |
| 3515 | Witch Knight Anira | Unchanged; canonical transliteration and rank terminology remain open. | D-733: uncertain |
| 3520 | Named lockpick `Master's Pick` | Added the established item name: `달인의 자물쇠따개` -> `달인의 자물쇠따개(Master's Pick)`. Matching Korean references already use this form. | D-734: accepted |
| 3522 | `Oracles` | Unchanged; formal order versus generic seers is unresolved. | D-735: uncertain |
| 3524 | `The Crows` | Unchanged; `크로우즈(The Crows)` matches the established named arena-team form. | D-736: not an issue |
| 3527 | `Five-and-nine by night` | Unchanged; code meaning is unclear and source-language interpretations differ. | D-737: uncertain |
| 3535 | `Vengeance` | Unchanged; the named destination's identity is not specified. | D-738: uncertain |
| 3538 | Orbocant / Elund | Unchanged; the council/spokesperson relation is conveyed and both spellings match prior Korean usage; exact title identities remain open. | D-739: not an issue |
| 3540 | Khamazandu's Crown / ancient prison | Unchanged; source contradiction and pronoun referent remain unresolved. | D-740: uncertain |
| 3546 | Fae “prayer” fragment | Unchanged; subject and function are omitted in all references. | D-741: uncertain |

Historical questions for `default` IDs 3524, 3527, and 3538 were reconciled.
The historical `High Stone` question at ID 3521 belongs to `base`, not
`default`, and was not merged with this batch. Other same-numbered questions
were kept resource-specific.

## Structural Verification

- All four `default` locale CSVs parse to 65,135 rows with identical ordered
  IDs; IDs 3500-3549 are present once.
- Parsed newline counts match across all four locales throughout this range.
- ID 3502 retains its indexed marker and line break; only the label was
  localized. ID 3520's item-name parenthetical does not alter structure.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings with no bare LF. Uncertain cells remain unchanged.
- Current Korean `default` SHA-256:
  `548b3567077db3e76a18ec559efcd74758ca24de69d8f09e535457ea8427c3b2`

## Checkpoint

- Decisions recorded: D-731-D-741.
- Cumulative dispositions: 171 accepted, 117 `not an issue`, and 453
  uncertain.
- Direct findings and carried historical questions in `default` now cover
  IDs 0-3549. Resume with IDs 3550-3599.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
