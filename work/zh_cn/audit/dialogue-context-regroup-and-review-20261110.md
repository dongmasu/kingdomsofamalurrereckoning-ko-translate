# Dialogue Context Grouping and Re-review

Date: 2026-11-10

## Scope

This is an evidence-based pilot for the 21 rows previously identified by the
user as Squire Brio dialogue:
`1326`, `4669`, `4823`, `5748`, `6737`, `8768`, `9173`, `9219`, `25942`,
`27137`, `28954`, `33631`, `36820`, `39386`, `43225`, `46922`, `52385`,
`55775`, `56435`, `56934`, and `58351`.

The purpose is to group dialogue by quest and character before reviewing
meaning, Korean naturalness, register, honorifics, and formatting. The
localization CSVs and extracted assets were not changed.

## Asset Evidence

The row ID is a zero-based index into the 8-byte keys in
`src/csv/en_us/estrutura_hashes_flat.bin`. Exact key matching against the
current extracted corpus produced these groups:

| Group | IDs | Evidence and confidence |
| --- | --- | --- |
| `SQ81` / `1339422.quest_bxml` | `4823`, `5748`, `8768`, `9173`, `9219`, `27137`, `33631`, `36820`, `39386`, `43225`, `55775`, `58351` | Strong quest association. The resource contains `QUEST_ID SQ81`, `NPC_YSA_SEE_Brio`, and dialog-line handlers. Keys `5748`, `9173`, `27137`, and `9219` occur in the serialized code region containing the Brio and `SQ81` references. This does not map those keys to individual callback line numbers. |
| `NQD_City_Ysa` / `1490841.quest_bxml` | `1326`, `4669`, `6737`, `25942`, `28954`, `46922`, `52385`, `56934` | Strong city-resource association, but not speaker proof. The asset contains many NPCs and no explicit `NPC_YSA_SEE_Brio` reference. Brio attribution for these rows rests on the user's identification and the dialogue content, not this asset match alone. |
| Other quest assets | `56435` | The key occurs in `2601200.quest_bxml` and `2601222.quest_bxml`. These matches do not identify Brio as speaker or establish a scene. |

A full exact-key scan independently found 51,080 distinct default IDs in 426
of the 530 quest assets. Of the matched IDs, 1,257 occur in more than one
quest asset. The same scan found no exact default-key matches in the extracted
interaction or FaceFX quest assets. A quest-asset match establishes a
resource relationship, not by itself a dialogue speaker.

## Dialogue Order

The `SQ81` asset supports a broad quest progression: enlist Brio's help, speak
with four dignitaries, and return to Brio with their preferred procession
order. The localization keys have not been linked to exact
`dialog_line_<quest>_<topic>_<line>` callbacks, so the exact order and branch
sequence of the 21 rows remain unverified.

Callback table order is not playback order. In `1339422.quest_bxml`, callbacks
for topic ID `1530217` are serialized in a non-numeric order (including line
indices `0`, `2`, `4`, `6`, `9`, `13`, `12`, `14`, `10`, and `11`). The suffix
can identify a topic line index, but does not establish how branches are
played. The dialog-topic symbol table maps `1530217` to `ProblemTOPIC` and
`1252288` to `BrioTOPIC`; these are different topics, and the topic name alone
does not establish a speaker. The extracted corpus contains the topic symbol
and initialization data, but no matching standalone topic body that links
these localization keys to a complete conversation graph.

## Translation Re-review

Compared the 21 active Korean rows with the same-ID English and Japanese
sources, using Chinese as a supporting check. The following findings need
editor review:

| ID | Disposition | Finding |
| --- | --- | --- |
| `1326` | applied and rechecked | Changed the title to the established `재산관리관(Lady of Receivership)` and recast the stiff formal phrasing as conversational `해요체`. The user identified this as Brio's polite pre-quest address, so the register is appropriate. |
| `36820` | applied and rechecked | Recast the stiff question and predicament wording as conversational `해요체`, retaining Brio's respectful pre-quest address. |
| `25942` | uncertain | `잘 가시오` is a marked `-시오` form. English says “Farewell, honorable one,” while Japanese `それでは失礼` has a different farewell nuance. The asset match does not establish Brio's scene phase; do not change it until the exchange context is established. |
| `28954` | uncertain | `엄한 주인` is a literal and awkward rendering of “harsh mistress.” Japanese says `厳しい方` (“a strict person”). `엄격한 분` may be more natural if the referent is confirmed as Olaana; the asset does not identify the speaker or referent. |
| `33631` | applied and rechecked | Replaced the vague presentation wording with an explicit question about lining up the dignitaries, kept the snake-tail metaphor, and aligned the ending with the quest's casual speech. |
| `43225` | applied and rechecked | Changed the marked `하게체` to casual speech and `네`, consistent with the user's description of Brio's quest dialogue. |

Applied text, rechecked against English and Japanese:

| ID | Suggested Korean |
| --- | --- |
| `1326` | `저는 지고왕(High King)의 명부 담당자이자 재산관리관(Lady of Receivership)의 수습생이에요. 제가 일을 이렇게 망친 걸 올라나(Olaana) 님이 아시면 몹시 실망하시겠죠.` |
| `36820` | `저 같은 종자를 도와주실 생각은 없으신가요? 그런 부탁을 드릴 입장이 아닌 건 알지만, 제가... 꽤 곤란한 처지라서요.` |
| `33631` | `일은 끝났군. 영락없는 뱀 무리였지? 그 꿈틀대는 꼬리를 건드리지 않으려면 어떤 순서로 줄 세워야 할지 알겠어?` |
| `43225` | `귀빈들은 정원 여기저기를 둘러보며 경치를 즐기는 것 같아. 난 여기서 네 조언을 기다릴게.` |

The other 15 rows did not show a clear meaning, register, or formatting error
in this pass. The wording that respectfully addresses the player as ruler at
`55775` and `56435` is contextually distinct from changing the listener's
speech level and should not be normalized mechanically.

All 21 IDs exist in the aligned English, Japanese, Chinese, and Korean
resources. The checked rows have no embedded line breaks, runtime variables,
or formatting markup; no structure or formatting edits are needed for this
pilot. The four listed corrections are present in the active Korean CSV and
have been rechecked against the source rows. Other review findings remain
separate from CSV application under the project review/editor workflow.

## Status

The Brio pilot demonstrates reliable quest-level grouping and supports
targeted register and wording review. It does not establish a complete
speaker/scene index or exact dialogue order for the whole default resource.
Scaling beyond this pilot requires retaining asset provenance and confidence,
and keeping speaker attribution and playback order unknown where the binary
links do not prove them.
