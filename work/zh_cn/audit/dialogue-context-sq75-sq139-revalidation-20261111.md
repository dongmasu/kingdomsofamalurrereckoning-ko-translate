# SQ75 and SQ139 Quest Assets Revalidation

- Date: 2026-11-11.
- Scope: 75 previously unrecorded `default` IDs across
  `1252458.quest_bxml` (38) and `1568851.quest_bxml` (37).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Four correction findings are recorded. No translation CSV or extracted
  game asset was changed.

## Grouping Evidence and Limits

`1252458.quest_bxml` has no explicit `QUEST_ID` or NPC symbol and has
12 serialized `dialog_line_*` handlers with an `SQ75` prefix. Its content
concerns the Searstalk, Luca Soren, and Arhaus Vorm. The prefix supports an
SQ75-related topic grouping, but does not map each key to a speaker, branch,
or playback order. ID `30114` explicitly self-identifies its speaker as
Arhaus Vorm; this does not establish the speaker for other rows.

`1568851.quest_bxml` has no explicit `QUEST_ID` or NPC symbol and has
12 serialized `dialog_line_*` handlers with an `SQ139` prefix. Its text
concerns Master Kiftal, Sorrogweth fungus, Witchknight Anira, and the
inhabitants of Cann-Rane. The prefix is a grouping clue only, not a
per-key speaker or order map.

All 75 rows were compared in English, Japanese, Chinese, and active Korean.
Repeated `Quest Failed` rows (`18194`, `38148`) and `Quest Complete` rows
(`34294`, `46891`) have identical Korean. No embedded line breaks, runtime
placeholders, or markup occur in the rows.

## Correction Candidates

| ID(s) | Asset / dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `20949` | `1252458` / naturalness | `I shall see you later` is translated `나중에 보지`, which can sound ominous or haughty; Japanese `また会おう` is a friendly plain-style farewell. Consider `나중에 보자.` | Medium-high |
| `30114` | `1252458` / speech level / naturalness | Arhaus's self-introduction mixes `환영하네` with `...이야`. Japanese is plain conversational style. Consider `우리 산장에 온 걸 환영해. 나는 아르하우스 보름(Arhaus Vorm)이야.` | Medium-high |
| `18908` | `1568851` / meaning | English specifies poisoning spear-tips and arrow-tips; Korean says `창과 화살촉에 독을 발랐으며`, leaving the spear-tip target implicit. Consider `창끝과 화살촉에 독을 발랐으며`. | Medium |
| `7014`, `17937`, `26577`, `29585`, `32759` | `1568851` / terminology / format | The same `Master Kiftal` title alternates between `키프탈(Kiftal) 사부` and `마스터 키프탈` / `마스터 키프탈(Kiftal)`. Standardize the title and name pairing, e.g. `키프탈 사부(Master Kiftal)`, retaining `약제사` where present in the source. | High |

## Retained Text

The other 71 rows were retained after comparison. This includes the Searstalk
quest details, the Witchknight's barrier and Kiftal's potion, and the
inhabitants' statements about their past actions. Direct self-identification
was recorded only for `30114`; other rows were not assigned to a speaker based
on asset-level clues.

## Complete Newly Reviewed ID Sets

- `1252458.quest_bxml`: `1017`, `1635`, `3718`, `4148`, `5776`, `12153`,
  `13269`, `13606`, `13863`, `15328`, `16698`, `20949`, `25319`, `25890`,
  `26530`, `27176`, `28536`, `28795`, `30114`, `30386`, `31454`, `35838`,
  `38148`, `38631`, `45013`, `46300`, `46891`, `46910`, `48762`, `49362`,
  `50971`, `58241`, `59441`, `62620`, `62644`, `63687`, `64648`, `64966`.
- `1568851.quest_bxml`: `5819`, `5981`, `7014`, `8230`, `8364`, `8733`,
  `9141`, `15259`, `16252`, `17937`, `18194`, `18908`, `18991`, `19256`,
  `19753`, `24526`, `26577`, `28729`, `29585`, `29766`, `31388`, `32759`,
  `32996`, `34294`, `35627`, `35931`, `36159`, `37233`, `38301`, `41868`,
  `44034`, `46031`, `46457`, `47143`, `52324`, `52861`, `64312`.

All 75 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
