# MQ09 / General Tilera Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 154 `default` keys associated with `589911.quest_bxml` (`MQ09`).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.
- No translation CSV or extracted game asset was modified.

## Grouping Evidence

The asset contains `QUEST_ID MQ09`, the asset-level symbol
`NPC_MQ_LJO_GeneralTilera`, 14 quest-target handlers, and 54 serialized
`dialog_line_*` handlers. Its localization keys cover General Tilera, Alyn
Shir, the Piercing Light, Urul-Tusk, the Windstones, and related dialogue,
choices, quest updates, objectives, and labels.

The single NPC symbol and handler count do not map each localization key to
Tilera, another speaker, a callback, a branch, or a playback position. The
callback identifiers are serialized in a non-sequential order; serialization
order is not evidence of dialogue order. Speaker attribution and playback
order therefore remain unknown at the key level.

## Correction Candidates

These are source-checked proposals, not permission to edit the active Korean
translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `10860` | Naturalness / speech level | The final `그 모든 일이 끝나야 해` repeats the preceding condition, while `맡길 것이다` shifts to a written declarative register. Japanese `槍を渡すわ` supports conversational speech. Consider `멜 센시르(Mel Senshir)가 해방되고, 발로르(Balor)가 죽고, 내 명예가 회복된 뒤에야 창을 네게 맡길게.` | High |
| `13060` | Meaning / terminology consistency | The same role `champion` is `용사` at `12006` but `챔피언` here. Align this occurrence with the natural existing form: `아가스(Agarth)는 탈출구를, 니랄림(Nyralim)은 구원자를, 티타리온(Titarion)은 용사를 찾고 있었어. 그런데 어쩌다 보니... 네가 모두의 바람을 채워 주고 있네.` | Medium-high |
| `19836` | Meaning / consistency | The quoted inscription `When the great voices rise in song` also appears at `35462` and `49436`, where the Korean wording agrees. Align the quote here to `위대한 목소리가 노래로 솟아오를 때`; retain the surrounding sentence. | High |
| `20214` | Format / name consistency | `Azaghaal` is named but lacks its English form, unlike the same name at `64170`. Consider `폐허는 아자갈(Azaghaal)이라는 야수가 이끄는 니스카루(Niskaru) 군단이 지키고 있다고 해. 그게 사실인지 전설인지는 나도 모르겠어.` | High |
| `25693` | Format / name consistency | The named Niskaru duke `Gajaor` lacks the English form. Consider `이 유적은 니스카루(Niskaru) 공작 가자오르(Gajaor)의 엄니로 만든 창, 관통의 빛(Piercing Light)이 잠든 곳이라고 전해진다.` | High |
| `27284` | Format / title consistency | This is the standalone title `The Great General`; consider retaining the source title as `위대한 장군(The Great General)`. | Medium |
| `31015` | Format | Other quest-objective labels in this project use the established `-기` form. Consider `틸레라(Tilera)를 니스카루(Niskaru)에게서 지키기` instead of the imperative. | High |
| `33211` | Meaning / naturalness | `문의 한 부분` and `네 부분` make the gate structure unclear, although the rest of the line identifies the Windstones as the task. Consider `아니. 문은 일부 열렸지만, 아직 바람돌 네 개가 남았어. 평원 곳곳에 흩어진 바람돌(Windstones)을 찾아 활성화해야 해.` | Medium-high |
| `45756` | Format / name consistency | The named Witch Knight `Malwyn` lacks the English form, while the same full title is paired elsewhere in the active localization. Consider `니스카루(Niskaru)가 처음부터 전쟁에 가담했던 건 아니야. 마녀 기사 말윈(Witch Knight Malwyn)이 니스카루(Niskaru)와 계약을 맺고 투아사(Tuatha)와 함께 싸우게 한 뒤부터였지.` | High |
| `55632` | Meaning / terminology consistency | The magical `chime` is called `종` elsewhere in this group (`10885`, `38510`, `42978`, `47231`), but this row uses `차임`. Consider `바람돌(Windstones) 다섯 개를 깨우면 우룰 터스크(Urul-Tusk)의 문이 열려. 에라셀(Erathell)에 있는 나머지 바람돌 곁에서 종을 울려.` | High |
| `55948`, `56877` | Meaning / consistency | Both English lines explicitly describe a `player` who has been away from `this game`; Korean reduces this to an `인물` / `사람` away from the fight, losing the apparent meta-game reference. Preserve that wording consistently, for example `이 게임을 너무 오래 쉬고 있던 플레이어`. At `55948`, consider `하지만 희망은 있어. 에라셀 평원(Plains of Erathell)에는 이 게임을 너무 오래 쉬고 있던 플레이어가 기다리고 있어... 이제 틸레라 장군(General Tilera)에게 연락할 때야.` At `56877`, retain its distinct opening and ending while using the same player/game phrase. | Medium-high |
| `60220` | Meaning / naturalness | `내 불운을 도와 달라는 뜻은 아니야` is awkward and can read as asking someone to help the misfortune itself. English and Chinese support the sense that she does not expect help with her bad luck. Consider `내 불운을 해결하는 데 누군가의 도움이 필요하다는 뜻은 아니야. 나와 얽히는 사람은 누구든 머지않아 재앙을 만나거든.` | Medium-high |
| `61143` | Meaning / naturalness | In `What Tilera wants there is beyond me, but I trust her`, `믿어` leaves the object and first-person subject implicit and may read as an instruction. Consider `틸레라(Tilera)가 거기서 뭘 하려는지는 모르겠지만, 난 그녀를 믿어. 내 판단에 어긋나더라도 말이야.` | Medium |
| `62998` | Naturalness | `그토록 큰 기대를 쌓아 올렸다가 무너뜨린 것` is a close calque of the English infinitive clause. Consider `많은 이들이 그녀에게 패배의 책임을 물었어. 사람들의 기대를 한껏 부풀려 놓고 결국 무너뜨린 것, 그게 틸레라(Tilera)의 죄였지. 그녀는 날마다 그 대가를 치렀어.` | Medium-high |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `32239` | Address / speech level | `자네가 틀렸어` differs from the more common `너` address in this group, but the key is not mapped to a speaker. Retain provisionally; do not label it a voice error without speaker evidence. | Uncertain |
| `32716` | Address / naturalness | `당신은` may sound stiff beside other direct address in the group. Japanese also uses `あなた`, and the key is not mapped to a speaker or scene; retain pending stronger context. | Uncertain |

## Consistency and Format Checks

Three exact-English duplicate groups occur within this asset, and their Korean
translations already match: `25873` / `28086` (“Can you open the gate yet?”),
`30507` / `53033` (“Talk to General Tilera”), and `58121` / `64849`
(`Urul-Tusk`). `43972` (“How do we open this gate?”) and `56698` (“How do we
open the gate?”) are not exact English duplicates; their differing Korean
phrasing is retained.

All 154 IDs were checked for meaning, Korean naturalness, register,
address/honorifics, terminology and names, repeated English, runtime markers,
markup, and line breaks. No embedded line breaks, runtime markers, or markup
were found. Fourteen correction findings affecting 15 IDs and two unresolved
address/register questions were recorded.

The complete sorted ID set is:

`459`, `659`, `1050`, `1473`, `3510`, `3634`, `3703`, `4297`, `5088`,
`5267`, `5529`, `6468`, `6475`, `6684`, `6764`, `7445`, `7779`, `7920`,
`8027`, `8459`, `9065`, `9066`, `9496`, `9582`, `10126`, `10478`,
`10530`, `10860`, `10885`, `11426`, `11501`, `12006`, `13060`, `16319`,
`17017`, `17671`, `17896`, `18700`, `19612`, `19836`, `19902`, `20035`,
`20214`, `20367`, `20388`, `20458`, `21558`, `22559`, `23527`, `23796`,
`24083`, `25079`, `25603`, `25693`, `25873`, `27263`, `27284`, `27298`,
`27935`, `28052`, `28086`, `28360`, `29209`, `29345`, `29438`, `30157`,
`30307`, `30507`, `31015`, `31061`, `31884`, `32239`, `32532`, `32716`,
`32743`, `32894`, `33211`, `33461`, `34581`, `34940`, `35462`, `35634`,
`35783`, `36035`, `36149`, `36440`, `36671`, `37004`, `37308`, `38388`,
`38510`, `38627`, `40248`, `40284`, `40496`, `40707`, `41091`, `41368`,
`41983`, `42167`, `42322`, `42344`, `42382`, `42747`, `42978`, `43310`,
`43972`, `44065`, `44500`, `45489`, `45583`, `45756`, `46817`, `46861`,
`47231`, `47758`, `48163`, `48883`, `49436`, `49782`, `53033`, `53511`,
`53608`, `53678`, `55098`, `55626`, `55632`, `55888`, `55913`, `55948`,
`56028`, `56698`, `56877`, `56979`, `57291`, `57452`, `58121`, `58463`,
`59814`, `59817`, `60220`, `60881`, `61143`, `62998`, `63628`, `64121`,
`64170`, `64415`, `64441`, `64452`, `64661`, `64849`, `65049`, `65053`.

The linked review ledger records all 154 IDs and their four-language source
fingerprints. No Korean CSV edit was applied.
