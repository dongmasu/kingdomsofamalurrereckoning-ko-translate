# Dialogue Context Revalidation: `528134.quest_bxml` (`SQ18`)

- Date: 2026-11-14.
- Scope: all 111 `default` IDs linked by the current asset index. The ledger
  has all 111 IDs; ID `47722` records the asset as `528134` without the
  `.quest_bxml` suffix. Preserve that historical ledger value.
- The asset explicitly contains `QUEST_ID SQ18`, nine NPC symbols, and 40
  dialog-line handlers. These establish quest-level grouping only; they do
  not map an individual localization ID to a speaker, branch, or playback
  order.

## Accepted Corrections

English establishes meaning; Japanese is the primary reference for voice and
layout; Chinese provides supporting evidence. The edits below are scoped to
the listed IDs and do not infer a speaker.

| ID(s) | Finding and correction |
| --- | --- |
| `1393`, `51144` | These journal sentences differ only in the named quest-giver. English, Japanese, and Chinese use the same wording otherwise. Align the Korean wording for the Widow's death, the end of the spider infestation, the Canneroc Inn, and Webwood becoming safe; retain the correct Barten/Garaner name in each row. |
| `12043` | Correct the inconsistent `카스로스(Cathrus)` spelling to the established default-resource form `캐스러스(Cathrus)`. |
| `12599` | Japanese and Chinese identify the `Hollow of Cathrus` as a cave. Replace the unnatural `캐스러스(Cathrus)의 공동` with `캐스러스 동굴(Hollow of Cathrus)`; preserve the quest-log meaning. |
| `14971` | Add the English pairing to the unpaired location and smooth the phrase to `캐스러스(Cathrus)로 물러난다고`. |
| `40677` | Pair both mentions of the location as `캐스러스(Cathrus)`; preserve the chase and guardian-spider meaning. |
| `48889` | Standardize the location in the objective as `캐스러스(Cathrus)`. |
| `52462` | Standardize `카스루스(Cathrus)` to `캐스러스(Cathrus)` within this SQ18 entry. |
| `55931` | Correct `캐서러스(Cathrus)` to `캐스러스(Cathrus)` and preserve the urgency of the request. |
| `14841` | Recast the entire line in natural, consistent plain speech: `요르반 성(Castle Yolvan)에서 온 필멸자구나. 도망쳐 나왔다니 정말 성가시네. 너희 필멸자들은 고집까지 부려 성가셔.` The asset does not identify the individual speaker. |
| `50729` | Japanese `ごますり屋` and Chinese `马屁精` mean a flatterer/sycophant, not a slave. Replace `종놈아` with `아첨꾼아`. |
| `47218` | Replace the literal, awkward “share a quality” construction with `인내는 우리 종족의 본성이야. 너희에겐 없는 자질이지.` Naturalize the remaining anticipation clause while preserving the challenge. |
| `54433` | Naturalize the “brutal in your own form” line as `너도 너만의 방식으로 잔혹하다는 건 알아.` Keep the amnesty and Canneroc lives bargain intact; render `nor am I unreasonable` without adding an unstated demand. |

The current `base:2346` rendering of `Cathrus` is outside this `default`
dialogue review. This report standardizes only the listed SQ18 `default`
entries and does not claim that all cross-resource occurrences have been
resolved.

## Rechecked Findings

| ID(s) | Result |
| --- | --- |
| `11177` | The meaning of `new brood` remains context-sensitive. The current `새로운 무리` is retained; the quest asset does not map this line to a speaker. |
| `12257` | `Widow take us` remains ambiguous as an oath/curse across the references. Do not choose an interpretation based on asset association alone. |
| `12306` | The source's deliberately unusual threat about lacking sympathy to kill the addressee personally remains ambiguous; retain the translation. |
| `14841` | The earlier mixed-ending candidate was rechecked against the current row and the complete source. It is handled by the accepted full-line rewrite above; no individual speaker is inferred. |
| `31911` | The previously accepted naturalness correction is already present; no additional edit is needed. |
| `39393`, `42477` | The question about finding the Widow is accurately translated and paired; retain both. |
| `61935` | The line's honorific/register remains uncertain without per-key speaker evidence. Do not infer the speaker from the asset's NPC list or handlers. |

## Cross-Checks

- All 111 linked rows were compared across English, Japanese, Chinese, and
  current Korean.
- Seven exact-English duplicate groups covering 20 linked rows have matching
  Korean within each group.
- Logical line-break counts and brace-token signatures match across all four
  languages for all 111 linked rows.
- Keep existing ledger dispositions, row order, and non-fingerprint fields.
  Refresh only `source_fingerprint` for IDs whose Korean text changes.

## Verification

All 13 accepted corrections were applied to their ID-specific Korean
`Texto` fields. Only their ledger `source_fingerprint` values were refreshed;
the existing dispositions, row order, and other ledger fields were preserved.
The historical asset-link suffix discrepancy at `47722` remains unchanged.

The 65,135-ID review ledger validates against the four language tables, and
the generated quest index and both context catalogs reproduce exactly. All
20 CSV-preservation and context-index tests pass. The active Korean CSV keeps
its 65,135 ordered records, UTF-8 BOM, 71,838 CRLF sequences, 244 LF-only
sequences, and no bare CR. The CRLF-aware diff check passes. No source CSV or
extracted game asset was modified, and no commit was made.
