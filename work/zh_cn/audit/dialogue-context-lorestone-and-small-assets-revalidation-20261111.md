# Lorestone and Small-Asset Revalidation

- Date: 2026-11-11.
- Scope: nine `default` IDs across four previously unrecorded assets.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Two English-pairing candidates were recorded. No translation CSV was
  changed.

## Grouping Evidence and Limits

`717986.quest_bxml` contains six keys about the Cradle of Summer and its
Lorestones, with no explicit `QUEST_ID`, `NPC_` symbol, or dialogue handler.
The entries are a quest title, objective, journal text, and status label;
they do not establish a speaker or playback order.

Three single-key assets were also revalidated: `1500406.quest_bxml` (`GDC
Demo`), `1655270.quest_bxml` (`Southern Lights`), and `751643.quest_bxml`
(`Kellerac's Sword`). Each contains only its standalone title/label and no
quest, NPC, or dialogue-handler metadata. They are kept as separate one-key
records, not grouped as a shared conversation.

All nine rows were compared in English, Japanese, Chinese, and active Korean.
No embedded line breaks, runtime placeholders, or markup occur in these IDs.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `12735` | Format / terminology | The first occurrence of the established term `Lorestone` is rendered `로어스톤` without its English pairing, while `62074` in the same asset uses `로어스톤(Lorestone)`. Consider adding the pairing at first mention. The English source's later `Loretones` spelling is a source typo; Japanese and Chinese confirm the intended term. | High |
| `52826` | Format / terminology | The objective `Find three Lorestones` uses the same unpaired term. Consider `로어스톤(Lorestone) 세 개 찾기`, matching the established term and the nearby gloss at `62074`. | High |

## Retained Text

The other seven IDs were retained. `Southern Lights` is reasonably rendered
as `남극광(Southern Lights)` despite the Japanese reference using the general
word for aurora; the Chinese retains the southern-lights direction. The
`GDC Demo`, `Kellerac's Sword`, and `Rise of the Morning Sons` labels retain
their source meanings and existing English pairings where present.

## Complete ID Set

- `1500406.quest_bxml`: `28235`
- `1655270.quest_bxml`: `51561`
- `717986.quest_bxml`: `3315`, `12097`, `12735`, `52826`, `60370`, `62074`
- `751643.quest_bxml`: `56993`

All IDs above have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
