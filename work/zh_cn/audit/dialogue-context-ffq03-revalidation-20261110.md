# FFQ03 / Murdoc Hain Context Revalidation

- Date: 2026-11-10.
- Scope: all 41 `default` keys associated with `495487.quest_bxml`
  (`FFQ03`).
- All 10 correction-candidate IDs below were corrected and rechecked against
  the four locale rows. The two source/context readings remain on hold.
- No extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID FFQ03`, the asset-level symbol
`NPC_DAL_VAR_MurdocHain`, two quest-target handlers, and 16 serialized
`dialog_line_*` handlers. Its text concerns Murdoc Hain's fire potions, the
reagents Tindertwig and Scarwood Bark, and the village militia's boggart
problem. The NPC symbol and handler count do not map individual localization
keys to speakers, callbacks, branches, or playback order. All 41 keys were
absent from the review ledger before this pass.

## Correction Candidates

These source-checked corrections were applied. The table records the
ID-specific wording and evidence used for revalidation.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `15055`, `18883`, `21385`, `43289`, `50951` | meaning / terminology | The same English `reagents` is rendered as both `시약` and `재료`. The quest identifies the reagents as plant ingredients; Japanese uses `素材`, and other rows in this group already use `재료`. Prefer `15055` `어떤 재료가 필요해?`, `18883` / `21385` `재료를 가져왔어.`, `43289` `제대로 된 재료만 있다면 얼추 비슷한 건 만들어 낼 수 있어.`, and `50951` `그럼 재료를 가져올게.` | High |
| `23436` | meaning / naturalness | In `Where can I find them?`, `them` refers to reagents, but `그들을` refers to people. Japanese asks where to search. Prefer `어디서 찾으면 돼?` | High |
| `8159`, `34790`, `37011`, `62312` | meaning / terminology / naturalness | Fire potions are rendered inconsistently as `불 물약`, `물약`, `불꽃 물약`, and `불기운`. Japanese consistently identifies these as fire-attack potions; `52601` already uses `화염 물약`. Prefer `8159` `그러니까 화염 물약이 필요해.`, `34790` `민병대의 화염 물약 재고가 바닥났고, 연금술사를 잃은 지도 거의 한 달 됐어.`, `37011` `머독 헤인(Murdoc Hain)은 간단한 화염 물약을 만들 수 있지만...`, and `62312` `민병대도 물약 없이 버틸 수는 있지... 그래도 화염 물약이 조금만 있어도 아픈 사람과 죽는 사람을 줄일 수 있어.` Keep the separate `Fire Damage` term at `3483` / `5859` distinct as `화염 피해`. | High |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `2160` | terminology | `Blazing Salve Potions` is rendered `화염 연고 물약`; Japanese uses a generic fire-attack-potion term, while the English may identify a distinct salve item. Keep provisionally until the item naming is established. | Uncertain |
| `3918` | meaning | English `wooden little things` and Chinese suggest wooden things, while Japanese says small creatures like trees. The current `나무로 만든 작은 것들` follows one plausible reading; do not replace it with `생명체` without firmer context. | Uncertain |

## Coverage

All 41 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Three correction findings affect 10 unique IDs;
two source/context readings remain unresolved. Three exact-English duplicate
groups already match across all four locales: `Here is a fire damage
potion.` (`3483` / `5859`), `Here are some reagents.` (`18883` / `21385`),
and the Tindertwig / Scarwood Bark location sentence (`50439` / `54169`).
All 10 correction-candidate IDs were applied and rechecked. The findings at
`2160` and `3918` remain on hold.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
