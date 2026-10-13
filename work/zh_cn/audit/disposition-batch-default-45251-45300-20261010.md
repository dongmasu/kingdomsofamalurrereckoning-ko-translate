# Disposition Batch: `default` IDs 45251-45300

- Date: 2026-10-10. Compared active Korean with English, Japanese, Chinese,
  historical questions, and prior terminology decisions. This is a working
  disposition pass, not independent final linguistic approval.
- Decisions: one accepted, two `not an issue`, and eight uncertain.
- CSV edit: ID 45289 only.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 45252 | Uncertain | The lorestone is identified, but `운명의 돌` may conflict with the established item-class term; verify corpus usage before standardizing. |
| 45255 | Uncertain | The location is clear, but Ysa/Gardens of Ysa forms vary across the corpus. |
| 45262 | Uncertain | The isolated capitalized label does not resolve whether The Ariad is a people, group, or unit. |
| 45268 | Uncertain | The ruler's fall and Grim's rise remain, but the proper name is homographic with Korean `그림`, and Moon Camp has variant forms. |
| 45277 | Uncertain | The bandit warning remains; whether Vagabonds is a formal group and its canonical Korean name are open. |
| 45285 | Uncertain | English/Japanese preserve `FAIL LINE`, while Chinese renders failed dialogue; player-facing status is unknown. |
| 45288 | Not an issue | The `font` source/fountain image is supported by the other locales; the `2:3` heading, blank line, and all 16 hymn lines remain. |
| 45289 | Accepted | Restore the source/Japanese single-hand joke; the previous Korean changed `single hand` to “one person.” |
| 45297 | Uncertain | All locales mention completing a translation, but it may be intentional dialogue or test metadata. |
| 45299 | Uncertain | `Trigger Belens` may be an internal/debug label; its audience and spelling cannot be settled locally. |
| Remaining IDs 45251-45300, excluding listed findings | Not an issue | No further supported row-local correction was found; meaning, values, markers, and structure remain intact. |

Decision IDs D-13858 through D-13868. Decision D-13865 authorizes this
targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 45289 | `요툰의 진격을 나 혼자서 박살 냈지! 물론 그 한 사람은 너였지만, 그런 사소한 건 따지지 말자고.` | `요툰의 진격을 나 혼자서 박살 냈지! 물론 그 '한 손'은 바로 너였지만, 그런 사소한 건 따지지 말자고.` | Restore the single-hand punchline, which is explicit in English and Japanese. |

CSV SHA-256 before editing:
`20a5cb771344c53d1178596c4f38ca1d4e3d775fd89a5a194d98773f1507c012`;
afterward:
`475f7237dc33497a9511e23a12b2cc839a0605793258d7eb000f3845f8570122`.
UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
preserved.

Direct register totals after this batch: 1,408 accepted, 4,533 `not an issue`,
and 7,921 uncertain (13,862 categorized dispositions). The next decision ID
is D-13869. All four locale files contain IDs 45251-45300 once and in matching
order. ID 45288 retains the hymn layout and ID 45291 retains +5%. Disposition
is complete through ID 45300; resume at ID 45301 (19,834 `default` IDs remain
through ID 65134).
