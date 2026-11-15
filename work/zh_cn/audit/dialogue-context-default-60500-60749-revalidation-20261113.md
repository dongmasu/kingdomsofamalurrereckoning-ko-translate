# Sequential `default` Revalidation: IDs `60500`-`60749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 71 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 179 IDs in ascending order.
- Ten new-row correction candidates and three new evidence-limited holds
  are recorded. Six existing candidates and one existing hold were rechecked
  without rewriting their append-only rows. Two newly noticed issues at
  existing `not-issue` IDs remain report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `60525` | Name / title format | The row identifies High Priestess Tirin, but the Korean pairs only `Tirin`. Consider pairing the full role/name unit as `티린 대여사제(High Priestess Tirin)`. | Medium |
| `60527` | Name / format | The standalone item `Flawless Mitharan Bloodseeker's Fulcrum` pairs only `Mitharan`. Consider pairing the complete item name, e.g. `흠 없는 미타란 피추적자의 지렛목(Flawless Mitharan Bloodseeker's Fulcrum)`. | Medium-high |
| `60531` | Name / format | The named destination `Great Library` is only `대도서관`. Consider `대도서관(Great Library)`. | Medium |
| `60542` | Title / format | `The Prince of Sorrows` is rendered as `비탄의 집(House of Sorrows) 왕자`, pairing the House but not the complete title. Consider `비탄의 집(House of Sorrows) 왕자(Prince of Sorrows)` if retaining the current Korean title. | Medium |
| `60564` | Name / format | `그월흐마이(Gwalchmai)의 물건(Gwalchmai's Goods)` repeats the person's English name in two parentheticals. Pair the complete shop name once, e.g. `그월흐마이의 물건(Gwalchmai's Goods)`. | High |
| `60576` | Objective style | `Speak with My Allies` is rendered as `내 동맹들과 대화`, unlike the concise action-form objectives. Consider `내 동맹들과 대화하기`. | Medium-high |
| `60577` | Objective style | `Pass through the barrier` is rendered as `장벽 통과`. Use the established action form, `장벽 통과하기`. | Medium-high |
| `60599` | Title / format | The standalone title `Four Shelves, Four Locks` is only `선반 넷, 자물쇠 넷`. Pair the complete title, e.g. `선반 넷, 자물쇠 넷(Four Shelves, Four Locks)`. | Medium |
| `60667` | Naturalness | `Beholden to no god` is rendered literally as `어느 신에게도 빚지지 않은`, which sounds financial in Korean. Consider `어느 신에게도 의지하지 않는 너는, 그 자립만으로도 보상을 얻는다.` | Medium-high |
| `60675` | Objective style | `Explore the Ancient Vault` is only `고대 금고(Ancient Vault) 탐험`. Preserve the paired location and use the action form `고대 금고(Ancient Vault) 탐험하기`. | Medium-high |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; the rows and dispositions
remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `60522` | The meaning uncertainty remains. `growth of magic` may refer to the development of magic or an increase in magical power; the aligned rows do not settle it. |
| `60546` | The naturalness/register candidate remains supported: `승리는 그대의 것이 될 것이다` is more literary and elevated than the plain English/Japanese. The specific speaker remains unconfirmed. |
| `60560` | The parallel terminology candidate remains supported: use `소형 생물` to match the paired `대형 생물` choice at `36853`. |
| `60614` | Both findings remain supported: `잘난 조수` misreads `lofty` as status/arrogance rather than height, and `Templar` terminology varies. Keep the office-term choice scoped pending a project-wide decision. |
| `60646` | The meaning/naturalness candidate remains supported: Japanese clarifies `baby brothers` as younger brothers, not necessarily children; `세상의 어린 동생들` can imply they are all young. |
| `60652` | The creature-combat consistency candidate remains supported: compare with `52702` and use the established `처치` sense rather than `파괴` for the Crudok. |
| `60709` | The idiom candidate remains supported: `for a song` means cheaply, not singing. Korean `그게 노래라고?` loses the bargaining joke; consider `그게 헐값이라고?`. |

## Additional Report-Only Findings at Existing IDs

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `60545` | Objective style | `Kill Meathgra` is rendered `미스그라(Meathgra) 처치`, without the action-form ending used by comparable objectives. Consider `미스그라(Meathgra) 처치하기`. Preserve its existing `not-issue` ledger row. |
| `60653` | Objective style | `Deliver the Death Notices` is rendered `사망 통지 전달`, not the established action-form objective. Consider `사망 통지 전달하기`. Preserve its existing `not-issue` ledger row. |

## Evidence-Limited Holds

| ID | Question and disposition |
| ---: | --- |
| `60660` | Capitalized `the House` may refer to a named Fae House or an organization; Korean `우리 가문` selects a family/clan reading. The row and asset association do not establish which House is meant. |
| `60711` | `older fighters` may mean older by age or long-serving/veteran fighters. Japanese `古株` supports veteran status, while English and Chinese can be read as age. Keep `나이 든 투사들` provisional. |
| `60679` | English `I did not suppose so`, Japanese `ああ、だろうな`, and Chinese `我本不应该这么做` diverge in polarity/implication. Korean `나도 아니리라 생각했어` is awkward, but the locales do not support a confident replacement. |

## Repeated English and Structure

- Fifty-five exact-English duplicate groups across the corpus touch this
  range, comprising 1,241 corpus rows; 58 IDs in the range participate.
  Korean wording is identical within every group.
- Five rows contain embedded line breaks: `60503`, `60518`, `60631`,
  `60635`, and `60683`. Each language has 11 embedded breaks in total across
  the range; per-row break counts match.
- Runtime-token and detected markup identities and order match across all
  four languages. Localized display text inside display markers is preserved.
- Of 250 IDs, 202 have indexed asset associations (246 links across 156
  assets), and 48 have none. Of the 179 newly recorded IDs, 131 are linked
  (132 links across 72 assets), and 48 are unlinked. Asset associations do
  not establish an individual speaker or playback order.

## Range Result

- All 71 pre-existing ledger rows remain unchanged; 179 new IDs are appended
  in ascending order. Ten correction candidates and three new holds are
  recorded. Six existing candidates and one existing hold were rechecked;
  the `60545` and `60653` objective findings remain report-only.
- The ledger covers 61,924 of 65,135 unique `default` IDs (95.07%), leaving
  3,211 unrecorded. Sequential coverage reaches `60749`; next is
  `60750`-`60999`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `60500`-`60749`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 61,924 ledger fingerprints validate, including the 71 rechecked and
  179 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; all
  nine related tests and the CRLF-aware audit diff check pass.
