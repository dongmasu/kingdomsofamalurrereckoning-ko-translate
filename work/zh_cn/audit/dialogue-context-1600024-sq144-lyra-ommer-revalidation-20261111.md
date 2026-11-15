# Asset Revalidation: `1600024.quest_bxml` (`SQ144`)

- Date: 2026-11-11.
- Scope: all 79 unique `default` IDs linked to this previously unrecorded
  asset. All 79 were new to the review ledger.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Fourteen IDs carry correction candidates. No evidence-limited hold was
  required. No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The asset has an explicit `QUEST_ID` of `SQ144`, 37 dialogue handlers, and
two NPC symbols: `NPC_POE_VAR_LyraVogard` and
`NPC_POE_VAR_OmmerVogard`. Its text concerns Lyra Vogard, Ommer Vogard, and
refugees trapped in Orieator's Tomb. The asset establishes the quest and
character context, but does not map individual localization IDs to either
NPC, a dialogue turn, branch, or playback position. Speaker attribution
remains unassigned and dialogue order unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1835`, `5388`, `8274`, `9190`, `10033`, `24485`, `33255`, `43760`, `44354`, `52754`, `55900`, `62233` | Name consistency | The same character, English `Lyra`, is rendered both `리라` and `라이라`. Japanese consistently uses `ライラ`, supporting `라이라`; use `라이라 보가드(Lyra Vogard)` for the full name and `라이라(Lyra)` for the short name. | High |
| `9190`, `10033`, `24485`, `33255`, `43760`, `44354` | English pairing | These lines name Lyra without an English parenthetical, while other references in this same quest context include `(Lyra)`. Add the English name alongside the standardized Korean name. | High |
| `11845` | Meaning / naturalness | `a spark of recognition` is rendered `공감`, which suggests empathy; Japanese `覚えがあるだろう` points instead to recognizing a familiar experience. Consider `네 눈빛에서 알아봤어` or another natural phrasing that preserves recognition. | Medium-high |
| `2737` | Objective style | `Speak to Ommer Vogard` is rendered as the bare noun `오머 보가드(Ommer Vogard)와 대화`, while the same asset's `Find the refugees` uses `난민 찾기` and the project generally uses `-하기` for objectives. Consider `오머 보가드(Ommer Vogard)와 대화하기`. | High |

The name-form finding is a proposal for these references to Lyra Vogard; it
does not merge or standardize the distinct character Lyra Turrelm elsewhere
in the game.

## Repeated Text and Structure

Five exact-English duplicate groups span ten rows:

- `35432` / `36734`
- `38553` / `40465`
- `42142` / `43854`
- `52990` / `55511`
- `54270` / `56441`

Korean translations match within all five groups. Four-language line-break,
runtime-token, and markup signatures also match for all 79 IDs. The wording
of “dog face” at `48687` already matches the established `개대가리` rendering;
it was not changed.

## Complete ID Set

`1835`, `2737`, `3324`, `4377`, `5388`, `5512`, `6064`, `6412`, `6581`,
`7455`, `7911`, `8274`, `9190`, `10033`, `10684`, `10847`, `11845`,
`12408`, `12720`, `17611`, `21443`, `21791`, `22290`, `24485`, `30748`,
`31426`, `31725`, `32355`, `32467`, `33255`, `33618`, `35079`, `35259`,
`35432`, `36602`, `36734`, `38553`, `40434`, `40465`, `40973`, `41686`,
`42142`, `42852`, `43760`, `43854`, `44354`, `44894`, `45319`, `46203`,
`46297`, `46415`, `46488`, `46573`, `46855`, `47998`, `48687`, `49674`,
`50623`, `51615`, `51973`, `52584`, `52754`, `52990`, `54270`, `55511`,
`55701`, `55900`, `55911`, `56441`, `57139`, `57411`, `59075`, `59663`,
`59889`, `61646`, `62233`, `63371`, `64655`, and `64659`.

The complete source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These are review findings, not approval to edit the translation.
