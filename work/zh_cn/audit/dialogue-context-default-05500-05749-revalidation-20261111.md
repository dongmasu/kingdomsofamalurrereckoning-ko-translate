# Sequential `default` Revalidation: IDs `5500`-`5749`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `5500`-`5749`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 181 new IDs were reviewed and recorded. The other 69 IDs already had ledger
  records and were left unchanged.
- Four IDs have correction candidates. Two IDs have evidence-limited holds.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `5527` | Naturalness | `순례(Sojourn)를 걷고` is a literal, awkward collocation for completing the named rite. Japanese describes performing the rite; Chinese describes completing the journey/rite. Consider a natural verb such as `순례를 마치고`, while keeping the three rite names provisional pending a terminology decision. | High |
| `5543` | Formatting / name consistency | The repeated title is formatted two ways: `엘스윈 경(Sir Elswin)` and `엘스윈(Elswin) 경`. Use the same title-inclusive parenthetical form at both occurrences. | High |
| `5657` | Meaning | `공격하라고 명령한 것 같아` weakens the journal's conclusion. English, Japanese, and Chinese all say the note lets the narrator deduce/infer that Goyen ordered the attack. Consider wording that preserves that inference without adding uncertainty. | High |
| `5705` | Terminology | `Side Quests` is rendered as `하위 임무`, unlike the established `부가 퀘스트` at ID `52930`. Align the heading and explanatory sentence with `부가 퀘스트`, preserving the `{*2...}` and `{LINE_LEFT}` markers. | High |

## Evidence-Limited Holds

| ID | Reason and disposition |
| ---: | --- |
| `5623` | Japanese identifies the remaining group as the Sparrow faction, while English and Chinese use a generic pronoun. The Korean remains generic; do not add a faction name without corroborating context. |
| `5699` | `second` is a specific duel role. Japanese describes an attendant and Chinese an assistant; the current `결투 조수(second)` is understandable, but the most accurate Korean role label is not settled by these lines alone. |

## Duplicate and Structural Checks

- Forty-five exact-English duplicate groups touching the new IDs (923 rows)
  were checked against the full `default` corpus. Korean text matched in
  every group.
- Logical line-break counts and runtime/layout-token signatures match across
  all four languages for all 181 new IDs.
- Korean embedded breaks use CRLF at IDs `5605`, `5640`, `5661`, and `5745`
  (22 breaks total); the corresponding English, Japanese, and Chinese breaks
  use LF. These are byte-level differences, not logical layout differences.
  Preserve the existing bytes.
- Of the 181 new IDs, 127 have indexed asset links and 54 do not. Asset
  association remains a context clue only; unsupported speaker attribution
  and dialogue order remain unknown.

Four-language source fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
