# SQ118 / Zanvil Whit and Venris Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 51 `default` keys found in `1388540.quest_bxml` (`SQ118`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ118`, the asset-level symbol
`NPC_KLU_DOK_ZanvilWhit`, and 17 serialized `dialog_line_*` handlers. Its text
concerns recovering reconnaissance carried by the Alfar scout Venris, finding
his body in the Midden, and following his wolf.

All 51 exact-key matches were compared at the same ID across active Korean,
English, Japanese, and Chinese `default` tables. The asset association does
not map individual keys to Zanvil, Venris, other speakers, callbacks,
branches, addressees, or playback positions. The NPC symbol is asset-level
evidence only.

## Revalidation Findings

These are read-only review proposals, not approval to edit the active Korean
CSV. `candidate` means an editor decision is warranted.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `439`, `7417`, `14002`, `26167`, `34594`, `41701`, `53293`, `58177` | Terminology / meaning | These rows refer to the same reconnaissance document carried by Venris, but Korean varies among `정찰 문서`, `정찰 자료`, `정찰 보고`, `정찰 기록`, and `정찰 정보`. Japanese repeatedly uses `偵察報告書`; the asset context identifies a recoverable document. The active Korean already uses `정찰 보고서` at `1237`, `1766`, and `20647`. Standardize the identified document references to `정찰 보고서`, preserving each sentence's grammar. | High |
| `49701` | Naturalness | `It was Venris' pet, and also his friend` is translated as `그건 ... 애완동물이자 친구였어`. Referring to the wolf as `그건` sounds object-like despite the explicit friendship. Consider `그 늑대는 벤리스(Venris)의 애완동물이자 친구였어.` | Medium-high |
| `57144` | Name pairing / format | The first `Venris` reference is paired, but the later `벤리스를 찾아` omits the English name while referring to the same person in the same row. Pair that occurrence as `벤리스(Venris)를 찾아`; no other sentence change is needed. | High |

No exact full English strings are duplicated among these 51 keys. All four
locales have zero embedded line breaks and no runtime markers or markup in
these rows. The other 41 rows showed no clearly supported correction in this
pass. Speech/register was checked per utterance; no cross-row voice conclusion
is made without a key-to-speaker mapping.

## Coverage and Limits

All 51 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names/terms, and formatting. The findings are
recorded with four-language source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`439`, `1237`, `1766`, `2888`, `7417`, `7463`, `10265`, `14002`, `16445`,
`20647`, `21430`, `23703`, `26167`, `27696`, `28068`, `30056`, `30615`,
`33051`, `34594`, `34836`, `35448`, `37113`, `37727`, `39100`, `40310`,
`41493`, `41701`, `43389`, `44215`, `44653`, `45506`, `46483`, `47014`,
`47210`, `48447`, `48710`, `49701`, `50380`, `50554`, `51333`, `52827`,
`52874`, `52904`, `53293`, `56345`, `57144`, `57966`, `58177`, `58471`,
`62560`, `64190`.
