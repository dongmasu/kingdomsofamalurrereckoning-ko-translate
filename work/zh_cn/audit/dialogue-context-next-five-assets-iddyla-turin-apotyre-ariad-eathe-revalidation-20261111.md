# Five Unrecorded Asset Revalidations: Idylla, Turin, Apotyre, Ariad, and Eathe

- Date: 2026-11-11.
- Scope: all 273 `default` IDs linked to five previously unrecorded assets.
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Thirty-seven IDs are recorded as correction candidates and seven as
  evidence-limited speech-level holds. No translation CSV or extracted game
  asset was changed.
- The batch has no exact-English duplicate group with divergent Korean text.
  Line-break counts and detected runtime-token/markup sequences match across
  all four languages for all 273 IDs.

## Grouping Evidence and Limits

`1987402.quest_bxml` contains 52 IDs, explicit quest IDs `DLC2_SQ11` and
`DLC2_SQ13`, the asset-level NPC symbol `DLC2_NPC_IDY_KOL_JobBoard`, and 30
dialogue handlers. It includes Idylla petition-board topics such as the
sewers, cisterns, missing surveyor, troll, and sewer race. The two quest IDs
and asset-level NPC symbol do not map an individual key to a quest branch or
speaker.

`528652.quest_bxml` contains 52 IDs, no explicit quest ID or NPC symbol, and
19 handlers with an `SQ14` prefix. The text supports a Turin/Jedda and lost
companions topic grouping; the handler prefix is only a clue.

`2601300.quest_bxml` contains 53 IDs and no explicit quest ID, NPC symbol, or
dialogue handler. Twenty-eight IDs also occur in `2601222.quest_bxml`; this
exact-key association supports a shared asset/topic link only. The text
includes anatomy, Niskaru, and bodily-specimen topics, but does not establish
that one character speaks every line. The asset names and shared keys do not
establish speakers or playback order.

`1759742.quest_bxml` contains 57 IDs, no explicit quest ID or NPC symbol, and
34 `Cursewood_NQD`-prefixed dialogue handlers. Its text concerns the Ariad,
its scouts, and the Klurikon campaign. The handler prefix supports only a
conservative topic association.

`1577264.quest_bxml` contains 59 IDs, explicit quest ID `SQ141`, no NPC
symbol, and 19 dialogue handlers. Its text supports an Eathe / Belen's
Testament revenge-quest topic grouping. Quest and handler metadata do not map
individual keys to a speaker, handler, branch, or playback order.

ID `56052` is shared by `1759742.quest_bxml` and `2601222.quest_bxml`; both
asset links are retained in the ledger. All per-key speaker attributions and
dialogue order remain unassigned or unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `6672` | Naturalness | The vocative interrupts the clause in `하이페리언(Hyperian)이 솟아올랐어, 부름받은 자(Beckoned).` Consider moving it to a natural address position, e.g. `부름받은 자여, 하이페리언(Hyperian)이 떠올랐어!` while retaining the following celebration. | Medium-high |
| `34878` | Terminology | `cisterns` is `저수지` here, while the same Idylla asset uses `저수조` for the same water-storage system at `34126`, `53549`, and `56007`. Use `저수조` consistently. | High |
| `37540`, `38319`, `44458`, `50723`, `52797` | Terminology | The same sewer-inspection `surveyor` role is rendered `조사원`, `측량사`, and `조사관`; the lost-surveyor titles use `측량사`. Japanese consistently uses `検査官`. Consider one context-appropriate form such as `조사관` throughout these five rows. | High |
| `3301` | Meaning / format | `Search Turin for the Scroll` is rendered `투린(Turin)에서 두루마리 찾기`, which locates the search in Turin. The quest context and the other three languages support searching Turin / his belongings for the scroll. Consider `투린(Turin)을 수색해 두루마리 찾기`. | High |
| `28797` | Naturalness | `투린이 때 이르게 죽었으니` is an awkward rendering of “has met an untimely death.” Consider `투린(Turin)이 불의의 죽음을 맞았으니` or another natural quest-journal phrasing. | Medium-high |
| `38144` | Naturalness | `젊은이 투린(Turin)` is an unnatural name-and-appositive order. Consider `투린(Turin), 그 젊은이를 만나거든 이리 보내 줘` while preserving the request and tone. | High |
| `18590` | Terminology | In the Niskaru-fang collection topic, `fangs` is rendered `이빨` here but `송곳니` at `18807` and `21684`. Use `송곳니` for this item consistently. | High |
| `18807` | Format | The objective `Collect Niskaru Fangs` uses the noun form `송곳니 수집`; align it with the established action-form objective style, e.g. `니스카루(Niskaru) 송곳니 수집하기`. | High |
| `3782`, `8897`, `12365`, `12917`, `17685`, `21745`, `23116`, `23469`, `24590`, `30409`, `31387`, `35865`, `38372`, `38597`, `40782`, `44627`, `46998`, `55119`, `55470`, `60393` | Terminology / English pairing | The same faction, `Belen's Testament` / `the Testament`, varies among `테스타먼트`, `성약단`, `결사`, and `교단`; `Belen` also appears as `벨렌` and `베일런`. Some rows omit the English pairing or pair only `(Testament)` with a Korean form that includes Belen. Consider a consistent full form such as `벨렌의 성약단(Belen's Testament)` and a consistent short form such as `성약단(The Testament)`, applying grammar by sentence. ID `31387` already uses the proposed full form; `60393` currently has the mismatched pairing `벨렌의 테스타먼트(Testament)`. | High |
| `8897`, `31387`, `35865`, `55119`, `55470` | Terminology | The description `death cult` varies between `죽음 숭배 집단` and `죽음의 교단`. Consider one natural description, e.g. `죽음의 교단`, separate from the faction's proper name. | High |
| `13952`, `40782`, `42176`, `60477`, `62054` | Terminology / tone | The same English insult `dreg` is rendered as `찌꺼기`, `잔챙이`, `밑바닥 인생`, `하찮은 놈`, and `천것`. Review for a consistent core rendering while retaining any intensity differences supported by the individual sentence. | Medium-high |
| `56253` | Format | The objective `Poison the Cistern` is rendered `저수조에 독 타기`, unlike the prevailing `-하기` action form. Consider `저수조에 독 풀기` with the project's objective style applied consistently. | High |

The proposed terminology forms are review directions, not approved glossary
decisions or applied edits. In particular, the `dreg` variations may reflect
speaker voice; the asset does not identify speakers for these keys.

## Evidence-Limited Holds

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `44458` | Speech level | Japanese is conversational while Korean uses polite endings. The asset contains multiple quest topics and has no per-key speaker mapping; retain as a possible register difference rather than a confirmed voice error. |
| `16957`, `44462` | Speech level / address | Korean uses marked vocatives and `-나` questions; Japanese is conversational. There is no explicit NPC or per-key handler mapping to establish whether the lines share a speaker or scene stage. Retain as unresolved. |
| `6642`, `16290`, `20874`, `34092` | Speech level / honorifics | Japanese uses casual speech while Korean uses polite or formal wording. The shared asset has no NPC or per-key speaker mapping, so do not normalize the register from asset membership alone. Retain as unresolved. |

## Retained Text and Structural Checks

The remaining 230 IDs were retained after comparing English, Japanese,
Chinese, and active Korean. No exact-English duplicate group within this batch
has divergent Korean text. All 273 IDs have matching line-break counts and
matching detected runtime-token/markup sequences across the four languages.

## Complete ID Sets

- `1987402.quest_bxml` (`DLC2_SQ11` / `DLC2_SQ13`; 52 IDs): `986`, `6672`,
  `8825`, `9859`, `10960`, `11410`, `13807`, `16482`, `18626`, `18676`,
  `18893`, `20718`, `21426`, `23203`, `31727`, `34126`, `34878`, `36051`,
  `36748`, `37540`, `37796`, `37845`, `38170`, `38319`, `39122`, `39431`,
  `40185`, `40205`, `40920`, `42274`, `44180`, `44458`, `45273`, `46532`,
  `46729`, `46899`, `49898`, `50723`, `52716`, `52797`, `52831`, `53549`,
  `54055`, `54320`, `54528`, `56007`, `56425`, `56518`, `58185`, `60650`,
  `63066`, `63142`
- `528652.quest_bxml` (`SQ14` handler-prefix clue; 52 IDs): `3301`, `4091`,
  `5337`, `8704`, `9595`, `11313`, `14038`, `14412`, `14738`, `14811`,
  `16402`, `16957`, `17527`, `18086`, `19881`, `20724`, `20996`, `23337`,
  `25068`, `25820`, `25870`, `26644`, `27956`, `28293`, `28797`, `30079`,
  `30275`, `31501`, `32992`, `33601`, `35905`, `36309`, `37125`, `38144`,
  `39355`, `41109`, `41350`, `44462`, `47831`, `52492`, `53139`, `54840`,
  `55010`, `55315`, `55860`, `56653`, `57212`, `58088`, `59350`, `59585`,
  `61501`, `63096`
- `2601300.quest_bxml` (28 IDs also linked to `2601222.quest_bxml`; 53 IDs):
  `193`, `2963`, `6642`, `6777`, `7361`, `7363`, `7606`, `9621`, `9923`,
  `13932`, `14020`, `15136`, `16290`, `17537`, `18590`, `18807`, `19498`,
  `19559`, `19643`, `20874`, `21684`, `23227`, `23512`, `23952`, `27185`,
  `27354`, `28868`, `30662`, `30841`, `33451`, `34092`, `34235`, `34795`,
  `35874`, `37024`, `38197`, `43206`, `43847`, `44100`, `44322`, `45860`,
  `47024`, `49768`, `50019`, `51706`, `54763`, `55964`, `59485`, `59707`,
  `61041`, `62173`, `63005`, `64937`
- `1759742.quest_bxml` (`Cursewood_NQD` handler-prefix clue; 57 IDs):
  `1411`, `1535`, `2725`, `12063`, `14071`, `14111`, `16152`, `16724`,
  `17498`, `17952`, `19701`, `20088`, `20269`, `22342`, `24974`, `25257`,
  `27445`, `28766`, `29166`, `29613`, `30072`, `30704`, `30817`, `30992`,
  `31163`, `33794`, `34303`, `34346`, `36020`, `36884`, `37983`, `39526`,
  `40459`, `40983`, `42621`, `45262`, `46944`, `47301`, `47747`, `48099`,
  `48408`, `49206`, `50194`, `50688`, `51295`, `53389`, `53409`, `53663`,
  `55141`, `56052`, `56258`, `56679`, `56893`, `57979`, `61459`, `61997`,
  `62042`
- `1577264.quest_bxml` (`SQ141`; 59 IDs): `313`, `2012`, `3537`, `3782`,
  `5794`, `5823`, `6432`, `8897`, `11882`, `12365`, `12917`, `13952`,
  `16685`, `17685`, `21670`, `21745`, `22590`, `23116`, `23469`, `24590`,
  `26018`, `27824`, `29491`, `29784`, `30409`, `30461`, `30823`, `31387`,
  `31683`, `32571`, `33271`, `34156`, `34192`, `35491`, `35865`, `36752`,
  `37779`, `38372`, `38597`, `39480`, `40744`, `40782`, `42176`, `44627`,
  `46998`, `48949`, `49252`, `49734`, `55119`, `55470`, `56253`, `57443`,
  `60393`, `60477`, `61585`, `62054`, `63675`, `64160`, `64640`

All 273 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with four-language source fingerprints. Findings remain proposals and have
not been applied to the translation CSV.
