# Elza's Letter / `2607700.quest_bxml` Revalidation

- Date: 2026-11-11.
- Scope: 12 previously unrecorded `default` IDs linked to
  `2607700.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Three correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Grouping Evidence and Limits

The asset has no explicit `QUEST_ID`, `NPC_` symbol, or `dialog_line_*`
handler. Its internal names include `ao_mq_000` and stages for meeting Elza,
defeating Niskaru, examining a corpse, reading a letter, and heading to
Orbocant. This supports grouping the text with the Elza-letter main-quest
topic, but does not establish a speaker or dialogue sequence. The 12 reviewed
rows are journal entries, objectives, quest text, and a title rather than
spoken dialogue.

All 12 previously unrecorded rows were compared in English, Japanese,
Chinese, and active Korean. The generic `Quest Complete` ID `60633` is also
linked to this asset but was already reviewed and recorded as a shared UI
label; it is not counted as a new row here. No embedded line breaks, runtime
placeholders, or markup occur in the 12 rows.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `9937` | Naturalness / objective style | `Read Elza's letter` is an objective label, but Korean uses the imperative `읽어라`. Align with the established concise `-기` objective style: `엘자의 편지 읽기`. | High |
| `10255` | Meaning / naturalness | `dealt with the Niskaru` is rendered as `처리했지만`, which is vague and bureaucratic for defeating hostile creatures. Japanese `倒した` and Chinese `消灭` support `니스카루(Niskaru)를 처치했지만`. | Medium-high |
| `63124` | Terminology | Capitalized `the Weave` is rendered `위브`, while the project has an established setting-lore form `운명의 태피스트리(The Weave)`. Consider using that form here and verify the full sentence for natural flow. | High |

## Retained Text

The other nine previously unrecorded rows were retained after comparison.
This includes the Hall of the Firstsworn objective and Elza/Agarth journal
entries; the Japanese rendering of the Hall as a shrine is not adopted because
English and Chinese identify it as a hall. Proper-name and objective wording
was checked in context. No dialogue voice or honorific consistency is inferred
from this asset.

## Complete Newly Reviewed ID Set

`1508`, `3015`, `7007`, `7506`, `9937`, `10255`, `10957`, `25324`, `33484`,
`49935`, `63124`, `64473`.

All 12 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
