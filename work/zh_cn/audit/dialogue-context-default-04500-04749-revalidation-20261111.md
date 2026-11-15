# Sequential `default` Revalidation: IDs `4500`-`4749`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `4500`-`4749`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 176 new IDs were reviewed and recorded. The other 74 IDs in this interval
  already had ledger records and were left unchanged.
- One correction candidate and four evidence-limited format holds were
  identified. The candidate is a proposal, not approval to edit the CSV.
- Meaning, Korean naturalness, register where applicable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidate

This is an ID-scoped proposal, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4521` | Meaning / terminology | English says Savant Engar can be found in the `main hall` of the Scholia Arcana chapterhouse; Japanese explicitly says `メインホール`. Korean `지부 본관` can mean the branch's main building rather than its hall. Other Scholia Arcana references vary between `대강당` (`8142`) and `본관(Main Hall)` (`55994`). Consider `그곳 스콜리아 아르카나 지부의 중앙 홀에서 만날 수 있을 거야`, then reconcile the named-location form across those references. The already-established `사반트 엥가르(Savant Engar)` title is correct and is not reopened. | Medium-high |

## Evidence-Limited Format Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `4524` | Format | The embedded paragraph break is LF in English, Japanese, and Chinese, but CRLF in Korean. Each locale has one logical break and the runtime/layout tokens match. Preserve the current bytes pending evidence about whether the game parser distinguishes CRLF from LF inside a string. |
| `4655` | Format | The embedded story breaks are LF in English, Japanese, and Chinese, but CRLF in Korean. The number of logical breaks matches; do not normalize the Korean bytes without establishing the game's handling. |
| `4672` | Format | The ability-description break is LF in English, Japanese, and Chinese, but CRLF in Korean. The logical break count and formatting markers match. Hold the byte-level normalization question. |
| `4678` | Format | The journal-entry breaks are LF in English, Japanese, and Chinese, but CRLF in Korean. The logical break count matches; retain the current text until CRLF rendering behavior is known. |

## Prior Decision Checks

Previously resolved findings were checked against the active Korean and
retained: the formal `사반트` rank at ID `4521`, the lock-picking tool at
`4597` (`프리즘미어 자물쇠 따개`), the oath-like fragment at `4631`, and the
rendering of `The Inferno` at `4746`. `Deep Gloam` at `4534` and the Sorrows
term at `4537` also match the established active forms. These decisions were
not reopened.

## Duplicate and Structural Checks

- Forty-six exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (467 rows total). Every group
  has identical Korean text.
- Logical line-break counts and runtime/layout-token sequences match across
  English, Japanese, Chinese, and Korean for all 176 new IDs. The four
  Korean CRLF cases above are byte-level line-ending differences, not missing
  or additional logical breaks.
- The 74 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset associations do not establish a per-key speaker or
  playback order; unsupported attribution and order remain unknown.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
