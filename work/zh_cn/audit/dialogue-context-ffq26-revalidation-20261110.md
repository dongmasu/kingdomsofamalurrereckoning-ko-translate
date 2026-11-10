# FFQ26 / Ruin Imas Context Revalidation

- Date: 2026-11-10.
- Scope: all 39 `default` keys associated with `747929.quest_bxml`
  (`FFQ26`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID FFQ26`, the asset-level symbol
`NPC_DET_GNO_RuinImas`, and 14 serialized `dialog_line_*` handlers. Its
text concerns Ruin Imas, the mysterious Culminite ore, and the prospects for
Apotyre. The NPC symbol and handler count do not map individual localization
keys to speakers, callbacks, branches, or playback order. All 39 keys were
absent from the review ledger before this pass.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `7299` | naturalness | `이 지역이 새롭게 태어나는 보상에 비하면` awkwardly makes the region's rebirth sound like a reward being given to the region. Prefer `이 금을 가져가. 이 지역이 다시 일어서는 것에 비하면 아무것도 아니야. 모투스 광업(Motus Mining Interests)도 루인 이마스(Ruin Imas)를 무시하면 안 된다는 걸 깨닫겠지.` | High |
| `14146` | meaning / terminology | `Where are the ore deposits?` is rendered `광맥은 어디에 있어?`, but the English says deposits, not a vein. Japanese `鉱床` and Chinese `矿床`, as well as the group's `Culminite deposits` at `3705`, support `광상`. Prefer `광상은 어디에 있어?` | High |
| `24959`, `38114` | format / consistency | Both refer to `Ruin Imas` but pair the Korean `루인 이마스` with only `(Imas)`. Other rows in this group correctly pair the full name. Use `루인 이마스(Ruin Imas)` in both. | High |
| `7835` | format | `Motus headquarters` is rendered `모투스 본부`, while other references in this group pair the proper name with English. Prefer `아데사(Adessa)에 있는 모투스(Motus) 본부`. | Medium-high |

## Holds

No additional source-conflict or insufficient-evidence hold was identified.

## Coverage

All 39 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Four correction findings affect five unique IDs.
Three exact-English duplicate groups already match across all four locales:
`You're speaking of this ore?` (`17961` / `20442`), `If I find enough
samples of this incredible resource...` (`46331` / `47915`), and `Why, yes!
I most certainly am!...` (`57401` / `59296`). No Korean CSV edit was applied.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
