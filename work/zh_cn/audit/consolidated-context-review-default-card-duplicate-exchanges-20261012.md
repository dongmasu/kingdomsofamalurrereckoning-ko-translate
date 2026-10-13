# Consolidated Context Review: Repeated Card Exchanges

- Date: 2026-10-12.
- Decision: D-19474.
- Scope: `default` IDs 62659 and 59878.

## Findings

| ID | English | Japanese source | Chinese source | Active Korean | Disposition |
| ---: | --- | --- | --- | --- | --- |
| 62659 | `Even? Ah, but I drew a three. Sorry, but no.` | `偶数？ でもスリーを引いたよ。お生憎様` | `平？啊，但是我开了一张三点。抱歉，没猜对。` | `짝수라고? 난 3을 뽑았는데. 미안하지만 아니야.` | not an issue |
| 59878 | `Higher, is it? And the card is ‒ four. So you win.` | `ハイでいいの？ カードは... フォーよ。あなたの勝ちね` | `大，是吧？这张牌是——四点。你赢了。` | `더 높은 숫자라고? 카드가 4니까 네가 이겼어.` | not an issue |

ID 62659 has exact English, Japanese, and Chinese source matches with ID
18669; both Korean lines preserve the even guess, three card, and rejected
outcome. ID 18669 supplied the card-dialogue evidence used in D-19470, so
the even-number meaning is established for this repeated exchange.

ID 59878 has exact English and Chinese matches with ID 26930, previously
cleared under D-19334. Japanese differs only in speaker register. Both Korean
lines preserve the higher call, four card, and win. These local facts suffice;
the review does not infer general card rankings or wager rules.

Two prior uncertainties were resolved as `not an issue`; linked comparison
IDs 18669 and 26930 were not recounted. No Korean CSV cells changed.

## Verification

- Compared English, Japanese source and preserved draft, Chinese source, and
  active Korean by `ID_Linha`.
- Active default SHA-256 remains
  `df9685d685ab7dd41c9490ef6e46283f16d370592f617e28beba4ac34c7306dc`.
- Totals after D-19474: **2,350 accepted / 25,106 not an issue / 11,068
  uncertain** (38,524). Resume at **D-19475** from the deduplicated
  unresolved-source queue.
