# FFQ71 / Knave of Pride Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 34 `default` keys found in `1573776.quest_bxml` (`FFQ71`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ71`, the asset-level symbol
`NPC_MQ_UNS_Knave`, and 13 serialized `dialog_line_*` handlers. Its text
concerns the Knave of Pride, the Bolgan Masters controlling Bolgan forces,
and a request to eliminate the threat at High Fulgen.

All 34 exact-key matches were compared at the same ID across the active
Korean, English, Japanese, and Chinese `default` tables. The asset-level NPC
symbol does not map individual keys to the Knave, other speakers, callbacks,
branches, addressees, or playback positions. ID `30902` explicitly has a
speaker identify himself as the Knave of Pride, but this does not establish
that every asset-linked key is his line.

## Revalidation Findings

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `30028` | Meaning / naturalness | `real nasty` is translated as `정말 사악해`, which says “really evil.” Japanese `たちの悪い` and Chinese `非常讨厌` support a less specific description. Consider `특별한 부류의 마법사들인데, 정말 고약해.` | Medium-high |
| `7581` | Terminology / meaning | `Knave of Pride` is rendered here as `자만의 악당`, but the same title is consistently rendered elsewhere in this group as `교만의 시종(Knave of Pride)`, including the self-identification at `30902` and the return objective at `40923`. Use the established title in both mentions in this journal text. | High |
| `11905` | Naturalness / objective form | `Kill the Tuatha Bolgan Masters` is an objective label. The Korean imperative `... 처치하라` differs from the established `-하기` objective form. Consider `투아사(Tuatha) 볼간 마스터(Bolgan Masters) 처치하기`. | High |
| `30902`, `35843` | Format / name pairing | Both rows explicitly name `Knave of Pride`, while Korean has only `교만의 시종`. Add the missing English pairing at each occurrence: `교만의 시종(Knave of Pride)`. | High |

The exact English duplicate `Hello.` at `19751` and `43113` has identical
Korean, Japanese, and Chinese translations. No other exact English duplicate
group occurs among these 34 keys. No embedded line breaks, runtime markers,
or markup were found.

Speech level and honorifics were checked row by row. The title-holder's
greeting at `30902` shifts from `-오` to a plain question after recognizing
the Hero; Japanese similarly shifts from a formal address to a plain
question, so this was not marked as a Korean-only register defect. The
remaining apparent dialogue showed no clearly supported abrupt
speech-level or honorific mismatch.

## Coverage and Limits

All 34 asset-linked IDs were reviewed for content type, meaning, Korean
naturalness, speech level, address, honorifics, terminology, and format as
applicable. The findings and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`269`, `4204`, `4895`, `7581`, `11852`, `11905`, `16184`, `19298`, `19692`,
`19709`, `19751`, `24841`, `27777`, `28526`, `29552`, `30028`, `30902`,
`35843`, `40518`, `40923`, `44309`, `45363`, `46112`, `48149`, `49053`,
`49625`, `50511`, `50751`, `51921`, `52788`, `58377`, `61232`, `61687`,
`62945`.
