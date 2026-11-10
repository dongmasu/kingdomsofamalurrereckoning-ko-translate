# SQ143 / Galette Treasure Context Revalidation

- Date: 2026-11-10.
- Scope: all 90 `default` keys in `1577269.quest_bxml` (`SQ143`).
- After the user's approval, all 34 correction-candidate IDs below were
  corrected and rechecked against the four locale rows. The east/west source
  conflict at `1410` and `52945` remains unchanged. No extracted resource was
  modified.
- English controls meaning; Japanese guides style/register; Chinese supports
  the comparison. All four tables were checked at every listed ID.

## Grouping Evidence

The index records `QUEST_ID SQ143`, `NPC_DET_VAR_HreidAmlethoe`, and 35
serialized `dialog_line_*` handlers. The text concerns Hreid, Teers, Alsers,
Bertsa, the Galette treasure, Belen's Testament, and a combination-locked door.
Dialogue, player choices, journals, objectives, and placeholder `.` labels
are mixed. Keys are not individually mapped to speakers or handlers.

The asset symbol spells `HreidAmlethoe`; full-name strings in this group
spell `Hreid Amelthoe`, with Japanese `フレイド・アメルソー`. Preserve the
source-local `흐레이드 아멜소(Hreid Amelthoe)` and the glossary's unresolved
identity distinction. The asset-level spelling alone does not overturn the
earlier decision not to merge the two name forms.

## Correction Candidates

These source-checked corrections were approved and applied. The table retains
the evidence and proposed wording that guided the ID-specific edits.

| IDs | Dimensions | Evidence, current text, and proposed correction | Confidence |
| --- | --- | --- | --- |
| `196`, `2339`, `13377`, `17705`, `18719`, `24714`, `28062`, `30089`, `41782`, `50496`, `53738`, `61704`, `64805` | meaning, format | Source-local `the Testament` means the cult established as `Belen's Testament` in the related Colm quest. Japanese `ベイレン結社` and Chinese `贝伦神约` corroborate. Current variants include `테스타먼트`, `성약(Testament)`, `성약단`, and `유언 결사`. Use established `벨렌의 성약단(Belen's Testament)` for these mentions, not a global replacement of generic testament. At `17705`/`18719`/`61704`, preserve that the victims/members are people rather than treating the organization itself as a single killable person. | High |
| `196`, `3894`, `8790`, `12081`, `25276`, `41163`, `52016` | meaning | English `crew` denotes the treasure-seeking party, not ship personnel: English `7633` identifies hired mercenaries, Japanese uses `仲間`, Chinese `队伍`/`队员`. Current `선원` is unsupported. Use `동료들`/`일행` according to each sentence: `우리 동료들이 문을 열었고`, `나까지 합쳐 일행은 네 명이었어`, `우리 일행은 아니었어`, `내 동료로 보이는 시신`, `동료들은 나만 두고 떠났어`, `어느 게 네 동료들의 시신이지?`, and `지도는 동료들에게 나눠 줬지만`. | High |
| `10077` | meaning, format | English `A friend, Teers, and I gathered a crew to claim it` refers to three subjects and to claiming treasure. Japanese `友人のティアーズと私で...`, Chinese `一个朋友，提尔斯和我...` corroborate. Current `친구 티어스와 나는 그곳을 차지하려고 사람들을 모았어` merges “a friend” with Teers and changes the treasure into a place. Prefer `친구 한 명과 티어스(Teers), 그리고 나는 그 보물을 손에 넣으려고 사람들을 모았어. 마을은 폐허였지만 우린 물러서지 않았지. 원하는 걸 손에 넣을 생각이었거든.` | High |
| `16475`, `19799`, `21069`, `45864`, `57646` | format | Explicit English `Hreid` / Japanese `フレイド` / Chinese `赫雷德` has bare `흐레이드` in one or more places. Pair every short-name occurrence as `흐레이드(Hreid)`, preserving already paired full names and not resolving the Amelthoe/Amlethoe identity question. | High |
| `25276`, `30661`, `41756`, `41782`, `45803` | format | Explicit English `Teers`, Japanese `ティアーズ`, Chinese `提尔斯` is bare `티어스` in Korean. Add `티어스(Teers)` at every occurrence, including both occurrences within `41782`. | High |
| `33163` | format | English `Alsers and Bertsa`, Japanese `アルサーズとベルツァ`, Chinese `艾尔瑟和柏特萨` identify the same two party members as `7633`/`22749`. Current `앨서스와 베르차` differs from local majority `알서스(Alsers)` and omits both annotations. Prefer `단단히 잠겨 있어. 열려면 알서스(Alsers)와 베르차(Bertsa)의 시신을 찾아야 해.` | High |
| `18342`, `54465`, `60326` | naturalness | These are objective labels (`Clear the Tunnels`, `Speak to Hreid`, `Unlock the Mechanism`), also action labels in Japanese/Chinese. Current `터널 소탕`, `흐레이드(Hreid)와 대화`, `장치 잠금 해제` should follow local `-하기` objectives: `터널 소탕하기`, `흐레이드(Hreid)와 대화하기`, `장치 잠금 해제하기`. | High |
| `18719` | meaning, naturalness | English `I don't know them` is spoken while identifying an unfamiliar corpse, as Japanese `知らん ... 一人だろう` and the corpse-identification context support. Current `그들을 몰라` asserts an unexplained plural. Prefer `모르는 사람이야. 아마 그 빌어먹을 벨렌의 성약단(Belen's Testament) 놈들 중 하나겠지.` | Medium-high |
| `46299` | meaning | English `those parts` refers locally to portions of the combination (`1410`/`22749`), Japanese `組み合わせを正しい順序で入れれば`, Chinese `把这些密码按正确的顺序排列`. Current `부품을 올바른 순서로 맞추면` invents physical mechanism parts. Prefer `암호를 올바른 순서로 입력하면 문이 열릴 거야.` | High |
| `50496` | meaning | English `If he knew he was dead` means anticipating certain death, not knowing he is already a corpse: Chinese `要是他明白自己死定了` makes this explicit. Japanese follows the English phrasing. Current `자신이 죽었다는 걸 알았다면` wrongly implies postmortem action. Prefer `왜지? 어차피 죽을 걸 알았다면 왜 굳이 여기 숨어 있었겠어? 설마... 벨렌의 성약단(Belen's Testament)이 보물을 손에 넣지 못하게 하려고...` | High |
| `62862` | meaning | English `a map to a treasure beneath Galette`, Japanese `ガレット地下の財宝への地図`, Chinese `盖莱特地下宝藏的地图` locate the treasure underground, not the map. Current `갈레트(Galette) 지하에 묻힌 보물 지도를 찾았지` can attach burial to the map. Prefer the unambiguous `마지막 일거리에서 갈레트(Galette) 지하의 보물로 가는 지도를 찾았지.` Preserve the Hireling rank and preceding sentences. | Medium-high |

## Holds and Preserved Differences

| IDs | Dimensions | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `1410`, `52945` | meaning | The combination differs in the sources: dialogue `1410` gives Bertsa's part as **south, east, north**, while journal `52945` gives **south, west, north**. Japanese and Chinese reproduce the same east/west discrepancy, and Korean follows each row correctly. Record the source conflict; do not silently make both Korean rows agree or claim the working puzzle solution is known. | Uncertain |

The exact-English duplicate groups already match in Korean:
`13377`/`64805`, `29208`/`30889`, and the six `.` placeholders
`49641`/`51808`/`58205`/`60550`/`62907`/`64770`.
The paired faction proposal must preserve the first pair's identity.
`Galette Caverns` and `Galette Tunnels` remain separately labelled, per the
existing glossary; this asset does not establish a global alias.

The informal dialogue is compatible with the Japanese plain register.
`41163`'s elevated `자네` can become neutral `네` in the crew correction,
but an unproven same-speaker register switch is not asserted. No other
clear honorific/speech-level defect was established in this pass.
No embedded line breaks, runtime braces, or markup occur in these rows
in any of the four locales.

## Coverage

All 90 IDs were checked for meaning, naturalness, speech level, address,
honorifics, terminology, and format. Per-ID fingerprints and statuses are
in `dialogue-context-review-ledger.tsv`. Speaker-at-key, branch flow, and
playback order remain unknown.

`105`, `196`, `1410`, `2339`, `2806`, `3894`, `4009`, `4554`, `6476`,
`6491`, `7633`, `8069`, `8790`, `9097`, `10077`, `10415`, `10527`,
`11928`, `12081`, `13377`, `14917`, `15392`, `16475`, `16851`, `17705`,
`18235`, `18342`, `18719`, `19799`, `21058`, `21069`, `22749`, `24714`,
`25235`, `25276`, `27359`, `28062`, `28237`, `29208`, `30089`, `30344`,
`30661`, `30714`, `30835`, `30889`, `32583`, `33163`, `33198`, `34183`,
`35071`, `38039`, `39803`, `39894`, `41163`, `41756`, `41782`, `43111`,
`45542`, `45803`, `45864`, `46028`, `46299`, `49641`, `50496`, `51212`,
`51808`, `52016`, `52945`, `53159`, `53738`, `53854`, `54465`, `55170`,
`57646`, `58205`, `58988`, `59493`, `60066`, `60326`, `60550`, `61704`,
`61858`, `62862`, `62907`, `63342`, `63436`, `64172`, `64482`, `64770`,
`64805`.
