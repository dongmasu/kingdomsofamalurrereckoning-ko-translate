# M0_SQ06 / Ratofer's Sale Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 193 `default` keys in `361668.quest_bxml` (`M0_SQ06`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID M0_SQ06`, the asset-level symbol
`NPC_POE_VAR_AskelThorin`, and 51 serialized `dialog_line_*` handlers. Its
scripts also reference `M0_NPC_LordRatofer`, and the quest revolves around
Ratofer asking the player to sell his belongings. Other text concerns buyers,
the townspeople, dialogue choices, quest objectives, journal entries, and
status labels. These asset-level references do not map individual
localization keys to speakers, callbacks, branches, or playback order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV. The ledger has no separate terminology
dimension, so terminology consistency findings are recorded under `meaning`.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `16000` | meaning | English says `some silver`; Japanese `銀` and Chinese `白银` also mean silver as a material. Current `은화를` specifically means silver coins, but the quest's blacksmith dialogue discusses using the silver metal. Prefer `은을 좀 팔고 싶어.` | High |
| `3099`, `20880` | meaning / terminology | Both English rows are the same `I want to sell you a kerchief.` and have identical Korean, but use `스카프`; the same `QuestItem_SQ06_Kerchief` is called `손수건` throughout most Korean journal, sale, and status text. Prefer `손수건 하나 팔게.` for both rows for within-quest consistency. Japanese uses `スカーフ`, so this is a Korean terminology consistency proposal, not a claim that the source item cannot be a scarf. | Medium-high |
| `1012`, `8049`, `8156`, `24422`, `27391`, `44085`, `45070`, `48328`, `49700`, `53840`, `56046`, `58365`, `60188`, `64795` | meaning / terminology | These references all concern the same physical family document, which establishes the Ratofer family's rank among the Alfar. Korean varies across `특허장`, `허가장`, `허가서`, `헌장`, and `인가서/인가장`; Japanese consistently uses `勅許状`, while `13848` and `16343` already use `칙허장`. Prefer `칙허장` consistently, adjusting particles and objective wording as needed. | High |
| `33247` | speech_level | Japanese uses plain forms (`そうしよう`, `悪くない`, `ならん`), while Korean switches to polite `하죠`, `괜찮습니다`, and `있겠지만요`. Prefer a plain line such as `원하는 대로 해. 물건 상태는... 그럭저럭 괜찮아. 그래도 여기저기 손볼 데가 좀 있겠군.` This is a line-level register finding; the asset does not establish the speaker for this key. | Medium-high |
| `19806` | naturalness | `use the door` means leave, not literally operate a door. Current `문으로 나가` is awkward in this dismissive exchange. Prefer `나도 그걸 떠맡진 않을 거야. 술을 사든가, 아니면 나가.` | High |
| `41533` | format | The objective title currently has the English possessive phrase inside parentheses: `라토퍼의 반지(Ratofer's Ring) 판매`. Other possessive quest labels keep the English name attached to the name, e.g. `라토퍼(Ratofer)의 손수건 판매`. Prefer `라토퍼(Ratofer)의 반지 판매`. | High |
| `55264` | naturalness | The Korean repeats `겪다` in `나라도 그가 겪은 일을 겪고 돌아왔다면`; Japanese also frames this around the circumstances of his return. Prefer `그가 어떤 일을 겪고 돌아왔는지 생각하면, 나라도 별로 할 말은 없었겠지. 다른 건 필요해?` | Medium-high |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `33627` | meaning | English says `They were the only things we never found.` Japanese instead says reality was filled with things other than those, and Chinese adds a wartime context. Current Korean follows English. Keep it provisionally; the source-language divergence is unresolved. | Uncertain |
| `40969` | meaning | English `Salvage the Silverware` and Chinese `回收银器` point to salvaging/recycling, Japanese `磨いた銀食器` points to polishing, and Korean `은식기를 회수하라` can mean retrieving it. The precise in-game action is not established by this key match. Do not choose between `분해`, `재활용`, or `손질` without stronger evidence. | Uncertain |
| `48853` | meaning | The quest title `Ratofer's Pawns` could refer to people used as pawns or to pawning his belongings. Korean `졸개들`, Japanese `質入れ`, and Chinese `士兵` diverge; the sale-quest context alone does not resolve the title's intended wordplay. Keep the current title provisional. | Uncertain |

## Coverage

All 193 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers, and
formatting. Seven correction findings and three unresolved readings were
recorded. Eleven exact-English duplicate groups already have identical Korean
text, including repeated quest objectives and sale-status lines. All 11
`$M0_SQ06.*$` runtime-marker groups remain present and in source order in all
four locales; no embedded line breaks were found. Speaker attribution and
dialogue order remain unknown at the key level.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
