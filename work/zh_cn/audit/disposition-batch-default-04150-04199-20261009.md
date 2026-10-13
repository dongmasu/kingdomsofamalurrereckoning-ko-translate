# Disposition and Edit Batch: `default` IDs 4150-4199

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and source-keyed historical questions
  for `default` IDs 4150-4199.
- Compared immutable English, Japanese, and Chinese source CSV rows with the
  active Korean CSV. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.
- This is a working disposition, not independent final linguistic approval.
- Sixteen findings were dispositioned: one accepted, nine `not an issue`,
  and six uncertain. One accepted correction was applied to one `Texto`
  cell.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4152 | `Hierophant` title | Defer the canonical Korean office term. | D-957: uncertain. |
| 4154 | Ironic plotting/treachery qualification | Keep the natural dry qualification. | D-958: not an issue. |
| 4157 | Valor grounds and vendors | Defer the exact place relation and canonical area name. | D-959: uncertain. |
| 4159 | Corthian Empire armor/remnant | Keep the supported empire/armor relation. | D-960: not an issue. |
| 4161 | `mystery and intrigue` | Replace the unsupported conspiracy sense of `음모` with compelling interest. | D-961: accepted. |
| 4163 | Chernobog's bloody-eye trophy | Keep the English/Japanese-supported `피 묻은 눈`. | D-962: not an issue. |
| 4171 | Weapon tutorial control markers/layout | Keep the English/Japanese marker sequence, headings, and four factors. | D-963: not an issue. |
| 4172 | Adessan political tract | Defer the source's security/securities wording and full satirical reading. | D-964: uncertain. |
| 4174 | Dark Hunter honorific | Keep the supported formal presentation. | D-965: not an issue. |
| 4177 | `thread in time` metaphor | Keep `시간` as the English/Japanese-supported concept; do not normalize to fate from another row. | D-966: not an issue. |
| 4181 | Return to Caer Elatha's `top` | Keep the primary English location point and Maxen knowledge relation. | D-967: not an issue. |
| 4187 | `The Midden` location | Defer proper-name versus literal-place interpretation. | D-968: uncertain. |
| 4190 | Debates decided by combat | Keep the supported procedure and sequence. | D-969: not an issue. |
| 4193 | `Telling` as generic `전승` | Defer the formal Fae tradition terminology. | D-970: uncertain. |
| 4196 | Unspecified `her` | Preserve the English ambiguity rather than adding Tirnoch. | D-971: not an issue. |
| 4199 | Scholia Arcana institution | Defer transliteration versus institution-type wording. | D-972: uncertain. |

Historical questions for same-numbered `base` items remain separate and were
not merged into these `default` dispositions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4161 | `신비와 음모가 가득한 곳이지!` | `신비롭고 흥미진진한 곳이지!` | D-961 |

## Structural Verification

- English, Japanese, Chinese, and Korean source CSVs each contain IDs
  4150-4199 once and in identical order.
- ID 4171's layout-marker identities/order and positions match
  English/Japanese, with localized `*2`/`*3` heading text. The Chinese source
  uses `{LINE_LEFT}` for the second heading; the Korean preserves the
  English/Japanese-derived template.
- ID 4172 retains four embedded line breaks in all four locales.
- The accepted edit changes only the approved Korean `Texto` cell and does
  not alter keys, row order, line breaks, or runtime markers.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  record endings, and no bare LF bytes.
- Active Korean `default` CSV SHA-256 at this checkpoint:
  `5e1dee07ae6a588dbad1fef618821871a533f0a2a418e7b446aa49a6784ecc3b`
- Cumulative dispositions: 213 accepted, 195 `not an issue`, and 564
  uncertain. Resume at `default` ID 4200.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology and integrated voice consistency remain
open.
