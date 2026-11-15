# Dialogue Context Revalidation: `587818.quest_bxml`

- Date: 2026-11-14.
- Scope: all 174 `default` IDs linked by the current asset index; 172 have
  matching asset links in the append-only review ledger.
- The asset has no recognized `QUEST_ID`; it contains
  `NPC_DET_SEE_Cadoroc` and 58 dialog-line handlers. These are asset-level
  clues only and do not map any localization ID to an individual speaker or
  establish playback order.
- Ledger-link gaps `47844` and `47856` are recorded here without rewriting
  existing ledger rows.

## Rechecked Findings

| ID | Result |
| ---: | --- |
| `52` | Register remains held: Japanese is blunt and informal while Korean is elevated; no per-line speaker or relationship is established. |
| `3447` | The active `독에 당해 죽어 가는` wording is concise and preserves the poison condition; no further change. |
| `5195` | Revised to `네가 준비도 없이 우리 집단이 겪는 문제에 맞서도록 할 시간은 없어.` This improves the sentence while keeping the capitalized `House` referent general; its exact institutional meaning remains unresolved. |
| `8749`, `9673` | The House of Sorrows and Winter Fae references are already paired and consistent with their source rows. |
| `19432`, `34220`, `42791` | The current Korean preserves the offer's necessity, the choice of aiding the House or opposing the Tuatha, and the test of worth. No supported change was found. |
| `20671` | The active Korean already reads `예전 같았으면 페이(Fae)들은... 이런 독에 취약하지 않았을 텐데...`; this pass did not edit it. This differs from the `20500`-`20749` application report, which says the candidate was cleared without a CSV edit. English `In other times`, Japanese `普通`, and Chinese `曾几何时` do not fully agree on ordinary versus past-time meaning. The current text was preserved and its fingerprint reconciled; the source nuance remains documented as unresolved. |
| `36618` | The active wording `페이의 처지는 미묘하다` reflects the already-applied correction; no additional change. |
| `44238` | Retained. Japanese differs from the related English duplicate at `27910`, and Korean preserves that distinction. |
| `56275`, `60660` | No new source evidence resolves the prior meaning/context questions. The current text was retained rather than inferring a speaker from the asset. |

Only `5195` was edited in this asset pass. The existing review dispositions
were preserved; only its `source_fingerprint` was updated.

## Validation

Across all 174 linked rows, the four language tables were checked for
logical line-break counts and brace-token signatures; no mismatches were
found. Exact-English duplicate groups among the three assets' 471 linked IDs
also have matching Korean wording.
