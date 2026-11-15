# Asset Revalidation: `1993963.quest_bxml` (`DLC1_SQ08` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 89 `default` IDs linked to this asset; all 89 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Seven correction-candidate IDs and one evidence-limited hold are recorded.
  No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML has no explicit `QUEST_ID` or NPC symbol. Its 39 serialized
`dialog_line_*` handlers use the `DLC1_SQ08` prefix, which is a quest clue
rather than a confirmed quest assignment or per-key dialogue mapping. The
linked strings concern Tari Holstig, his mother's ring, the village of Cape
Solace, the Scion, and the `Price of Freedom` text at ID `8378`. These support
a topic grouping only. The asset does not map individual localization IDs to
a speaker, handler, branch, addressee, or playback order; speaker attribution
and dialogue order remain unassigned/unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `8378` | Title / English pairing | This standalone quest-title text is translated as `자유의 대가` without its English title. If retaining the bilingual title convention, use `자유의 대가(Price of Freedom)`. | Medium-high |
| `10290` | Naturalness | `형기가 얼마나 길든 끝까지 살아 내야 해` is understandable but awkward for serving a sentence. Japanese also means to complete the sentence; consider `형기가 얼마나 길든 끝까지 복역해야 해.` | Medium-high |
| `18839` | Naturalness | `야영지를 두셨어` is stiff for `kept a camp`. Consider `어머니는 절벽 아래 조수 웅덩이(Tidal Pools)에 야영지를 마련해 두셨어. 마을의 광신도들을 믿지 않으셨거든.` | Medium |
| `28409` | Meaning / naturalness | `deal with his actions` is rendered as `자기 행동을 수습`, which can mean fixing or covering up the consequences. Japanese explicitly says to face his actions; consider `타리 홀스티그(Tari Holstig)가 자기 행동과 마주하도록 최선을 다해 도왔어.` | Medium-high |
| `29917` | Naturalness | `탈출을 기도하며 지내셨지` is an awkward calque. Consider `어머니는 그곳에서 벗어나게 해 달라고 날마다 기도하셨지`, preserving the prayer for escape. | Medium-high |
| `32734` | Naturalness | `조수 웅덩이(Tidal Pools)의 바위 은닉처` is unnatural and obscures that the ring is hidden among rocks. Consider `조수 웅덩이(Tidal Pools)의 바위 틈에 있을 거야.` | Medium-high |
| `53915` | Objective format | `타리(Tari)의 반지를 되찾아라` uses an imperative while the linked objectives use compact `-기` forms such as `살펴보기` and `열쇠 훔치기`. Consider `타리(Tari)의 반지 되찾기`. | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| --- | --- | --- |
| `5423` | Meaning / idiom | `the island will see me to sleep` is figurative. Japanese says the island will see him through until sleep, while Chinese reads that he will sleep here forever. Korean `이 섬이 나를 잠들게 해 주겠지` preserves the sleep image, but the sources do not settle whether it means watching over him, laying him to rest, or dying here. Keep it provisional rather than choosing one reading. |

## Repeated Text and Structure

Five exact-English duplicate groups cover 10 rows: `Return to Tari Holstig`
(`1940`, `11962`), `I can get you out.` (`6720`, `61703`),
`Check the Tidal Pools.` (`39231`, `44808`), the identical cage-key journal
update (`46853`, `58133`), and `Farewell.` (`58688`, `60880`). Korean is
identical within every group. All 89 IDs have matching four-language
line-break, runtime-token, and markup signatures.

## Complete Asset ID Set

`1418`, `1790`, `1940`, `3236`, `4335`, `5001`, `5423`, `5568`, `6651`,
`6720`, `6837`, `8378`, `9076`, `9617`, `10153`, `10254`, `10290`, `11011`,
`11079`, `11962`, `13065`, `14096`, `14708`, `15084`, `16014`, `16683`,
`16718`, `17167`, `17186`, `18539`, `18839`, `20099`, `20743`, `21010`,
`22887`, `23152`, `23690`, `27270`, `28040`, `28409`, `28505`, `29006`,
`29091`, `29105`, `29825`, `29917`, `30455`, `32734`, `33615`, `33917`,
`34386`, `36142`, `37509`, `37537`, `39231`, `39514`, `39517`, `40655`,
`43435`, `44808`, `45003`, `45672`, `45936`, `46853`, `47694`, `47802`,
`48326`, `48725`, `50170`, `50181`, `50452`, `51146`, `51989`, `52400`,
`52461`, `52602`, `53915`, `55528`, `57181`, `58133`, `58688`, `59830`,
`60135`, `60880`, `61527`, `61703`, `61941`, `62189`, and `64758`.

All 89 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
