# DLC1 SQ04 Revalidation

- Date: 2026-11-11.
- Scope: all 82 `default` IDs linked to `1957623.quest_bxml`.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Sixteen unique IDs carry correction candidates; ID `9829` remains on hold
  pending confirmation that it is a displayed title. No translation CSV or
  extracted asset was changed.
- The one exact-English duplicate group, `42311`/`44785` (`Where is the
  Tome?`), has matching Korean. Line-break counts and detected
  runtime-token/markup sequences match across all four languages for all 82
  IDs.

## Grouping Evidence and Limits

`1957623.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its
serialized handlers use the `DLC1_SQ04` prefix and include quest-target and
dialogue-line handler names. This supports a DLC1 SQ04 topic grouping only:
the localization keys are not mapped to individual callbacks, speakers,
branches, or playback order.

The rows cover dialogue, player options, objectives, and journal/status text.
The `dialog_line_*` handler count and asset association do not establish that
each matched localization row is spoken dialogue. Per-key speaker attribution
and playback order remain unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `583`, `22815` | Terminology / naturalness | The same English address, `long-legs`, is rendered as `장다리` and `다리 긴 녀석`. The Japanese and Chinese retain the same term in both lines. Consider choosing one Korean core form while inflecting it naturally for the question and direct address. | Medium |
| `1882` | Speech level / naturalness | `Pepin's tardiness is a concern` ends in `걱정되는군`, which sounds stiffer than the conversational Japanese `気掛かりね`. Consider a plain conversational ending such as `페핀이 늦는 게 걱정이야` without assigning a speaker. | Medium |
| `11256`, `14729`, `17902`, `27767`, `32700`, `43918`, `44214`, `47648`, `60614` | Terminology consistency | The same title `Templar` varies within this asset among `템플러`, `성전기사`, `성전 기사`, `템플 기사단원`, and `성전사`. The active corpus also has several competing forms and no settled global choice in the existing terminology records. Align this group only after the project resolves the title; do not assume that the most frequent form is approved. | High |
| `25699` | Naturalness | `깊은 곳에 잠들어 있다` followed by `우리가 되찾을 때까지 잃어버린 채로` is repetitive. Consider keeping the image and the retrieval condition in one clause, e.g. `우리가 되찾을 때까지 언더시 패스팅(Undersea Fasting)의 깊은 곳에 잠들어 있을 거야.` | Medium-high |
| `29050`, `36967` | Speech level / naturalness | The Korean endings `안타깝군` and `아쉽군` are more formal/stiff than the conversational Japanese `残念よ` / `残念ね`. Consider a natural plain-style rendering, but leave speaker identity unknown. | Medium |
| `29564` | Objective style | `Acquire the Tome of Contrition` is rendered as the direct command `획득하라`, unlike the nearby objective forms `...찾기` and `...으로 가기`. Consider the project's concise objective form `참회의 서(Tome of Contrition) 획득하기`. | High |
| `60614` | Meaning / naturalness | In `and a lofty one at that`, Japanese `ノッポ` means tall. Korean `잘난 조수` instead describes an arrogant or distinguished assistant. Replace with a height-related expression, such as `그것도 키 큰 조수를 말이야`. | High |

## Evidence-Limited Hold

| ID | Question | Evidence and disposition |
| ---: | --- | --- |
| `9829` | Whether `The Expedition` is a displayed title | English capitalization suggests a title, while Japanese, Chinese, and Korean render it as a bare label. The asset does not establish whether an English pairing is required for this UI string. Retain `원정` pending confirmation of its display role. |

## Retained Text and Complete ID Set

The other 65 IDs were retained after four-language comparison. The repeated
English `Where is the Tome?` lines match exactly in Korean. `Tome of
Contrition`, `Dverga`, `Pepin`, and `Undersea Fasting` pairings were retained
where present; no broader terminology change was inferred.

Complete asset-linked ID set:

`583`, `1882`, `2325`, `2472`, `2896`, `4277`, `4420`, `5030`, `7236`,
`8011`, `8123`, `8169`, `8391`, `8417`, `8939`, `9829`, `9860`, `10666`,
`13005`, `13750`, `14582`, `14729`, `15534`, `16705`, `18039`, `18647`,
`19161`, `19507`, `21639`, `22515`, `22815`, `23759`, `25223`, `25699`,
`27767`, `29050`, `29272`, `29564`, `31226`, `32040`, `32700`, `35258`,
`36644`, `36784`, `36967`, `38577`, `38807`, `40145`, `40222`, `40504`,
`42311`, `43899`, `43918`, `43964`, `44785`, `45210`, `45343`, `46809`,
`47174`, `49312`, `49368`, `49683`, `49785`, `50469`, `51681`, `52325`,
`53937`, `54598`, `55500`, `55717`, `55784`, `56199`, `57009`, `57905`,
`58100`, `59227`, `60614`, `61277`, `63586`, `64273`, `65007`, `65096`.

Findings remain proposals; no translation CSV changes were applied.
