# Chaos and Druid Armor Quest-Text Revalidation

- Date: 2026-11-11.
- Scope: 19 unique asset-linked IDs across four quest-text assets, plus one
  cross-corpus `Chaos Scholar` reference.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are terminology, objective-style, and naturalness proposals. No
  translation CSV was changed.

## Grouping Evidence and Limits

The asset catalog identifies no explicit `QUEST_ID`, `NPC_` symbol, or
`dialog_line_*` handler in `2604102.quest_bxml` (6 keys),
`2607900.quest_bxml` (5), `2608000.quest_bxml` (5), or
`2608200.quest_bxml` (7). Text content separates into the Chaos Scholar
armor, Skald's Chaos weapon core, Jock's Chaos weapon crafting, and druid
Aiden O'Conor's armor topics. These content links support text-topic review,
not speaker attribution or dialogue order.

The shared ID `60633` (`Quest Complete`) occurs in 44 quest assets. Its
English, Japanese, Chinese, and Korean label is the same generic UI text, so
it is recorded once with all 44 asset links rather than duplicated as
44 independent translations. This records only that shared label; it does
not complete review of the other keys in those assets.

All 19 asset-linked IDs and the supplemental ID `1691` were compared across
the four languages. No embedded line breaks, runtime placeholders, or
markup occur in these rows. These are quest objectives, journal text,
titles, and UI labels, so no speaker or voice continuity was inferred.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1488`, `1691`, `32217`, `51109` | Terminology / format | The same capitalized source term `Chaos Scholar` is rendered as both `혼돈 학자` and `혼돈의 학자`, without an English pairing. English, Japanese, and Chinese refer to the same figure. Consider standardizing the term as `혼돈 학자(Chaos Scholar)` and inflecting it naturally in each sentence. ID `1691` is a cross-corpus item-description reference with no quest-asset match. | Medium-high |
| `2295`, `7588`, `18522`, `43481` | Objective style | These quest objectives use imperative `-어라` endings (`얻어라`, `찾아라`), while the project's usual objective style is `-기`; ID `32937` in the linked armor group already uses `찾기`. Consider converting these four objectives to concise `-기` forms without changing their targets. | High |
| `13857` | Meaning / naturalness | `I should give it a try and bring her some` says the player should try the plan and bring Skald some Chaos Matter. Current `한번 시도해 보게 그녀에게 조금 가져가야겠다` can read as bringing it so that she can try it. Consider `시험 삼아 그녀에게 혼돈 물질을 조금 가져가 봐야겠다.` | High |
| `24666` | Format / title | The English title is `The Tree and the Branches`, while the parenthetical currently omits the initial `The`. Consider `나무와 가지(The Tree and the Branches)` to preserve the full source title. | Medium |
| `50124` | Meaning / naturalness | `the complete set of ... armor` is rendered as `갑옷 한 벌을 모두 찾아냈다`, which is awkward and can suggest one garment rather than a set. Consider `전설적인 드루이드 에이든 오코너(Aiden O'Conor)의 갑옷 세트를 모두 찾아냈다.` | High |

## Retained Text

The other nine unique asset-linked IDs were retained. In particular, the
existing `Abyss armor` pairing at `32217`, the objective form at `32937`, and
the one shared `Quest Complete` label were checked and left as recorded.

## Complete Asset ID Set

- `2604102.quest_bxml`: `1488`, `28163`, `32217`, `32937`, `51109`,
  `60633`
- `2607900.quest_bxml`: `2295`, `3138`, `13857`, `15427`, `60633`
- `2608000.quest_bxml`: `12782`, `17669`, `46217`, `56769`, `60633`
- `2608200.quest_bxml`: `7588`, `18522`, `24666`, `32937`, `43481`, `50124`,
  `60633`
- Cross-corpus terminology reference, without a quest-asset match: `1691`

All 20 unique IDs above have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
