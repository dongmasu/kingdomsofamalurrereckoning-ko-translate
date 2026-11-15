# Asset Revalidation: `2603402.quest_bxml` (Crownhold barricade road topic)

- Date: 2026-11-11.
- Scope: all 61 `default` IDs linked to this asset. Sixty were new to the
  ledger; shared UI ID `60633` had already been reviewed and already listed
  this asset among its 44 links.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Seven correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Context Evidence and Limits

The BXML contains four state variables, `is_barricade_1_cleared` through
`is_barricade_4_cleared`, but no explicit `QUEST_ID`, `NPC_...` symbol, or
`dialog_line_*` handler. The linked text concerns the blocked Crownhold road,
deserters, the Preordained occupation, and Captain Koch. These clues support
a barricade/road topic grouping only; exact key matches do not map IDs to
individual speakers, dialogue turns, branches, or playback order. Speaker
attribution remains unassigned and dialogue order unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `11210` | Objective style | `Return to Captain Koch` is the imperative `코흐 대위(Captain Koch)에게 돌아가라`, while related objectives use concise `-기` forms. Consider `코흐 대위(Captain Koch)에게 돌아가기`. | High |
| `12344` | Objective style | `Open the mountain road` is `산길을 개방하라`; align the objective label to `산길 개방하기` or the established equivalent. | High |
| `12506` | Meaning | `collaborators` describes people cooperating with the occupying power. Korean `협력자들` loses that negative occupation-era meaning; the Chinese uses `通敌之人`. Consider `부역자들` or another term that preserves the nuance without changing the line's point about protecting citizens. | High |
| `42941` | Objective style | `Defeat the Jottun in the last camp` ends with `처치`, while related task labels use `처치하기`. Consider `마지막 야영지의 요툰(Jottun) 처치하기`. | High |
| `50418` | Naturalness | `그들은 크라운홀드 전체를 손아귀에 넣고, 도시 중심의 질서의 사원 주변에 모여 있다` has an awkward nested modifier. Recast the location as `도시 중심에 있는 질서의 사원 주변에`. | Medium-high |
| `52464` | Naturalness | `your successes along the road` becomes the literal `자네가 길을 따라 거둔 성과`. Use a natural contextual phrase such as `산길에서 거둔 성과` while retaining the report of a bloody outcome. | Medium |
| `63343` | Rank consistency | `I've only been a Captain for a few weeks` is `대장이 된 지 겨우 몇 주 됐어`, while the same character's title is consistently `코흐 대위(Captain Koch)` in this group. Align the rank to `대위`. | High |

## Repeated Text and Structure

The exact-English duplicate group at IDs `54328` / `60828` (`Hello,
stranger.`) has identical Korean (`안녕, 낯선 이여.`). No other exact-English
duplicate groups occur among these IDs. The four-language line-break counts,
runtime-token sequences, and detected markup signatures match for all 61 IDs.
No embedded line breaks, runtime placeholders, or markup occur in these rows.

## Complete ID Set

`624`, `1944`, `2667`, `3122`, `5911`, `6610`, `11210`, `11436`, `12344`,
`12506`, `12581`, `13786`, `14992`, `16427`, `17701`, `18175`, `18483`,
`18701`, `19057`, `23395`, `24054`, `24839`, `24886`, `27738`, `28850`,
`29338`, `30540`, `32074`, `33308`, `34449`, `35177`, `35476`, `35670`,
`36154`, `36531`, `36737`, `37413`, `39084`, `41430`, `42941`, `43123`,
`43799`, `44704`, `46011`, `46438`, `48732`, `48750`, `49266`, `50418`,
`51219`, `52464`, `53684`, `53987`, `54328`, `56831`, `59132`, `60633`,
`60828`, `61885`, `63227`, and `63343`.

The 60 new four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
ID `60633` retains its existing shared-UI ledger record. These review findings
are not approval to edit the translation.
