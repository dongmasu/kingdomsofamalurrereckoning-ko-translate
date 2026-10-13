# Disposition and Edit Batch: `default` IDs 4900-4949

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 4900-4949.
- Compared immutable English, Japanese, and Chinese source rows with active
  Korean. English governs meaning; Japanese informs voice/register; Chinese
  is a supporting cross-check.
- Eight findings were dispositioned: three accepted, three `not an issue`,
  and two uncertain. Three accepted corrections were applied to their
  approved Korean `Texto` cells.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 4904 | Idiomatic `Keep the peace` warning | Use the natural warning not to cause trouble. | D-1188: accepted. |
| 4907 | Mitharan item adjective / `Damaging Grip` | Keep the established adjective and item construction. | D-1189: not an issue. |
| 4914 | `Sacrificial Altar of Wisdom` attachment | Keep the plausible altar rendering. | D-1190: not an issue. |
| 4918 | Source typo `one that's desires` | Preserve the intended unknown-desires meaning. | D-1191: not an issue. |
| 4925 | Anira holding the Master Makers | Remove the misleading concessive link. | D-1192: accepted. |
| 4930 | `Pledgeshield` title/rank | Defer the unresolved formal term. | D-1193: uncertain. |
| 4934 | `Siege-Breaker` and `Delvers` names | Defer the unresolved title/group forms. | D-1194: uncertain. |
| 4941 | Positive “his enemy falls” clause | Correct the ambiguous/negative Korean ending. | D-1195: accepted. |

Historical questions for other source keys remain separate. Uncertain rows
remain unchanged.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 4904 | `평화를 지켜.` | `말썽 피우지 마.` | D-1188 |
| 4925 | `...억류하고 있는데도 그들을 풀어 주는 일을 돕지 못하게 되었다.` | `...억류하고 있어, 그들을 풀어 주는 일도 돕지 못하게 되었다.` | D-1192 |
| 4941 | `...여름의 챔피언은 승리하고 적은 쓰러지지.` | `...여름의 챔피언은 승리하고 적은 쓰러져.` | D-1195 |

## Structural Verification

- English, Japanese, Chinese, and Korean each contain IDs 4900-4949 once in
  identical order; each full CSV parses as 65,135 rows.
- Runtime marker identities/order and explicit line-break counts match for
  all rows in this range.
- The active Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF
  physical record endings, and zero bare LF bytes.
- Only the three accepted Korean `Texto` cells changed; keys, order, other
  fields, and uncertain Korean rows remain unchanged.
- Active Korean `default` CSV SHA-256:
  `218f28fd6262e9433df856d43ee9eb1e698ccd8504af68cd58cf36627248a8b1`
- Cumulative dispositions: 250 accepted, 278 `not an issue`, and 667
  uncertain. Resume at `default` ID 4950.

Findings are working dispositions, not independent final linguistic
approval. Corpus-wide terminology, combined-name consistency, and integrated
voice review remain open.
