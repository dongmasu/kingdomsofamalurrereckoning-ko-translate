# Disposition and Edit Batch: `default` IDs 4850-4899

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 4850-4899.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Eleven findings were dispositioned: one accepted, five `not an issue`, and
  five uncertain. One accepted correction was applied to its approved Korean
  `Texto` cell.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4850 | Templars as the city's leadership | Keep the intelligible apposition and divided allegiances. | D-1177: not an issue. |
| 4854 | `hardened criminals... I think` | Keep the speaker's uncertainty and refugee comparison. | D-1178: not an issue. |
| 4862 | `Adept Lerkara Fel` rank | Defer the setting-specific Korean rank term. | D-1179: uncertain. |
| 4868 | `the most powerful body` / `a second spring` | Defer the lore referent and prophetic/literal reading. | D-1180: uncertain. |
| 4872 | Religious euphemism of liberation and delivery | Keep the source-supported euphemism and unsettling tone. | D-1181: not an issue. |
| 4876 | Wild Evenroot variant | Keep the conditional reward and plant reference. | D-1182: not an issue. |
| 4885 | `Unarmed Fighter Parent` | Defer the internal-label and parent-category interpretation. | D-1183: uncertain. |
| 4886 | Sagecrafter's workstation | Keep the established crafting-workstation rendering. | D-1184: not an issue. |
| 4887 | Unlocalized inventory action labels | Localize visible marker payloads only. | D-1185: accepted. |
| 4890 | `its vessel` / Kora Petal | Defer the unspecified vessel and item-name convention. | D-1186: uncertain. |
| 4892 | Belmaid poem imagery | Preserve the current poem pending a supported full revision. | D-1187: uncertain. |

All uncertain rows remain unchanged. The source-keyed historical questions
were reconciled to the current rows; unrelated same-number entries were not
merged into these decisions.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4887 | `{*1inventory}`, `{*1selling}`, `{*1destroying}` | `{*1인벤토리}`, `{*1판매}`, `{*1파괴}` | D-1185 |

Japanese and Chinese localize the three visible labels inside matching
markers. The Korean terms agree with existing in-corpus UI labels. Marker
identities, order, surrounding text, and `{LINE_SPACE}` are unchanged.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 4850-4899 once in
  identical order; each full CSV parses as 65,135 rows.
- Runtime marker identities/order and explicit line-break counts match for
  all rows in this range.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  physical record endings, and zero bare LF bytes.
- Only the accepted Korean `Texto` cell at ID 4887 changed; keys, order,
  other fields, and uncertain Korean rows remain unchanged.
- Active Korean `default` CSV SHA-256:
  `63425211c39c25951e580ade78ac14f7957795e80c176bec3a56b8e11e37fb81`
- Cumulative dispositions: 247 accepted, 275 `not an issue`, and 665
  uncertain. Resume at `default` ID 4900.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
