# Sequential `default` Revalidation: IDs `18750`-`18999`

- Date: 2026-11-11.
- Scope: all 250 active Korean `default` rows compared by ID with English,
  Japanese, and Chinese, including Korean naturalness, meaning, register,
  terminology, and formatting.
- Sixty-nine existing ledger records were rechecked; 181 previously
  unrecorded IDs were reviewed and added.
- Ten existing correction candidates were retained, one existing candidate
  was reclassified as an evidence-limited hold, one existing hold was retained,
  one existing row was reclassified as a format candidate, four new correction
  candidates were recorded, and three new holds were recorded.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `18760` | Meaning | English `I'm sorry` is an apology; Korean `그건 잘못했어` only says the theft was wrong. Consider `빵 한 덩이만 훔쳤어. 그건 미안해. 하지만 여기 갇힌 지 벌써 몇 주나 됐다고!` | High |
| `18796` | Speech level / naturalness | The apparent player-choice line uses `제안은 아직도 유효한가요?`, unlike the informal endings in the same choice group; English and Japanese are plain. If the choice-menu classification is correct, consider `그 제안 아직도 유효해?`. | Medium-high |
| `18807` | Objective form | `Collect Niskaru Fangs` is rendered as the noun phrase `니스카루(Niskaru) 송곳니 수집`, unlike the established action-form objective style. Consider `니스카루(Niskaru) 송곳니 수집하기`. | High |
| `18839` | Naturalness | `야영지를 두셨어` is stiff for keeping a camp. Consider `어머니는 절벽 아래 조수 웅덩이(Tidal Pools)에 야영지를 마련해 두셨어. 마을의 광신도들을 믿지 않으셨거든.` | Medium |
| `18864` | Terminology consistency | In the same island-invasion quest, this force is called `침입자` here, while related references use `침략자` (including IDs `10460`, `26137`, `29845`, `35976`, and `44268`). Consider local alignment to `침략자`; this does not authorize a global replacement. | High |
| `18873` | Meaning / naturalness / name pairing | The line's `자네가 무엇을 발견할지 모르는 건 아니네` is opaque for hope tempered by realistic expectations. The same group also identifies the soldier as `Gautliffe`, rendered without the English pairing here. Consider the established `고틀리프(Gautliffe)` and a natural continuation such as `아직 희망은 품고 있지만... 끔찍한 소식을 들을 각오도 하고 있네.` Preserve the existing register and leave the exact military-rank mapping unresolved. | Medium-high |
| `18874` | Objective form | This is one of the parallel `Terminate the [family] family` objectives, whose Korean constructions vary. Consider `중가르 가문(Zungar family) 처단하기`, aligned with the concise `-하기` objective form and the related family objectives. | High |
| `18876` | Objective form | `Collect Preordained Talismans` is rendered without the established action-form ending. Consider `예정된 자들(Preordained)의 부적 수집하기`. | High |
| `18902` | Meaning / terminology / format | `orchestrated, bloody battle` is reduced to a battle that occurred through Paige's plan, muting the deliberate staging; the explicit name `Paige` is also unpaired. The title `Praetorian` varies across related rows. Make the engineered clash explicit and pair the name, while retaining the unresolved rank distinction; do not infer a speaker from the asset association. | Medium-high |
| `18919` | Meaning / naturalness | English `Requires {1} points in {2} abilities`, Japanese, and Chinese describe points invested in the `{2}` ability category. Korean `{1}포인트로 {2}개 능력 필요` instead reads as requiring `{2}` abilities at a cost of `{1}` points. Consider `{2} 능력에 {1}포인트 필요`, subject to checking the runtime values. The Korean preserves the English/Japanese placeholder order. | Medium-high |
| `18908` | Meaning | English specifies poisoning spear-tips and arrow-tips, while Korean `창과 화살촉에 독을 발랐으며` leaves the spear-tip target implicit. Consider `창끝과 화살촉에 독을 발랐으며`. | Medium |
| `18934` | Format / terminology | Capitalized `God Under the Mountain` is a recurring divine title (`2098`, `38748`, `47293`, `18934`), but Korean omits the English pairing in these references. Consider consistently pairing `산 아래의 신(God Under the Mountain)` where the title occurs. | Medium-high |
| `18938` | Format / name pairing | `Tine Delfric` is rendered as `타인 델프릭` without the English name, unlike the established paired form elsewhere (for example `18127`, `41883`, and `59858`). Consider `타인 델프릭(Tine Delfric)`. | High |
| `18945` | Naturalness | `꽤 괜찮은 사기를 벌였지` is understandable but stiff for the boastful colloquial `I had a right good swindle going`. Consider a more conversational form such as `웬딩 젊은이 몇 명과 꽤 크게 사기를 쳤지.` | Medium-high |
| `18951` | Format / name pairing | `Altar of Doubt` is a named altar, and the corresponding objective at `63601` already uses `의심의 제단(Altar of Doubt)`. Consider pairing the name here as well. | High |

## Evidence-Limited Holds

These are not confirmed errors; the available references do not settle the
reading or form.

| ID | Dimension | Reason |
| ---: | --- | --- |
| `18751` | Meaning / terminology | Capitalized `The Order` may be a formal faction name, but the isolated line and locale references do not establish whether `교단` is its canonical Korean form or whether the English pairing is required. |
| `18756` | Naturalness / register | The wording and `자네` address remain plausible, but the asset association does not identify the speaker or dialogue stage needed to settle the apparent register difference. Retain the existing hold. |
| `18778` | Meaning / terminology | `Tuatha Bolgan Master` does not establish whether `Master` is a rank, creature subtype, or proper title. The locale references do not settle the Korean construction. |
| `18788` | Meaning / reference | English leaves the subject of `got all bloody` implicit; Japanese suggests a person fell against the statue and became bloodied, while the English can be read differently. Do not choose a subject without more context. |
| `18883` | Meaning / terminology | `Here are some reagents` and Chinese identify reagents, while Japanese reads `素材を持ってきた` (“I brought materials”). Korean `재료를 가져왔어` is natural and follows Japanese; retain provisionally rather than treating the prior candidate as a confirmed error. |

## Rechecked Existing Findings

- Ten existing candidates at `18760`, `18796`, `18807`, `18839`, `18864`,
  `18873`, `18874`, `18876`, `18902`, and `18908` remain candidates against
  the current Korean text.
- Existing candidate `18883` is reclassified as an evidence-limited hold
  because the English/Chinese and Japanese references differ on whether the
  line presents reagents or says they were brought.
- Existing row `18951` is reclassified as a format candidate because the
  named `Altar of Doubt` lacks the English pairing used at `63601`.
- Existing hold `18756` remains unresolved.
- Asset associations were not treated as proof of an individual speaker,
  dialogue turn, or playback order.

## Duplicate and Structural Checks

- All 250 IDs are present once and in identical ascending order in English,
  Japanese, Chinese, and active Korean.
- Fifty-eight exact-English duplicate groups touch the range (1,319 corpus
  rows). Two groups have Korean differences that are supported by Japanese:
  - `All right then.` (`16898`, `18884`, `60779`, `62563`): `16898` and
    `18884` match in Korean; Japanese at `60779` and `62563` instead says
    `またな` / `またね` (“see you”), supporting their different Korean
    farewell.
  - `Here we are.` (`18967`, `24219`): Japanese distinguishes `着いたか`
    (“we've arrived”) from `ここにいるわ` (“we're here”), supporting
    `도착했군` versus `여기 있어`.
- Logical embedded-line-break counts match across all four languages for
  every ID. Localized `{*1...}` wrappers at `18867` and `{*3...}` at `18932`
  preserve their structure while translating the contents.
- At `18919`, Korean preserves the English/Japanese `{1}`, `{2}` order;
  Chinese reverses those two placeholders. This source-language difference
  is recorded, not normalized.

The ledger now contains 31,068 of 65,135 IDs (47.70%), leaving 34,067
unreviewed. The next sequential range is `19000`-`19249`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
