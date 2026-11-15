# Asset Revalidation: `1981711.quest_bxml` (`DLC2_SQ10` Handler-Prefix Candidate)

- Date: 2026-11-11.
- Scope: all 104 linked `default` IDs, newly recorded.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- Thirteen correction-candidate IDs and one evidence-limited hold.
- No translation CSV or extracted asset was changed. Proposed corrections
  require separate approval.

## Context Evidence and Limits

The asset contains 35 serialized `DLC2_SQ10`-prefixed dialogue handlers, but
no explicit `QUEST_ID`, NPC symbol, or per-key handler mapping. Its text
concerns Hallidite and the Oracle, the three altars, divine rewards, and the
Marauders of the Teeth of Naros. The handler prefix supports a quest/topic
candidate grouping only; it does not establish individual speakers,
addressees, branches, or playback order. Quest journal, objective, title, and
UI rows were assessed as their own text types.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `5940`, `21492`, `23508`, `33176`, `34181` | Terminology | These rows render the same capitalized `Oracle` title as `예언자`, while this asset also uses `신탁자(Oracle)` at `27551`, `52102`, `53277`, and `53372`. Consider using `신탁자` consistently for Hallidite's title in this asset; do not extend the decision to unrelated uses of `Prophet` or impose a global term without separate evidence. | High for within-asset inconsistency |
| `10927` | Meaning / naturalness | `신들에게 평화를 가져오려면` is awkward in Korean for appeasing the gods. Chinese interprets this as calming their anger, and `10184` already uses `신들을 달래야 한다` for the same purpose. Consider `할리다이트(Hallidite)의 말에 따르면 신들을 달래려면 제단을 지키는 야수들의 피를 흘려야 한다.` | High |
| `13385` | Naturalness | `내 힘도 크게 확장됐어` is a stiff calque for the Oracle's power increasing. Consider `하이페리언(Hyperian)이 떠오르면서 내 힘도 크게 강해졌어. 신들이 너에게 내린 시련을 볼 수 있을 만큼.` | Medium-high |
| `15473` | Naturalness | `수호자들을 처치하면 신들이 처치를 도운 이들에게` repeats `처치` awkwardly. Consider `수호자들을 처치하면 신들이 도와준 이들에게 큰 보상을 내릴 거야.` | High |
| `21555` | Meaning / terminology | `Make the Sacrifice` is translated `희생하기`, which can mean giving oneself up. In this quest the player offers a sacrifice at an altar; the surrounding journal lines use `제물을 바치다`. Consider `제물 바치기`. | High |
| `31048` | Naturalness / terminology | `희생 의식의 원들` is awkward and inconsistent with this asset's `마법진` for the sacrificial circles at `15473`. Consider `약탈자들과 타락한 우리 동족이 만든 희생 의식의 마법진이 이 도시와 이 땅 곳곳에 있어.` | High |
| `42744` | Naturalness | `의심의 제단을 고요하게 만들었으니` is a literal rendering of bringing the altar to stillness. Consider `의심의 제단을 잠잠하게 만들었으니` while keeping the journal voice. | Medium-high |
| `46516` | Terminology | The named `Altar of Regression` is consistently `퇴행의 제단` at `6943`, `42924`, and `58925`, but this row says `회귀의 희생 제단`. Align the proper name with `퇴행의 제단`; retain the sacrificial context in the rest of the sentence. | High |
| `50426` | Speech level | The first sentence ends in casual `표시야`, then shifts abruptly to the elevated imperative `뿌리 뽑아라`. Japanese keeps the clause in one voice. Consider `마지막 장소에 있는 이 희귀한 선물은 신들이 보내는 감사의 표시야. 선을 위해 사용해 악을 뿌리 뽑아.` | High |

## Evidence-Limited Hold

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `5155` | Meaning | “Face the first circle” is rendered `첫 번째 시련`. Japanese says `魔法陣`, while the quest context also treats the altars as trials. The row does not settle whether `circle` names the ritual circle, the altar, or the challenge; hold rather than choosing a term from the handler prefix alone. |

## Retained Decisions and Structural Checks

- `28819` was rechecked against all four languages. The current direct, informal
  Korean instruction is consistent with its English and Japanese tone.
- Oracle/Prophet distinctions are retained: only the five rows above refer to
  `Oracle`; ordinary `prophet` wording is not changed by this finding.
- Asset-level handlers do not establish individual speakers or playback
  order.
- Three exact-English duplicate groups have identical Korean. All 104 IDs
  match across four languages in line-break, runtime-token, and markup
  signatures.
- All linked IDs are listed below; each receives a four-language source
  fingerprint and an ID-level disposition in
  [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

## Complete Asset ID Set

`1391`, `1883`, `2893`, `3039`, `3246`, `4001`, `5155`, `5940`, `6400`,
`6765`, `6943`, `8346`, `9251`, `10184`, `10338`, `10927`, `11281`,
`11402`, `11478`, `12884`, `13106`, `13385`, `13669`, `14045`, `14218`,
`14770`, `15436`, `15473`, `15949`, `16108`, `16857`, `18753`, `18951`,
`19092`, `19520`, `21492`, `21539`, `21555`, `22875`, `22914`, `23508`,
`23801`, `24636`, `25626`, `25974`, `26259`, `27017`, `27551`, `28329`,
`28616`, `28819`, `29738`, `31048`, `33176`, `33864`, `33923`, `34022`,
`34181`, `34286`, `34571`, `34740`, `36470`, `36925`, `37505`, `38433`,
`39002`, `40307`, `40367`, `40648`, `41336`, `41589`, `42744`, `42924`,
`43980`, `44340`, `44649`, `46120`, `46516`, `49370`, `49556`, `49610`,
`50426`, `50725`, `52102`, `53277`, `53372`, `53709`, `54690`, `54978`,
`55069`, `55376`, `57293`, `58925`, `59737`, `59936`, `60989`, `61837`,
`61912`, `62481`, `62515`, `62810`, `63038`, `63601`, and `64467`.
