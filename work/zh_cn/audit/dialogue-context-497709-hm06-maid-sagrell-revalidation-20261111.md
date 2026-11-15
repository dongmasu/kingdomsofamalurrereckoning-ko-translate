# Asset Revalidation: `497709.quest_bxml` (`HM06` handler prefix)

- Date: 2026-11-11.
- Scope: all 81 unique `default` IDs linked to this asset; all 81 were new to
  the review ledger.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Three correction-candidate IDs are recorded. No translation CSV or
  extracted game asset was changed.

## Context Evidence and Limits

The asset has 34 `dialog_line_*` handlers with an `HM06` prefix, but no
explicit `QUEST_ID` or `NPC_...` symbol. Its text concerns the Maid of
Windemere, Sir Sagrell, the Great Cycle, the bell and crystals at Summer's End,
and the Court of Enchantments. These clues support a shared story/topic
grouping only; they do not map localization IDs to individual speakers,
dialogue turns, branches, or playback order. Speaker attribution remains
unassigned and dialogue order unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6853` | Objective format | `Use the whistle` is rendered `호루라기 사용`, while this asset's other action objectives use `-기` forms (`6006`, `9084`, `27073`, `31743`, `52087`). Consider `호루라기 사용하기`. | High |
| `20813` | Speech level / register | The Korean shifts within one utterance from `용서하게` / `잊는군` to `포로일 뿐이야` / `그렇지`. Japanese uses plain conversational forms (`許してくれ`, `忘れるんだ`, `全員がそうだ`) and does not support a one-off elevated `-하게` form. Recast the full utterance in a consistent register; do not infer a specific speaker from asset membership. | Medium-high |
| `33109` | Speech level / register | `I am grateful to you` is translated with formal polite `고맙습니다`, while Japanese `感謝しているぞ` is plain and marked masculine. Consider a plain conversational equivalent such as `고마워` or `고맙다`; the asset does not establish the individual speaker. | Medium-high |

## Repeated Text and Structure

No exact-English duplicate groups occur among these 81 IDs. Four-language
line-break, runtime-token, and markup signatures match for all 81 IDs.
Previously established Maid-title and Khleran/Sagrell name forms were
retained; this review does not reopen historical title questions.

## Complete ID Set

`1056`, `1185`, `1601`, `2337`, `3754`, `3923`, `4154`, `4676`, `5221`,
`5262`, `6006`, `6648`, `6853`, `8370`, `9084`, `9254`, `9569`, `9801`,
`10633`, `11080`, `11561`, `11630`, `11937`, `12539`, `13827`, `13934`,
`14714`, `14893`, `18135`, `18936`, `18988`, `19427`, `20663`, `20813`,
`21387`, `24072`, `25503`, `26129`, `26337`, `26600`, `27073`, `28978`,
`30469`, `31743`, `32615`, `32810`, `33109`, `35654`, `36186`, `37963`,
`39603`, `40043`, `41252`, `41439`, `41712`, `42194`, `47692`, `48093`,
`48138`, `48467`, `48653`, `49111`, `49413`, `49523`, `49995`, `50814`,
`51391`, `52087`, `53753`, `56050`, `56914`, `57602`, `57902`, `58985`,
`59429`, `59723`, `59799`, `61401`, `63686`, `64269`, and `64320`.

The complete four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These review findings are not approval to edit the translation.
