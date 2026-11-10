# FFQ26 / Ruin Imas Context Revalidation

- Date: 2026-11-10.
- Scope: all 39 `default` keys associated with `747929.quest_bxml`
  (`FFQ26`).
- Four correction-candidate IDs were corrected and rechecked against all
  four locale rows. ID `7835` was retained because its proposed English
  pairings were already present.
- No extracted game asset was modified.
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

The source-checked corrections below were applied. ID `7835` was rechecked
and retained as already compliant.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `7299` | naturalness | `이 지역이 새롭게 태어나는 보상에 비하면` awkwardly makes the region's rebirth sound like a reward being given to the region. Prefer `이 금을 가져가. 이 지역이 다시 일어서는 것에 비하면 아무것도 아니야. 모투스 광업(Motus Mining Interests)도 루인 이마스(Ruin Imas)를 무시하면 안 된다는 걸 깨닫겠지.` | High |
| `14146` | meaning / terminology | `Where are the ore deposits?` is rendered `광맥은 어디에 있어?`, but the English says deposits, not a vein. Japanese `鉱床` and Chinese `矿床`, as well as the group's `Culminite deposits` at `3705`, support `광상`. Prefer `광상은 어디에 있어?` | High |
| `24959`, `38114` | format / consistency | Both refer to `Ruin Imas` but pair the Korean `루인 이마스` with only `(Imas)`. Other rows in this group correctly pair the full name. Use `루인 이마스(Ruin Imas)` in both. | High |
| `7835` | format | The current text already says `아데사(Adessa)에 있는 모투스(Motus) 본부`, so both proper-name pairings are present. Retain unchanged. | High |

## Holds

No additional source-conflict or insufficient-evidence hold was identified.

## Coverage

All 39 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Three correction findings affecting four unique IDs
were applied and rechecked. The format candidate at `7835` was retained as
already compliant.
Three exact-English duplicate groups already match across all four locales:
`You're speaking of this ore?` (`17961` / `20442`), `If I find enough
samples of this incredible resource...` (`46331` / `47915`), and `Why, yes!
I most certainly am!...` (`57401` / `59296`). No extracted game asset was
changed.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
