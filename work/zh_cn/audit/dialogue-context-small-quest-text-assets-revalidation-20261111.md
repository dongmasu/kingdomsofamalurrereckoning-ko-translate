# Small Quest-Text Asset Revalidation

- Date: 2026-11-11.
- Scope: 25 `default` IDs across five previously unrecorded quest-text assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- The review recorded three correction candidates. No translation CSV was
  changed.

## Grouping Evidence and Limits

The reviewed assets are `1619339.quest_bxml` (3 keys),
`1695866.quest_bxml` (5), `1698817.quest_bxml` (6),
`1698819.quest_bxml` (6), and `1913467.quest_bxml` (5). None contains an
explicit `QUEST_ID`, an `NPC_` symbol, or a serialized `dialog_line_*`
handler. Their English text identifies quest topics including Kandir's Fae
pool experiment, the Shadow of Enfamanir, the Treasures of Meropis,
Cureseeker, and Special Delivery. Those topics support asset-scoped text
groups only; they do not establish an individual speaker or playback order.

All 25 rows were compared in English, Japanese, Chinese, and active Korean.
The repeated `Quest Complete` labels match across the reviewed rows. No
embedded line breaks, runtime placeholders, or markup occur in these IDs.
Because the entries are objectives, journal text, quest titles, and UI labels,
speaker, register, address, honorific, and dialogue-order judgments were not
inferred.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26329` | Naturalness | The relative clause can momentarily read as though Farrara rescued the ballad rather than the first Fae settlers. English, Japanese, and Chinese agree that the story is about saving those settlers from Enfamanir. Consider recasting the sentence so the tale's subject is explicit: `《엔파마니르의 그림자(Shadow of Enfamanir)》라는 유명한 페이(Fae) 발라드를 재현하기로 했다. 이 이야기는 파라라 경(Sir Farrara)이 이사의 정원(Gardens of Ysa)에 처음 정착한 페이(Fae)들을 사악한 니스카루 호리녹스(Niskaru Horrinox) 엔파마니르(Enfamanir)의 위협에서 구해 낸 일을 다룬다. 엔파마니르의 소굴은 시드(Sidhe)의 물에 잠긴 숲에 있다.` | High |
| `61125` | Naturalness | This is the quest objective `Slay Enfamanir`; the current noun-only `엔파마니르(Enfamanir) 처치` is less consistent with the project's usual `-하기` objective form. Consider `엔파마니르(Enfamanir) 처치하기`. | Medium |
| `31370` | Format | The otherwise source-faithful quest journal entry omits the established English pairings for `브라이트타워` (`Brightower`) and `패란즈` (`Faelands`). Other active Korean rows use `브라이트타워(Brightower)` and `패란즈(Faelands)`. Add those glosses without changing the meaning or sentence structure. | High |

## Retained Text

The remaining 22 rows were retained after source comparison. In particular,
the Meropis title at `53338` remains `메로피스(Meropis)의 보물`, without the
redundant parenthetical for the full English title; `32963` already pairs
`엔파마니르의 그림자` with `Shadow of Enfamanir`. The Cureseeker objective
labels and the Special Delivery journal entries preserve their existing
meaning and concise UI style.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

- `1619339.quest_bxml`: `16888`, `39607`, `45084`
- `1695866.quest_bxml`: `26329`, `32963`, `35224`, `56667`, `61125`
- `1698817.quest_bxml`: `927`, `17986`, `19885`, `45423`, `46539`, `53338`
- `1698819.quest_bxml`: `6306`, `18402`, `31370`, `41899`, `55679`, `59718`
- `1913467.quest_bxml`: `11131`, `11983`, `23606`, `27118`, `47434`
