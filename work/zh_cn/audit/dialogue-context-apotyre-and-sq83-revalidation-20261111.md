# Apotyre Mining and Brownie Quest Assets Revalidation

- Date: 2026-11-11.
- Scope: 71 previously unrecorded `default` IDs across
  `749396.quest_bxml` (35) and `1254943.quest_bxml` (36).
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Three correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Grouping Evidence and Limits

`749396.quest_bxml` has no explicit `QUEST_ID` or NPC symbol and contains
12 `dialog_line_*` handlers with the `Apotyre_NQD` prefix. Its text spans the
Skoria, Darkvari, Cynric, and Zungar mining families and the dispute over
Skoria Mine; this supports an Apotyre topic grouping, not one speaker or
conversation.

`1254943.quest_bxml` has no explicit `QUEST_ID` or NPC symbol and contains
13 `dialog_line_*` handlers with the `SQ83` prefix. Its content concerns
Sihtric Vorm and the aggressive Brownies along the road to Detyre. The prefix
supports an SQ83-related grouping, but does not prove that each key belongs
to Sihtric, a particular handler, branch, or playback position. ID `62380`
explicitly self-identifies its speaker as Sihtric Vorm; this evidence applies
only to that line.

All 71 rows were compared in English, Japanese, Chinese, and active Korean.
The repeated `Mayor Eswin` label at `4571` and `6933` has the same Korean
translation. No embedded line breaks, runtime placeholders, or markup occur
in these rows.

## Correction Candidates

| ID | Asset / dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `45468` | `749396` / naturalness | `They're the second oldest family in Apotyre, and headed for a prison, or the graveyard` is rendered with `그리고 지금은`, adding a present-time claim and making the threat sound like a current destination. Consider `아포타이어(Apotyre)에서 두 번째로 오래된 가문이야. 결국 감옥이나 묘지에 갈 처지지.` | Medium-high |
| `47202` | `1254943` / naturalness | `savagely ambushed` is rendered `잔혹하게 습격당했다`, an awkward adverb-plus-passive construction. Consider `브라우니(Brownies)에게 맹렬한 기습을 당했다고 하더군.` | Medium |
| `62380` | `1254943` / speech level | The self-identified Sihtric line uses marked Korean `환영하오` / `이오`, while Japanese uses plain conversational forms (`ようこそ` / `だ`). Consider a natural plain-style version such as `시드(Sidhe)에 있는 우리 안식처에 온 걸 환영해. 나는 시트릭 보름(Sihtric Vorm)이야.` This is a row-level comparison, not a claim about Sihtric's other lines. | Medium |

## Retained Text

The other 68 rows were retained after comparison. Repeated topic terms and
asset-level handler prefixes were not treated as proof that dialogue-like
lines share a speaker. Other greetings, refusals, and short conversational
responses were judged individually; no cross-row voice normalization was
applied without per-key evidence.

## Complete Newly Reviewed ID Sets

- `749396.quest_bxml`: `1637`, `3578`, `4571`, `6933`, `7013`, `7431`,
  `9669`, `15186`, `16990`, `23284`, `24184`, `24552`, `25040`, `26408`,
  `32149`, `32183`, `36601`, `37352`, `39494`, `39918`, `40555`, `42375`,
  `45468`, `45840`, `48795`, `48957`, `51137`, `52114`, `55666`, `56030`,
  `57582`, `58477`, `59104`, `60729`, `64214`.
- `1254943.quest_bxml`: `4581`, `5065`, `5466`, `9634`, `10374`, `16826`,
  `17859`, `19066`, `19257`, `21622`, `24727`, `29412`, `32715`, `33455`,
  `38247`, `38462`, `40981`, `42804`, `43816`, `44409`, `44610`, `47059`,
  `47202`, `49073`, `50532`, `51252`, `51463`, `52274`, `54042`, `55486`,
  `57320`, `58386`, `59486`, `62380`, `62407`, `63419`.

All 71 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
