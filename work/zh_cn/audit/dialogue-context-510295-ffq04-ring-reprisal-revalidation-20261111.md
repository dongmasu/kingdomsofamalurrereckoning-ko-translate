# Asset Revalidation: `510295.quest_bxml` (`FFQ04` / Ring and Reprisal)

- Date: 2026-11-11.
- Scope: all 83 `default` IDs linked to this asset; none had a prior ledger
  record.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Twelve IDs are recorded as correction candidates. No translation CSV or
  extracted game asset was changed.

## Context Evidence and Limits

The BXML contains `conditional_quest_ffq04` labels for the quest targets,
ledger, and completion state, plus 38 `dialog_line_*` handlers carrying the
`FFQ04` prefix. It has no explicit `QUEST_ID` or `NPC_...` symbol. The
serialized state labels include `kept_ring`, `fought_penri`,
`mounted_trophy`, `lekka_dead`, and `antelope_acquired`; the language rows
identify Penri Kell, the Ballad "Ring and Reprisal," and Lekka the Corpulent.
This supports an `FFQ04` / Ring and Reprisal topic grouping, but does not map
localization IDs to individual handlers, speakers, dialogue turns, branches,
or playback order. Speaker attribution remains unassigned and dialogue order
unknown.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `19879` | Meaning / name rendering | `Lekka the Corpulent` is rendered as `통통한 레카라는 트롤`, obscuring the named character and omitting the English pairing. Other rows in this context use `뚱보 레카`, and ID `51179` has `뚱보 레카(Lekka the Corpulent)`. Align the proper-name form and epithet with that traceable form. | High |
| `20416` | Meaning / role consistency | The same champion in the Ballad is called `용사` in the first sentence and `기사` in the second. Japanese likewise varies between `守り手` and `騎士`, but the English describes one champion/knight carrying out both actions. Keep the role reference clear in Korean rather than implying two people. | Medium |
| `26261` | Title formatting | The named Ballad `Ring and Reprisal` appears as `《반지와 보복》` without its English title. Consider `《반지와 보복(Ring and Reprisal)》` to make the title traceable and consistent with the project's English-pairing convention for named lore. | Medium |
| `36828` | Meaning / naturalness | `드디어 왔군` follows English `Finally`, but Japanese `よかった` expresses relief (`다행이야`). Consider a Korean line that preserves the relief while leading naturally into the remark about the Yolvan road. | Medium |
| `39523` | Objective style | `Obtain Antelope Trophies` is `영양 전리품 획득`, unlike the project's concise `-기` objective style. Consider `영양 전리품 획득하기`; check the game's trophy object wording before finalizing. | High |
| `40717` | Meaning / name rendering | `Lekka the Corpulent` is reduced to `살찐 레카`, with neither the established `뚱보 레카` form nor an English pairing, unlike ID `51179`. Align the epithet and preserve the character's full traceable name. | High |
| `40999` | Title formatting | The title `Ballad of the Ring` is rendered `반지의 발라드` without English. Consider `반지의 발라드(Ballad of the Ring)` so this named Ballad can be distinguished from generic references to ballads. | Medium |
| `43519` | Speech level / naturalness | `Hail traveler!` becomes the archaic-sounding `반갑소, 여행자여!`; Japanese has a courteous greeting (`ごきげんよう、旅人さん！`). Consider a natural Korean greeting without the sudden archaic register. The speaker is not established by this asset alone. | Medium-high |
| `45019` | Meaning / title | `Reprisal, Reprised` uses repeated sound and the idea of reprisal being performed again; `복수의 재현` conveys repetition but loses the deliberate wordplay. Revisit the Ballad title while preserving its repeated-action sense. | Medium |
| `45511` | Naturalness | `How goes the hunt?` is translated as `사냥은 어떻게 돼 가?`, which is understandable but less idiomatic than a direct conversational check-in such as `사냥은 잘돼 가?`. | Medium-high |
| `53657` | Naturalness / speech level | `Hello, stranger.` becomes `안녕, 낯선 이여.` The vocative sounds literary/archaic beside the plain Korean greeting and Japanese `こんにちは、見知らぬ人`; consider a more natural Korean address. The speaker is not established by this asset alone. | Medium |
| `59260` | Terminology / role consistency | `the champion in the ballad` is rendered `발라드의 챔피언`, while the same role is called `용사` at ID `20416`. Review the established Korean rendering for this Ballad role and use it consistently without inferring a speaker. | Medium |

## Repeated Text and Structure

No exact-English duplicate groups occur among these 83 IDs. The four-language
line-break counts, runtime-token sequences, and detected markup signatures
match for every ID. No embedded line breaks, runtime placeholders, or markup
occur in these rows.

## Complete ID Set

`1173`, `1365`, `2263`, `3297`, `3746`, `3960`, `4634`, `4679`, `7017`,
`7828`, `7846`, `13541`, `16693`, `17024`, `17349`, `18598`, `19200`,
`19879`, `20416`, `21033`, `22427`, `23165`, `25121`, `25577`, `26261`,
`26492`, `26974`, `27306`, `28589`, `29138`, `31304`, `32573`, `34755`,
`34815`, `35031`, `35172`, `35906`, `35933`, `36604`, `36828`, `37332`,
`37364`, `38535`, `39082`, `39103`, `39523`, `40320`, `40717`, `40999`,
`41128`, `42587`, `43519`, `44190`, `45019`, `45183`, `45355`, `45511`,
`45648`, `46090`, `47470`, `48703`, `51179`, `51204`, `51447`, `51760`,
`51818`, `53531`, `53657`, `53685`, `53719`, `54409`, `55693`, `56234`,
`56257`, `56964`, `57086`, `57146`, `58836`, `58945`, `59260`, `60879`,
`62714`, and `64537`.

The complete four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
These review findings are not approval to edit the translation.
