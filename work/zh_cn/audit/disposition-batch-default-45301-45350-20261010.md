# Disposition Batch: `default` IDs 45301-45350

- Date: 2026-10-10. Compared active Korean with English, Japanese, Chinese,
  historical questions, and prior terminology decisions. This is a working
  disposition pass, not independent final linguistic approval.
- Decisions: two accepted, four `not an issue`, and twelve uncertain.
- CSV edits: IDs 45313 and 45346 only.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 45302 | Uncertain | The speaker says the relationship is unknown; `Widow` may be a named entity rather than a generic widow. |
| 45303 | Uncertain | The repeated “for us. For me.” emphasis remains; religious title and institution forms differ across locales. |
| 45305 | Uncertain | Leaving the Travelers and the message's life-or-death indifference remain; formal group spelling needs alignment. |
| 45306 | Uncertain | Arrival, Bisarane, trial, and escape are present; Proving Halls and the trial/dungeon distinction need context. |
| 45308 | Uncertain | Korean preserves the fan's disbelief and devotion without deciding whether Edgard is dead or merely gone. |
| 45309 | Not an issue | Korean's singular `하나` expresses one beast even though Japanese uses an explicit numeral. |
| 45311 | Uncertain | The test string, Fae lore, and incomplete ending remain; `discorporation` needs a canonical term. |
| 45313 | Accepted | Remove redundant `형상의 모습`; retain the inverted-tree comparison and the Sorrows relation. |
| 45314 | Uncertain | The intimate farewell and fear-to-peace image remain; Korean `루비가` is an awkward fragment for the signature and needs letter-style review. |
| 45316 | Uncertain | Shrine meaning remains, but Firstsworn spelling and the formal place term are unsettled. |
| 45319 | Uncertain | The lever disables the trap and prevents more Faer Gorta from entering, giving the refugees a chance; creature terminology remains open. |
| 45326 | Uncertain | The Antiquarian and preservation of lesser ballads are conveyed; formal role and Fae Telling terms need alignment. |
| 45331 | Uncertain | The theft is explicit, but the source gives no context for what the “collections” are. |
| 45339 | Not an issue | The imperative naturally expresses the demand that the speaker's interlocutor stop stalling immediately. |
| 45342 | Uncertain | Ellova's introduction and deferential register remain; `전하` depends on scene-specific rank context. |
| 45346 | Accepted | Correct the meaning from not losing respect to the addressee receiving the speaker's respect. |
| 45348 | Not an issue | All five localized style-marker occurrences and payload order match English and Chinese. |
| Remaining IDs 45301-45350, excluding listed findings | Not an issue | No further supported row-local correction was found; meaning, values, markers, and structure remain intact. |

Decision IDs D-13869 through D-13886 authorize these targeted `Texto`
corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 45313 | `공간 한가운데 있는 나무, 미든에서 본 교수대 나무를 뒤집어 놓은 형상. 그것이 바로 비탄의 형상의 모습이다.` | `공간 한가운데 있는 나무, 미든에서 본 교수대 나무를 뒤집어 놓은 형상. 그것이 바로 비탄의 형상이다.` | Remove a redundant “form/appearance” construction. |
| 45346 | `그래도 너에 대한 존중은 잃지 않겠다.` | `그래도 넌 내 존중을 받게 될 거야.` | Preserve English/Chinese promise that the addressee will have the speaker's respect. |

CSV SHA-256 before editing:
`475f7237dc33497a9511e23a12b2cc839a0605793258d7eb000f3845f8570122`;
afterward:
`943bbeefb98d9832b94c7fd620dca223acca2017c472bd0226fb858650159081`.
UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
preserved.

Direct register totals after this batch: 1,410 accepted, 4,537 `not an issue`,
and 7,933 uncertain (13,880 categorized dispositions). The next decision ID
is D-13887. All four locale files contain IDs 45301-45350 once and in matching
order. ID 45348 retains five `*1` markers in the Korean payload order shared
with English and Chinese; the Japanese-only order difference remains noted.
Disposition is complete through ID 45350; resume at ID 45351 (19,784
`default` IDs remain through ID 65134).
