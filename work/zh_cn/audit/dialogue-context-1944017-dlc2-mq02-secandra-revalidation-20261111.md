# DLC2 MQ02 / Secandra Revalidation

- Date: 2026-11-11.
- Scope: all 139 `default` IDs linked to `1944017.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Five correction candidates and one evidence-limited hold are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC2_MQ02`, one NPC symbol
`DLC2_NPC_TON_KOL_Secandra`, 44 serialized dialogue handlers, and 139 matched
localization IDs. Its content concerns Secandra, Kahrunk, the Jottun, and the
Kollossae city of Idylla. This supports a quest/NPC review group but does not
map every key to Secandra, a particular handler, dialogue branch, or playback
order. Per-key speaker attribution remains unassigned and playback order
unknown.

All 139 rows were compared across English, Japanese, Chinese, and active
Korean. No row contains an embedded line break. Repeated source strings in this
asset have matching Korean translations.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15082` | Naturalness | `They have caused my people suffering` is rendered `우리 민족을 고통받게 했어`, and `inevitably rise again` as `필연적으로 다시 일어설 때까지`. Both are understandable, but the Korean is stiff. Consider `그래도 저들은 우리 민족에게 큰 고통을 안겼어. 놈들이 어차피 다시 세력을 키울 텐데, 그때까지 기다리며 내버려 둬야 할까?` | Medium |
| `16010` | Naturalness / rhetoric | `We are stone and flesh, sword and faith` is a deliberate parallel declaration. `우리는 바위이자 살덩이, 검이자 신앙이다` is awkwardly literal. Consider `우리는 돌이자 살이며, 검이자 신앙이다`, preserving the parallelism. | Medium |
| `49212` | Meaning / naturalness | English `fortitude` and Japanese `耐久力` refer to endurance or the ability to withstand harm; Korean `끈기` leans toward persistence. Consider `문제는 힘이 아니라 얼마나 잘 버티느냐야.` | High |
| `64722` | Naturalness | `the latest to have this authority` means the current/recent holder of the authority. `그 권한을 가진 가장 최근 인물` is an unnatural calque. Consider `적어도 그래야 해. 하지만 지금 권한을 쥔 아노카토스(Anokatos)는 제 역할을 하지 못하고 있어.` | High |
| `64911` | Naturalness | The source's emphatic self-identification, `I am, my people are, Kollossae`, becomes `나와 내 동족은 콜로사이다`, which is grammatically awkward. Consider `나도 내 동족도 콜로사이(Kollossae)야.` Japanese instead frames the land as Kollossae territory; English and Chinese support the self-identification reading, so retain that content. | Medium |

## Evidence-Limited Hold and Source Note

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `37215` | Speech level | Korean uses deferential `-소` / `-것이오`; Japanese and Chinese are neutral. The asset-level NPC symbol does not identify the speaker or scene stage for this key. Retain pending per-key speaker/context evidence. |

At ID `54570`, Japanese describes not overlooking something, while English and
Chinese both say the speaker does not want their position revealed. Korean
`내 위치를 노출하는 건 절대 바라지 않아` follows English and Chinese and was
retained; the Japanese difference is documented rather than silently merged.

## Complete Reviewed ID Set

`465`, `1108`, `1132`, `1290`, `2118`, `2609`, `2760`, `3210`, `4112`,
`4626`, `5477`, `5840`, `5841`, `6041`, `6810`, `6915`, `9865`, `10211`,
`10857`, `11319`, `12586`, `12954`, `13400`, `14899`, `15009`, `15025`,
`15082`, `15126`, `16010`, `16366`, `17114`, `18036`, `19047`, `19685`,
`20521`, `20720`, `20936`, `21180`, `21345`, `21846`, `22362`, `22906`,
`23894`, `24723`, `24946`, `24975`, `25458`, `25679`, `25725`, `25759`,
`26716`, `27138`, `28485`, `28523`, `29328`, `30231`, `30568`, `31035`,
`31096`, `31260`, `31416`, `31570`, `31764`, `33284`, `33688`, `34376`,
`35758`, `35772`, `36258`, `36267`, `36459`, `36569`, `36655`, `36909`,
`36936`, `36986`, `37026`, `37215`, `37714`, `37943`, `39291`, `39490`,
`39663`, `39813`, `39972`, `42423`, `43187`, `43189`, `43752`, `44475`,
`45433`, `45616`, `45692`, `46743`, `46986`, `48515`, `48550`, `49142`,
`49212`, `49382`, `49515`, `50515`, `50567`, `50608`, `51250`, `51994`,
`52116`, `52147`, `52240`, `52698`, `52852`, `52985`, `53069`, `53266`,
`53267`, `53425`, `53933`, `54104`, `54570`, `54812`, `55411`, `55874`,
`56615`, `56757`, `56913`, `57157`, `57220`, `59422`, `61273`, `61915`,
`62258`, `62640`, `62821`, `62925`, `64253`, `64497`, `64722`, `64831`,
`64911`.

All 139 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
