# Sequential `default` Revalidation: IDs `5250`-`5499`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `5250`-`5499`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 185 new IDs were reviewed and recorded. The other 65 IDs already had ledger
  records and were left unchanged.
- Three IDs have correction candidates. Seven IDs have evidence-limited holds.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `5296` | Naturalness | `불안정함과 공포를 먹고살지` is awkward Korean. English and Japanese say the leader feeds on the people's anxiety and fear. Consider `우리 사람들의 불안과 공포를 먹고살지` or another natural wording that preserves the predatory metaphor. | High |
| `5309` | Speech level / naturalness | The hesitant speech shifts into stiff formal endings (`때가 왔습니다`, `출발합니다`) despite the casual, plain Japanese throughout. Consider a consistent conversational rendering while retaining the pauses and comic indecision; do not assign a speaker from the asset association alone. | Medium |
| `5341` | Naturalness | `내가 고쳐 줄게` can sound as if the injured person is an object being repaired. Japanese explicitly means to heal the person. Consider `내가 치료해 줄게` or another natural expression of care. | High |

## Evidence-Limited Holds

| ID | Reason and disposition |
| ---: | --- |
| `5279` | `Chair Merchant` is a role/title whose exact institutional meaning is unresolved. Japanese suggests a merchant head and Chinese a chamber chair; retain `상인 대표(Chair Merchant)` pending stronger context. |
| `5283` | `Neophyte` and `Docent` are academic roles, but English, Japanese, and Chinese do not settle a consistent Korean rank pair. Keep the current terms provisional. |
| `5311` | `a fair telling` has lore-specific ambiguity. Japanese invokes the Telling, while Chinese reads it as a fair prophecy; do not standardize it from this line alone. |
| `5325` | The vocative `dove` is omitted in Japanese, rendered as a peace-bringer in Chinese, and generalized as `친구` in Korean. Its intended form of address is unresolved. |
| `5348` | `Down` is an isolated short label; Japanese poses it as a question while Chinese and Korean render a direction. UI context is insufficient to choose a reading. |
| `5369` | `Adept` differs across the references (Japanese uses a mage term; Chinese uses an attendant/apprentice term). Retain `숙련자(Adept)` provisionally without assigning an organization or rank. |
| `5412` | `Holdfast locks` may be a place-specific lock or seal. Japanese says a seal, while English and Chinese suggest locks; retain the current broad wording pending context. |

## Duplicate and Structural Checks

- Forty-nine exact-English duplicate groups touching the new IDs (588 rows)
  were checked against the full `default` corpus. Korean text matched in
  every group.
- Logical line-break counts and runtime/layout-token signatures match across
  all four languages for all 185 new IDs.
- Korean embedded breaks use CRLF at IDs `5253`, `5275`, `5430`, `5486`, and
  `5492` (20 breaks total); the corresponding English, Japanese, and Chinese
  breaks use LF. These are byte-level differences, not logical layout
  differences. Preserve the existing bytes.
- Of the 185 new IDs, 120 have indexed asset links and 65 do not. Asset
  association remains a context clue only; unsupported speaker attribution
  and dialogue order remain unknown.

Four-language source fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
