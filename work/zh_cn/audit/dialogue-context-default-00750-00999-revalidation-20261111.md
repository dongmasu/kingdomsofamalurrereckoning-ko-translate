# Sequential `default` Revalidation: IDs `750`-`999`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `750`-`999`; add only IDs that had no current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 185 new IDs were reviewed and recorded. Existing ledger records in this
  range were kept intact and not counted again.
- Four correction candidates and three evidence-limited holds were identified.
- The pass checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and line breaks/runtime markers. UI, objective,
  item, book, and other non-dialogue text was judged according to its text type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approved edits:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `806` | Meaning | “Your heart's in the right place” praises someone's good intentions. `마음만은 고맙네` shifts this toward being thankful for the gesture. Consider `그래도 마음씨는 좋네` or another wording that preserves the praise. | Medium |
| `948` | Format | This occurrence uses `로어스톤` without the English parenthetical, unlike other occurrences of the established name. Consider `로어스톤(Lorestone)` for consistency. | High |
| `952` | Format | `먼지의 자손` names the Children of Dust but omits the English parenthetical used in other occurrences. Consider `먼지의 자손(Children of Dust)`. | High |
| `981` | Meaning | `얼빠진 페이트위버` suggests foolishness or absent-mindedness, while “sloppy” / Japanese `だらしない` describes slovenliness or carelessness. Consider `칠칠맞지 못한 페이트위버(Fateweaver)` or a context-appropriate equivalent. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `756` | Speech level | Japanese uses a casual feminine ending; Korean `흥미롭군` is more marked and masculine-sounding. No key-level speaker evidence supports a voice correction; hold. |
| `928` | Speech level | Japanese gives a direct plain command, while Korean uses the elevated `필멸자여` / `두어라`. The English vocative and missing speaker context leave the intended register unresolved; hold. |
| `945` | Speech level | Japanese is a plain question, while Korean uses polite `-죠`. The asset does not establish the speaker or relationship; hold. |

## Source and Structural Checks

- Exact-English duplicate groups in this range (`758`/`876`, `833`/`900`,
  and `923`/`940`) have identical Korean translations.
- English, Japanese, and Korean line-break counts match throughout the range.
  Chinese ID `856` has one additional line break; Korean follows English and
  Japanese.
- Runtime-variable and display-wrapper structure matched where present.
- IDs with existing ledger records were not rewritten or assigned duplicate
  records.

## Newly Recorded IDs

The 185 new ledger rows are:

`750`, `751`, `752`, `753`, `754`, `756`, `757`, `759`, `760`, `761`, `762`,
`763`, `764`, `765`, `766`, `767`, `768`, `770`, `771`, `773`, `775`, `776`,
`777`, `779`, `780`, `782`, `783`, `785`, `786`, `787`, `788`, `790`, `791`,
`794`, `795`, `796`, `798`, `799`, `802`, `804`, `805`, `806`, `807`, `809`,
`810`, `813`, `814`, `816`, `817`, `819`, `820`, `821`, `823`, `825`, `826`,
`827`, `828`, `830`, `831`, `832`, `833`, `834`, `836`, `839`, `840`, `842`,
`843`, `845`, `847`, `848`, `849`, `851`, `852`, `854`, `855`, `856`, `857`,
`858`, `860`, `861`, `862`, `863`, `864`, `866`, `867`, `868`, `870`, `871`,
`873`, `877`, `878`, `880`, `881`, `882`, `883`, `884`, `885`, `886`, `887`,
`888`, `889`, `890`, `891`, `893`, `894`, `897`, `898`, `899`, `900`, `901`,
`904`, `905`, `906`, `907`, `908`, `909`, `910`, `911`, `912`, `915`, `916`,
`917`, `919`, `920`, `921`, `922`, `923`, `924`, `925`, `928`, `929`, `930`,
`934`, `935`, `936`, `937`, `938`, `940`, `941`, `942`, `943`, `944`, `945`,
`946`, `948`, `949`, `950`, `951`, `952`, `953`, `954`, `955`, `956`, `957`,
`958`, `959`, `960`, `961`, `962`, `965`, `966`, `968`, `969`, `971`, `972`,
`973`, `974`, `976`, `977`, `978`, `980`, `981`, `982`, `984`, `987`, `988`,
`989`, `990`, `992`, `993`, `994`, `995`, `997`, `998`, `999`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
