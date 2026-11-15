# Five Unrecorded Asset Revalidations: SQ47, SQ78, SQ97, SQ100, and SQ103

- Date: 2026-11-11.
- Scope: all 423 previously unrecorded `default` IDs in five extracted assets.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Thirteen correction-candidate IDs and six evidence-limited register holds
  are recorded. No translation CSV or extracted asset was changed.

## Grouping Evidence and Limits

`1260381.quest_bxml` has 84 matching IDs and no explicit `QUEST_ID` or NPC
symbol. Its 35 serialized dialogue handlers use an `SQ47` prefix.
`1293651.quest_bxml` has 82 IDs, explicit quest ID `SQ78`, two NPC symbols
(`NPC_POE_ALM_IdwaWidfrond` and `NPC_POE_VAR_BrittHagni`), and 36 handlers
with an `SQ78` prefix. It concerns the Azo Raemund / Britt Hagni search and
identity. The two NPC symbols do not identify the speaker for any individual
key.

`1310054.quest_bxml` has 92 IDs and 28 `SQ97`-prefixed handlers, but no
explicit `QUEST_ID` or NPC symbol. Its text concerns Eli Tems, the Kandrian
ring, and the Kandrian Guard.
`1310217.quest_bxml` has 67 IDs and 37 `SQ100`-prefixed handlers, but no
explicit `QUEST_ID` or NPC symbol. Its text concerns Esha and the Ashmoor
survivors' escape.
`1310280.quest_bxml` has 98 IDs and 43 `SQ103`-prefixed handlers, but no
explicit `QUEST_ID` or NPC symbol. Its text concerns Eventide, Bareth, and
Cryamor.

The asset matches and handler prefixes support conservative quest/topic
grouping only. They do not map keys to individual speakers, handlers,
branches, or playback order. No speaker or order was inferred.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `10434` | Meaning | English explicitly calls Gizela Camden's widow; Japanese also says she is a widow. Korean `그의 아내` identifies her only as his wife. Consider `캠든 울플랙(Camden Wulflac)의 사망 소식을 미망인 기젤라(Gizela)에게 전했다. 이제 그녀는 홀로 마을 생활로 돌아갈 것이다.` | High |
| `15879` | Meaning / terminology | The personified `Authority` is rendered `권위자`, which can read as an ordinary authority figure. The established divine referent is `권능(Authority)` at IDs `6908`, `35218`, and `46194`, and the prior review specifically left `15879` as an open terminology candidate. Consider `권능(Authority)께서 언제나 여러분을 보살펴 주시기를.` | High |
| `19779` | Naturalness | `up to my elbows in corpses all day` is rendered literally as `시체를 팔꿈치까지 파헤치고 있었어`, which is awkward Korean. Japanese and Chinese both support the sense of spending the day among corpses. Consider `하루 종일 시체를 뒤적이고 있었어. 무례한 표현인가? 이제 나도 모르겠네. 다른 할 일을 찾아야겠어.` | High |
| `20931` | Meaning / terminology | The same asset consistently uses `칸드리안` and `칸드리안 경비대(Kandrian Guard)`, but this row has `캔드리안 근위대` and splits `Indre Kandrian` as `인드레(Indre) 캔드리안`. Align the names and faction with `인드레 칸드리안(Indre Kandrian)` and `칸드리안 경비대(Kandrian Guard)`, preserving the sentence's meaning. | High |
| `14709`, `53519` | Naturalness | These identical-source rows say `There is nothing left for us here. Let us leave it to memory, where it belongs.` The Korean repeats the idea of leaving the place in memory in two consecutive sentences. Consider a concise rendering such as `우리에게 이곳에 남은 건 아무것도 없어요. 이곳은 추억 속에 남겨 두는 게 맞아요.` | Medium-high |
| `2637` | Format | The objective `Speak with Esha` is phrased as `에샤(Esha)와 대화`, while the project's objective style uses the action form. Consider `에샤(Esha)와 대화하기`. | High |
| `10042` | Format | The objective `Escort the Survivors` uses the imperative `생존자들을 호위하라`, unlike the established concise action form. Consider `생존자 호위하기`. | High |
| `58639` | Speech level / naturalness | `감사하오` uses marked archaic `-하오체`, while Japanese `感謝するわ` is plain conversational speech. Consider a natural plain-style form such as `고맙다, 필멸자여. 이제 가.` This is a line-level style candidate, not a claim about a shared speaker across the asset. | Medium-high |
| `1200`, `6878`, `61603`, `64085` | Terminology consistency | The same Eventide group is rendered `부족`, `일족`, and `씨족` for `clan`. Japanese consistently uses `族`. Consider using `이븐타이드 씨족` for `clan of Eventide` and `우리 씨족` for `our clan`, with grammar adjusted to each sentence. | High |

The Camden spellings at IDs `6279`, `24680`, and `35133` were not reopened:
the existing full-name consistency review had already considered the
Camden/Gizela group, and locale transliteration variation by itself is not a
new row-level finding.

## Evidence-Limited Holds

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `14177`, `25615`, `28110`, `43846`, `22080` | Conversational register | Japanese is plain conversational speech, while Korean uses polite endings. The asset has no per-key speaker or scene-stage mapping, so the register difference may reflect a different interaction or addressee. Keep unresolved rather than normalizing from asset membership. |
| `41010` | Conversational register | Japanese uses plain feminine speech (`本当に恐ろしいわ`), while Korean says `너무 무서워요`. There is no per-key speaker or scene-stage mapping to establish whether this is a voice mismatch. Keep unresolved. |

## Retained Text and Structural Checks

The other 404 IDs were retained after comparison across English, Japanese,
Chinese, and active Korean. The batch contains no exact-English duplicate
group with divergent Korean text. Line-break counts, runtime-placeholder
sequences, and detected markup signatures match across all four languages
for every ID.

## Complete ID Sets

- `1260381.quest_bxml` (`SQ47` handler-prefix clue; 84 IDs): `420`, `599`,
  `3127`, `3455`, `4192`, `4891`, `6279`, `7120`, `9092`, `10142`,
  `10221`, `10434`, `10674`, `11305`, `11681`, `13132`, `13418`,
  `14177`, `14857`, `15420`, `15589`, `15684`, `16561`, `17646`,
  `18202`, `19975`, `21213`, `22210`, `22768`, `23503`, `23812`,
  `24680`, `25358`, `25615`, `26128`, `27140`, `27266`, `28110`,
  `28319`, `28811`, `29661`, `29742`, `30944`, `31962`, `33276`,
  `33437`, `34153`, `34756`, `35048`, `35133`, `36736`, `37270`,
  `37374`, `37555`, `37877`, `38614`, `41351`, `43746`, `43846`,
  `43900`, `45123`, `45238`, `45251`, `45259`, `46113`, `47612`,
  `48539`, `48625`, `50397`, `50559`, `51733`, `53411`, `54059`,
  `54359`, `54856`, `56071`, `56801`, `57275`, `57391`, `58851`,
  `60670`, `62109`, `63702`, `64040`
- `1293651.quest_bxml` (`SQ78`; two asset-level NPC symbols; 82 IDs):
  `42`, `1121`, `3879`, `4684`, `4809`, `5039`, `6233`, `7277`,
  `9274`, `9972`, `10613`, `11233`, `12733`, `13528`, `13896`,
  `14064`, `14896`, `15879`, `15966`, `17928`, `18800`, `19779`,
  `21354`, `22080`, `22587`, `23177`, `24062`, `24756`, `24757`,
  `25594`, `26550`, `27515`, `27693`, `29804`, `30464`, `33263`,
  `33806`, `34024`, `34222`, `34373`, `34472`, `34593`, `35001`,
  `35205`, `35876`, `37197`, `37232`, `38324`, `38573`, `39377`,
  `39771`, `40609`, `40685`, `40706`, `41338`, `41668`, `42590`,
  `42614`, `43645`, `43711`, `44533`, `45858`, `46192`, `46623`,
  `50787`, `50818`, `50892`, `51657`, `51887`, `52026`, `52100`,
  `52278`, `53027`, `53545`, `55902`, `56100`, `58979`, `59831`,
  `62215`, `62252`, `64284`, `65013`
- `1310054.quest_bxml` (`SQ97` handler-prefix clue; 92 IDs): `632`,
  `933`, `1068`, `2937`, `3423`, `5194`, `5474`, `5574`, `5847`,
  `8787`, `8963`, `9785`, `10015`, `10144`, `10295`, `12386`,
  `13114`, `14867`, `15134`, `15909`, `15931`, `16269`, `16272`,
  `16640`, `17335`, `17985`, `18930`, `19387`, `20488`, `20931`,
  `21771`, `23492`, `23844`, `24586`, `25251`, `26056`, `26299`,
  `26622`, `26627`, `26917`, `27478`, `27681`, `29191`, `29251`,
  `31358`, `32152`, `33050`, `33356`, `34363`, `35052`, `35114`,
  `35693`, `36198`, `36348`, `36780`, `37284`, `37522`, `38746`,
  `39019`, `39556`, `40239`, `40741`, `41442`, `42207`, `43336`,
  `44178`, `44464`, `44665`, `45426`, `47570`, `47847`, `48194`,
  `48363`, `48419`, `50416`, `51789`, `52682`, `54366`, `55660`,
  `56205`, `56735`, `57054`, `57866`, `59886`, `59958`, `60077`,
  `60526`, `62331`, `62673`, `64397`, `64689`, `64919`
- `1310217.quest_bxml` (`SQ100` handler-prefix clue; 67 IDs): `173`,
  `277`, `1200`, `2637`, `3198`, `4021`, `7146`, `8238`, `8776`,
  `10042`, `10610`, `10989`, `13094`, `13181`, `13488`, `15178`,
  `15399`, `15448`, `15853`, `17161`, `18432`, `19248`, `19768`,
  `19964`, `20860`, `22694`, `25580`, `25875`, `26505`, `26576`,
  `28000`, `28366`, `29450`, `31558`, `31790`, `34070`, `35260`,
  `38923`, `39315`, `39448`, `39491`, `40896`, `41010`, `41170`,
  `41185`, `42715`, `44069`, `46458`, `46733`, `49561`, `52356`,
  `53415`, `53679`, `53990`, `55139`, `55430`, `55791`, `56657`,
  `57671`, `58553`, `58639`, `59045`, `59937`, `60045`, `60808`,
  `63796`, `64042`
- `1310280.quest_bxml` (`SQ103` handler-prefix clue; 98 IDs): `258`,
  `1398`, `1562`, `1573`, `2026`, `2206`, `2590`, `3953`, `3964`,
  `3990`, `4832`, `5258`, `5548`, `5846`, `5967`, `6878`, `7609`,
  `7734`, `7975`, `8073`, `8202`, `10726`, `11452`, `11891`,
  `13210`, `14709`, `14846`, `15555`, `16594`, `17344`, `17851`,
  `17855`, `18403`, `18741`, `19185`, `19500`, `19810`, `20104`,
  `21336`, `23049`, `23219`, `23777`, `24466`, `25456`, `25979`,
  `26375`, `27486`, `27606`, `27919`, `27950`, `28494`, `29644`,
  `30362`, `31248`, `31487`, `31723`, `33885`, `36420`, `36956`,
  `38005`, `38107`, `38681`, `38719`, `38890`, `39739`, `39897`,
  `40069`, `40791`, `40812`, `43233`, `43702`, `44596`, `45187`,
  `46373`, `49435`, `49646`, `50242`, `50371`, `51528`, `51955`,
  `51995`, `53519`, `56799`, `57663`, `58076`, `58774`, `59143`,
  `60727`, `61310`, `61603`, `61780`, `62157`, `62622`, `63521`,
  `63889`, `64085`, `64503`, `65052`

All 423 IDs have four-language source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The findings remain review proposals; they do not authorize translation CSV
edits.
