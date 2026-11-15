# Sequential `default` Revalidation: IDs `54750`-`54999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 77 existing ledger fingerprints; all match and their rows
  remain unchanged. Appended the other 173 IDs in ascending order.
- Identified three new correction candidates and two evidence-limited holds.
  Two candidates are on newly added ledger rows; the candidate at `54779`
  concerns an existing ledger row, which remains unchanged. Rechecked four
  existing correction candidates without changing their ledger records.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `54779` | Objective format | `Defeat Calder Vonn` is a quest objective, but Korean uses the imperative `처치하라`; the established objective style is the compact `-하기` form. Consider `칼더 본(Calder Vonn) 처치하기`. | High |
| `54781` | Terminology / label | `Destiny Unbound` is rendered `속박 없는 운명`, while the related `Unbind Destiny` labels use `운명 해방` (`17426`) and `운명의 속박 풀기` (`34900`). The latter is not yet a settled global form, but `운명 해방: {1}회` is a more natural candidate and preserves the count marker. | Medium |
| `54785` | Naturalness | `리리아(Lyria)의 이름으로` is a literal oath inserted between the subject and question, making the line awkward. Reorder the invocation naturally while preserving the incredulous question; for example, `감시대장(Captain of the Watch)이... 리리아(Lyria)님, 그자가 어떻게 살인범일 수 있지?` The exact title wording remains a separate terminology question. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `54753` | Meaning | English `send you off as you arrived` is awkward, and Japanese and Chinese differ on whether the comparison concerns the manner or timing of the send-off. Korean preserves both arrival and farewell; do not choose a more specific relation without scene evidence. |
| `54874` | Meaning / characterization | English `an innocent`, Japanese `人がいい` (good-natured), and Chinese `无辜` (blameless) support different nuances. Korean `순진한 사람` is plausible but not established by the sources; retain pending context. |

## Rechecked Findings

- Existing candidates `54797`, `54932`, `54941`, and `54951` remain supported by
  their earlier reports. Their existing ledger records are preserved.
- The accepted terminology correction at `54808`, `비탄의 힘(Sorrows)`, is
  already present and distinguishes this magical force from the House of
  Sorrows.
- The accepted age-neutral wording at `54773` remains in place; `내 형제` does
  not specify an unsupported younger-sibling relationship.
- The earlier stylistic concern at `54861` was re-opened and cleared. The
  line's `대화하고 싶다고 밝혔을 뿐이야` naturally explains the speaker's
  peaceful approach; no individual speaker is inferred.
- `54828` preserves the point that the victim's race does not lessen the
  tragedy. `54894` uses `도박장` as a generic venue, consistent with the
  existing terminology disposition. `54990` already matches the previously
  reviewed exact-English duplicate wording.

## Source Notes and Structure

- Fifty-six exact-English duplicate groups across the corpus touch this
  range, covering 1,083 target rows. Korean wording matches within every
  group.
- Five rows contain embedded line breaks: `54765` (5), `54783` (5),
  `54820` (8), `54830` (2), and `54993` (3). Each language has 23 embedded
  breaks total. Line-break counts and runtime/display-marker signatures
  match across English, Japanese, Chinese, and Korean.
- Of 250 IDs, 203 have indexed asset associations, represented by 206 links
  across 140 assets; 47 have no indexed asset. Of the 173 newly recorded
  IDs, 126 are linked through 127 links across 76 assets, and 47 are
  unlinked. Asset associations do not establish per-key speakers or playback
  order.

## Range Result

- After adding 173 IDs, the ledger covers 57,661 of 65,135 unique `default`
  IDs (88.53%), leaving 7,474. Sequential coverage reaches `54999`; the next
  range is `55000`-`55249`.
- The three new candidates are documented in this report; only `54781` and
  `54785` are marked on newly appended ledger rows. ID `54779`'s existing
  ledger row was preserved append-only, with the new finding recorded here.
- The regenerated ID catalog reports 45,788 reviewed IDs with indexed asset
  links and 11,873 without them. This is distinct from the current range's
  203 linked and 47 unlinked IDs.
- Existing ledger rows remain append-only. Findings require separate
  approval before any translation CSV edit; no translation CSV was changed.
