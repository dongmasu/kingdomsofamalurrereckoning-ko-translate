# Small Dialogue and Evenroot Asset Revalidation

- Date: 2026-11-11.
- Scope: 19 `default` IDs across three assets with sparse localization keys.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are two correction candidates and one evidence-limited hold. No
  translation CSV was changed.

## Grouping Evidence and Limits

`1379398.quest_bxml` has four keys and four `dialog_line_*` handler names;
`1963058.quest_bxml` has six keys and two handlers; `462518.quest_bxml` has
nine keys and nine handlers. None contains an explicit `QUEST_ID` or `NPC_`
symbol. The Evenroot text is a bounded plant-and-harvesting topic. The two
handler-bearing conversation assets are kept separate; their handler counts
do not identify a speaker or map a key to a callback or playback position.

All 19 rows were compared in English, Japanese, Chinese, and active Korean.
No embedded line breaks, runtime placeholders, or markup occur in these IDs.
Register was assessed per line, without inferring shared speakers.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4943` | Format / terminology | `Evenroot` is a named plant and is paired with English at `8246` and `31684`, but not here. Consider `나로스의 이빨(Teeth of Naros) 곳곳에 자라는 야생 이븐루트(Evenroot) 변종이 있어.` | High |
| `41220` | Meaning / format | Japanese `普通のイーブンルート` supports “ordinary/main Evenroot,” not “original Evenroot”; `원래 이븐루트` can imply the original specimen. This row also omits the `Amphora` pairing present at `61644`. Consider `그것들도 수확할 수 있을 거야. 다만 일반 이븐루트(Evenroot)처럼 암포라(Amphora)의 물이 필요해.` | High |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `35298` | Meaning / naturalness | English `Okay then` and Chinese `那好吧` read as acceptance, while Japanese `じゃあな` reads as a farewell. Korean `그럼 가` adds a direct command to leave. The conversational context is not established, so hold rather than choosing between `그럼, 알았어` and a farewell. |

## Retained Text

The other 16 rows were retained. The short dismissals and acknowledgements
in `462518.quest_bxml` are individually natural, but the asset does not show
that they share a speaker. In the alchemy lines, the hesitant phrasing and
the taste reaction are supported by the source; in particular, the added
notion of mixing reagents is not strong enough on its own to justify changing
the current text.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

- `1379398.quest_bxml`: `9347`, `22765`, `54866`, `56591`
- `1963058.quest_bxml`: `4943`, `8246`, `31684`, `41220`, `54873`, `61644`
- `462518.quest_bxml`: `425`, `793`, `2711`, `6880`, `8665`, `35298`,
  `52311`, `54532`, `62981`
