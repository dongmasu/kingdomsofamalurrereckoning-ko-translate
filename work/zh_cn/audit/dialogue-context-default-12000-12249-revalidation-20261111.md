# Sequential `default` Revalidation: IDs `12000`-`12249`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-two existing ledger records were retained after their four-language
  fingerprints were verified. The other 188 IDs were compared and added.
- Two newly recorded IDs have correction candidates. Seventeen newly recorded
  IDs retain evidence-limited findings; no candidate and hold overlap.
- Of the 188 new records, 127 have indexed quest-asset links and 61 do not.
  Two IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `12090` | Speech level | English gives a direct caution, and Japanese uses the casual `気をつけてな`; Korean `조심하게` shifts to marked 하게체. Consider a plain conversational form such as `이 땅에서는 조심해`, without inferring a speaker. | Medium-high |
| `12130` | Speech level | The first two clauses use plain conversational endings (`흥미롭군`, `볼 수 있을까`), then `조심하게` abruptly shifts to 하게체. Japanese `気をつけてな` supports keeping the final clause conversational, e.g. `조심해`. The asset has no individual-speaker mapping. | Medium-high |

These are review proposals, not authorization to edit the translation CSV.

`12131` already has a high-confidence speech-level candidate in the
asset-context review of `HM01`; its register inconsistency remains unresolved
and is not counted as a new finding here. See
[`dialogue-context-hm01-revalidation-20261110.md`](dialogue-context-hm01-revalidation-20261110.md).

## Evidence-Limited Findings

| IDs | Dimension | Reason and disposition |
| --- | --- | --- |
| `12004` | Text type | The terse `Bag parent. Not for actual use.` label may be internal metadata; whether players see it is not established. |
| `12035` | Meaning | The scope of `none of the Tuatha have escaped my attack` differs across references: Japanese says they were repelled, Chinese says they were killed, and English/Korean leave the result broader. |
| `12046` | Title | `Getting Your Hands Dirty` can mean doing unpleasant work or personally getting involved; the isolated title does not resolve the intended sense. |
| `12065` | Meaning | The antecedents of `they` and `him`, and the relation expressed by `leave him disregarding`, remain unclear across the source readings. |
| `12114` | Title / referent | English `The Silken Seat`, Japanese `シルク亭` (inn), and Chinese's soft seat reading do not establish whether this is a venue or a literal object. |
| `12154` | Meaning / context | The riverbed warning and adding a basement for gold are juxtaposed without an explained connection in any source. |
| `12155` | Title / referent | `Plain Jane` may be the ordinary-woman idiom or a specific name/title; Japanese and Chinese favor the generic reading, but the isolated key does not establish its use. |
| `12161` | Place / referent | Japanese reads `Forum` as a public hall and Chinese as a square; the asset-level link does not settle which place or label is meant. |
| `12163` | Rank / name | The references differ on whether `Pledgeshield` is a formal rank or descriptive title. Preserve the current form pending stronger evidence. |
| `12178` | Name / institution | Japanese transliterates `Orbocant` as a name, while Chinese reads it as a council. The isolated label does not resolve the category. |
| `12190` | Meaning | The fragment `Of whom? The Arnes?` and its relation to the sought deserter Clyeth are restructured differently across the sources. |
| `12192` | Idiom | `Stay dry, captain` can be a sobriety idiom or a literal nautical warning; Japanese supports the former while Chinese supports the latter. Korean follows the Japanese reading. |
| `12199` | Terminology | `Scholia Arcana` has competing active Korean renderings. This key's phonetic form is intelligible, but the broader institutional-name choice remains unresolved. |
| `12228` | Referent | `At the bottom` lacks its antecedent in this key. The references agree on the location but do not identify the structure. |
| `12230` | Meaning / syntax | The opening `Follow me?` and the referent of `it` are unclear; Japanese and Chinese omit or reshape the opening. |
| `12235` | Place / terminology | `St. Odwig's Mission` is rendered as a religious institution in Korean and Japanese, but Chinese reads `Mission` as a task. |
| `12243` | Register / speaker | Korean uses consistent, marked 하오체, while Japanese is a blunt imperative. Without per-line speaker evidence and surrounding voice context, do not normalize the register by guess. |

At `12116`, English, Japanese, and Korean have four logical line breaks,
while Chinese has three. Korean matches English and Japanese; this is a
source-locale layout discrepancy, not a Korean formatting correction.

The current text reflects established decisions at `12000` (`에테네`),
`12024` (`숙박하기`), `12037` (`동굴`), `12143` (`남극광`), `12236`
(natural riverbank wording), and `12240` (`워스원(Warsworn)`). The approved
`12102` faction-name pairing is present; existing context and terminology
dispositions at `12031`, `12141`, `12204`, and `12234` were not reopened or
recounted. No individual speaker or playback order was assigned.

## Duplicate and Structural Checks

- Forty-eight exact-English duplicate groups touch the 188 new IDs,
  comprising 578 rows across the corpus. Korean text matches in every group.
- Runtime placeholders, named variables, layout tokens, display-wrapper
  identities/order, and brace balance match across all four languages for
  the 188 new IDs. Localized text inside display wrappers varies by language
  as expected.
- Logical line-break counts match across all four languages except for the
  Chinese-source difference at `12116`.
- Seven Korean strings contain 31 existing embedded CRLF breaks:
  `12008` (3), `12044` (6), `12078` (5), `12116` (4), `12187` (4),
  `12195` (1), and `12219` (8). Their existing bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
