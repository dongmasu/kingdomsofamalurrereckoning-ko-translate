# Disposition and Edit Batch: `default` IDs 3400-3449

- Decision date: 2026-10-09.
- Scope: candidates in the preliminary report and source-keyed historical
  questions for `default` IDs 3400-3449.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. This is a working disposition, not independent
  final linguistic approval.
- Sixteen candidates were dispositioned: five accepted, three `not an issue`,
  and eight uncertain. Only the five accepted `Texto` cells below were edited.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 3402 | Indexed `Special Deliveries` chest label | `{*1Special Deliveries}` -> `{*1특별 배송}` | D-702: accepted |
| 3406 | Named enemy/title `The Widow` | `과부다. 저 여자가 그들을 이끌고 있어.` -> `위도우(The Widow)야. 저 여자가 그들을 이끌고 있어.` | D-703: accepted |
| 3411 | `God Storm? The Musings of Dulstan` | Unchanged; title boundary and whether `God Storm` is an event/name or a literal question remain unresolved. | D-704: uncertain |
| 3414 | Positive-effects category / buffs | Unchanged; UI category terminology remains unsettled. | D-705: uncertain |
| 3419 | `Hostile Parent` | Unchanged; internal test label versus player-facing label is unclear. | D-706: uncertain |
| 3420 | Chaos doctrine / malformed source grammar | Unchanged; Korean preserves the intended death warning and doctrinal meaning while normalizing the English source typo. | D-707: not an issue |
| 3425 | Dverga/Dvergan and Erathi terms | Unchanged; people-name/adjective distinction and canonical forms remain open. | D-708: uncertain |
| 3426 | Direct address in `Few are your equal` | `각 분야에서 그와 맞먹는 이는 드물지만, 모든 분야를 통틀어 견줄 자는 없습니다.` -> `각 분야에서 당신과 맞먹는 이는 드물지만, 모든 분야를 통틀어 견줄 자는 없습니다.` | D-709: accepted |
| 3427 | `The Travelers` faction | Unchanged; canonical Korean faction form remains unresolved. | D-710: uncertain |
| 3430 | House of Ballads / Belmaid | Unchanged; both forms align with repeated Korean corpus usage. | D-711: not an issue |
| 3436 | Moving De Groot for exam and burial | `검사와 매장을 위해 드 그루트(De Groot)를 안으로 옮겼어.` -> `부검과 매장을 위해 드 그루트(De Groot)를 안으로 옮겼어.` | D-712: accepted |
| 3438 | `Force ({1}% Chance)` lock action | Unchanged; `강제로 열기` conveys the action, and the value is preserved. | D-713: not an issue |
| 3439 | `Ice Blink 3` skill label | Unchanged; canonical skill name remains unresolved. | D-714: uncertain |
| 3446 | Nested quotation/backslash rendering | Unchanged; runtime rendering of parsed `\"` sequences is unverified. | D-715: uncertain |
| 3447 | `Fae of Sorrows` / `finesse` | Unchanged; creature/faction identity and possible ability wordplay remain contextual questions. | D-716: uncertain |
| 3448 | Present inability of the scouts | `정찰병들은 그들을 찾아내지 못했지만, 멜 센시르의 영웅이라면 찾을 수 있을지도 몰라.` -> `정찰병들은 그들을 찾지 못하고 있지만, 멜 센시르의 영웅이라면 찾아낼지도 몰라.` | D-717: accepted |

## Structural Verification

- All four locale `default` CSVs parse to 65,135 rows with identical ordered
  IDs; the IDs 3400-3449 occur once.
- Across these 50 rows, parsed newline counts and runtime-marker identities
  and order match the reference locales. ID 3420 retains its numbered list
  and three paragraphs; ID 3425 retains its three paragraphs.
- The ID 3402 marker order remains `{*1...}`, `{LINE_SPACE}`, `{*1...}`,
  `{*1...}`. The Korean CSV retains its UTF-8 BOM and CRLF record endings
  with no bare LF. All five approved cell values were checked after editing.

## Checkpoint

- Decisions recorded: D-702-D-717.
- Cumulative dispositions: 167 accepted, 113 `not an issue`, and 437
  uncertain.
- The `default` disposition cursor now covers IDs 0-3449. Resume with IDs
  3450-3499 and reconcile the existing preliminary report.
- This remains an in-progress disposition/edit pass; independent review and
  corpus-wide terminology reconciliation remain open.
