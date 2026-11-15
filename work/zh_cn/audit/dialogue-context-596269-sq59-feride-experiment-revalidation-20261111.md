# `SQ59` / Feride Experiment Asset Revalidation

- Date: 2026-11-11.
- Scope: all 46 `default` IDs linked to `596269.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Five correction candidates and one evidence-limited hold are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `SQ59`, 15 serialized
`dialog_line_*` handlers, and 46 distinct localization keys, but no detected
NPC symbol. Its content concerns Feride Ouet's experiment in Adessa Mine,
including dialogue-like lines, player choices, quest updates, objectives,
and labels. This supports grouping the asset with the `SQ59` experiment
context, but does not identify an individual speaker, callback, branch,
addressee, or playback order. The separate `591256.quest_bxml` review covers
191 other IDs; the two assets have no overlapping localization IDs.

All 46 rows were compared across English, Japanese, Chinese, and active
Korean. One exact-English duplicate group covers IDs `36294` and `37890`;
all four languages use matching text within that pair. No reviewed row has an
embedded line break, runtime placeholder, or markup token.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `3163`, `62874` | Naturalness / format | These are quest objectives, `Speak with Feride` and `Speak to Feride Ouet`. The current Korean ends at `대화`, which reads like a label fragment rather than an action objective. Use the established objective form, e.g. `페리드(Feride)와 대화하기` and `페리드 오에트(Feride Ouet)와 대화하기`. | High |
| `41746` | Naturalness / format | `Go to Adessa Mine` is an objective rendered as `아데사(Adessa) 광산으로 이동`. Consider matching the project's action-objective form, e.g. `아데사(Adessa) 광산으로 가기`. | Medium-high |
| `62676` | Naturalness | `그가 도와 달라고 한 실험을 도와야겠다` repeats `도와` in close succession. Recast without changing the journal's first-person plan, e.g. `그가 협조를 부탁한 실험을 맡아야겠다`. | Medium-high |
| `64372` | Meaning / naturalness | `rewards will be worthwhile` is rendered `충분한 보상을 받게 될 거야`, which can mean the reward amount will be sufficient rather than worth the effort. Consider `보상이 그만한 가치가 있을 거야` or an equally natural wording. | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `60522` | Terminology | `growth of magic` is rendered `마력의 성장`; the same research topic appears at `31728` as `마법이 성장하는 양상`. English and Japanese at both IDs use `magic`/`魔法`, while Chinese at `60522` uses `魔力`. The broader experiment distinguishes magic from mana, but these references do not settle whether this particular phrase means magic's development or an increase in magical power. Keep the current wording provisional rather than forcing alignment. |

## Complete Reviewed ID Set

The exact 46-ID membership is represented by the asset links in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and the
corresponding fingerprinted rows in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The regenerated ID catalog links each reviewed ID to this report. These
machine-readable records are authoritative for the complete set.
