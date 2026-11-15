# Avicenn and Captain Keloran Asset Revalidation

- Date: 2026-11-11.
- Scope: 100 previously unrecorded `default` IDs across
  `760713.quest_bxml` (55) and `1762903.quest_bxml` (45).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Four correction candidates and three evidence-limited holds are recorded.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

`760713.quest_bxml` has one asset-level NPC symbol,
`NPC_DAL_GNO_AvicennEtelle`, and 18 serialized handlers whose names include
the `FFQ33` prefix. It has no explicit `QUEST_ID`.
`1762903.quest_bxml` has one asset-level NPC symbol,
`NPC_ALA_LJO_CaptainKeloran`, and 23 handlers with a `ShadowPass_NQD` prefix,
but no explicit `QUEST_ID`. These clues support candidate topic grouping only:
they do not map a localization key to a speaker, handler, branch, or playback
position. Individual speaker attribution and dialogue order remain unknown.

All 100 rows were compared in English, Japanese, Chinese, and active Korean.
Five exact-English duplicate groups have matching Korean translations:

- `Even after Balor was unleashed...`: `473`, `2163`
- `Tilera`: `1124`, `3513`
- `Ettin`: `45558`, `47719`
- `Shine and Shadow`: `18328`, `61231`
- `If you don't want them...`: `46236`, `48158`

The last group also matches the previously reviewed ID `44978` in all four
languages. Its interpretation remains on hold as recorded in
`dialogue-context-next-five-assets-followup-revalidation-20261111.md`.
No embedded line breaks, runtime placeholders, or markup occur in these 100
rows.

## Correction Candidates

These are review proposals, not approved edits:

| ID(s) | Dimension | Current Korean | Proposed Korean | English and supporting evidence | Confidence / disposition |
| --- | --- | --- | --- | --- | --- |
| `29707` | Name consistency / format | `아비센 엔텔이 죽었다. 내 임무를 완수할 수 없어.` | `아비센 에텔(Avicenn Etelle)이 죽었다. 내 임무를 완수할 수 없어.` | EN: `Avicenn Entelle has died. I cannot complete my task.` JA: `アヴィセン・エテルは死んだ。` Other English name labels at `15096`, `22521`, and `29924` use `Avicenn Etelle`; the asset symbol is `NPC_DAL_GNO_AvicennEtelle`. | High / candidate |
| `46157` | Name consistency / format | `노움 원정대의 유일한 생존자 아비센 엔텔이 델라크(Dellach)에 잠입해 위험한 유물 한 쌍, 빛과 그림자(Shine and Shadow)를 되찾아 달라고 했다. 에틴(Ettin) 전사가 그것으로 혼란을 일으키기 전에 회수해야 한다.` | `노움 원정대의 유일한 생존자 아비센 에텔(Avicenn Etelle)이 델라크(Dellach)에 잠입해 위험한 유물 한 쌍, 빛과 그림자(Shine and Shadow)를 되찾아 달라고 했다. 에틴(Ettin) 전사가 그것으로 혼란을 일으키기 전에 회수해야 한다.` | EN spells the name `Avicenn Entelle`; JA uses `アヴィセン・エテル`, as do the other English name labels and the asset-level NPC symbol. | High / candidate |
| `36172` | Meaning / naturalness | `이런 곳까지 찾아오는 이는 드물지. 특히 필멸자라면 더더욱.` | `이런 곳까지 모험 삼아 내려오는 이는 드물어. 특히 필멸자라면 더더욱 그렇지.` | EN: `It is unusual for anyone ‒ especially those of mortal race ‒ to venture down here.` JA: `まさか、定命の者がここまで来るとはね`. Korean conveys arrival but softens `venture`'s sense of daring to come this far. | Medium / candidate |
| `38711` | Naturalness | `솔직히 말하지. 여기 에틴(Ettin)들은 쉽게 처리하는 것 같은데, 자네처럼 잔혹한 솜씨를 지닌 사람이 필요해.` | `솔직히 말하지. 여기 에틴(Ettin)들을 쉽게 상대하는 것 같군. 자네처럼 거칠게 싸울 줄 아는 사람이 필요해.` | EN: `I will be blunt: you seem to have little trouble handling the ettin here. I could use somebody of your brutal talents.` JA describes needing someone with that kind of strength; the Korean `잔혹한 솜씨` is stiff and sounds malicious. | Medium-high / candidate |

## Evidence-Limited Holds

| ID | Dimension | Current Korean | English / supporting evidence | Disposition |
| ---: | --- | --- | --- | --- |
| `8071` | Meaning | `저 야만인들은 문명 사회를 5분도 흉내 내지 못하고 늘 무슨 난장판을 벌여. 그들을 쫓아내 줘서 고맙군.` | EN: `Those brutes can't even imitate proper society for five minutes without some manner of civil collapse. Thank you for keeping them that way.` JA says `倒してくれて、感謝するよ` (thanks for defeating them); ZH says `谢谢你赶走了他们` (thanks for driving them away). Exact duplicate `44978` matches in all four languages. | Retain as uncertain, linked to the existing `44978` hold. |
| `15593` | Meaning / reference | `맹세하건대, 나도 쓰러지기 전에 겨울을 불태워 버리겠어.` | EN: `I swear, before I too have fallen, Winter will burn.` ZH also says Winter will burn; JA instead says `部下の後を追う前に、必ずや連中を打ち倒してやる` (defeat them before following his subordinates). | Hold; the capitalized referent `Winter` is not established by these asset links. |
| `58603` | Speech level | `좋아, 보답으로 무기는 자네가 가져가게. 더 유용하게 쓸 수 있기를 바라네.` | EN: `Very well, keep the weapons as your reward. I hope you find more use for them.` JA: `よかろう。その武器は報酬として持っていくといい。役に立つ事を祈るよ`. | Hold; asset evidence does not map this key to a speaker or addressee. |

Other rows were retained after the four-language comparison. This includes
the repeated Tilera, Ettin, and Shine and Shadow labels; the quest objective
`유물 회수하기`; and the repeated artifact and faction references. Differences
between quest-log prose and dialogue-like text were not treated as voice
changes without per-key speaker evidence.

## Complete ID Sets

- `760713.quest_bxml` (55): `837`, `3289`, `4427`, `6380`, `8071`, `8164`,
  `9218`, `11899`, `12076`, `12478`, `15155`, `18328`, `19937`, `22521`,
  `23971`, `24181`, `25592`, `26673`, `28210`, `29707`, `29893`, `31896`,
  `32795`, `34145`, `35833`, `38711`, `39111`, `40153`, `41749`, `42225`,
  `43258`, `44021`, `45558`, `46157`, `46236`, `47719`, `48158`, `50123`,
  `51120`, `51906`, `54126`, `54446`, `56118`, `56311`, `56562`, `57287`,
  `58603`, `58773`, `58955`, `61121`, `61231`, `62957`, `63079`, `63411`,
  `64899`
- `1762903.quest_bxml` (45): `473`, `705`, `1124`, `2162`, `2163`, `3358`,
  `3513`, `4363`, `5600`, `7001`, `8937`, `9372`, `12391`, `12856`,
  `13294`, `13460`, `15593`, `16613`, `16733`, `19224`, `29385`, `32895`,
  `32997`, `34163`, `36172`, `37453`, `39622`, `40821`, `41287`, `41816`,
  `42914`, `43118`, `43339`, `44262`, `46905`, `47274`, `49116`, `53053`,
  `54275`, `58096`, `59082`, `60416`, `61738`, `62415`, `65020`

All 100 rows have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
