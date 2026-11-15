# Dialogue Context Revalidation: `518702.quest_bxml` (`SQ15`)

- Date: 2026-11-14.
- Scope: all 108 `default` IDs linked by the current asset index; all 108
  have matching asset links in the review ledger.
- The asset explicitly contains `QUEST_ID SQ15`, NPC symbols
  `NPC_DAL_STR_EnconegHoln` and `NPC_DAL_STR_EnconegHoln_2`, and 36
  dialog-line handlers. These support the SQ15 quest grouping only. They do
  not map localization IDs to individual speakers, branches, or playback
  order.
- The separate `695918.quest_bxml` asset also belongs to SQ15 and has no
  overlapping localization IDs with this asset. Its prior review does not
  establish a speaker mapping for this asset.

## Rechecked Findings

| ID(s) | Result |
| --- | --- |
| `19467` | The existing `님프(Nymph)` pairing already matches the source-anchored quest label. |
| `6769`, `13350`, `45454`, `48234`, `65022` | Added the missing `Nymph` pairing to the same capitalized recurring label. Generic lowercase `nymph` dialogue was not globally annotated. `13350` and `48234` remain identical after the edit. |
| `26939` | The earlier wording `엔코네그(Enconeg)는 내 도움에 보답했다` was subsequently refined to `엔코네그(Enconeg)는 고마움의 표시로 내게 보상을 줬다`, making the recipient explicit. See `dialogue-context-26750-26999-candidate-reconciliation-20261114.md`. |
| `27012` | Retained `물고기 같은 부분만 빼면 말이지`. English's `fishy` is supported as a fish-related joke by the fishing context and Chinese; Japanese is less explicit. No stronger correction is supported. |
| `62077` | Remains held. English `my Imelda` and the Japanese and Chinese rows do not establish the exact relationship. A separate line in the asset mentions a wife named Imelda, but the asset does not map these keys to one speaker, so that line cannot resolve this row. |

The previous ledger dispositions were preserved. Only the five edited IDs'
`source_fingerprint` fields were refreshed.

## Cross-Checks

All 108 linked rows were checked against English, Japanese, Chinese, and the
current Korean text. The five exact-English duplicate groups
(`1511`/`28678`, `15639`/`39515`, `34634`/`36255`/`37927`/`40072`,
`62071`/`63779`, and `62221`/`64604`) have identical Korean within each
group. No logical line-break or brace-token signature mismatch was found.

The translations use several registers across quest dialogue, journal text,
and UI labels. Because no individual speaker mapping is established, no
cross-line voice or playback-order claim was made.
