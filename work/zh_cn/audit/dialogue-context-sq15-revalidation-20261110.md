# SQ15 / Enconeg Holn Context Revalidation

- Date: 2026-11-10.
- Scope: all 47 `default` keys associated with `695918.quest_bxml`
  (`SQ15`).
- Both correction-candidate IDs below were corrected and rechecked against
  the four locale rows. The uncertain kinship readings remain unchanged.
- No extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ15`, the asset-level symbol
`NPC_DAL_STR_EnconegHoln_2`, and 20 serialized `dialog_line_*` handlers. Its
text covers Ettinmere, Enconeg Holn's family, Imelda's grave charm, and the
ettin threat. The NPC symbol and handler count do not map individual
localization keys to speakers, callbacks, branches, or playback order. All
47 keys were absent from the review ledger before this pass.

## Correction Candidates

These source-checked corrections were applied. The table records the
ID-specific wording and evidence used for revalidation.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `30430` | naturalness | `content to die in the house my family built here years ago` is rendered as the stiff `오래전 가족이 지은 이 집에서 죽음을 맞는 것으로 만족하는 늙은이`. Prefer `이제 나는 그저 오래전 가족이 지은 이 집에서 죽음을 맞으면 그만인 늙은이일 뿐이야.` | Medium-high |
| `55832` | naturalness / format | `two-headed bastards` is rendered as `쌍두 놈들`, unlike the established `에틴(Ettin)` name used throughout this group. Prefer `그 빌어먹을 에틴(Ettin)들 중 하나가 그걸 억지로 떼어 갔어. 바보 한 쌍처럼 낄낄거리며 호수로 가져갔지.` | Medium-high |

## Holds

| ID(s) | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `9001`, `18532` | meaning | English `aunt` and Japanese `叔母` do not specify whether this is a maternal or paternal aunt; Chinese differs between these rows as well. Korean currently specifies `이모`. Keep provisional rather than changing it to `고모` without evidence. | Uncertain |

## Coverage

All 47 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Both correction-candidate IDs were applied and
rechecked; the uncertain kinship readings at `9001` and `18532` remain on
hold. Both exact-English duplicate groups
already match across all four locales: `Imelda Holn` (`30433` / `32609`) and
`Ettin` (`46339` / `47916`). No embedded line breaks or markup were found.
The `$SQ15_FIN.m_inn_cost$` token at `26535` appears once in each locale.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
