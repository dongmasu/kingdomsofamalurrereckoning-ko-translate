# MQ14 / Dannestar Island Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 192 `default` keys associated with `589924.quest_bxml` (`MQ14`).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.
- No translation CSV or extracted game asset was modified.

## Grouping Evidence

The asset contains `QUEST_ID MQ14`, the asset-level symbol
`NPC_MQ_UNS_Cydan`, seven quest-target handlers, and 96 serialized
`dialog_line_*` handlers. The text covers the House of Sorrows' shadow path,
Dannestar Tower, the Well of Souls, Ventrinio, Cydan, Hugues, Alyn Shir, the
Laz, and related dialogue, choices, quest updates, objectives, and labels.

The NPC symbol and handler count do not map each localization key to Cydan or
another speaker, callback, branch, or playback position. The 96 callback
identifiers are serialized in a non-numeric order; that order is not evidence
of dialogue order. Speaker attribution and playback order therefore remain
unknown at the key level.

## Correction Candidates

These are source-checked proposals, not permission to edit the active Korean
translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `1566` | Naturalness | `사교하러 온 게 아니야` is an unnatural rendering of “This is no social visit”; Japanese `遊びに来たんじゃない` supports a more conversational `놀러 온 게 아니야. 정신 바짝 차려.` | High |
| `9054` | Meaning / naturalness | `glorified school teacher` is not simply someone who is `잘난 척`; it is a dismissive description of a teacher whose status or title is inflated. Consider `그자는 이름만 번듯한 학교 선생일 뿐이야! 약하고 열의도 없어.` | Medium-high |
| `10307` | Meaning | Korean `작은 무리만 데리고 ... 들어왔는지` makes the speaker's side sound like the group that entered Dalentarth. English, Japanese, and Chinese instead describe getting/sending a small group into Dalentarth. Consider `그래서 그들이 어떻게 작은 무리를 달렌타스(Dalentarth)까지 들여보냈는지 알겠군.` | High |
| `10368` | Naturalness | `이 샘과 조율되고 싶어서 그렇게 안달이더니` is awkward around the established game term `조율`. Consider `이 샘에 조율되기를 그렇게 바라더니, 이제 와서 중요하지 않다고?` while retaining the repeated question. | Medium |
| `13887` | Naturalness | `그분을 잃은 슬픔에 위로를 표하네` has an awkward condolence construction. Japanese also uses a formal condolence expression. Consider `내 아름다운 땅에서 그 흉측한 오점이 사라지다니 참 애석하군. 그를 잃어 슬프겠군. 깊은 위로를 전하네.` | Medium |
| `13903` | Naturalness | The self-correction is intentionally comic, but `필요한 도움을 제공해야겠다는 거지` is stilted. Consider `...내 말은, 말조심하고 수적으로도 우세하고 중무장한 덩치 큰 사람들에게 필요한 건 뭐든 도와줘야겠다는 거지. 그럼 우리 알라바스트라(Alabastra)로 가는 건가?` | Medium |
| `16944`, `30967`, `32796`, `43669`, `48006`, `52715`, `53524` | Terminology consistency | These refer to the same capitalized Well / Well of Souls facility, but Korean alternates between `샘` and `우물`. Most same-group references already use `샘` (`10368`, `24784`, `38600`, `40443`, `48918`, `58067`, `61903`). Use `샘` consistently in the seven listed rows; preserve the surrounding sentence and existing English annotation where present. | High |
| `22065` | Naturalness | `살아 있는 그림자로 된 섬뜩한 길을 내어 줄 것 같아` is cumbersome for a path made through living shadow. Consider `우리 새 친구가 네게 섬뜩한 살아 있는 그림자 길을 내어 주려는 것 같아.` | Medium |
| `42429` | Naturalness | `여긴 뭔가 잘못됐어` can sound as if the place itself is wrong. Japanese `何かが奇妙` and Chinese `有点不对劲` support `여기 뭔가 이상해. 너무 오래 멈춰 있지 마.` | High |
| `63353` | Naturalness / meaning | `그자는 누구도 그 샘에 조율시킬 방법이 없어` is syntactically awkward and obscures that Hugues cannot attune another person to the Well. Consider `그자의 샘은 작동할지도 몰라. 하지만 그자는 다른 사람을 샘에 조율시키는 방법이 없어! 그자가 이룬 성과도 사실상 내 공이지!` | Medium-high |
| `63766` | Meaning / naturalness | `stairwell` is rendered as the narrower `계단참` (a landing). The English, Japanese, and Chinese indicate the staircase/stairwell generally. Consider `여기서 헤어지자. 내가 이 계단에서 라즈(Laz)를 막을 테니, 넌 위로 올라가 벤트리니오(Ventrinio)를 구해.` | Medium-high |

## Holds

| ID(s) | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `29557` | Address / speech level | Korean shifts to `솔직하시군요`, `그분`, and `당신`, more deferential than most direct address in the group. Japanese uses `あなた`, but the asset includes multiple characters and no key-to-speaker mapping; retain pending speaker evidence. | Uncertain |
| `30364`, `32421` | Speech level / address | The English is semantically the same apart from hyphen/dash punctuation, and Japanese and Chinese also match, but Korean shifts from casual `네`/`-어` to `자네`/`-네`. Because exact speaker and scene attribution are unavailable, do not normalize them solely from source similarity. | Uncertain |

## Consistency and Format Checks

The exact-English group “How can I reach Ventrinio?” (`658`, `2831`) already
has identical Korean. The three `Shadow Walk` labels (`19679`, `22158`,
`24611`) also match. Eleven IDs contain only the period `.` in all four
locales and require no translation change. The near-duplicate lines at
`30364` and `32421` differ in dash punctuation in English, so they are not
treated as an exact-string duplicate group.

All 192 IDs were checked for meaning, Korean naturalness, register,
address/honorifics, terminology and names, repeated English, runtime markers,
markup, and line breaks. No embedded line breaks, runtime markers, or markup
were found. Eleven correction findings affecting 17 IDs and three unresolved
register/address rows were recorded.

The complete sorted ID set is:

`658`, `1110`, `1566`, `2278`, `2714`, `2831`, `3206`, `3396`, `3454`,
`4273`, `5406`, `6387`, `7202`, `7652`, `7742`, `7871`, `8263`, `8408`,
`8475`, `9054`, `9185`, `9242`, `9425`, `9623`, `9663`, `10147`, `10164`,
`10307`, `10368`, `10435`, `11769`, `12331`, `12461`, `12625`, `13038`,
`13187`, `13600`, `13887`, `13903`, `14904`, `15693`, `15797`, `16336`,
`16845`, `16944`, `17888`, `18006`, `18264`, `18765`, `19650`, `19679`,
`19823`, `20125`, `20292`, `20305`, `20964`, `21214`, `21231`, `21290`,
`21538`, `21645`, `22065`, `22158`, `22385`, `22596`, `22723`, `23084`,
`23258`, `24611`, `24784`, `25660`, `26265`, `27136`, `27244`, `27940`,
`27959`, `28764`, `29003`, `29032`, `29557`, `29955`, `30364`, `30967`,
`31475`, `31955`, `32345`, `32421`, `32584`, `32796`, `32800`, `32932`,
`33506`, `34760`, `34807`, `34906`, `35058`, `35539`, `35749`, `35892`,
`36018`, `36843`, `37005`, `37059`, `37127`, `37212`, `38253`, `38600`,
`38743`, `39038`, `39323`, `40016`, `40187`, `40397`, `40443`, `41704`,
`41862`, `42175`, `42189`, `42429`, `43024`, `43164`, `43669`, `44094`,
`45067`, `45475`, `45732`, `46167`, `46342`, `47152`, `47155`, `47698`,
`47853`, `48006`, `48056`, `48092`, `48316`, `48389`, `48918`, `48942`,
`49407`, `49968`, `50601`, `51768`, `52399`, `52665`, `52715`, `52932`,
`52961`, `53314`, `53504`, `53524`, `53700`, `53907`, `54149`, `54582`,
`54831`, `54921`, `55025`, `55301`, `55597`, `55668`, `56742`, `56820`,
`57415`, `57761`, `57899`, `58067`, `58348`, `58874`, `58999`, `59343`,
`59833`, `60971`, `61031`, `61554`, `61903`, `62075`, `62424`, `62477`,
`62743`, `62795`, `62951`, `63215`, `63353`, `63416`, `63460`, `63766`,
`64423`, `64523`, `64612`, `64864`, `65099`.

The linked review ledger records all 192 IDs and their four-language source
fingerprints. No Korean CSV edit was applied.
