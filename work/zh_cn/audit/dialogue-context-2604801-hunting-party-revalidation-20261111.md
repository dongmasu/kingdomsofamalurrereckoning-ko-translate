# Asset Revalidation: `2604801.quest_bxml` (Mithros Hunting Party topic)

- Date: 2026-11-11.
- Scope: all 55 `default` IDs linked to this asset. Fifty-four were new to
  the ledger; shared UI ID `60633` had already been reviewed and already
  listed this asset among its 44 links.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Six correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Context Evidence and Limits

The BXML contains the conditions `player_has_trophy_1` through
`player_has_trophy_4`, but no explicit `QUEST_ID`, `NPC_...` symbol, or
`dialog_line_*` handler. The linked text describes Brogan MacQueen's hunting
party, the House of Valor, and the so-called Giants of Mithros. These clues
support a hunting-party topic grouping only; exact key matches do not map
individual IDs to speakers, turns, branches, or playback order. Speaker
attribution remains unassigned and dialogue order unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `20473` | Meaning / proper-name consistency | `Tyr Magnus, the House Champion` is rendered `발라드의 집 챔피언 티르 매그너스`. The surrounding quest explicitly identifies the fighters as the House of Valor (`용맹의 집`, e.g. IDs `12520` and `64292`), not the House of Ballads. Correct the affiliation to the House of Valor and keep the champion title clear. | High |
| `22072`, `31881`, `41217` | Objective style | These `Kill the ...` objectives end in `처치`, while the same set uses `처치하기` at ID `55949` and other objectives use concise `-기` forms. Align these labels to the established objective style, e.g. `뿌리 골렘(Root Golem) 처치하기`. | High |
| `33825` | Naturalness / context | `I'll join the party` is `무리에 합류할게`. In this quest `party` means Brogan's hunting party (`사냥대`), not a generic group or animal herd. Consider `사냥대에 합류할게`. | High |
| `46634` | Meaning / naturalness | `the good hunting's all in Mithros` is rendered `미스로스에서 사냥이 잘돼`, which can mean that the speaker personally hunts successfully there. Preserve the source's point that the best hunting is in Mithros, e.g. `요즘 좋은 사냥감은 다 미스로스에 있어`. | Medium-high |

## Repeated Text and Structure

No exact-English duplicate groups occur among the 55 IDs. The four-language
line-break counts, runtime-token sequences, and detected markup signatures
match for every ID. No embedded line breaks, runtime placeholders, or markup
occur in these rows.

## Complete ID Set

`2066`, `2482`, `3758`, `4641`, `5500`, `7979`, `8035`, `9178`, `9348`,
`10259`, `12520`, `13772`, `15834`, `17085`, `17730`, `18197`, `19674`,
`20473`, `20544`, `20878`, `21136`, `22072`, `24505`, `25430`, `25492`,
`25751`, `27349`, `28045`, `30577`, `30643`, `31216`, `31881`, `32540`,
`33825`, `36915`, `38607`, `38629`, `41217`, `44338`, `46634`, `48411`,
`50425`, `51500`, `53036`, `53096`, `54966`, `55754`, `55949`, `56367`,
`57468`, `58061`, `60633`, `61406`, `64292`, and `64644`.

The 54 new four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
ID `60633` retains its existing shared-UI ledger record. These review findings
are not approval to edit the translation.
