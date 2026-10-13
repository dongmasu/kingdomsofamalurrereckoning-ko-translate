# Disposition and Edit Batch: `default` IDs 3700-3749

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions for
  `default` IDs 3700-3749.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Sixteen findings were dispositioned: three accepted, four `not an issue`,
  and nine uncertain. Three accepted `Texto` corrections were applied to
  three rows.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3701 | Skoria mining family | Unchanged; family versus mining company/formal house is unresolved. | D-785: uncertain |
| 3705 | Culminite deposits | Unchanged; canonical Korean mineral name is not established. | D-786: uncertain |
| 3706 | Ariad / missing-or-dead Healer | Unchanged; institutional identity and the Healer's fate differ by reference. | D-787: uncertain |
| 3707 | Nonhuman `two-legs` description | Unchanged; preserve the unusual voice pending a setting-specific term decision. | D-788: uncertain |
| 3712 | Alpha Pteryx | Unchanged; Alpha's role and the creature's Korean name are unresolved. | D-789: uncertain |
| 3718 | Searstalk | Unchanged; ingredient/plant name interpretations differ. | D-790: uncertain |
| 3721 | `binding` service | Unchanged; bookbinding, magical binding, and sealing readings conflict. | D-791: uncertain |
| 3724 | `patron` | `후원자 같아 보이진 않는데` -> `손님 같아 보이진 않는데`; preserve the joining/customer contrast without implying sponsorship. | D-792: accepted |
| 3726 | `the Mission` / prison of ideas | Unchanged; institutional identity and the Mission name remain unsettled. | D-793: uncertain |
| 3731 | Ability marker | The preliminary report calls this `[Upgrade]`, but the actual active row is `{*1[Passive]}`. Localized the actual passive label: `{*1[Passive]}` -> `{*1[지속 효과]}`. The `[Upgrade]` marker occurs at another ID and was not moved or edited. | D-794: accepted |
| 3732 | Anokatos / predecessor | Unchanged; current syntax clearly says the predecessor died in the Hyperian tragedy and Anokatos is more secretive. | D-795: not an issue |
| 3734 | Sorrogweth Fungus | Unchanged; Korean retains the named fungus and its mushroom category. | D-796: not an issue |
| 3736 | `fence` | Unchanged; `장물아비` correctly names a receiver/reseller of stolen goods. | D-797: not an issue |
| 3742 | `rag-pickers` | `넝마 수집꾼들` -> `넝마주이들`; retain the scavenger insult in natural Korean. | D-798: accepted |
| 3744 | Corrupted-save dialog | Unchanged; reason and retry/cancel/continue-disabled options are all preserved in order. | D-799: not an issue |
| 3749 | `Great Cycle` | Unchanged; the project uses competing Korean forms and needs a global terminology decision. | D-800: uncertain |

Historical questions for IDs 3701, 3705-3708, 3712, 3716, 3718, 3721, 3724,
3726, 3734, 3736, 3742, and 3749 were reconciled. Same-numbered `base` item
questions, including IDs 3703, 3708, 3714, 3716, 3723, and 3729, remain
separate from these `default` rows.

## Structural Verification

- All four `default` locale CSVs parse to 65,135 rows with identical ordered
  IDs; IDs 3700-3749 are present once.
- No newline-count differences occur in the range. ID 3731 retains its
  indexed marker and all three line breaks; only the localized label changed.
- ID 3740 retains damage values 800 and 110 and its line break. ID 3731's
  localized label differs in text from each source locale, but marker ID,
  position, and ordering match.
- No key, row, variant, or sidecar changed. The Korean CSV retains its UTF-8
  BOM, semicolon delimiter, and CRLF record endings with no bare LF.
- Current Korean `default` SHA-256:
  `b3dba2f8964b12118dbefe47f30f473a4aa9a2b64660900031ad6a39905657d4`

## Checkpoint

- Decisions recorded: D-785-D-800.
- Cumulative dispositions: 184 accepted, 133 `not an issue`, and 483
  uncertain.
- Direct findings and carried historical questions in `default` now cover
  IDs 0-3749. Resume with IDs 3750-3799.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
