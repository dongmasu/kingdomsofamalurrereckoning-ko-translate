# Sequential `default` Revalidation: IDs `250`-`499`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `250`-`499`; add only IDs that had no current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 185 new IDs were reviewed and recorded. Existing ledger records in this
  range were kept intact and not counted again.
- Four correction candidates and seven evidence-limited holds were identified.
- The pass checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and line breaks/runtime markers. UI, objective,
  item, and other non-dialogue text was judged according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approved edits:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `320` | Format | The English, Japanese, and Chinese poem have five line breaks; Korean has six. Reflow the Korean verse to the source-supported six-line structure while preserving its poetic wording and meaning. | High |
| `333` | Meaning / naturalness | `강건하기를` expresses being robust, while “May your might endure” specifically wishes that the Beckoned's strength not fail. Consider `힘이 다하지 않기를, 부름받은 자(Beckoned)여.` | Medium |
| `358` | Meaning | `케이프 솔라스에 사는 여자` adds that the woman lives there; “a lady at Cape Solace” only locates the encounter or matter there. Consider `케이프 솔라스에서 어떤 여자와 금전 문제로 곤란한 상황에 처했어.` | High |
| `483` | Meaning | `불명예 제대한 병사` says Dink was discharged, which the source does not state. Consider `불명예를 입은 병사 딩크(Dink)가 물러서지 않아 결국 싸워야 한다.` | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `268` | Speech level | Japanese `会いましょう` is polite; Korean `만나` is plain. The asset does not map this key to a speaker or establish the relationship; hold. |
| `287` | Meaning | “Shear line” and “change key” are technical/contextual terms. Japanese renders the first as a transliteration and the second as a spare key, while the other sources differ; hold pending stronger context rather than choosing a meaning. |
| `306` | Speech level | Japanese uses a casual, gentle request; Korean `-군` sounds more stiff and marked. No key-level speaker or relationship evidence supports a voice correction; hold. |
| `311` | Speech level | Japanese apologizes casually, while Korean `미안하오` uses a marked old-fashioned register. The speaker/addressee relationship is not established; hold. |
| `360` | Speech level | Japanese is plain and conversational; Korean `좋은 거래였소` is marked/formal. No key-level speaker context establishes whether that register is intentional; hold. |
| `407` | Meaning | English says the character's “sojourn” is finished; Korean calls it a `체류 의식`. Japanese explicitly describes a rite while Chinese describes a journey, so the extra ritual sense cannot be resolved from the English alone; hold. |
| `452` | Speech level | The Korean uses highly deferential speech for an oath to `전하`, while Japanese uses a plainer feminine ending. The royal address can justify Korean deference, but speaker evidence is insufficient to settle the difference; hold. |

## Source and Structural Checks

- Exact-English duplicate groups in this range (`313`/`475` and `367`/`414`)
  have identical Korean translations.
- The Korean poem at `320` is the only line-break-count mismatch found in the
  range: Korean has six line breaks; English, Japanese, and Chinese each have
  five.
- Runtime-marker and markup signatures match across the four languages for
  the reviewed range.
- IDs with existing ledger records were not rewritten or assigned duplicate
  records.

## Newly Recorded IDs

The 185 new ledger rows are:

`250`, `251`, `253`, `254`, `255`, `256`, `257`, `259`, `261`, `262`, `263`,
`265`, `266`, `267`, `268`, `270`, `271`, `272`, `274`, `276`, `278`, `279`,
`282`, `283`, `284`, `286`, `287`, `288`, `289`, `290`, `291`, `293`, `294`,
`295`, `296`, `297`, `298`, `299`, `300`, `301`, `302`, `303`, `305`, `306`,
`307`, `309`, `310`, `311`, `312`, `314`, `315`, `316`, `317`, `319`, `320`,
`321`, `322`, `323`, `324`, `325`, `326`, `327`, `328`, `329`, `332`, `333`,
`336`, `337`, `338`, `339`, `340`, `341`, `342`, `343`, `344`, `345`, `346`,
`347`, `350`, `352`, `353`, `354`, `355`, `358`, `360`, `361`, `362`, `364`,
`366`, `367`, `368`, `369`, `370`, `371`, `372`, `373`, `375`, `376`, `377`,
`379`, `380`, `381`, `383`, `384`, `385`, `386`, `387`, `388`, `391`, `392`,
`393`, `394`, `395`, `397`, `399`, `400`, `401`, `402`, `404`, `405`, `406`,
`407`, `408`, `409`, `411`, `413`, `415`, `416`, `417`, `418`, `419`, `421`,
`423`, `426`, `427`, `428`, `429`, `430`, `432`, `433`, `434`, `435`, `436`,
`437`, `438`, `440`, `441`, `442`, `443`, `444`, `445`, `446`, `447`, `448`,
`449`, `450`, `451`, `452`, `454`, `455`, `456`, `457`, `458`, `461`, `462`,
`463`, `464`, `466`, `469`, `471`, `472`, `474`, `475`, `476`, `477`, `479`,
`481`, `483`, `485`, `487`, `490`, `491`, `492`, `498`, `499`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
