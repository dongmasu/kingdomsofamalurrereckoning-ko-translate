# TR01 Grim Rescue Dialogue and Quest-Text Revalidation

- Date: 2026-11-10.
- Scope: all 119 `default` keys found in `457008.quest_bxml` (`TR01`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains the `QUEST_ID TR01` marker, the asset-level symbol
`NPC_DAL_GNO_CenturionGastet`, and 50 serialized `dialog_line_*` callbacks.
All 119 matched IDs were compared across active Korean, English, Japanese,
and Chinese `default` tables. This gives strong evidence that the rows belong
to the `TR01` quest resource, but does not assign every row to Gastet, prove
that every key is dialogue, or map a key to a callback.

The content supports these provisional subgroups:

| Subgroup | Representative IDs | Interpretation and confidence |
| --- | --- | --- |
| Grim's captivity and requests for rescue | `5174`, `6316`, `7080`, `8174`, `9111`, `12173`, `12905`, `25474`, `27671`, `30172`, `31227`, `41545`, `42554`, `54583`, `59282` | High confidence in the Grim-prisoner exchange from first-person references to the cell, confiscated tools, and escape. Exact callback and playback order are unknown. |
| Mission briefing and return to Crilgarin | `14352`, `14592`, `14740`, `16271`, `18333`, `19518`, `26770`, `27351`, `33838`, `36121`, `43778`, `47254`, `47519`, `48794`, `48796`, `57987` | High confidence in the shared rescue mission and its briefing/debrief text. Individual speaker mapping is not proven by key-to-callback evidence. |
| Gnomish guards, the book, and the release bargain | `10340`, `10418`, `22556`, `40369`, `42297`, `45704`, `51840`, `55311`, `56025`, `57023`, `61607`, `62226` | Strong thematic connection to the gnomish force and release negotiation. Gastet is named in the asset, but these IDs are not individually mapped to him. |
| Quest objectives, journal, and labels | `3467`, `4808`, `9095`, `10966`, `15190`, `19052`, `20345`, `20870`, `21565`, `27295`, `27351`, `29581`, `32100`, `34253`, `34723`, `35379`, `43910`, `44851`, `46291`, `47952`, `54771`, `54854`, `58086` | Resource strings include journal narration, objectives, choices, and named labels. Do not apply dialogue register assumptions to these rows. |

The subgroups describe textual context, not a reconstructed dialogue graph.
The asset's serialized callback order and the `default` row order are not
playback order.

## Revalidation Findings

The following are review findings, not approval to edit the CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6316` | Meaning and naturalness | `여기 꽤 괜찮은 곳에 자리를 잡았어` reads as sincere praise, while the cell and imminent gutting make the English line sardonic. Japanese likewise presents his situation as grim. Consider `뭐, 여기선 그럭저럭 버티고 있어. 아직 배를 갈리진 않았거든. 그러기 전에 날 꺼내 주면 고맙겠어.` | High |
| `7080` | Terminology and naturalness | `Missives` is the named book identified elsewhere in this group as `Missives of Sable`; `서한집(Missives)` loses that identity. The phrase `프레토리안 근위병 ... 부대` also stacks the guard role and unit label awkwardly. Consider `하지만 세이블의 서신(Missives of Sable)을 찾던 노움 프레토리안(Praetorians) 부대에 습격당했어.` Keep the already natural `친구` vocative and the rest of the threat. | High |
| `10418` | Meaning / terminology | Korean `법무관들` suggests legal officials. The Japanese `軍団兵`, Chinese `禁卫军`, and the surrounding armed-garrison context identify a military group. The precise relationship between source `Praetors` and the separately used `Praetorians` is not established; hold the final Korean label, but do not retain the legal-official reading without further evidence. | Medium |
| `12173` | Meaning | `the Missives` refers to one book, but Korean `그 서신들을` is plural. Japanese `その書` and Chinese also treat it as one book. Change the object to singular, e.g. `그 책을 내게 넘기면 네가 원하는 건 무엇이든 주지.` | High |
| `15351` | Terminology and naturalness | `the Missives` is the same named book; `서한` is under-specific beside the established full title. Use `세이블의 서신(Missives of Sable)` and clarify the bargain, e.g. `아니면 노움보다 먼저 세이블의 서신(Missives of Sable)을 손에 넣어, 그걸 내주고 우리를 풀어 달라고 할 수도 있어.` | High |
| `25474` | Address; source ambiguity | English uses the familiar vocative `dove`, while Korean uses `도브`; the established neutral form is `친구`. The rest of the English says “give you what I want,” which conflicts with the Japanese refusal/forced-choice reading and the preceding “keep your kit” option. Correct only the vocative if approved; hold the sentence meaning rather than silently repairing the source. | Address: high; sentence: unresolved |
| `27671` | Address | Grim's `dove` is rendered `도브(Dove)`, while the same quest dialogue uses the established familiar `친구`. Replace only the address. | High |
| `41545` | Address and naturalness | `내 사랑` adds romantic intimacy not established by English `dove`; Japanese omits the vocative. Use the established neutral `친구`, e.g. `이런... 친구, 너였구나! 크릴가린(Crilgarin)이 널 보내다니 정말 다행이야.` | High |
| `42297` | Terminology | English names the Praetorians, but Korean reduces them to generic `근위병들`, unlike the established `프레토리안 근위대(Praetorians)` used in this group. Align the group name while retaining the sentence's complaint. | Medium-high |
| `42554` | Address | Replace the unsupported name-like `도브(Dove)` with the established familiar `친구`; the rest of the urgent request is consistent with the sources. | High |
| `59282` | Naturalness and address | `그대여` is elevated and stiff beside Grim's casual `고마워` and the same group's familiar `친구` address. Prefer `고마워, 친구.` Preserve the pounds reference and the rest of the line. | High |
| `39600` | Meaning and naturalness | `유물` suggests a portable artifact, but the sentence describes a battle site. Japanese `名残` and Chinese `遗迹` also support a remnant/site reading. Consider `지난 시대의 흔적이야. 위대한 페이(Fae) 둘이 맞붙은 중대한 전투의 현장이지.` This keeps the English's unspecified identity of the two Fae. | Medium-high |

`31227` was checked against all three source languages and retained. Its
current Korean matches the previously approved wording:
`분명 이 책과 관련이 있을 거야. 아주 중요한 책인가 봐... 내가 여기서 나가는 것만큼이나 말이야.`

Eleven exact-English duplicate groups occur in this asset, and Korean is
identical within each group:

| IDs | English |
| --- | --- |
| `1171`, `3041` | `Stealth Kit` |
| `2516`, `25810` | `Where can I find Grim?` |
| `5292`, `13195` | `How do I get you out, again?` |
| `21565`, `29581`, `54854` | `Missives of Sable` |
| `24460`, `25455` | `How about I keep your kit?` |
| `27953`, `30330` | `Here are your tools.` |
| `33983`, `58767` | `I bought your freedom.` |
| `35379`, `39967` | `I found the Missives of Sable.` |
| `41773`, `50617` | `It's all the fault of the damned Hierophant...` |
| `46291`, `47952` | `Grim Onwig` |
| `51840`, `55311` | `Praetorians` |

The 119 Korean rows and their aligned English, Japanese, and Chinese rows have
no embedded line breaks or markup/runtime tokens. No structural or line-break
change is indicated.

## Coverage

All 119 asset-linked IDs were reviewed for meaning, Korean naturalness,
register/address, and formatting. The clear candidates and the two held items
are recorded above; the other rows showed no clearly supported defect in this
pass. No CSV edit was applied. The full ID set is:

`1037`, `1171`, `2516`, `3041`, `3467`, `4808`, `5174`, `5292`, `6316`,
`7080`, `8116`, `8174`, `8771`, `9095`, `9111`, `9189`, `9343`, `10340`,
`10418`, `10966`, `11994`, `12173`, `12590`, `12648`, `12905`, `13195`,
`14352`, `14592`, `14740`, `15190`, `15351`, `16271`, `17960`, `18333`,
`19052`, `19518`, `19566`, `20345`, `20870`, `21565`, `22556`, `22872`,
`23192`, `23490`, `24460`, `25455`, `25474`, `25810`, `26770`, `27295`,
`27351`, `27596`, `27671`, `27953`, `28215`, `29002`, `29581`, `29793`,
`30172`, `30330`, `31227`, `32100`, `32566`, `33838`, `33983`, `34253`,
`34723`, `35379`, `35391`, `36121`, `37961`, `39043`, `39317`, `39600`,
`39967`, `40369`, `40494`, `41380`, `41545`, `41773`, `42091`, `42297`,
`42554`, `43778`, `43910`, `44851`, `45704`, `46282`, `46291`, `47254`,
`47519`, `47952`, `48073`, `48794`, `48796`, `49965`, `50322`, `50617`,
`51569`, `51840`, `51986`, `54583`, `54771`, `54854`, `55311`, `55374`,
`56025`, `57023`, `57987`, `58086`, `58767`, `59282`, `60817`, `60999`,
`61562`, `61607`, `62226`, `62283`, `64226`.
