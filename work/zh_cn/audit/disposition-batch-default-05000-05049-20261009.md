# Disposition and Edit Batch: `default` IDs 5000-5049

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 5000-5049.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Fifteen findings were dispositioned: two accepted, six `not an issue`, and
  seven uncertain. Two accepted corrections were applied to their approved
  Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 5002 | `DanagerManager` label | Defer whether this is an internal identifier or malformed source text. | D-1206: uncertain. |
| 5007 | Fear of notices versus the feared event | Keep the supported contrast without inventing referents. | D-1207: not an issue. |
| 5010 | Wish/transformation speaker boundaries | Defer the ambiguous attribution and quote punctuation. | D-1208: uncertain. |
| 5011 | `Cradle of Summer` / `Amman the Clever` | Defer official place/title forms and unseen/unreported nuance. | D-1209: uncertain. |
| 5014 | `Poultice` item | Use `습포제` rather than ointment `연고`. | D-1210: accepted. |
| 5015 | Endearment `dove` | Defer the best Korean vocative without scene context. | D-1211: uncertain. |
| 5017 | Assistant's revival as a `simple Laz` | Defer the species/description nuance. | D-1212: uncertain. |
| 5020 | Gravehal inscription and Dvergan script | Keep the source-supported language/script distinction. | D-1213: not an issue. |
| 5024 | `wade into Acatha` | Restore the wading action. | D-1214: accepted. |
| 5027 | Court of Winter alliance / seasonal cycle | Keep the alliance and seasonal metaphor. | D-1215: not an issue. |
| 5032 | `Reverie` / `dream-self` | Defer the setting-specific metaphysical terms. | D-1216: uncertain. |
| 5035 | Chimera departure and unsaved-progress warning | Keep the permanent-departure warning and line break. | D-1217: not an issue. |
| 5044 | Mark of Flame target cap and costs | Keep the verified values and layout. | D-1218: not an issue. |
| 5046 | `Sworn to War` status/title | Defer the formal group/title rendering. | D-1219: uncertain. |
| 5047 | `Hit React Resistance [DO NOT USE]` | Preserve the explicit unusable warning. | D-1220: not an issue. |

Historical questions for other source keys remain separate. All uncertain
rows remain unchanged.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 5014 | `연고를 알라드(Alard)에게 전달하기` | `습포제를 알라드(Alard)에게 전달하기` | D-1210 |
| 5024 | `아카사(Acatha)로 걸어 들어가야 해.` | `아카사(Acatha)로 들어가 물을 헤쳐야 해.` | D-1214 |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 5000-5049 once in
  identical order; each full CSV parses as 65,135 rows.
- Runtime marker identities/order and explicit line-break counts match for
  all rows in this range.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  physical record endings, and zero bare LF bytes.
- Only the two accepted Korean `Texto` cells changed; keys, order, other
  fields, and uncertain Korean rows remain unchanged.
- Active Korean `default` CSV SHA-256:
  `52fa2e3e20bcb73e1b4864a28bb0033b25037e1312edd846c58d977d72542195`
- Cumulative dispositions: 254 accepted, 287 `not an issue`, and 679
  uncertain. Resume at `default` ID 5050.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
