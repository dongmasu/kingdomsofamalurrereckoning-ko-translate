# Asset Revalidation: `628550.quest_bxml` (`SQ67` handler prefix)

- Date: 2026-11-11.
- Scope: all 80 unique `default` IDs linked to this asset; all 80 were new to
  the review ledger.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Eight correction-candidate IDs are recorded. No translation CSV or
  extracted game asset was changed.

## Context Evidence and Limits

The asset has 30 `dialog_line_*` handlers with an `SQ67` prefix, but no
explicit `QUEST_ID` or `NPC_...` symbol. The matched text supports an
Audra Firan / Khleran topic involving Audra's Jottun capture, escape from a
cage, and the hunt for the Witch Knight at Ghennig. The handler prefix and
topic do not map localization IDs to individual speakers, dialogue turns,
branches, or playback order. Speaker attribution remains unassigned and
dialogue order unknown. No localization ID in this asset is also linked to a
different quest asset.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2211` | Naturalness / terminology | `The key to this cage` is translated as `이 우리를 여는 열쇠`, where `우리` can read as an animal enclosure. Japanese `監獄` and Chinese `牢笼` support the prison-cage context. Consider `철창 열쇠는 길을 조금 내려가면 있는 요툰 룬 군주(Jottun Runelord)가 가지고 있어` or another natural prison-cage wording. | Medium-high |
| `9332`, `26929`, `53592` | Terminology / spacing | `Witch Knight` appears as `마녀기사` in these three lines, while the same asset uses `마녀 기사` elsewhere, including `1631`, `21938`, `39410`, and `55435`. Use the established spaced form `마녀 기사`. | High |
| `5449` | Naturalness / consistency | `알파르 군(Alfar Army) 주력 부대` lacks the possessive particle and reads as a stacked noun phrase. The parallel lines `27698` and `55834` use `알파르 군(Alfar Army)의 주력 부대`; align this line with that phrasing. | High |
| `21580` | Speech level / register | Japanese `ありがとう！` is a plain, neutral expression of thanks, while Korean `고맙네!` has a marked older/senior-sounding tone and stands apart from the asset's `고마워` forms. Consider `고마워!`; this is a line-level comparison, not an individual-speaker attribution. | Medium-high |
| `42694` | Objective format | `Talk to Audra` is rendered `오드라와 대화`, while other objectives in this asset use `-기` forms (`33537`, `36927`, `14648`). Consider `오드라(Audra)와 대화하기`. | High |
| `42720` | Objective format | `Get the Cage Key` is rendered as the noun label `철창 열쇠 획득`, while the parallel objectives use `-기` forms. Consider `철창 열쇠 얻기`. | High |

## Reviewed Context Differences

The exact-English duplicate groups `17352` / `19010`, `21938` / `39410`,
and `27698` / `55834` have matching Korean translations. Japanese at `58815`
describes the Jottun mercenaries as guarding Khleran, while English and
Chinese describe a refuge full of them; Korean follows the primary English
source and Chinese.

Four-language line-break, runtime-token, and markup signatures match for all
80 IDs. No evidence supported assigning any individual row to Audra or
Khleran, and no dialogue order was inferred.

## Complete ID Set

`14`, `1074`, `1631`, `2211`, `2433`, `5261`, `5449`, `5739`, `5807`,
`7492`, `7494`, `7604`, `9332`, `9468`, `10599`, `12217`, `12611`, `12623`,
`12957`, `13714`, `14608`, `14648`, `14776`, `14942`, `16879`, `17352`,
`17659`, `18204`, `18665`, `19010`, `20492`, `21543`, `21580`, `21938`,
`22550`, `23824`, `24844`, `25446`, `26336`, `26733`, `26929`, `27698`,
`27730`, `29602`, `31424`, `32159`, `32988`, `33257`, `33537`, `36793`,
`36816`, `36927`, `37667`, `39410`, `41625`, `42694`, `42720`, `42820`,
`45337`, `48395`, `52262`, `53592`, `53948`, `54859`, `55409`, `55435`,
`55834`, `56749`, `56951`, `57536`, `58815`, `59154`, `59247`, `61832`,
`62187`, `62893`, `63630`, `64623`, `64692`, and `64995`.

The complete four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These review findings are not approval to edit the translation.
