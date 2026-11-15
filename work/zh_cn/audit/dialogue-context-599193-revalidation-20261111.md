# Oasis of Ingress Multi-NPC Asset / `599193.quest_bxml` Revalidation

- Date: 2026-11-11.
- Scope: all 30 `default` IDs linked to `599193.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Findings are holds for conflicting or incomplete evidence. No translation
  CSV was changed.

## Grouping Evidence and Limits

The asset has no explicit `QUEST_ID` and contains nine distinct `NPC_`
symbols, including `NPC_DET_SEE_Aergase`, plus 20 serialized
`dialog_line_*` handlers. The keys concern Mitharu, the Oasis of Ingress,
Alserund, shrine offerings, and several visitors. This is a multi-NPC asset;
the Aergase symbol does not identify the speaker of any particular key.
No localization key is mapped to an individual speaker, handler, branch, or
playback position.

All 30 rows were compared in English, Japanese, Chinese, and active Korean.
The repeated English label `Era Ondrick` at `10249` and `12996` is aligned
across all four languages. No embedded line breaks, runtime placeholders, or
markup occur in the 30 rows.

## Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `39367` | Meaning | English asks whether the traveler came to “confer with Mitharu”; Japanese and Chinese instead ask about making an offering. Korean follows the English with `의논하러 왔나`. Preserve the current English-based reading, but hold the source discrepancy for quest-context evidence rather than silently changing the meaning. |
| `64468` | Speech level / naturalness | The user's earlier concern about the line's plain style remains a valid review question. Japanese presents a formal religious statement, but this multi-NPC asset does not map this key to a speaker or establish that neighboring lines share a voice. Keep the line on hold; do not infer a register error from asset proximity alone. |

Other dialogue and UI rows were retained after source comparison. In
particular, the concise `Voice` and `Hearing Voices` labels, offering
instructions, and the short blessing `Mitharu guide you` fit their respective
text types. Differences in register among the asset's lines are not treated
as a same-speaker inconsistency without speaker evidence.

## Complete ID Set

All IDs below have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv):

`9067`, `10249`, `12996`, `13323`, `13743`, `14391`, `15294`, `15385`,
`19769`, `20746`, `22795`, `28221`, `30399`, `32068`, `34096`, `35054`,
`35867`, `35891`, `37076`, `39367`, `40548`, `42228`, `45150`, `46859`,
`50186`, `50875`, `57421`, `63716`, `64468`, `64606`.
