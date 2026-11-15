# Asset Revalidation: `2009109.quest_bxml` (`DLC1_PH05b`, Gravehal Paintings)

- Date: 2026-11-11.
- Scope: all 85 `default` IDs linked to this asset; all 85 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Four correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Context Evidence and Limits

The BXML explicitly contains `QUEST_ID DLC1_PH05b`, the asset-level symbol
`DLC1_NPC_GAL_ALM_BenwickAthelm`, and 20 `dialog_line_*` handlers with the
`DLC1_PH05b` prefix. The current catalog's uppercase-only `QUEST_ID` extractor
does not capture this mixed-case value, so it is recorded here from the
read-only BXML rather than inferred from the handler prefix.

The quest, NPC symbol, and handler names establish asset-level Gravehal
painting context. They do not map individual localization IDs to Benwick, a
specific handler, a branch, or playback order. Speaker attribution remains
unassigned and dialogue order unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `19243`, `59152` | Term / format consistency | The quoted term `thumos` is rendered as `투모스` without its English form, while related IDs `17152` and `28612` use `투모스(thumos)`. Add the English pairing at first mention, preserving each line's distinct painting number and creature objectives. | High |
| `51400` | Meaning / syntax | `what he calls "thumos"` is attached to `그 생명력` (“that vitality”), although the Japanese and Chinese refer to the magical paint/substance. This makes the Korean say he names the life-force itself. Recast the phrase so `투모스(thumos)` names the magical paint/substance, without changing the two objectives. | High |
| `43392` | Naturalness / terminology | In this painting context, generic `paint` is rendered `페인트`, unlike the consistent artistic-material term `물감` used throughout the asset. Consider `물감은 어떻게 구하지?` | High |

## Repeated Text and Structure

Eight exact-English duplicate groups cover 19 rows. Korean is identical within
each group. All 85 IDs have matching four-language line-break, runtime-token,
and markup signatures; no embedded line breaks or format discrepancies were
found.

## Complete Asset ID Set

`2989`, `3074`, `3577`, `4284`, `4531`, `6413`, `6897`, `7468`, `8201`,
`8399`, `9139`, `9978`, `10320`, `11870`, `12399`, `13569`, `13711`,
`14054`, `14227`, `14373`, `15438`, `15665`, `15818`, `17152`, `17464`,
`18116`, `18222`, `19243`, `20661`, `21840`, `22908`, `23146`, `23255`,
`24375`, `25769`, `25912`, `26044`, `26467`, `27363`, `27590`, `28612`,
`29001`, `29626`, `31930`, `33417`, `34656`, `34902`, `34945`, `35496`,
`35676`, `37151`, `38712`, `39760`, `40830`, `41406`, `41784`, `43392`,
`44102`, `44599`, `45219`, `45571`, `45650`, `46629`, `51042`, `51400`,
`52578`, `53223`, `53751`, `54671`, `55461`, `55554`, `56252`, `57739`,
`59147`, `59152`, `59249`, `59827`, `60156`, `60906`, `61519`, `61531`,
`61883`, `62378`, `63825`, and `64896`.

All 85 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These findings are candidates, not approval to edit the translation.
