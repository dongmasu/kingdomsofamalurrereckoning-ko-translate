# Sequential `default` Revalidation: IDs `7000`-`7249`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `7000`-`7249`; add only IDs without a current review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- All 250 IDs were checked. 187 IDs without a prior ledger record were
  reviewed and recorded; the other 63 already had current records and their
  source fingerprints were current.
- Nineteen new IDs have correction candidates. Three of those also have an
  evidence-limited dimension that should not be guessed.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `7015` | Naturalness | `여행자 친구` reads like a literal vocative. Smooth the friendly address while preserving the speaker's casual, self-assured voice. | Medium |
| `7027` | Meaning / naturalness | The sentence obscures the relationship between the garment's enchantment pattern and the pattern Artan saw in his fate. Recast it without changing that claim. | High |
| `7042` | Name / format | `Destiny Stone` is paired, but `Tapestry of Fate` is not. Consider pairing the latter on this first occurrence. | Medium |
| `7049` | Meaning / naturalness | The insult depends on a mined-out `stope`; `다 캐낸 갱도` may not convey the empty underground excavation clearly. Keep the exact mining nuance open pending stronger terminology evidence. | Medium; hold overlaps |
| `7079` | Name / title format | `Queen of Cups` is omitted from the title pairing. Consider `컵의 여왕(Queen of Cups)` alongside Maire's name. | High |
| `7090` | Terminology | English uses `the Weave`, while Korean renders it as `운명의 태피스트리`. Check whether the project's established term treats these as the same concept before aligning them. | Medium |
| `7104` | Name / format | `Golden Age Alchemy` may be a named title, but Japanese describes an alchemy shop while English and Chinese do not. Pair the English title only if the asset context confirms it is a proper title. | Medium; hold overlaps |
| `7106` | Meaning | `pulsing circle` is rendered `깜박이는 원`. Check whether the intended minimap animation is pulsing or blinking, and use a natural UI term for the source behavior. | Medium |
| `7114` | Meaning | `the murderer behind those devices` can mean the person responsible for the devices or the murderer associated with them. The Korean selects the former; retain as unresolved until context distinguishes them. | Medium; hold overlaps |
| `7129` | Meaning / naturalness | In the fable, `old cook grain` becomes `낡은 곡물 요리`, which sounds like an old dish rather than cooked grain. Recheck this phrase and nearby references to grain-cook without flattening the intentionally absurd story. | Medium |
| `7147` | Naturalness | `워스원, 대열에 합류해 싸우러 온 건가?` is awkwardly stacked. Smooth the vocative and the question about joining the ranks. | Medium |
| `7155` | Terminology | `High Court of Winter` is rendered `겨울 상궁정`. Check the established Korean form for this institution and align it without changing the named faction. | Medium |
| `7189` | Terminology / format | `번개 피해(Lightning Damage)` repeats the English term inside an effect sentence. Check the established effect-label convention and keep the sentence natural. | Medium |
| `7190` | Naturalness | `콜로사이(Kollossae)의 삶 모든 면` is missing the possessive particle. The phrase should read naturally as `콜로사이의 삶의 모든 면`. | High |
| `7223` | Name / format | The UI label is `Ballads Library`, while the Korean names the location as the House of Ballads library. Check whether the full label should be paired as a distinct place name. | Medium |
| `7239` | Naturalness | `우리가 운명을 이루도록 도와준 건 너야. 고마워` is stiff for `We have you to thank`. Prefer a direct, conversational expression of gratitude. | High |
| `7245` | Speech level | `반갑소` shifts into 하오체, while the Japanese line is plain masculine speech. Use the project's natural conversational register while retaining the respectful epithet. | High |
| `7247` | Terminology | `의약제` for `physics` needs a terminology check in this alchemy list; Japanese reads it as `下剤`, while Chinese follows the English literally. Do not replace it without resolving the source term. | Medium |
| `7249` | Naturalness | `네 말을 믿고 존중해 주지` is understandable but stiff for a spoken challenge. Consider a more idiomatic promise to believe the addressee and acknowledge their merit. | Medium |

## Existing Record Follow-Ups

- `7013` explicitly says “My given name is Eswin Ealfhelm.” This is direct
  first-person evidence for attributing that journal entry to Eswin Ealfhelm;
  no other rows or playback order are inferred.
- `7141` repeats `House of Ballads` in one journal entry and repeats the
  parenthetical both times. Consider retaining the English pairing at first
  mention only. Its existing ledger disposition is updated as a format
  candidate.

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `7049` | The English mining term `stope` is more specific than a generic tunnel; current references do not establish a preferred Korean equivalent. |
| `7104` | The source languages disagree on whether this is an alchemy shop or a named alchemy title; no asset evidence resolves the label type. |
| `7114` | The English phrase does not identify whether the murderer is behind the devices or behind the crimes involving them. |

## Duplicate and Structural Checks

- Fifty-nine exact-English duplicate groups touch the range (1,383 rows across
  the corpus). Korean text matches within every group.
- Runtime-variable and layout-control wrappers and their order match. Localized
  marker contents differ where expected; no logical line-break-count
  differences were found.
- Six Korean strings contain 30 existing CRLF embedded breaks: ID `7004`
  (3), `7034` (2), `7129` (16), `7190` (2), `7196` (1), and `7247` (6).
  These existing bytes were preserved; the other locales use LF at those
  breaks.
- Of the 187 new IDs, 126 have indexed quest-asset links and 61 do not.
  Asset membership does not establish a speaker, handler mapping, branch, or
  dialogue order.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
