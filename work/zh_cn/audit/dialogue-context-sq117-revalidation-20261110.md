# SQ117 / Malthon and Meathgra Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 42 `default` keys found in `1388507.quest_bxml` (`SQ117`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ117`, the asset-level symbol
`NPC_KLU_UNS_Malthon`, and 13 serialized `dialog_line_*` handlers. Its text
concerns Malthon's request to kill the leanashe Meathgra by removing her food
source, and the danger posed by corpses in the Midden.

All 42 exact-key matches were compared at the same ID across active Korean,
English, Japanese, and Chinese `default` tables. The asset association does
not map individual keys to Malthon, other speakers, callbacks, branches,
addressees, or playback positions. The NPC symbol is asset-level evidence
only.

## Revalidation Findings

These are read-only review proposals, not approval to edit the active Korean
CSV. `candidate` means an editor decision is warranted; `uncertain` preserves
an unresolved reading rather than proposing a speculative correction.

| ID(s) | Dimension | Evidence and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1869` | Meaning | `wise to obvious attacks on her` is translated as `뻔한 공격쯤은 대비하고 있거든`, which says she prepares for obvious attacks. Japanese says she notices them and Chinese says she can detect them. Consider `미스그라(Meathgra)는 오래 살아서 뻔한 공격쯤은 금방 알아채.` | High |
| `3125` | Speech level / naturalness | The same utterance asks `미든(The Midden)의 시체는 처리했나?` and then `미스그라(Meathgra)를 유인해 냈어?`, shifting from `-나?` to `-어?`. English, Japanese, and Chinese keep the two questions parallel. Use one register consistently, e.g. `미든(The Midden)의 시체는 처리했나? 미스그라(Meathgra)는 유인해 냈나?` | High |
| `40074`, `64964` | Terminology | Both English rows explicitly say `cremate`, but Korean uses `불태워`; other rows in this quest use the more precise `화장하다` for `cremate` (`13321`, `43163`, `60201`). Use `화장해` in these instructions while preserving their different sentence structures. | High |
| `43163` | Naturalness | `Cremate the Newly Dead` is rendered as `새로 죽은 자 화장하기`, which reads awkwardly as an objective. Japanese and Chinese also describe newly dead bodies. Consider `갓 죽은 시신 화장하기.` | Medium-high |
| `56084` | Terminology / unresolved reference | English calls the destination `her den`, while Korean uses `은신처`; the same creature's `den` is otherwise `굴` in this group. Consider aligning that term to `굴`. The capitalized `the House` may refer to the House of Sorrows, but Japanese and Chinese omit that reference and the key has no scene-level mapping; retain `그 집` pending stronger evidence rather than expanding it. | Terminology: high; reference: uncertain |

No exact full English strings are duplicated among these 42 keys. All four
locales have zero embedded line breaks and no runtime markers or markup in
these rows. The other 36 rows showed no clearly supported correction in this
pass. The distinct formal/plain lines were assessed individually; no
cross-row speaker-voice conclusion is made without a key-to-speaker mapping.

## Coverage and Limits

All 42 asset-linked IDs were reviewed for meaning, Korean naturalness,
register where applicable, names/terms, and formatting. The findings are
recorded with four-language source fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV or extracted game asset was changed.

The key-to-callback mapping, individual speakers, branch flow, addressee, and
playback order remain unknown. Asset membership and callback serialization
order are not treated as proof of those details.

The full ID set is:

`1039`, `1869`, `3125`, `4278`, `5510`, `6913`, `8355`, `9164`, `13321`,
`16708`, `17089`, `21127`, `21192`, `21194`, `21967`, `22883`, `23477`,
`24010`, `25863`, `26234`, `26295`, `28727`, `28761`, `28878`, `32814`,
`34991`, `39733`, `40074`, `40268`, `43163`, `45882`, `46363`, `49918`,
`51414`, `52317`, `54918`, `56084`, `60201`, `60545`, `61246`, `63067`,
`64964`.
