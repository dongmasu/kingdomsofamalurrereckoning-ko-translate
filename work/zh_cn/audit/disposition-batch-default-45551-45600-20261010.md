# Disposition Batch: `default` IDs 45551-45600

- Date: 2026-10-10. Compared active Korean with English, Japanese, Chinese,
  historical questions, and prior terminology decisions. This is a working
  disposition pass, not independent final linguistic approval.
- Decisions: one accepted, five `not an issue`, and three uncertain.
- CSV edit: ID 45583 only.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 45552 | Uncertain | The loading/concourse string may be technical or test text; player-facing intent is not established. |
| 45554 | Not an issue | The established Sagecrafting term and the skill's gem-use/crafting function are preserved. |
| 45560 | Not an issue | Context supports the intended discerning-eye meaning despite the English source typo. |
| 45564 | Not an issue | The class insult is pejorative as in English and the three causes of flight remain. |
| 45570 | Not an issue | The unsupported audio driver and risk of incorrect operation are retained. |
| 45583 | Accepted | Clarify that Tilera cannot succeed alone, separately from the claim that she is fated never to succeed. |
| 45592 | Uncertain | The rhetorical fragment remains; the intended sense of `salvage` cannot be resolved in isolation. |
| 45594 | Uncertain | The pause in Well of Souls research and other Templars' interest remain; formal names need alignment. |
| Remaining IDs 45551-45600, excluding listed findings | Not an issue | No further supported row-local correction was found; meaning, values, and structure remain intact. |

Decision IDs D-13941 through D-13949 authorize this targeted `Texto`
correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 45583 | `하지만 불쌍한 틸레라(Tilera)는 성공할 운명이 아니니 혼자서는 해낼 수 없어. 네가 도와주면 돼.` | `하지만 혼자서는 해낼 수 없어. 불쌍한 틸레라는 끝내 성공하지 못할 운명이니까. 바로 그 점에서 네가 도울 수 있어.` | Separate the inability to act alone from the prediction of never succeeding, matching the English/Japanese/Chinese scope. |

CSV SHA-256 before editing:
`943bbeefb98d9832b94c7fd620dca223acca2017c472bd0226fb858650159081`;
afterward:
`512e91881e407286b80bb884024880b73590d25522ff81fc95f17ee8dcaf6207`.
UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
preserved.

Direct register totals after this batch: 1,411 accepted, 4,556 `not an issue`,
and 7,976 uncertain (13,943 categorized dispositions). The next decision ID
is D-13950. All four locale files contain IDs 45551-45600 once and in matching
order. ID 45566 retains its 13-second duration, 20% armor reduction, 40 Mana
cost, and line break. Disposition is complete through ID 45600; resume at
ID 45601 (19,534 `default` IDs remain through ID 65134).
