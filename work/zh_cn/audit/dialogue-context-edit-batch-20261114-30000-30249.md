# Dialogue Context Translation Edit Batch: IDs `30000`-`30249`

- Date: 2026-11-14.
- Rechecked all 21 current candidate IDs against English, Japanese, Chinese,
  active Korean, and their linked reports.
- Applied one supported correction at `30225`; the other 20 supported findings
  already matched the active Korean.
- Preserved evidence-limited questions at `30094`, `30115`, and `30126`.

## Applied Correction

| ID | Correction |
| ---: | --- |
| `30225` | Changed the cautionary farewell from marked `밖에 나가서는 조심히 다니게.` to the natural plain-style `밖에 나가서는 조심히 다녀.` English asks the traveler to step carefully; Japanese gives a warm plain-style travel blessing. No speaker identity or dialogue order was inferred. |

## Related Terminology Correction

| ID | Correction |
| ---: | --- |
| `37751` | Changed `최대 생명력` to `최대 체력` in the moderate health-potion description. Its English `total health` and Japanese maximum-life wording identify the character health stat; adjacent strength levels `30266` and `49632` already use `체력`. |

## Retained Findings

The following 20 candidate rows already reflected the source-supported
meaning, register, terminology, or formatting and were left unchanged:

- `30013`, `30028`, `30034`, `30038`, `30045`, `30065`, `30091`,
  `30108`, `30112`, `30114`, `30116`, `30128`, `30135`, `30145`,
  `30149`, `30153`, `30160`, `30186`, `30190`, and `30210`.
- The English label `Argine, Queen of Staves` is already complete and
  consistently paired in the active Korean at its repeated title rows.
- `30149` already uses the alchemy-context term `조제법`; the linked SQ12
  wording proposal is therefore satisfied.
- The earlier name-pairing finding at `30061` is also resolved in the active
  row as `칼로르 경(Lord Callor)`; its ledger disposition remains unchanged.

## Holds And Verification

- `30094` remains unchanged as `먼지의 자손들(Children of Dust)`. The
  competing `먼지의 자식들` wording is not established as a canonical
  collective form; do not normalize related occurrences globally.
- `30115` retains the source abbreviation `Mstr.` pending resolution of the
  English source form. `30126` retains `인장` because the English/Japanese
  object descriptions conflict.
- Only the Korean `Texto` fields at `30225` and linked row `37751` changed.
  Only their ledger `source_fingerprint` values were refreshed; all other
  ledger fields and rows were preserved.
- Neither changed row has runtime tokens or embedded line breaks. CSV
  structure, encoding, row order, and existing line endings were retained. No
  commit was made.
