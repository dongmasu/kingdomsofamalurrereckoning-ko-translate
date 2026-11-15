# Five Gravehal Restoration Asset Revalidations

- Date: 2026-11-11.
- Scope: all 421 unique `default` IDs linked to five previously unrecorded
  assets. All 421 were new to the review ledger.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Thirty-one correction-candidate IDs and one evidence-limited hold were
  recorded. No translation CSV or extracted game asset was changed.

## Asset Evidence and Limits

| Asset | Quest/topic evidence | NPC evidence | IDs |
| --- | --- | --- | ---: |
| `1991492.quest_bxml` | No explicit `QUEST_ID`; 23 handlers with `DLC1_PH02a` prefix | `DLC1_NPC_GAL_GNO_PadrigDower` | 81 |
| `1993117.quest_bxml` | No explicit `QUEST_ID`; 23 handlers with `DLC1_PH03a` prefix | `DLC1_NPC_GAL_GNO_PadrigDower`, `DLC1_NPC_GAL_VAR_OllieMadsen` | 83 |
| `1993119.quest_bxml` | No explicit `QUEST_ID`; 24 handlers with `DLC1_PH04a` prefix | `DLC1_NPC_GAL_DOK_DeirdreGwint`, `DLC1_NPC_GAL_GNO_PadrigDower` | 80 |
| `1993121.quest_bxml` | No explicit `QUEST_ID`; 23 handlers with `DLC1_PH05a` prefix | `DLC1_NPC_GAL_GNO_PadrigDower` | 80 |
| `1993123.quest_bxml` | Explicit `QUEST_ID DLC1_MQ03`; 28 handlers with `DLC1_PH06a` prefix | `DLC1_NPC_GAL_DOK_MyfaRhonwen`, `DLC1_NPC_GAL_GNO_PadrigDower` | 97 |

The quest and handler identifiers, NPC symbols, and exact-key asset matches
are asset-level clues only. They do not map individual localization keys to
handlers, speakers, branches, or playback positions. In particular,
`1993123.quest_bxml` contains both an explicit `DLC1_MQ03` identifier and
`DLC1_PH06a` handler names; neither is treated as a per-key mapping.
Unconfirmed speaker and dialogue-order fields remain `unknown` or
`unassigned`.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `48659`, `7813`, `8257`, `50541` | Terminology / consistency | The same construction materials use `해변석`, `해안석`, and `비치스톤` for `Beachstone`, and `불씨나무`, `잿나무`, and `엠버우드` for `Emberwood`. Existing material labels use `비치스톤(Beachstone)` and `엠버우드(Emberwood)`. Align the lists with those forms; capitalize the parenthetical `Seasteel` consistently with its item label. | High |
| `16478` | Terminology / consistency | `fastings` is rendered `패스팅(fastings)`, while related game text describes the same Dverga network as `지하 통로` (including IDs `5728` and `13930`). Use the established Korean term `지하 통로` here. | High |
| `13502`, `14231`, `20428`, `24993`, `34890`, `35410`, `41271`, `64234`, `65048` | Terminology / consistency | `master-at-arms` varies among `무기 담당관`, `무술 교관`, and `병기 교관`. The same role is already rendered `무기 교관` at ID `13436`, where the English explicitly describes training fighters. Standardize these role references to `무기 교관` by context. | High |
| `859`, `13015`, `15295`, `27146`, `28305`, `43735`, `53065`, `60844` | Terminology / consistency | The second-floor `Gallery` is called `전시관`, `미술 전시실`, `화랑`, and `갤러리` within the same Gravehal construction context. The asset title `Gravehal Gallery` is `그레이브홀 미술관` and `Art Gallery` is `미술관`; align the references to `미술관`. | High |
| `33574`, `36922`, `37862` | Address / consistency | The same form of address, `my liege`, is rendered as `나리` or `전하`, while related lines use `주군`. Consider using the established `주군` consistently. | High |
| `3489` | Speech level / pronoun consistency | The line shifts from polite `멋지네요` to `내 거처`, then back to polite `저처럼`. Change `내 거처` to `제 거처` to keep the speaker's first-person register consistent. | High |
| `10316` | Speech level / pronoun consistency | `나는` is paired with formal endings (`뻗어 왔습니다`, `영광이겠습니다`). Use `저는` to match the line's polite register and Japanese `私`. | High |
| `15688` | Meaning / naturalness | `old pages` is translated as `오래된 책장 냄새`, which refers to a bookshelf rather than old pages or paper. Consider `묵은 책 냄새` or another natural rendering of the source image. | High |
| `42149` | Naturalness | `드베르가 요새 그레이브홀 요새` redundantly repeats `요새` and obscures the relationship between the Dverga and Gravehal. Consider `패디(Paddy)가 드베르가(Dverga)의 그레이브홀 요새(Gravehal Keep)를 복구했다.` | High |
| `10718` | Meaning / naturalness | `He'll be very interested to see this` is rendered `이걸 보면 아주 반가워할 거야`, shifting interest to happiness. Consider `이걸 보면 아주 흥미로워할 거야` or `분명 관심을 보일 거야`. | Medium-high |
| `468` | English pairing | `Mr. Athelm` is rendered `애설름 씨` without an English pairing, while the full name is paired elsewhere. Consider `애설름 씨(Mr. Athelm)`. | High |

## Evidence-Limited Hold

| ID | Question | Evidence and disposition |
| --- | --- | --- |
| `14745` | `And that you do.` | English is an elliptical reply; Japanese says `確かに`, while Chinese and Korean suggest successful completion. Asset membership does not identify the preceding line or reply path. Retain the current Korean pending dialogue-link evidence. |

## Repeated Sources and Structure

The batch contains 45 exact-English duplicate groups spanning 167 rows.
Korean translations match within every group; no exact-source Korean
divergence was found. Four-language line-break, runtime-token, and markup
signatures also match for all 421 IDs.

The complete ID-to-asset associations and per-ID review records are in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The complete ID sets are:

- `1991492.quest_bxml`: `1417`, `2442`, `3310`, `3469`, `4903`, `5704`,
  `5738`, `6821`, `6975`, `7407`, `7749`, `7955`, `8534`, `10718`, `10955`,
  `11044`, `11086`, `11975`, `12128`, `12546`, `14478`, `17602`, `17821`,
  `18922`, `18976`, `19154`, `19429`, `19573`, `21142`, `21676`, `22078`,
  `23295`, `23518`, `25659`, `26735`, `28572`, `28856`, `28894`, `29268`,
  `30098`, `30822`, `31589`, `31928`, `32031`, `32138`, `32840`, `32877`,
  `33132`, `33334`, `33798`, `33928`, `34863`, `35014`, `36034`, `36363`,
  `36534`, `37605`, `38143`, `40485`, `40757`, `41080`, `43242`, `44348`,
  `44674`, `46676`, `47305`, `48075`, `48659`, `48801`, `49533`, `50866`,
  `52315`, `56520`, `56645`, `57035`, `58924`, `60119`, `60321`, `63017`,
  `64520`, `65101`.
- `1993117.quest_bxml`: `1007`, `2816`, `3183`, `3480`, `4008`, `4637`,
  `4882`, `5349`, `6308`, `6450`, `7458`, `8746`, `9381`, `9523`, `9932`,
  `11459`, `12815`, `12886`, `13502`, `13909`, `13950`, `14231`, `16478`,
  `18024`, `18103`, `19232`, `20101`, `20428`, `20660`, `21251`, `21776`,
  `22683`, `23262`, `24502`, `24510`, `24640`, `24968`, `24993`, `25021`,
  `25638`, `25747`, `26549`, `27575`, `27746`, `28264`, `28433`, `29318`,
  `29667`, `31384`, `33574`, `33664`, `34516`, `34890`, `35238`, `35410`,
  `36513`, `36922`, `37855`, `38653`, `40789`, `41028`, `41271`, `42863`,
  `43929`, `44857`, `47396`, `47475`, `47516`, `47604`, `47674`, `49659`,
  `50163`, `53745`, `55003`, `55811`, `57558`, `60200`, `60558`, `60630`,
  `61983`, `62095`, `64234`, `65048`.
- `1993119.quest_bxml`: `488`, `667`, `1314`, `1509`, `2796`, `3054`,
  `3612`, `4029`, `4661`, `5289`, `5596`, `6238`, `9772`, `10829`, `11564`,
  `11957`, `12052`, `12182`, `12366`, `12396`, `13099`, `13241`, `14258`,
  `14745`, `15688`, `15695`, `15819`, `18008`, `18772`, `18859`, `19328`,
  `19708`, `20067`, `20311`, `20537`, `21659`, `22853`, `23493`, `25570`,
  `27326`, `27758`, `27876`, `28951`, `29305`, `30123`, `31380`, `33277`,
  `37862`, `38411`, `41903`, `43141`, `43240`, `43260`, `43274`, `43823`,
  `45939`, `46261`, `46306`, `46810`, `46893`, `47981`, `48924`, `49008`,
  `49163`, `49648`, `50573`, `51214`, `53877`, `55839`, `55958`, `56440`,
  `57172`, `57844`, `58411`, `58923`, `59949`, `61988`, `62750`, `62983`,
  `64261`.
- `1993121.quest_bxml`: `468`, `859`, `1480`, `1964`, `2923`, `4831`,
  `5428`, `5700`, `5912`, `6488`, `8181`, `8257`, `9570`, `10132`, `11638`,
  `11813`, `13015`, `14001`, `14544`, `15295`, `16834`, `17228`, `17268`,
  `17461`, `17894`, `19739`, `20112`, `22305`, `22395`, `22466`, `22915`,
  `23072`, `23500`, `23914`, `24278`, `24339`, `26980`, `27119`, `27146`,
  `28305`, `28323`, `29158`, `29406`, `29431`, `31528`, `31658`, `33400`,
  `33519`, `35223`, `37999`, `39696`, `39878`, `40005`, `40540`, `41511`,
  `41832`, `43735`, `45978`, `46098`, `46764`, `48857`, `49354`, `50360`,
  `51032`, `52871`, `53065`, `53177`, `54734`, `54740`, `55149`, `56021`,
  `56313`, `57098`, `57535`, `57723`, `59110`, `60361`, `60841`, `60844`,
  `61959`.
- `1993123.quest_bxml`: `211`, `1067`, `1853`, `2061`, `2111`, `2399`,
  `3274`, `3489`, `3698`, `3832`, `4715`, `4967`, `5753`, `5921`, `6119`,
  `6293`, `6739`, `7813`, `7842`, `7939`, `8136`, `8297`, `8458`, `10316`,
  `10851`, `12157`, `13004`, `13082`, `13590`, `14398`, `14537`, `14718`,
  `16002`, `16329`, `17023`, `17386`, `17806`, `18027`, `19707`, `20764`,
  `21183`, `21742`, `21787`, `23041`, `25044`, `26903`, `28416`, `29066`,
  `29217`, `29310`, `29569`, `32230`, `32904`, `33226`, `33809`, `34142`,
  `34777`, `36693`, `36729`, `38752`, `39206`, `39446`, `40289`, `42149`,
  `42304`, `42502`, `42609`, `42702`, `42817`, `43639`, `43939`, `44954`,
  `45202`, `45340`, `45809`, `46170`, `47392`, `47403`, `47435`, `48318`,
  `48828`, `49505`, `49558`, `50541`, `52108`, `52537`, `56112`, `56516`,
  `57160`, `57349`, `57960`, `58595`, `59698`, `61934`, `63983`, `64333`,
  `64641`.

Findings are review proposals, not approval to edit translations.
