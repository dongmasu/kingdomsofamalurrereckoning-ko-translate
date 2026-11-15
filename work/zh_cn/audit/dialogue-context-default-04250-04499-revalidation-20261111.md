# Sequential `default` Revalidation: IDs `4250`-`4499`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `4250`-`4499`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 174 new IDs were reviewed and recorded. The other 76 IDs in this interval
  already had ledger records and were left unchanged.
- Two correction candidates were identified. They are proposals, not approval
  to edit the translation CSV.
- Meaning, Korean naturalness, register where applicable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4311` | Naturalness | `미사루를 걸고 부탁이니` is an awkward literal rendering of `for Mitharu's sake`. Japanese and Chinese use a plea invoking Mitharu. Consider `미사루를 생각해서라도 제발 놈들을 여기로 끌고 오지 마`, retaining the urgent request not to lead the Kobolds back. The Kobold name is already paired as `코볼트(Kobold)`. | High |
| `4337` | Naturalness | `잠금 보관되어 있어` is not idiomatic Korean. English `locked away`, Japanese `収められている`, and Chinese `被锁在` describe an old book kept in the Great Library. Consider `크라운홀드(Crownhold)의 대도서관에 보관되어 있어` while retaining the book's age and the uncertainty that it may contain the sought secrets. | High |

## Follow-up: `The Sorrows`

The review of ID `4472` provides an explicit definition: the Sorrows are an
accumulation of destructive magic siphoned from the Winter Fae. English ID
`64074` further calls them “a force of magical energy,” with Japanese
`魔法エネルギー` corroborating that reading. This resolves the prior
evidence-limited meaning holds at IDs `3364` and `3831`: Korean `비탄의
힘(Sorrows)` is supported, not an unsupported commitment to a people or
creature. Their ledger meaning and overall dispositions are updated to
`not_flagged` and `not-issue`.

The current Korean at ID `64074` instead calls the same referent
`소로우(Sorrows)`, while ID `4472` and related entries use
`비탄의 힘(Sorrows)`. Record this as a separate terminology candidate for ID
`64074`; a context-preserving revision should use the established Korean
term and express that the Sorrows are magical energy. This supplemental
candidate is outside the `4250`-`4499` range count and remains unapproved.

## Duplicate and Structural Checks

- Forty-two exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (544 rows total). Every group
  has identical Korean text.
- Embedded line-break counts and runtime/layout-token sequences match across
  English, Japanese, Chinese, and Korean for all 174 new IDs.
- The 76 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset associations do not establish a per-key speaker or
  playback order; unsupported attribution and order remain unknown.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
