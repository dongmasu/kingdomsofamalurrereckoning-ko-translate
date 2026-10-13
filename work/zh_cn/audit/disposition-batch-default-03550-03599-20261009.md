# Disposition and Edit Batch: `default` IDs 3550-3599

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions for
  `default` IDs 3550-3599.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Fourteen findings were dispositioned: three accepted, three `not an issue`,
  and eight uncertain. Three accepted `Texto` corrections were applied to
  three rows.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3553 | `Don't loosen my tongue on the talk of gods` | `신 얘기를 꺼내 내 입을 풀게 하지 마... 기도는 그만두게` -> `신들 얘기를 꺼내서 내 입을 열게 하지 마... 기도는 됐어`; retain the threat and casual dismissive tone. | D-742: accepted |
| 3558 | `And why should you be?` | Unchanged; the preceding referent is missing and source readings differ. | D-743: uncertain |
| 3570 | `Maid of Windemere` | Unchanged; formal title versus descriptive role and the canonical Korean form remain unsettled. | D-744: uncertain |
| 3574 | Souls resting `above` | Unchanged; Korean follows all three references and preserves the contrast about what the souls know. | D-745: not an issue |
| 3575 | `the heart of the Faelands` | `패란즈(Faelands)의 심장부지` -> `패란즈(Faelands)의 심장부야`. | D-746: accepted |
| 3579 | `Gallows End` | Unchanged; competing corpus forms require a global name decision. | D-747: uncertain |
| 3583 | `family mines` / `a new order` | Unchanged; the ownership/group scope and political or commercial sense are unresolved. | D-748: uncertain |
| 3587 | Grim name joke / source typo `circumvents` | Unchanged; the source likely means `circumstances`, but whether the Korean carries the name's dark wordplay is unresolved. | D-749: uncertain |
| 3591 | `Foorooroo Region of Testing` | Unchanged; player-facing versus internal/test text is unknown. | D-750: uncertain |
| 3592 | Motus report / Veil and threadbare imagery | Text retained. The Korean preserves the imagery, but line-break counts differ by locale; defer layout to structural review. | D-751: uncertain |
| 3594 | `Cape Solace` | Unchanged; `솔라스 곶` is a plausible place-name form and preserves the geographic type. The same-numbered `base` question is separate. | D-752: not an issue |
| 3598 | Jora's Barghest companion | Unchanged; the objective preserves the companion relation. The same-numbered item-rank question is separate. | D-753: not an issue |
| 3599 | `zealous fool` / `the Beckoned` | `열광적인` -> `광신적인`; `초대받은 자` -> `부름받은 자`, aligning the established player-title form. | D-754: accepted |
| 3599 | `Cipher` | Unchanged; named entity versus literal cipher/secret order remains unresolved. | D-755: uncertain |

Historical questions for IDs 3558, 3570, 3574, 3575, 3583, 3587, 3591, 3592,
3594, 3598, and 3599 were reconciled. Same-numbered questions for other
resources, including the `base`/`affix` item findings at IDs 3551, 3557,
3566, 3576, 3581, 3589, 3591, and 3598, were not merged with `default`.

## Structural Verification

- All four `default` locale CSVs parse to 65,135 rows with identical ordered
  IDs; IDs 3550-3599 are present once.
- No key, row, variant, or sidecar changed. The three edited rows retain
  their original line-break counts and runtime-marker content.
- ID 3592 has 13/9/10/13 line breaks in English/Japanese/Chinese/Korean.
  Korean follows English here rather than the Japanese-derived layout. This
  pre-existing discrepancy remains unchanged and requires dedicated review.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, and CRLF record
  endings with no bare LF. Other uncertain cells remain unchanged.
- Current Korean `default` SHA-256:
  `135cb83bcc21874c4acf6701a744094d0d7220d05ff1539e1a44534b72da6935`

## Checkpoint

- Decisions recorded: D-742-D-755.
- Cumulative dispositions: 174 accepted, 120 `not an issue`, and 461
  uncertain.
- Direct findings and carried historical questions in `default` now cover
  IDs 0-3599. Resume with IDs 3600-3649.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
