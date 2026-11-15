# Dialogue Context Revalidation: `545731.quest_bxml`

- Date: 2026-11-14.
- Scope: all 186 `default` IDs linked by the current asset index; 185 have
  matching asset links in the append-only review ledger.
- The asset has no recognized `QUEST_ID`; it contains
  `NPC_POE_LJO_FaitirScath` and 77 dialog-line handlers. These are
  asset-level clues only and do not map any localization ID to an individual
  speaker or establish playback order.
- Ledger-link gap `47830` is recorded here without rewriting the existing
  ledger row.

## Rechecked Findings

| ID(s) | Result |
| --- | --- |
| `1214`, `8617`, `9473`, `11102` | Retained. The exclamation is idiomatic; the Scaith-curse sentence and the quoted name `First` preserve the source meaning. |
| `12243` | Replaced the marked `-오` speech with a direct informal command, consistent with the Japanese imperative and Chinese plain request: `따라와. 조상들의 뼈가 날 쫓지 못하게 장엄한 종(Solemn Bell)까지 호위해 줘야 해!` |
| `13748` | Recast the self-exile sentence as `나는 가문에서 스스로를 추방해야 한다.` The following sentence now uses `가문이나 씨족` for the source's family/clan distinction. |
| `17377` | Clarified the repeated title as `퍼스트(The First)`, matching the capitalized source title and the related Scaith quest context. |
| `20376`, `26357`, `26551`, `31318`, `33266`, `34152`, `35959`, `39140`, `39714`, `49731`, `64130` | The current translations already reflect their supported prior wording or retain a source-specific distinction; no further edit was needed. In particular, the Scaith family, Aster family, ritual-object names, and `First Scaith` references were checked in context. |
| `24455`, `34047`, `39631` | Remain held: the sources do not settle the identity/title of `the First` in `24455` and `34047`, or whether `Scrivener` is a formal office or generic role in `39631`. Asset membership does not resolve these questions. |
| `42583` | Corrected the plural family reference and made the candle-hall explanation natural: `저주에 시달리던 스케이스(Scaith) 가문 사람들은 동족을 찾아다니는 데 열중했어. 그래서 촛불의 전당이 생겼지. 태어날 때마다 초 하나에 불을 붙이고, 죽을 때마다 하나를 껐어.` |
| `45358` | Added the established English title to the reward sentence: `퍼스트(The First)`. Japanese and Chinese identify the First Scaith in this quest context. |

Five IDs (`12243`, `13748`, `17377`, `42583`, and `45358`) were edited in
this asset pass. Existing review dispositions were preserved; only those
IDs' `source_fingerprint` fields were updated.

## Validation

Across all 186 linked rows, the four language tables were checked for
logical line-break counts and brace-token signatures; no mismatches were
found. Exact-English duplicate groups among the three assets' 471 linked IDs
also have matching Korean wording.
