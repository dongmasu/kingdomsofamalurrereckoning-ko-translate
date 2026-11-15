# `FFQ36` / `SQ89` Quest-Text Revalidation

- Date: 2026-11-11.
- Scope: all 20 `default` IDs linked to `1164089.quest_bxml` (`FFQ36`) and
  `1272808.quest_bxml` (`SQ89`), ten per asset.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are terminology proposals or a meaning hold. No translation CSV
  was changed.

## Grouping Evidence and Limits

`1164089.quest_bxml` contains explicit `QUEST_ID FFQ36`, the asset-level
symbol `NPC_DAL_ALM_SyllaretaVauner`, ten localization keys, and no
`dialog_line_*` handlers. `1272808.quest_bxml` contains explicit
`QUEST_ID SQ89`, the asset-level symbol `NPC_DET_ALM_Abblier`, ten keys, and
no dialogue handlers. The keys are quest objectives, journal/status text, UI
labels, and a quest title; neither asset provides dialogue turns for voice
comparison.

All 20 rows were compared in English, Japanese, Chinese, and active Korean.
The single repeated-English group (`Quest Failed`, `12088`/`57924`) matches
across all four languages. No embedded line breaks, runtime placeholders, or
markup occur in these rows.

## Candidates and Hold

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26880`, `36279`, `51359`, `62870` | Name consistency | These rows use `실라레타`, while the same character is `실라리타(Syllareta)` or `실라리타 바우너(Syllareta Vauner)` in other active Korean rows. Japanese consistently gives `シラリータ`. Consider `실라리타` in this quest group. A full `default` search also found related spellings at `16296`, `19811`, `33121`, `53467`, and `55813`; those cross-group rows are not changed or silently folded into this asset review. | High |
| `62156` | Name consistency | The row pairs the location as `병원 구역(Hospitalis Quarter)`, while the same location is overwhelmingly `병원 구역(Hospitalis Quarters)` in active Korean and Japanese uses the same `救護区域`. Consider the established plural place name, while preserving the source's possessive wording. | Medium-high |
| `40900` | Meaning / title | `Hair of the Dog` is rendered `해장술`. That is a recognizable Korean idiom, but Japanese uses `毒を制する毒` (“poison countering poison”) and the quest concerns an anti-venom. Keep the title on hold until deciding whether to retain the drinking idiom or foreground the quest-specific poison meaning. | Uncertain |

No other correction was supported in this bounded pass. In particular, the
objective `보상 받기`, the terse quest-state labels, the anti-venom
descriptions, and `독샘` were retained.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

`117`, `4097`, `8753`, `12088`, `15876`, `19776`, `22455`, `24545`,
`26880`, `27833`, `34177`, `36279`, `40900`, `42598`, `49602`, `51359`,
`57924`, `61402`, `62156`, `62870`.
