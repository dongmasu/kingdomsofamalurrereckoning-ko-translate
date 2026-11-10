# SQ53 / Aetill Algar Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 131 `default` keys associated with `592526.quest_bxml`
  (`SQ53`).
- After the user's approval, all six correction-candidate IDs below were
  corrected and rechecked against the four locale rows. The two unresolved
  readings remain unchanged.
- No extracted game asset was modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ53`, the asset-level symbol
`NPC_DET_ALM_AetillAlgar`, and 58 serialized `dialog_line_*` handlers. Its
keys cover the Skoria mine and tyrenium dispute, Aetill Algar and Adath
Skoria, Whitestone and Apotyre, player choices, quest updates, objectives,
journal text, and UI labels. The asset-level NPC symbol and handler count do
not map individual keys to speakers, callbacks, branches, or playback order.
Speaker attribution and dialogue order therefore remain unknown at the key
level. None of the 131 IDs has another quest-asset association in the current
index.

## Correction Candidates

These source-checked corrections were approved and applied. The table retains
the evidence and proposed wording that guided the ID-specific edits.

| ID | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `14591` | Meaning / terminology consistency | The same mineral is `티레니움(Tyrenium)` in the established wording at `4364`, `2077`, and elsewhere; this row alone has `타이레니움(tyrenium)`. Japanese `ティアニウム` and Chinese `泰尔金` identify the same ore. Normalize only the term: `티레니움(Tyrenium)이 남아 있는 한 이 광산은 우리 거야.` Preserve the rest of the line. | High |
| `4397` | Meaning / terminology consistency | `sample of the ore` is rendered `광석 견본`, while this group's parallel Skoria ore-sample lines (`9853`, `16854`) and the related quest direction (`9555`) use `광석 표본` / `표본`. Japanese サンプル and Chinese 矿石样本 support an ore specimen. Prefer `광석 표본을 얻었으니 화이트스톤(Whitestone)의 에스윈(Eswin) 시장에게 전해야겠다.` | High |
| `49420` | Naturalness | The current `신뢰의 표시거나, 그들이 죽었거나` is understandable but leaves the two reasons syntactically uneven. English and Japanese both state that the ring is surrendered either as a sign of trust or when its owner dies. Prefer `그렇군. 스코리아 가문(Skoria) 남자들이 반지를 내주는 건 딱 두 경우뿐이야. 신뢰의 표시로 건네거나, 그들이 죽었을 때지. 가서 필요한 걸 가져가.` | Medium-high |
| `57654` | Meaning | English says the player will not be forgotten when the village enters a golden age; Japanese says the player's name will endure. `황금기를 맞이해도` can read as “even if/though it enters,” rather than the expected future time. Consider `정말 큰 도움을 받았어. 이 마을이 새로운 황금기를 맞이하면 널 잊지 않을 거야.` This retains the earlier verified promise that the player, not merely their help, will be remembered. | Medium |
| `28182` | Meaning / naturalness | English `the evils awakened there` is abstract; Japanese specifies 邪悪な存在 (evil beings), and Chinese supports a concrete hostile presence. Korean `그곳에서 깨어난 악에서 살아남을` is unnatural and obscures the referent. Prefer `스코리아 광산(Skoria)에 갔었군. 그곳에서 깨어난 사악한 존재들로부터 살아남을 사람이 있을 거라곤 생각 못 했어. 예상보다 강하다는 걸 증명했군.` | High |
| `6120` | Meaning | English `what came out of that hole` and the Japanese/Chinese equivalents leave the being unspecified. Korean adds `괴물`, which is plausible but unsupported by this line. Prefer `그 구멍에서 나온 건 내가 여태껏 본 어떤 것과도 달랐어. 부하 대부분이 죽었지. 이젠 우린 아래로 갈 수 없어. 너도 마찬가지야. 그러니 돌아서서 가던 길이나 가.` | High |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `6405` | Meaning | English `give myself up` can mean surrender, while Japanese explicitly says the speaker will end their own life; Chinese is not decisive. Korean currently says `스스로 목숨을 내놓겠어`. The sources do not settle whether the English is intentionally euphemistic or conflicts with Japanese, so retain the current translation pending stronger evidence. | Uncertain |
| `27562` | Naturalness / meaning | The earlier independent verification held the proposal to remove `지금처럼`: although it reduces repetition, it weakens the English `like the husk it's become` by dropping the already-become state. Rechecked here; retain the active wording and preserve the hold rather than reopening the rejected proposal. | Uncertain |

## Consistency and Format Checks

Eleven exact-English duplicate groups occur within this asset, covering 22
rows; every group already has identical Korean:

| IDs | English |
| --- | --- |
| `7283`, `58123` | Whitestone partnership question |
| `9853`, `16854` | Skoria mine / tyrenium ore sample |
| `15404`, `50179` | Mining families and the Skorias |
| `17466`, `27471` | `Where is Skoria Mine?` |
| `17852`, `27927` | `Deliver the ore` |
| `22304`, `51111` | `I'm working for Adath.` |
| `25265`, `30939` | `$SQ53.bribe_value$` offer |
| `25497`, `42102` | `You belong in prison.` |
| `34044`, `54777` | `Quest Complete` |
| `38948`, `65092` | `Obtain the sample` |
| `41795`, `47298` | `Speak to Adath Skoria` |

The `$SQ53.bribe_value$` token is preserved in both offer rows in all four
locales. None of the 131 rows contains embedded line breaks. No other
runtime markers or markup were found.

The complete sorted ID set is:

`1251`, `1713`, `2186`, `2394`, `3250`, `3459`, `3583`, `4233`, `4397`,
`5033`, `5240`, `5896`, `5991`, `6120`, `6148`, `6405`, `7110`, `7283`,
`8072`, `9048`, `9204`, `9555`, `9853`, `9872`, `11188`, `11764`, `11792`,
`12639`, `12741`, `13168`, `13232`, `13758`, `14070`, `14591`, `14915`,
`15404`, `15666`, `16854`, `17076`, `17112`, `17466`, `17499`, `17852`,
`21534`, `22304`, `23632`, `24435`, `24809`, `24843`, `25182`, `25265`,
`25497`, `25671`, `27009`, `27182`, `27471`, `27488`, `27562`, `27927`,
`28182`, `30939`, `31122`, `31241`, `32407`, `34044`, `34746`, `35570`,
`37934`, `38092`, `38281`, `38395`, `38948`, `39319`, `39860`, `41554`,
`41689`, `41762`, `41795`, `42048`, `42102`, `42293`, `42368`, `43328`,
`43522`, `43614`, `44219`, `44779`, `45101`, `45603`, `45980`, `46237`,
`46919`, `47298`, `48275`, `49420`, `49427`, `49864`, `50024`, `50179`,
`50812`, `50839`, `51111`, `51254`, `51694`, `52539`, `52743`, `52818`,
`53910`, `54303`, `54777`, `55582`, `57654`, `57841`, `57853`, `58123`,
`58134`, `59144`, `59466`, `60590`, `60649`, `61300`, `61378`, `62321`,
`62919`, `63086`, `63137`, `63335`, `63728`, `64201`, `64282`, `65092`.

All 131 IDs were revalidated for meaning, Korean naturalness, register,
address/honorifics, names and terminology, repeated English text, runtime
markers, markup, and line breaks. Six correction findings and two
unresolved readings are recorded with four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No key was mapped to a specific speaker, callback, branch, or playback
position. All six correction-candidate IDs were applied and rechecked; the
holds at `6405` and `27562` remain unresolved.
