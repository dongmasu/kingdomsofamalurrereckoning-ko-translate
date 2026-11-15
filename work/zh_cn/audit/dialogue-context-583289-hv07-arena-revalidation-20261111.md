# Asset Revalidation: `583289.quest_bxml` (`HV07` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 89 `default` IDs linked to this asset; all 89 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Eleven correction-candidate IDs are recorded. No translation CSV or
  extracted game asset was changed.

## Context Evidence and Limits

The BXML has no explicit `QUEST_ID`. It contains 15 asset-level NPC symbols
and 43 serialized `dialog_line_*` handlers with the `HV07` prefix. The linked
text concerns the House of Valor arena, its tournament, the Crows team, and
the Champion's plot involving Magnus. These clues support a topic grouping,
but the asset does not map individual localization IDs to a speaker,
handler, branch, addressee, or playback order. The presence of multiple NPC
symbols is not evidence that any particular line belongs to one of them;
speaker attribution and dialogue order remain unassigned/unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `6013`, `14925`, `16106`, `32146`, `32976`, `54385` | Terminology / consistency | The same House of Valor arena is rendered as `투기장`, `경기장`, and `아레나` within this asset; the named location is `용맹의 투기장(Valor Arena)`. Standardize these generic references to `투기장`. At `6013`, keep the separate `pit` reference distinct; at `16106`, also retain the source's coercion, e.g. `챔피언이 사나운 트롤(Troll)들과 강제로 맞붙게 했어!` | High |
| `8228` | Naturalness | `팀을 하나라도 남기고 싶으면` is awkward for “if you want to have a team at all.” Consider `팀을 지키고 싶으면 지금 당장 아래로 내려가는 게 좋을 거야.` | Medium-high |
| `13837` | Meaning / naturalness | In the tournament context, `exhibition` means an exhibition match; Japanese also says `試合`. `끔찍한 경연` is less clear. Consider `그 끔찍한 시합에서 살아남은 크로우즈(The Crows)`. | Medium-high |
| `28399` | Naturalness | `다음 경기에 관해, 그리고 다음 상대를 상대로 전략을 세울 수 있도록 정보를 얻기 위해` is syntactically tangled. Consider `다음 경기를 확인하고 상대에 관한 정보를 얻어 전략을 세우려면 제이킨(Jakin)과 이야기해야겠다.` | High |
| `37978` | Meaning / naturalness | `챔피언의 돈이 도박장을 굴려` is a literal and unclear rendering of the champion funding the gambling den; Japanese explicitly uses `出資`. Consider `챔피언이 도박장에 돈을 대고 있어. 그러니 안 돼.` | High |
| `47026` | Naturalness | `작은 군대만큼 많은 사람` is an awkward count comparison for “a small army's worth of people.” Consider `대회가 시작된 뒤로 네가 죽인 사람 수가 소규모 군대에 맞먹는 걸 봤어.` | Medium-high |

## Repeated Text and Structure

Five exact-English duplicate groups cover 11 rows: `You'll make history if
you win this next one...` (`5670`, `7854`), `Speak to Jakin` (`7372`,
`28458`, `57174`), `Kill the gladiator, boys!` (`24541`, `57656`), `.`
(`27458`, `57107`), and `I don't have time for this.` (`38004`, `54406`).
Korean is identical within every group. All 89 IDs have matching
four-language line-break, runtime-token, and markup signatures.

## Complete Asset ID Set

`838`, `3504`, `4045`, `4345`, `4965`, `5670`, `5928`, `6013`, `6786`,
`7103`, `7372`, `7538`, `7648`, `7854`, `7900`, `8228`, `8990`, `9262`,
`9438`, `13837`, `13946`, `14314`, `14925`, `15111`, `15180`, `15406`,
`15971`, `16106`, `16260`, `17271`, `18806`, `22507`, `24541`, `27458`,
`28230`, `28399`, `28458`, `28706`, `29262`, `29722`, `30751`, `31180`,
`31423`, `31921`, `32146`, `32976`, `33625`, `35329`, `35427`, `37808`,
`37978`, `38004`, `38379`, `38384`, `42162`, `42788`, `43599`, `45614`,
`47026`, `47811`, `49063`, `51040`, `52033`, `52079`, `53455`, `53872`,
`54349`, `54385`, `54406`, `55516`, `55654`, `56042`, `56376`, `57107`,
`57174`, `57317`, `57656`, `57858`, `59012`, `59582`, `60656`, `62767`,
`62960`, `63163`, `63280`, `64187`, `64799`, `64810`, and `64955`.

All 89 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
