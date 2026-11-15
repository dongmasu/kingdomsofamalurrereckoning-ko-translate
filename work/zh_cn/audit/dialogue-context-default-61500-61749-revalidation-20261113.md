# Sequential `default` Revalidation: IDs `61500`-`61749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 63 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 187 IDs in ascending order.
- Seven new correction candidates and 11 evidence-limited holds are recorded.
  Five existing candidates and one existing speech-level hold were rechecked
  without rewriting their append-only rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `61524` | Objective style | `Speak to Stellan Reitan` is phrased as a noun label ending in `대화`, unlike the established action-form objectives. Consider `스텔란 레이탄(Stellan Reitan)과 대화하기`. | High |
| `61589` | Terminology | The established collectible is `로어스톤(Lorestone)`, not `지식석(Lorestone)`. Use the established term while retaining the explanation and reward. | High |
| `61619` | Item-name format | `Flawless Mitharan Amplified Bindings` pairs only `Mitharan`. Consider pairing the complete label: `흠 없는 미타란 증폭 결속구(Flawless Mitharan Amplified Bindings)`. | Medium-high |
| `61658` | Title format | The named figure/title `The Carver` is rendered `조각가(Carver)`, omitting the article in the paired English name. Consider `조각가(The Carver)`. | High |
| `61677` | Item-name format | `Flawless Mitharan Charged Shaft` pairs only `Mitharan`. Consider pairing the complete label: `흠 없는 미타란 충전 자루(Flawless Mitharan Charged Shaft)`. | Medium-high |
| `61721` | Naturalness | `화이트스톤 시장 별장` is an awkward Korean noun sequence and can be misread as a market villa. Consider `화이트스톤 시장의 별장(Whitestone Mayor's Cottage)`, avoiding a second parenthetical for `Whitestone`. | Medium |
| `61748` | Item-name format | `Flawless Mitharan Frosted Hilt` pairs only `Mitharan`. Consider pairing the complete label: `흠 없는 미타란 서리 깃든 손잡이(Flawless Mitharan Frosted Hilt)`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `61532` | Meaning | English and Chinese say `no promise`, while Japanese and Korean use the sense of `hope`. The current `희망` is natural and follows Japanese, but the cross-language nuance is unresolved; do not force a change without more context. |
| `61578` | Meaning / source integrity | English, Chinese, and Korean contain a slave-sale contract, but Japanese contains an unrelated first-person account. The Japanese field also has no paragraph breaks where the other three have six. Treat this as a source-alignment conflict, not a Korean translation decision. |
| `61540`, `61550`, `61555`, `61557`, `61578`, `61631`, `61685`, `61691`, `61745` | Embedded line-ending format | These Korean fields store embedded line separators as CRLF, while English, Japanese, and Chinese use LF. Logical break counts otherwise match at these IDs. Preserve the current CSV bytes; do not normalize the embedded separators as part of review. |
| `61728` | Meaning | English cuts off at `the Weeping K‒`, Japanese trails off before identifying the title, and Chinese supplies a complete `Weeping King` reference. Korean also completes it as `통곡의 왕`. Do not infer whether the full title is intended. |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their rows and dispositions
remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `61570` | The exact title `Irion, King of Cups` still lacks the English title pairing in Korean. The existing candidate remains supported. |
| `61586` | The `Warden` role still varies across the same quest context (`교도관`, `관리관`, and `감시관`); Japanese and Chinese do not fully resolve the Korean role. Retain the existing terminology candidate. |
| `61603` | The source explicitly says `clan of Eventide`, rendered `이븐타이드 씨족`; its later `our people` is rendered `우리 민족`. Do not extend the clan correction to that distinct phrase. Preserve the existing append-only candidate record and document this scope clarification. |
| `61724` | The standalone `High Priestess` is already `대여사제`. The inconsistency identified in the prior group is at `47111`, not a reason to change this row. Preserve the existing record. |
| `61731` | The rescue-quest term `bandits` remains inconsistent with `도적` elsewhere in the group; retain the existing terminology candidate. Speech-level attribution remains uncertain because no per-key speaker is established. |

## Additional Cross-Checks

- Exact source rows in 57 repeated-English groups touch this range, comprising
  59 range IDs and 1,266 corpus rows. Korean wording matches within every
  group.
- Nine rows contain embedded line breaks, totaling 24/18/24/24 breaks across
  English/Japanese/Chinese/Korean. `61578` is the sole logical break-count
  mismatch; Japanese has no embedded break in that row.
- Normalized runtime, display, and layout marker sequences match across the
  four languages.
- Of 250 IDs, 189 have indexed asset associations (190 links across 122
  assets), and 61 have none. Of the 187 newly recorded IDs, 126 are linked
  (126 links across 74 assets), and 61 are unlinked. Asset associations do
  not establish per-key speakers or playback order.
- Spot checks confirmed that `61607` is a Traveler dialogue line whose
  Korean meaning aligns with the sources, and `61732` already pairs the full
  title `Grand Faemage Gorrenet`; neither is promoted as a new candidate.
  The imperative at `61535` is also supported by the source `Thank Lyria!`
  and is not treated as a register error.

## Range Result

- All 63 pre-existing ledger rows remain unchanged; 187 new IDs are appended
  in ascending order. Seven new correction candidates and 11 evidence-limited
  holds are recorded.
- The ledger covers 62,686 of 65,135 unique `default` IDs (96.24%), leaving
  2,449 unrecorded. Sequential coverage reaches `61749`; next is
  `61750`-`61999`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `61500`-`61749`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The four-language ledger fingerprints, regenerated quest-asset index and
  catalogs, related tests, and CRLF-aware audit diff check are verified after
  the ledger update.
