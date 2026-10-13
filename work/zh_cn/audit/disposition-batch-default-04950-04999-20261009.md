# Disposition and Edit Batch: `default` IDs 4950-4999

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 4950-4999.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Ten findings were dispositioned: two accepted, three `not an issue`, and
  five uncertain. Two accepted corrections were applied to their approved
  Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4954 | Nested requirement-token string | Keep tokens, order, and spacing unchanged. | D-1196: not an issue. |
| 4958 | `Warlord Experiorati` | Defer the name/title/source-artifact question. | D-1197: uncertain. |
| 4961 | `Irion, King of Cups` title styling | Defer its lore/card role and Korean ordering. | D-1198: uncertain. |
| 4963 | `the usual racket` | Render the comparison as the usual scheme/operation, not people. | D-1199: accepted. |
| 4980 | `Bane of Three Winds Crutch` | Defer the proper-name boundary. | D-1200: uncertain. |
| 4982 | Isolated timed-effect placeholders | Preserve the values pending mechanic context. | D-1201: uncertain. |
| 4983 | Fahrlangi/Harst/Besin theft-account sequence | Keep the supported agency and chronology. | D-1202: not an issue. |
| 4985 | Ambiguous `wormy` description | Defer the character-specific nuance. | D-1203: uncertain. |
| 4991 | Unlocalized `Ljosalfar-` marker label | Localize only the visible label. | D-1204: accepted. |
| 4995 | `deed` document | Keep the broad, supported Korean `증서`. | D-1205: not an issue. |

Historical questions for other source keys remain separate. All uncertain
rows remain unchanged.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4963 | `...흔한 사기꾼들과는 다를 거라고.` | `...늘 하던 수작과는 다를 거라고.` | D-1199 |
| 4991 | `{*2Ljosalfar-}` | `{*2료스알브-}` | D-1204 |

The 4991 change localizes the visible marker payload using the established
`Ljosalfar = 료스알브` form. Marker ID `*2`, trailing hyphen, `{LINE_LEFT}`,
and `{LINE_SPACE}` are retained.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 4950-4999 once in
  identical order; each full CSV parses as 65,135 rows.
- Runtime marker identities/order and explicit line-break counts match for
  all rows in this range.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  physical record endings, and zero bare LF bytes.
- Only the two accepted Korean `Texto` cells changed; keys, order, other
  fields, and uncertain Korean rows remain unchanged.
- Active Korean `default` CSV SHA-256:
  `ad383b91661b2e1967d5323aa0d9cf32ff1879d5a9d513dd50f39fb45aac53ed`
- Cumulative dispositions: 252 accepted, 281 `not an issue`, and 672
  uncertain. Resume at `default` ID 5000.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
