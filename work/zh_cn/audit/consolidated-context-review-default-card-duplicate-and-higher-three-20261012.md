# Consolidated Context Review: Duplicate Card Call and Higher/Three

- Date: 2026-10-12.
- Decision: D-19473.
- Scope: `default` IDs 34045 and 46239.

## Findings

| ID | English | Japanese source | Chinese source | Active Korean | Disposition |
| ---: | --- | --- | --- | --- | --- |
| 34045 | `Odd? Ah, but this here's a four. Sorry, but no.` | `奇数？ でもカードはフォーだ。残念ね` | `单？啊，但这是一张四点。抱歉，没猜对。` | `홀수라고? 그런데 이건 넷이야. 미안하지만 안 돼.` | not an issue |
| 46239 | `You choose higher? Well, it's a three. That's higher ‒ so you win.` | `ハイでいいの？ おや、スリーか。ハイだから君の勝ちだな` | `你选大？嗯，是张三点。大点——你赢了。` | `높은 쪽에 걸었어? 좋아, 3이야. 더 높은 수니까 네가 이겼어.` | not an issue |

ID 34045 is an exact English and Chinese duplicate of ID 12942, which was
already resolved as `not an issue` under D-3785. Japanese and Korean vary
only in wording for the four-card reveal and rejection; the odd/four
correction is preserved. At ID 46239, all references explicitly say the
player chose higher, drew a three, and won because it was higher. The Korean
preserves all three facts. The game context beyond these stated exchanges
does not need to be inferred.

Two prior uncertainties were resolved as `not an issue`. No CSV cells
changed; no runtime markers or embedded line breaks occur.

## Verification

- Compared English, Japanese source and preserved draft, Chinese source, and
  active Korean by `ID_Linha`.
- ID 12942 is linked evidence for ID 34045 and was not recounted.
- Active default SHA-256 remains
  `df9685d685ab7dd41c9490ef6e46283f16d370592f617e28beba4ac34c7306dc`.
- Totals after D-19473: **2,350 accepted / 25,104 not an issue / 11,070
  uncertain** (38,524). Resume at **D-19474** from the deduplicated
  unresolved-source queue.
