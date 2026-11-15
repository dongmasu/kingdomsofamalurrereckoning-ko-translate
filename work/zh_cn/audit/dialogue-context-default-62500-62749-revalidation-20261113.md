# Sequential `default` Revalidation: IDs `62500`-`62749`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 60 pre-existing ledger rows and preserved them. Appended the
  remaining 190 IDs in ascending order.
- Nine new correction candidates and five embedded-line-ending holds are
  recorded. The line-ending holds do not authorize newline normalization.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `62523` | Naturalness | `혼자 있게 좀 둬` is an awkward rendering of `Leave a man in peace`; Japanese says to leave the speaker alone. Consider `그만 좀 내버려 둬` or an equally natural equivalent. | High |
| `62550` | Meaning | English `I adore Olaana` describes the speaker's affection, but Korean says Olaana is lovable (`올라나는 사랑스러워`). Chinese supports the direct affection reading; consider `올라나(Olaana)를 정말 좋아해`. | High |
| `62563` | Exact-English duplicate consistency | English is identical at `16898`, `18884`, `60779`, and `62563`, but Korean has two renderings: `좋아, 그럼.` and `그럼 또 보자.` Japanese distinguishes `よし` from `またな` / `またね`, so the contextual difference is real in that draft. The project rule favors one Korean rendering for identical English; consider a group-wide, context-neutral form rather than retaining two without per-key speaker evidence. | Medium |
| `62613` | Speech level | The line moves from conversational `-지` to the more formal `중시한다`; Japanese remains conversational. Consider making the final clause conversational as well, e.g. `겉치레보다 행동을 중시하지.` | Medium-high |
| `62633` | Format / naturalness | `대회계원(Bursar's)` carries an English possessive ending into the parenthetical pairing, while Japanese identifies the institution as the source of funding. Consider rephrasing naturally as `이제 대회계원에서 우리 원정 비용을 지원해`, pairing the institution without the possessive suffix. | Medium-high |
| `62637` | Naturalness | `곧 나중이라는 건 없을 거야` is a literal, difficult-to-read rendering of `Soon there will be no later.` Preserve the sense that time is running out while recasting the Korean naturally. | Medium |
| `62658` | Format / terminology | The source refers to the other `Hirelings` (plural), while Korean pairs `고용병(Hireling)` and adds a Korean plural suffix. Consider `다른 고용병들(Hirelings)` to keep the pairing parallel. | Medium-high |
| `62682` | Address / naturalness | `당신과 거래할 수 있어서 즐거웠어` combines the formal-leaning address `당신` with casual speech. Japanese omits the pronoun and uses casual speech; consider `아, 아니, 거래해서 즐거웠어.` | Medium-high |
| `62730` | Naturalness | `최고의 주사위가 이기길` is stilted. Japanese turns the line into an appeal to the dice; consider a natural Korean equivalent that retains the playful chance-taking tone. | Medium |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their statuses and prior
dispositions remain unchanged.

| ID | Recheck |
| ---: | --- |
| `62502` | The split `선택은 아카라가 하는 거야. 네가 아니라고!` remains awkward against the clear English and Japanese contrast. Preserve the existing candidate. |
| `62505` | The sentence still ends with the malformed `웬센과 대등한 이지`. Preserve the existing naturalness/grammar candidate. |
| `62582` | The singular `sprite` remains unpaired in Korean; preserve the existing terminology and English-pairing candidate. |
| `62650` | English places Adar behind the jail, while Japanese and Chinese generally place him in it. Preserve the evidence-limited location hold. |
| `62676` | `도와 달라고 한 실험을 도와야겠다` still repeats `도와`; preserve the existing naturalness candidate. |

The other 55 pre-existing rows in the range were rechecked and retained as
not-issue records.

## Additional Cross-Checks

- Fifty-eight exact-English duplicate groups touch this range, comprising 63
  range IDs and 1,402 corpus rows. Korean matches within every group except
  the four-ID group listed above; its Japanese variants support two different
  contextual readings, but the existing Korean divergence remains a
  consistency candidate under the project's exact-English rule.
- Five rows contain embedded line breaks, totaling 17 breaks in each
  language. Per-row logical break counts match. All 17 embedded Korean
  separators are CRLF while English, Japanese, and Chinese use LF; preserve
  the CSV bytes and do not normalize them.
- Runtime-marker identities and order match across all four languages for
  the range.
- Of 250 IDs, 198 have indexed asset associations (203 links across 122
  assets), and 52 have none. Of the 190 newly recorded IDs, 138 are linked
  (141 links across 70 assets), and 52 are unlinked. Asset associations do
  not establish per-key speakers or playback order.

## Range Result

- All 60 pre-existing ledger rows remain unchanged; 190 new IDs are appended
  in ascending order. Nine new correction candidates and five
  embedded-line-ending holds are recorded.
- The ledger covers 63,400 of 65,135 unique `default` IDs (97.34%), leaving
  1,735 unrecorded. Sequential coverage reaches `62749`; next is
  `62750`-`62999`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `62500`-`62749`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All ledger fingerprints validate, including the 60 rechecked and 190
  newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
