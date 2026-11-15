# Colet and the Echoes / FFQ08-Associated Asset Revalidation

- Date: 2026-11-11.
- Scope: 77 previously unrecorded `default` IDs across
  `2604500.quest_bxml` (39) and `550127.quest_bxml` (38).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Three correction candidates and one evidence-limited hold are recorded.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

`2604500.quest_bxml` has no explicit `QUEST_ID`, NPC symbol, or
`dialog_line_*` handler. Its text concerns Colet and the Echoes' performances
in Gale Crossing. This supports a music-ensemble topic group, but not a
speaker or dialogue-order map.

`550127.quest_bxml` has no explicit `QUEST_ID` or NPC symbol and contains
10 serialized `dialog_line_*` handlers with an `FFQ08` prefix. Its text
concerns Singing Nell, the Windstones at Ayten Circle, and calling the
Erathell / Erathi. The prefix supports an FFQ08-related grouping only; it
does not map individual keys to Nell or any other speaker, branch, or
playback position.

All 77 rows were compared in English, Japanese, Chinese, and active Korean.
The repeated `Hey.` rows (`12850`, `25109`) have matching Korean. The
repeated `The blessings of the heavens...` rows (`1224`, `41546`) also match.
No embedded line breaks, runtime placeholders, or markup occur in these rows.

## Correction Candidates

| ID | Asset / dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `8547` | `2604500` / meaning / naturalness | `Hello, old friend!` is rendered `오랜만이야, 친구!`, which adds that the speaker has not seen the addressee for a long time. The line may simply be a familiar greeting. Consider `반가워, 오랜 친구!` to preserve the familiar address without adding elapsed time. | Medium |
| `50684` | `2604500` / terminology | The objective/title `Listening to Echoes` is rendered literally as `메아리에 귀 기울이기`, but this asset's Echoes are the musical group Colet and the Echoes. Consider a group-aware form such as `에코즈(Echoes) 공연 감상하기`. | High |
| `39549` | `550127` / naturalness | `Stranger strange, come to Ayten` uses deliberate repetition. Korean `낯선 이여, 아이텐(Ayten)에 오다니 참 낯설군` repeats `낯설-` awkwardly. Consider `이방인이 아이텐(Ayten)에 오다니, 참 드문 일이군.` | Medium |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `9181` | Speech level / address | Korean uses formal `당신이 가야 합니다` / `...하십시오`, while Japanese uses less formal plain assertions. The key is not mapped to a speaker or conversation stage, so retain it pending per-key voice evidence rather than normalizing the register from the asset-level `FFQ08` clue. |

## Retained Text

The other 73 rows were retained after comparison. This includes the
ensemble's performance details and the Windstones' musical instructions.
The asset associations do not establish shared speakers for short greetings,
responses, or quest text; no cross-row voice normalization was applied.

## Complete Newly Reviewed ID Sets

- `2604500.quest_bxml`: `648`, `979`, `1949`, `2280`, `3084`, `4077`,
  `4487`, `6606`, `8547`, `10215`, `10753`, `11965`, `12220`, `12497`,
  `12850`, `13069`, `15502`, `17573`, `19310`, `25109`, `31831`, `33006`,
  `34840`, `37402`, `39519`, `41551`, `43109`, `43134`, `46040`, `46074`,
  `50684`, `51541`, `52080`, `52231`, `53202`, `53375`, `56231`, `59751`,
  `62963`.
- `550127.quest_bxml`: `1224`, `1769`, `2143`, `3909`, `4784`, `7314`,
  `7380`, `9181`, `10629`, `11475`, `15377`, `17316`, `17690`, `18388`,
  `18582`, `19703`, `26115`, `28354`, `28777`, `30766`, `38418`, `39549`,
  `40680`, `41546`, `43588`, `46080`, `46750`, `49551`, `50388`, `51094`,
  `52254`, `52259`, `52384`, `58497`, `59208`, `59627`, `60447`, `64579`.

All 77 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
