# Sequential `default` Revalidation: IDs `61000`-`61249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 44 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 206 IDs in ascending order.
- Eleven new correction candidates and 17 evidence-limited holds are
  recorded. Three existing candidates were rechecked without rewriting their
  append-only rows. Three additional proposals remain report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `61016` | Localization / naturalness | The UI title `Director of Operations` is left in English in Korean, while Chinese translates it. Japanese also leaves the title in English, so the exact Korean rendering remains provisional. Consider `운영 책임자(Director of Operations)`. | Medium |
| `61022` | Speech level | `조심해서 다니게, 친구` uses marked 하게체, while Japanese and Chinese use a conversational plain address. Consider `우리 땅에서는 조심해서 다녀, 친구.` | Medium |
| `61092` | Objective style | `Talk to Sverri or Simeon` lacks the established action ending. Consider `스베리(Sverri)나 시메온(Simeon)과 대화하기`. | High |
| `61167` | Naturalness | `분별 있는 선에서` is an awkward rendering of `within reason`; Japanese says to stay within a reasonable range. Consider `물론 무리하지 않는 선에서.` | High |
| `61171` | Title format | The named book `The Memoir of Galenun Hegem` is rendered only as `갈레눈 헤젬의 회고록`. Consider pairing the complete title, e.g. `갈레눈 헤젬(Galenun Hegem)의 회고록(The Memoir of Galenun Hegem)`. | Medium |
| `61173` | Naturalness | `아카사의 망치 ... 들리고, 내리쳐지고, 다시 들렸으며` is an awkward passive sequence for the hammer rising and falling. Consider `아카사의 망치(The Hammer of Acatha)가 치켜올랐다가 내리꽂히고, 다시 솟았네.` | Medium-high |
| `61182` | Meaning / effect terminology | The ability effect `causing them to panic` is weakened to `적을 당황하게`. Japanese says confusion and Chinese says panic. Consider `때로는 적을 공황 상태에 빠뜨립니다`. | Medium-high |
| `61190` | Item-name format | `Flawless Mitharan Armored String` pairs only `Mitharan`, not the complete item name. Consider pairing the full label, e.g. `흠 없는 미타란 갑옷용 끈(Flawless Mitharan Armored String)`. | Medium |
| `61201` | Naturalness | `내가 당신에게 고마워해야겠군` is stiff and unidiomatic for `I have you to thank`. Consider `당신과 기막힌 은신처 덕분에 살았군. 고맙네.` | Medium-high |
| `61216` | Terminology | The passage uses `권위자(Authority)` for the deity/title, conflicting with the established `권능(Authority)` at `6908`. Apply the established term consistently within this passage. | High |
| `61243` | Item-name format | `Flawless Mitharan Charged Bindings` pairs only `Mitharan`, not the complete item name. Consider pairing the full label, e.g. `흠 없는 미타란 충전 결속구(Flawless Mitharan Charged Bindings)`. | Medium |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; the rows and dispositions
remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `61008` | The objective `Kill the Banshaen Priestess` still uses noun-only `처치`; the existing action-form candidate remains supported. |
| `61118` | `Another stirs in Yolvan?` still does not establish that someone has awakened. Japanese says there is trouble in Yolvan and Chinese does not support the awakening reading; retain the existing meaning candidate. |
| `61125` | The objective `Slay Enfamanir` still uses noun-only `처치`; the existing action-form candidate remains supported. |

## Evidence-Limited Holds

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `61088` | Meaning | English `Please.` and Chinese support a plea, while Japanese `どうぞ` can invite someone to proceed. Keep `제발` provisional without the dialogue turn. |
| `61119` | Meaning / UI | `CAPITAL` is not resolved: Japanese says half/full-width, Chinese identifies the Caps key, and Korean leaves the English label unchanged. Do not choose a keyboard label without stronger UI context. |
| `61184` | Meaning | `Be my second` may describe a second/assistant, but Japanese `介添人` suggests an attendant and Chinese says deputy. Keep `보조인` provisional until the scene context resolves the role. |
| `61013`, `61038`, `61040`, `61115`, `61138`, `61144`, `61160`, `61173`, `61174`, `61182`, `61204`, `61216`, `61222`, `61236` | Embedded line-ending format | Each Korean field stores embedded separators as CRLF while English, Japanese, and Chinese use LF. Preserve the active CSV bytes and do not normalize these fields without an explicit editing decision. This is a storage-format hold, not evidence that the visible paragraph structure should be changed. |

## Additional Report-Only Findings

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `61013` | Title format | The quoted book title `The Wharfmaster's Child` appears only as `『부두장의 아이』`. Consider `『부두장의 아이(The Wharfmaster's Child)』`; this proposal is report-only because the row also has an embedded-line-ending hold in the same ledger dimension. |
| `61109` | Objective style | `Speak to the Crossing Keepers` is rendered `교차점의 수호자들(Crossing Keepers)과 대화`. Consider the established `-하기` form. Preserve its existing `not-issue` ledger row. |
| `61145` | Objective style | `Get the Silver Necklace` is rendered `은 목걸이 획득`, without the established action-form ending. Consider `은 목걸이 획득하기`. Preserve its existing `not-issue` ledger row. |

## Repeated English and Structure

- Sixty-seven exact-English duplicate groups touch this range, comprising
  70 IDs in the range. Korean wording matches within every group.
- Fourteen rows contain embedded line breaks: `61013`, `61038`, `61040`,
  `61115`, `61138`, `61144`, `61160`, `61173`, `61174`, `61182`, `61204`,
  `61216`, `61222`, and `61236`. They contain 79/85/82/85 embedded breaks
  across English/Japanese/Chinese/Korean. At `61013` and `61174`, Korean
  break counts match Japanese, the primary layout reference; the other
  languages differ. Blank-paragraph structure is retained.
- All runtime/display marker identities and order match after excluding
  localized display text inside markers.
- Of 250 IDs, 181 have indexed asset associations (186 links across 116
  assets), and 69 have none. Of the 206 new IDs, 137 are linked (141 links
  across 74 assets), and 69 are unlinked. Asset associations do not establish
  an individual speaker or playback order.

## Range Result

- All 44 pre-existing ledger rows remain unchanged; 206 new IDs are appended
  in ascending order. Eleven correction candidates and 17 holds are recorded.
  Three existing candidates were rechecked; the three additional findings
  above remain report-only.
- The ledger covers 62,320 of 65,135 unique `default` IDs (95.68%), leaving
  2,815 unrecorded. Sequential coverage reaches `61249`; next is
  `61250`-`61499`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `61000`-`61249`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 62,320 ledger fingerprints validate, including the 44 rechecked and
  206 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
