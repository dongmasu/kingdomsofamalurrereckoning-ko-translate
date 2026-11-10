# SQ116 / Drewn Ansilla Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 60 `default` keys found in `1388321.quest_bxml` (`SQ116`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ116`, the asset-level symbol
`NPC_KLU_DOK_DrewnAnsilla`, and 20 serialized `dialog_line_*` handlers. Its
text concerns Drewn Ansilla's claim to the Caeled Coast, the Seal of Ansilla
and Verdant Blades, and Hillared Gastyr and the family rivalry.

All 60 exact-key matches were compared at the same ID across active Korean,
English, Japanese, and Chinese `default` tables. The asset association does
not map individual keys to Drewn, Hillared, other speakers, callbacks,
branches, addressees, or playback positions. The NPC symbol is asset-level
evidence only.

## Revalidation Findings

These are read-only review proposals, not approval to edit the active Korean
CSV. `candidate` means an editor decision is warranted.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `9734`, `31179`, `37757`, `43136`, `46678` | Terminology / name consistency | The same named `Verdant Blades` appears as `베르던트 블레이드`, `푸른 칼날`, and `초록 칼날들`, with missing English pairing. IDs `32241` and `33619` already use the same Korean `푸른 칼날(Verdant Blades)`. Align the five references to that established form without changing sentence structure. At `31179`, English and Japanese say only that the blades belonged to Drewn's father; `유품` adds an heirloom/remembrance nuance. Consider `푸른 칼날(Verdant Blades)은 아버지의 것이었어.` | High |
| `27442` | Meaning / naturalness | `You must go after the Blades and Seal` is translated as `칼날과 인장을 찾아가야 해`, which can mean going to the items. Japanese explicitly says to search for them. Consider `칼날과 인장(Blades and Seal)을 찾아야 해.` | High |
| `30065` | Meaning | `I hope you find them` refers to the sought heirlooms. Chinese uses an inanimate pronoun; Korean `그들을` refers to people. Consider `그것들을 찾길 바라.` | High |
| `57384` | Terminology / title | In `The Blades and the Seal`, Korean uses `봉인`, whereas the same quest's `Seal of Ansilla` and repeated `Blades and Seal` references use `인장`. Japanese uses `紋章`, and the item is the Ansilla medallion, not an act of sealing. Use the consistent title form `칼날과 인장(Blades and Seal)`. | High |
| `46149`, `58192` | Name pairing | English capitalizes the shortened name `Hill`; Korean renders it as `힐` without English, while the Japanese and Chinese also preserve the nickname. Consider `힐(Hill)` at these two explicit name references. | High |
| `56179` | Naturalness | `those last few moments with Hillared` is rendered as `마지막 순간 몇 장면`, an awkward phrase. Japanese and Chinese also describe remembered moments. Consider `힐러레드(Hillared)와 함께한 마지막 몇 순간이 자꾸 떠올라.` and preserve the following memory fragments. | Medium-high |

Three exact-English duplicate groups occur within the asset, and all have
identical Korean text:

| IDs | English |
| --- | --- |
| `10134`, `15698` | `Hillared Gastyr` |
| `32241`, `33619` | `Take the Verdant Blades. You must. I do not wish to rule my new domain with fear and fire. The Seal is enough. And so a new age begins...` |
| `50241`, `54707` | `What are you doing here?` |

All four locales have zero embedded line breaks and no runtime markers or
markup in these 60 rows. The other 49 rows showed no clearly supported
correction in this pass. The polite/plain differences in separate rows were
not attributed to one speaker because no key-to-speaker mapping is established.

## Coverage and Limits

All 60 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names/terms, and formatting. The findings are
recorded with four-language source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`4726`, `5022`, `8212`, `9734`, `10134`, `10576`, `11625`, `12397`, `12847`,
`13154`, `14315`, `14613`, `15698`, `18137`, `20775`, `25174`, `25951`,
`27442`, `27844`, `28246`, `28358`, `28474`, `28882`, `28994`, `29195`,
`29677`, `29702`, `30065`, `30924`, `30957`, `31179`, `32241`, `33619`,
`34319`, `35227`, `37510`, `37757`, `39528`, `39896`, `41528`, `41855`,
`43136`, `43838`, `45344`, `46149`, `46678`, `48831`, `50241`, `52414`,
`52784`, `52926`, `54707`, `56179`, `57384`, `58192`, `61360`, `62784`,
`63425`, `63804`, `64791`.
