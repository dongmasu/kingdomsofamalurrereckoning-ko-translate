# Headhunter and Chaos Portal Quest Assets Revalidation

- Date: 2026-11-11.
- Scope: 54 previously unrecorded `default` IDs across
  `2604201.quest_bxml` (27) and `2606001.quest_bxml` (27).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Five correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Grouping Evidence and Limits

Neither asset contains an explicit `QUEST_ID`, `NPC_` symbol, or
`dialog_line_*` handler. Their text supports two separate topic groups:
Crownhold's Headhunters and Chaos Portals / Hearts of Chaos. The groups are
not one conversation or character set. Each asset includes mixed journal,
objective, title, and dialogue-like text; no individual speaker, addressee,
callback, branch, or playback order can be assigned from these asset links.

All 54 previously unrecorded rows were compared in English, Japanese,
Chinese, and active Korean. The generic `Quest Complete` ID `60633` is also
linked to both assets but was already recorded as a shared UI label and is
not counted as a new row. Repeated `I have Hearts of Chaos.` rows (`16345`,
`30832`, `35848`) have identical Korean, as do the `Hearts of Chaos` labels
at `14171` and `59093`. No embedded line breaks, runtime placeholders, or
markup occur in these 54 rows.

## Correction Candidates

| ID(s) | Asset / dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `54727`, `61586` | `2604201` / terminology | The same `Warden` role is rendered as `관리관` at `54727` and `교도관` at `61586`, while `18395` in this group already uses `감시관`. Align the role to `감시관` after checking the two sentence contexts. | High |
| `9493` | `2604201` / objective style | `Deliver the Headhunter tokens` is an objective label, but Korean uses the imperative `전달하라`. Align it with the established `-기` objective style, e.g. `헤드헌터단원(Headhunter)의 표식 전달하기`. | High |
| `28356` | `2606001` / naturalness | `I can feel it in the air` is rendered literally as `공기에서 느껴져`, which is awkward Korean. Consider `공기만으로도 느껴져… 질서가 회복되고 있어.` | Medium |
| `29616` | `2606001` / terminology | The `nodes` that sustain the portals are called `결절` here, but the same asset uses `노드` at `45567`; Japanese also uses `ノード`. Use `노드` consistently. | High |

## Retained Text

The other 49 newly reviewed rows were retained. This includes the
Headhunters' token / “head” wordplay, the five leaders' mercenary groups, and
the Chaos Portal and Chaos Heart descriptions. Their presence in the same
asset does not establish a shared speaker or voice. No register changes were
inferred from asset-level association.

## Complete Newly Reviewed ID Sets

- `2604201.quest_bxml`: `1655`, `7074`, `9493`, `15729`, `16735`, `17827`,
  `18395`, `31371`, `34508`, `35922`, `36306`, `36963`, `39245`, `40062`,
  `41074`, `41175`, `42819`, `46318`, `47927`, `51799`, `52264`, `54727`,
  `57407`, `60405`, `61276`, `61586`, `62748`.
- `2606001.quest_bxml`: `489`, `7823`, `14171`, `16345`, `18662`, `18790`,
  `26454`, `28349`, `28356`, `29616`, `29624`, `30832`, `31500`, `35848`,
  `45567`, `48089`, `48368`, `48987`, `51577`, `54996`, `57304`, `58501`,
  `59093`, `60145`, `61500`, `62134`, `63772`.

All 54 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
