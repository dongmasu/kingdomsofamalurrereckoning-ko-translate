# Asset Revalidation: `439722.quest_bxml` (`SQ08`, Headsman and Alfar Camp)

- Date: 2026-11-11.
- Scope: all 86 `default` IDs linked to this asset; all 86 are newly recorded.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Twenty-eight correction candidates and two evidence-limited holds are
  recorded. No translation CSV or extracted game asset was changed.

## Context Evidence and Limits

The BXML explicitly identifies `QUEST_ID SQ08`, six NPC symbols
(`NPC_DAL_ALM_BetheliJons`, `NPC_DAL_See_TheHunter`, and four prisoner
symbols), and 32 `dialog_line_*` handlers. This establishes the quest's
Midden/Alfar-camp conflict context, but does not map individual localization
IDs to a speaker, handler, branch, addressee, or playback order. The asset
contains multiple NPCs, so speaker attribution remains unassigned and dialogue
order unknown.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1136`, `4007`, `11326`, `11684`, `15965`, `18118`, `23251`, `24624`, `32518`, `32955`, `33252`, `37286`, `37436`, `37936`, `39934`, `40758`, `44377`, `45706`, `48290`, `48832`, `52054`, `63612` | Terminology / consistency | The same adversary, `the Headsman`, varies among `처형인`, `처형자`, `집행관`, `형리`, `교수형 집행인`, `처형관`, `행맨`, and `헤드스맨`. Use one Korean rendering, provisionally `처형인(Headsman)` at the first reference in each row. This is a translation-consistency proposal; the asset does not establish an individual speaker, and earlier review notes about whether the capitalized English is a title or role remain relevant. | Medium-high |
| `15965`, `23251`, `58889` | Name consistency / format | `Betheli` appears as `베텔리`, while the existing glossary establishes `베셀리`, supported by Japanese `ベセリ` and Chinese `贝瑟里`. Use `베셀리(Betheli)` at the first name reference in each row, retaining short later references without duplicate parentheses. `default:21512` has the same local spelling outside this asset and is noted as a separate cross-asset follow-up, not reviewed under this asset. | High |
| `15419`, `24624`, `37286`, `44477`, `45706`, `49861` | Name consistency / format | The place `Tinehil` is `타인힐` in most rows, `티네힐` at `37286`, and lacks an English pairing in these rows. Existing labels use `타인힐(Tinehil)`; align the first reference in each row to that form. | High |
| `43894` | Speech level / naturalness | The Korean shifts to formal `-습니다/-주세요` and then the archaic vocative `나그네여`, while Japanese is conversational (`受け取って`, `ありがとう`). Consider a consistently conversational line, for example: `줄 수 있는 게 많지 않아. 아니, 나눠 줄 여유가 거의 없다고 해야겠네. 그래도 우리가 마련한 보상은 무엇이든 받아 줘. 정말 고마워, 나그네.` Speaker identity remains unknown. | Medium-high |
| `9681` | Speech level / naturalness | The Korean's `없나요!?` is polite, while the Japanese asks in plain conversational style (`止める者はいないの？`). Consider `세상에... 저 괴물을 막을 사람은 아무도 없어!?` Speaker identity remains unknown. | Medium |
| `44377` | Naturalness | `페이에게 목숨을 건 결투를 신청받았다` is awkwardly passive, and `생명력을 노예처럼 부려` obscures the source's “enslaving the life-force.” Consider a direct construction such as `필멸자의 생명력을 빼앗아 페이(Fae)의 위상을 되찾으려는 처형인(Headsman)이라는 페이(Fae)가 내게 목숨을 건 결투를 신청했다.` Recheck the full sentence if edited. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `5772`, `44477` | Meaning / terminology | English uses `my Hollow` for Tinehil at `5772` (`은신처`) and `a hollow` at `44477` (`골짜기`). Japanese uses `洞穴` in both, but English capitalization and sentence context differ. The available evidence does not settle whether both mean the same geographic feature or whether one means the Headsman's lair. Hold the term choice rather than force a global replacement. |

## Repeated Text and Structure

One exact-English duplicate group covers two rows. Korean is identical in the
group. All 86 IDs have matching four-language line-break, runtime-token, and
markup signatures; no embedded line breaks or format discrepancies were
found.

## Complete Asset ID Set

`1136`, `3331`, `3791`, `3929`, `4007`, `4374`, `4508`, `4893`, `5408`,
`5772`, `6092`, `7515`, `9681`, `9995`, `10200`, `11326`, `11422`,
`11684`, `12786`, `13293`, `14959`, `15202`, `15419`, `15432`, `15561`,
`15808`, `15965`, `16602`, `16711`, `17475`, `18118`, `18400`, `19034`,
`21079`, `22835`, `23251`, `24624`, `24673`, `26257`, `27436`, `30337`,
`30338`, `30845`, `31746`, `32518`, `32910`, `32955`, `33252`, `33689`,
`37286`, `37436`, `37886`, `37936`, `37942`, `39759`, `39934`, `40758`,
`41118`, `41979`, `42246`, `42691`, `43716`, `43894`, `44377`, `44477`,
`45706`, `45893`, `48290`, `48523`, `48655`, `48832`, `49522`, `49652`,
`49861`, `50612`, `51553`, `52054`, `52520`, `53483`, `53779`, `54879`,
`55971`, `57310`, `58889`, `62326`, and `63612`.

All 86 four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
Findings are proposals, not approval to edit the translation.
