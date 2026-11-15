# Sequential `default` Revalidation: IDs `5750`-`5999`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `5750`-`5999`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 170 new IDs were reviewed and recorded. The other 80 IDs already had ledger
  records and were left unchanged.
- Three IDs have correction candidates. Two IDs have evidence-limited holds.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `5754` | Meaning / naturalness | `새로운 변화` conveys a change but weakens the narrative image in `a new twist in the Telling`; Japanese also says a new twist. Consider a natural phrase that retains a new turn in the story/prophecy without over-defining the lore. | Medium |
| `5871` | Meaning | `마법사들은 권력을 탐하지` reads as seeking political authority. The dialogue is about wizards and a sorceress bargaining over power; Japanese and Chinese use the broader sense of power. Consider `힘` or `마력` according to the intended magical context. | High |
| `5949` | Speech level / naturalness | The captain's Korean uses repeated 하오체 (`왔소`, `잃어버렸소`), while Japanese uses a more ordinary conversational register. Consider a consistent, natural register for the greeting and rhetorical questions without losing the captain's dry humor. | Medium |

## Evidence-Limited Holds

| ID | Reason and disposition |
| ---: | --- |
| `5842` | `Forum` is a capitalized place label, but Japanese reads it as a council and Chinese as a square. Retain `포럼(Forum)` pending location context. |
| `5918` | Japanese reorders `{2}` and `{1}` relative to English, Chinese, and Korean. Korean preserves the English/Chinese variable order; retain it rather than normalizing to Japanese. |

## Duplicate and Structural Checks

- Forty-one exact-English duplicate groups touching the new IDs (549 rows)
  were checked against the full `default` corpus. Korean text matched in
  every group.
- Logical line-break counts match across all four languages for all 170 new
  IDs. Runtime/layout-token signatures also match except at ID `5918`, where
  Japanese orders dynamic variables differently; Korean matches English and
  Chinese.
- Korean embedded breaks use CRLF at IDs `5758`, `5793`, `5849`, `5887`,
  `5888`, `5899`, and `5933` (30 breaks total); the corresponding English,
  Japanese, and Chinese breaks use LF. These are byte-level differences, not
  logical layout differences. Preserve the existing bytes.
- Of the 170 new IDs, 121 have indexed asset links and 49 do not. Asset
  association remains a context clue only; unsupported speaker attribution
  and dialogue order remain unknown.

Four-language source fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
