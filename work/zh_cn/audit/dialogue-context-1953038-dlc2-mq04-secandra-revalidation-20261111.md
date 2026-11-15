# DLC2 MQ04 / Secandra Revalidation

- Date: 2026-11-11.
- Scope: all 133 `default` IDs linked to `1953038.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Six correction candidates and three evidence-limited holds are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC2_MQ04`, one NPC symbol
`DLC2_NPC_TON_KOL_Secandra`, 45 serialized dialogue handlers, and 133 matched
localization IDs. Its text concerns the Hyperian, Idylla, Anokatos, and the
Kollossae's attempted atonement. This supports a quest/NPC review group but
does not map every key to Secandra, a particular handler, dialogue branch, or
playback order. Per-key speaker attribution remains unassigned and playback
order unknown.

All 133 rows were compared across English, Japanese, Chinese, and active
Korean. Exact repeated source strings in this asset have matching Korean
translations. There are no embedded line breaks; dot-only rows were retained
as source entries, not treated as missing text.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `14977` | Naturalness | `an article of worship known as the Wreath of Absolution` is rendered `예배용 물건`. Consider `아노카토스(Anokatos)가 '면죄의 화관(Wreath of Absolution)'이라는 의식용 물건을 만드는 걸 도왔다.` This keeps the source's description without leaving the awkward calque. | Medium |
| `19206` | Naturalness / syntax | `Anokatos personally requested my guards and I escort his followers here` is understandable but the Korean subject/recipient relation is awkward (`내 경비병들과 내가 ... 호위해 달라고 요청했어`). Consider `아노카토스(Anokatos)가 직접 내 경비병들과 나에게 이곳의 추종자들을 호위해 달라고 했어.` | High |
| `21961` | Terminology consistency | This source says `ritual of penitence`, as does the related wording at `4616`. ID `4616` uses `참회의 의식`, while this row uses `속죄 의식`. English `penitence` and Japanese `悔恨の儀式` support aligning this row to `참회 의식`; `atonement` remains `속죄` at IDs `7265` and `10156`. Chinese uses `赎罪仪式` for both concepts, so retain the distinction from English/Japanese. | Medium-high |
| `39520` | Meaning / naturalness | `The mural ... is meant to represent` states the mural's intended purpose, not an obligation. Korean `우리 민족의 승리를 나타내야 해` sounds like it must depict the victory. Consider `우리 앞의 벽화는 우리 민족의 승리를 나타내기 위한 거야. 하지만 내 눈에 보이는 건 깨진 약속뿐이야.` | High |
| `51162` | Naturalness | `bore the brunt of their imminent will` is rendered as the stiff phrase `다가오는 그들의 의지의 충격을 견뎌 내리라`. Japanese also describes the impact of the gods' approaching will. Consider `다가오는 신들의 뜻을 온몸으로 받아내리라.` | Medium |
| `57762` | Naturalness | `I bear witness to their confirmation` becomes `그분들의 승인을 목격하는구나`, an unnatural collocation. Japanese says the speaker can verify the gods' approval firsthand. Consider `마침내 그분들의 인정을 직접 확인하는구나!` | High |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `25173` | Speech level | Korean moves from `다행이오` to `모양이군` in one turn, while Japanese and Chinese use neutral phrasing. The asset-level NPC symbol does not map this key to a speaker or scene stage; retain pending per-key evidence. |
| `29490` | Speech level | The Korean shifts from conversational `잠재울 수 있어` to elevated `세우리라` within one speech. Without a key-to-speaker or turn reference, retain rather than imposing a single register. |
| `61999` | Meaning / terminology | `redemption of my city and my people` is rendered `우리 도시와 백성을 구원할 일`. Japanese uses `贖罪` and Chinese `救赎`, while the English can cover salvation or atonement. Retain `구원` provisionally until the intended distinction from `atonement` / `penitence` is clearer in the surrounding scene. |

## Complete Reviewed ID Set

`246`, `308`, `431`, `547`, `963`, `1582`, `1819`, `1956`, `2196`, `2241`,
`2400`, `2421`, `2753`, `3082`, `3599`, `4040`, `4616`, `4670`, `4680`,
`4771`, `5251`, `5340`, `5986`, `6595`, `7263`, `7265`, `7570`, `8840`,
`9089`, `10156`, `10193`, `10620`, `10865`, `11616`, `12583`, `13182`,
`13307`, `14540`, `14937`, `14977`, `15204`, `15210`, `15524`, `15584`,
`16050`, `16194`, `16931`, `17255`, `17444`, `18365`, `18865`, `19206`,
`20008`, `20383`, `21516`, `21910`, `21961`, `22222`, `23607`, `24482`,
`24688`, `25173`, `25829`, `26153`, `26649`, `27129`, `27864`, `27972`,
`27987`, `28020`, `28247`, `28299`, `29282`, `29490`, `29642`, `29918`,
`30295`, `30328`, `30350`, `30838`, `31214`, `31307`, `32729`, `34430`,
`35928`, `36320`, `37359`, `37736`, `37857`, `37960`, `38772`, `39520`,
`40438`, `40522`, `40582`, `40833`, `41075`, `43158`, `43364`, `44615`,
`44675`, `44739`, `46036`, `46802`, `46847`, `48134`, `48421`, `48848`,
`49599`, `50122`, `50144`, `51162`, `51517`, `52947`, `53084`, `53244`,
`53839`, `54161`, `57762`, `58085`, `58412`, `60004`, `60348`, `60489`,
`60905`, `60970`, `61999`, `62691`, `62888`, `63788`, `63837`, `64162`,
`64308`.

All 133 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
