# TR03 / Master's Pick Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 104 `default` keys associated with `467744.quest_bxml`
  (`TR03`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID TR03`, the asset-level symbol
`NPC_ADE_GNO_ElorenCriet`, six serialized quest-target handlers, and 35
serialized `dialog_line_*` handlers. The text covers the Master's Pick theft,
Eloren Criet, Argine, Grim Onwig, the Hierophant, Sun Camp, and related journal,
objective, title, and dialogue text. The asset's NPC symbol does not prove
that every key belongs to Eloren or any other individual. No localization key
was mapped to a specific dialogue callback, speaker turn, branch, or playback
position. All 104 keys were absent from the review ledger before this pass.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `134` | meaning / name consistency | `Grim Rumors` is rendered `그림(Grim)의 소문`, which can read as rumors told by Grim. The Japanese `グリムの噂` and this quest context indicate rumors about Grim. Prefer the title `그림(Grim)에 관한 소문`. | Medium-high |
| `5766` | naturalness | `내가 한 말은 ... 같은 건 없었다는 거야` is stiff and does not clearly express that the speaker never had the Pick. Prefer `난 '달인의 자물쇠따개(Master's Pick)' 같은 건 가진 적 없다고 했어. 이상하고 열리지 않는 상자만 있었는데, 프레토리안 근위대(Praetorians)가 그걸 압수했지.` | High |
| `22461` | terminology / naturalness | `How do I free the Pick?` is rendered only as `따개를 어떻게 꺼내지?`, leaving the named object vague. Prefer `달인의 자물쇠따개(Master's Pick)를 어떻게 꺼내지?` | Medium |
| `30348` | terminology consistency | In `free the pick from the box`, `자물쇠 따개` is separated and lacks the established item name used elsewhere in this quest. Prefer `구이안(Guian)의 실험실에 잠입해 장치를 쓰면 상자에서 달인의 자물쇠따개(Master's Pick)를 꺼낼 수 있어. 대사제(Hierophant)의 이름으로.` | Medium-high |
| `33902` | meaning | `열쇠를 풀어야겠어` treats the lock pick as a key and renders `free` literally. The item is the Master's Pick, trapped in a box. Prefer `이 메모에 구이안 스테빅(Guian Stebic)이 언급돼 있어. 모투스 광업(Motus Mining) 소속이군. 흠. 그의 연구실에 잠입해 '아리부스 엔진(Arrivus Engine)'을 찾아, 그걸로 상자에서 달인의 자물쇠따개(Master's Pick)를 꺼내야겠어.` | High |
| `41650` | meaning / naturalness | `픽을 풀어내다` is awkward and does not make clear that the device is meant to retrieve the Pick from its box. Prefer `엘로렌(Eloren)은 구이안(Guian)이 자물쇠따개를 꺼낼 방법을 갖고 있다고 생각했어. 아리부스 엔진(Arrivus Engine)이라는 장치야.` | Medium-high |
| `48130` | meaning | `Strike quickly` is translated as `빨리 공격해`, adding an attack that the English does not specify. Japanese `すばやく片づける` supports acting or handling the matter quickly. Prefer `서둘러 처리해. 여기엔 뭔가 불확실한 요소가 있어.` | High |
| `58143` | meaning / naturalness | The English repeats the `quarry` wordplay (target and stone quarry), but `말 그대로 꽤 괜찮은 채석장` is confusing in Korean. Prefer the clear sense: `네가 노리는 사냥감이야. 꽤 값진 전리품이기도 하지. 노움 소유라니 별나긴 해도, 우리 후원자가 현상금을 걸어 둔 물건인 건 변함없어.` | Medium-high |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `15774` | address | English uses the endearment `dove`; Japanese omits it, Chinese renders it literally as `和平使者`, and Korean uses `내 사랑`. The Korean is plausible but more intimate; without a confirmed speaker and relationship, retain provisionally. | Uncertain |
| `28541` | meaning | The English opening `... Except it is not` is elliptical and difficult to resolve against the following sentences; the Japanese and Chinese renderings also diverge. Keep the current opening rather than guessing at a correction. | Uncertain |
| `47918` | meaning / register | English says `we are beyond that point`, while Japanese recasts this as “you did not come all this way to hear that”; Korean follows the English but reads awkwardly. Keep unresolved until the intended source nuance is established. | Uncertain |

## Coverage

All 104 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Eight correction candidates and three unresolved
source/context questions were recorded. The exact-English duplicate groups
`6220` / `27168` and `9043` / `49504` already match across all four locales.
No embedded line breaks or markup were found. The `$TR03.bribe_value$` runtime
token at `36484` is preserved in English, Japanese, Chinese, and Korean.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
