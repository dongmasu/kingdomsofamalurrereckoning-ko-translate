# Four Sparse-Asset Revalidation

- Date: 2026-11-11.
- Scope: 37 `default` IDs across four quest assets, plus unlinked exact-English
  comparator `18005` for objective `1961`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Eight IDs carry correction candidates. No translation CSV was changed.

## Grouping Evidence and Limits

`531658.quest_bxml`, `747927.quest_bxml`, `1533374.quest_bxml`, and
`1536957.quest_bxml` have respectively 8, 9, 10, and 10 matched localization
IDs. The asset catalog finds no explicit `QUEST_ID`, `NPC_` symbol, or
`dialog_line_*` handler in any of them. Their contents support separate
quest-log, objective, journal, title, and UI-text groups only; they do not
establish a speaker, voice, or playback order.

All 37 asset-linked rows were compared in English, Japanese, Chinese, and
active Korean. Repeated status and contract strings already match in Korean.
`Find the other remains` also occurs at ID `18005`; English and Chinese are
identical, while Japanese uses `他の遺体` at `1961` and `他の死体` at `18005`.
The current Korean is identical. The ID catalog has no quest-asset match for
`18005`, so it is recorded only as a cross-corpus text comparator, not assigned
to `531658.quest_bxml`.

No embedded line breaks, runtime placeholders, or markup were found in the
reviewed rows. Since these assets contain no dialogue handlers, speech level,
address, honorifics, speaker identity, and dialogue order were not inferred.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `903`, `16681`, `64377` | Meaning / naturalness | The Korean says the startled owner was `쫓겨나면서`, which can mean being expelled and reads awkwardly here. English, Japanese, and Chinese describe the owner being startled or chased by an animal and fleeing, leaving the book behind. Recast with `놀라 달아나다`; for example, `주인이 놀라 달아나면서 책을 두고 온 모양이다.` Preserve the animal detail at `64377`. | High |
| `1961`, `18005` | Naturalness / objective style | `Find the other remains` is an objective, but `나머지 유해를 찾아라` is a direct command unlike the project's usual concise `-기` objective form. Consider `다른 유해 찾기` for both IDs. The Japanese wording differs only between `他の遺体` and `他の死体`; both refer to finding the other bodies/remains, and Chinese is identical. ID `18005` remains unlinked to a quest asset. | High |
| `27036`, `45239` | Terminology / naturalness | The same Webwood profession is rendered `비단 농부` and `비단 재배자`; ID `64374` in this reviewed set uses `비단 채집꾼`. Japanese consistently uses `絹採り職人`, and Chinese uses `缫丝者`. A full English-source scan found 19 `silkfarmer`/`silkfarming` occurrences with several Korean forms, including `실크파머`, `양잠업자`, `비단 생산자`, `비단 농사꾼`, and `누에를 치던 사람`. A broader term review should select and apply one contextually sound form; do not treat this four-asset pass as a completed global terminology decision. | Medium |
| `20094` | Terminology / format | This line uses `혼인 반지` where the same ring is otherwise `결혼반지`, and names `한릭` without the English pairing used elsewhere as `한릭(Hanrik)`. Consider aligning those forms. A wider name scan also surfaced other Hanrik spellings/pairing omissions, which remain outside this asset-scoped decision. | Medium-high |

## Retained Text

The remaining 29 asset-linked rows were retained after source comparison.
`Quest Complete`, `Quest Failed`, the contract-party failure notice, and
`Turn in the contract` already match across their repeated uses. The title
`Wrest from Peace`, translated `평온을 빼앗다`, preserves the title's
wordplay and was not forced into a literal reference to a grave.

## Complete ID Sets

- `531658.quest_bxml`: `1094`, `1961`, `19960`, `27036`, `27610`, `45239`,
  `48935`, `64374`
- `747927.quest_bxml`: `2194`, `29298`, `38973`, `39666`, `43377`, `52882`,
  `59492`, `63805`, `64203`
- `1533374.quest_bxml`: `903`, `5797`, `9349`, `16681`, `28896`, `31926`,
  `34155`, `35909`, `56545`, `64377`
- `1536957.quest_bxml`: `5220`, `5879`, `9423`, `20094`, `20374`, `24197`,
  `24976`, `25137`, `27365`, `31517`
- Cross-corpus comparator with no asset match: `18005`

All 38 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
