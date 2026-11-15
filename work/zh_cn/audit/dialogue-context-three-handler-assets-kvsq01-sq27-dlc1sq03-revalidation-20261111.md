# Three Handler-Asset Revalidations: KVSQ01, SQ27, and DLC1_SQ03

- Date: 2026-11-11.
- Scope: all 222 unique `default` IDs linked to three previously unrecorded
  quest assets: `1354229.quest_bxml` (73), `548108.quest_bxml` (74), and
  `1963062.quest_bxml` (75).
- English was the semantic anchor; Japanese was the primary voice/register
  reference; Chinese was supporting evidence.
- Sixteen unique correction-candidate IDs and four evidence-limited register
  holds were recorded. No translation CSV or extracted game asset was changed.
- Eight exact-English duplicate groups (22 rows) have matching Korean
  translations. All 222 IDs have matching line-break counts and detected
  runtime-token/markup sequences across the four languages.

## Grouping Evidence and Limits

- `1354229.quest_bxml` has 26 `dialog_line_*` handlers with a `KVSQ01`
  prefix, but no explicit `QUEST_ID` or NPC symbol.
- `548108.quest_bxml` has 21 handlers with an `SQ27` prefix, but no explicit
  `QUEST_ID` or NPC symbol.
- `1963062.quest_bxml` has 45 handlers with a `DLC1_SQ03` prefix, but no
  explicit `QUEST_ID` or NPC symbol.

The prefixes and asset membership support candidate quest/topic groupings
only. They do not map localization keys to handlers, branches, or playback
order. Individual speakers remain unassigned except IDs `7875` and `33884`,
whose text explicitly identifies Niahm Kent; that evidence does not extend to
other rows in the assets. The matched keys include dialogue, choices,
objectives, journal/status text, and labels.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `26414`, `30331`, `34259` | Name / format | Each English source names both Krast brothers but places the shared surname after the second name (`Osgar and Medgar Krast` / `Medgar and Osgar Krast`). Korean pairs only the second full name and leaves the first as a given name. Consider showing both complete names, e.g. `오스가르 크라스트(Osgar Krast)와 메드가르 크라스트(Medgar Krast)`. | High |
| `32881`, `38609` | Terminology / meaning | The Warsworn joining credential is rendered `표창장` in the title `The Commendation` and `추천서` in `recommendation to join`. Japanese uses `推薦状` for the title and task description, and related Korean rows use `추천장`. Consider using one form, such as `추천장`, for this credential. | High |
| `1208` | Meaning | English says `my sister, Nameria`; Japanese also specifies an older sister. Korean `내 형제 나메리아` does not identify her as a sister. Use a gender-neutral Korean term for a female sibling without inventing her relative age, e.g. `내 자매 나메리아(Nameria)`. | High |
| `14183` | Name consistency | `Malgar` is rendered `말가르` at IDs `890`, `2328`, `8470`, `11952`, and `32308`, but `마르가르` here. Align this occurrence to `말가르(Malgar)`. | High |
| `15326` | Name / format | `Smiler` is written `스마일러` without its English pairing, while other occurrences in the same asset use `스마일러(Smiler)`. Add the missing pairing. | High |
| `16921` | Terminology | `re-assigned` is rendered `재배치`, while the same reassignment to Tala-Rane is `전근` at `52118`; Japanese uses `転任` in both. Align this instance with `전근`. | High |
| `33884` | Meaning | `scion of the Rathir Kents` means a descendant of that family; Korean `후계자` adds an heir/succession meaning. Japanese uses `末裔`. Consider `후손` or `후예`. The line explicitly identifies its speaker as Niahm Kent. | High |
| `46161` | Meaning | In this quest, `Tala-Rane must be rid of him` refers to Malgar, whom the linked objective at `32308` says to kill. `몰아내야 해` can mean drive him away; consider `탈라레인에서 그자를 없애야 해` to retain the intended outcome without overstating the phrasing. | Medium-high |
| `64643` | Naturalness / objective form | `코볼트(Kobold)들 죽이기` is awkward for a quest objective and diverges from the established action-form objective style. Consider `코볼트(Kobold) 처치하기`. | High |
| `7875` | Speech level | The line explicitly identifies the speaker as Niahm Kent. Japanese uses plain `だ`, matching the plain self-identification at `33884`; Korean ends the introduction with marked `-이오`. Consider a conversational plain ending such as `... 맹세의 칼날이지`. | High |
| `3886` | Naturalness / grammar | `그위네드 부부 중 한 사람가 죽었다` has the particle error `사람가`. Correct to `그위네드 부부(Gwynedds) 중 한 사람이 죽었다`. | High |
| `5752` | Meaning / terminology | `village stores` is rendered `마을 상점`, but the surrounding food-growing context and the same asset's `stores` at `15624` / `19594` refer to food storage or supplies. Consider `마을의 저장고` or `마을의 식량 비축분`. | Medium |
| `9757` | Meaning / naturalness | `I'm convinced it ran aground ... but I can't be sure` becomes `틀림없지만 확신은 못 하겠어`, a direct contradiction. Keep the uncertainty coherent, e.g. `아래 암초에 좌초된 것 같아. 그래도 확실하진 않아.` Japanese differs on whether the ship ran aground, so retain the source conflict in any final decision. | Medium |

## Evidence-Limited Register Holds

| ID(s) | Question | Evidence and disposition |
| --- | --- | --- |
| `170` | Speech level | Korean repeatedly uses `-소` while Japanese uses plain `言おう` / `払う`. No NPC symbol or per-key speaker mapping establishes whether this is intended character voice; retain as a possible register issue without assigning a speaker. |
| `18756` | Speech level | Korean uses `자네` and `-나`, while Japanese is conversational and feminine. The asset does not map this key to a speaker, so do not treat this as a confirmed voice mismatch. |
| `45397`, `62104` | Speech level | Korean uses marked `-말게` / polite `-지요`, while Japanese uses plain forms; Chinese also differs in politeness. With no per-key speaker or scene-stage mapping, retain both as unresolved register questions. |

## Retained Text and Repeated Sources

The eight exact-English duplicate groups cover 22 rows across these assets.
Each group's Korean translations already match; no frequency-based
harmonization was applied. Other rows were retained after checking meaning,
Japanese register, Chinese support, and Korean naturalness. The name
attribution for Niahm at `7875` and `33884` comes from the lines'
self-identification only; no other individual speaker or dialogue order was
inferred.

## Complete ID Sets

- `1354229.quest_bxml` (73 IDs): `896`, `2175`, `2662`, `2671`, `2734`,
  `2833`, `5183`, `5905`, `6029`, `6065`, `7043`, `12092`, `12160`,
  `12341`, `13653`, `13861`, `16777`, `16883`, `17277`, `17635`, `19096`,
  `21406`, `21442`, `23124`, `23345`, `24400`, `24868`, `25133`, `26040`,
  `26127`, `26414`, `28837`, `28953`, `30331`, `31060`, `32870`, `32881`,
  `33786`, `34043`, `34108`, `34259`, `37494`, `37866`, `38091`, `38609`,
  `38765`, `39593`, `40458`, `40556`, `41863`, `42577`, `42663`, `42785`,
  `45487`, `46233`, `47880`, `48021`, `48566`, `50849`, `53413`, `55354`,
  `55508`, `56797`, `56989`, `57041`, `57888`, `59858`, `60300`, `60893`,
  `62180`, `62756`, `63502`, `64305`
- `548108.quest_bxml` (74 IDs): `170`, `1208`, `2105`, `4086`, `4591`,
  `6654`, `7875`, `8320`, `8430`, `8470`, `9879`, `11952`, `13382`,
  `14183`, `15326`, `15837`, `16921`, `18076`, `19101`, `19714`, `20186`,
  `21505`, `21850`, `23529`, `24500`, `25264`, `27352`, `27447`, `27877`,
  `28285`, `29275`, `29314`, `29580`, `32308`, `33718`, `33884`, `34410`,
  `34784`, `35714`, `35948`, `38884`, `39331`, `39995`, `40202`, `41950`,
  `44688`, `44870`, `45397`, `46161`, `46250`, `46513`, `46993`, `47431`,
  `47760`, `48077`, `48268`, `49122`, `49929`, `50766`, `50926`, `50987`,
  `51892`, `52118`, `53302`, `54290`, `55801`, `58544`, `60021`, `62104`,
  `63022`, `63261`, `63927`, `64223`, `64643`
- `1963062.quest_bxml` (75 IDs): `132`, `2140`, `3886`, `4076`, `4095`,
  `4415`, `5752`, `6076`, `7105`, `7396`, `8328`, `9358`, `9757`, `12418`,
  `12960`, `13987`, `14619`, `15305`, `15624`, `17157`, `17258`, `17837`,
  `18756`, `19044`, `19139`, `19555`, `19594`, `23291`, `23575`, `28073`,
  `28575`, `29777`, `29896`, `32451`, `33990`, `34506`, `34886`, `34941`,
  `36241`, `36708`, `36771`, `37854`, `38188`, `38944`, `39433`, `41067`,
  `41602`, `42192`, `44302`, `44352`, `44712`, `44976`, `45324`, `45378`,
  `45641`, `46399`, `47443`, `47520`, `48101`, `50819`, `50924`, `51547`,
  `53181`, `56236`, `56726`, `57078`, `57343`, `57577`, `58029`, `59665`,
  `61262`, `64094`, `64369`, `64820`, `65088`

All 222 IDs are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv)
with current four-language fingerprints. Findings remain review proposals;
no translation CSV changes were made.
