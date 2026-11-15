# Candidate Application Reconciliation: IDs `47250`-`47499`

- Date: 2026-11-15.
- Rechecked all 14 current candidate IDs against the active Korean row,
  English meaning, Japanese tone and phrasing, Chinese supporting evidence,
  and the cited context reports.
- Thirteen IDs were newly counted. `47293` had already been counted as a
  linked `God Under the Mountain` candidate; it was rechecked without
  recounting.
- The earlier `The Font` consistency check mentioned `47256`, but did not
  count it as an application-reconciliation candidate. It is counted here
  once; its current `샘(The Font)` form is already correct.
- Two full-sentence refinements were applied at `47293` and `47447`. The
  other supported candidate wording was already present in the active CSV.
- Evidence-limited questions `47280`, `47300`, and `47496` remain separate
  holds. No speaker or playback order was inferred.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `47256` | Retained | `샘(The Font)` correctly pairs the named spring; this candidate was not previously counted in the application tally. |
| `47266` | Retained | `라토퍼(Ratofer)의 은식기 판매하기` follows the established quest-objective form. |
| `47277` | Retained | The button variable precedes the active-ability marker, matching source marker order; the Korean UI sentence is natural. |
| `47281` | Retained | `룬다미르(Rundamir)라고 했어?` is conversational and matches the Japanese question. |
| `47293` | Corrected | The previous phrase did not clearly express equal dislike of the object and the people. It now says `난 그것과 그자들을 똑같이 혐오해`, followed by the sacrifice for the fully paired deity title. |
| `47299` | Retained | `다르켄(Darkken)` has the correct personal-name pairing. |
| `47324` | Retained | `선배 제자 핀네가 너와 토론하고 싶어 해` conveys the senior disciple's wish naturally without assigning a speaker. |
| `47340` | Retained | `그곳들은` correctly refers to places that would have been razed; the sentence preserves the keep as the remaining trace of old Kandrian. |
| `47353` | Retained | `아리아드(Ariad) 병사들의 원수를 갚고` conveys avenging the soldiers while retaining the separate goal of eradicating the Tuatha. |
| `47419` | Retained | `통곡하는 왕의 동굴(Weeping King's Hollow)` identifies the cave rather than changing it to a valley. |
| `47420` | Retained | `닐(Nil)` is paired without adding unsupported identity details. |
| `47424` | Retained | The complete `겨울 패란즈(Winter Faelands)` region name is paired; the full item sentence remains clear. |
| `47426` | Retained | `공짜는 아니지만, 편하게 둘러봐!` preserves the vendor's casual invitation without copying the source's broken interruption. |
| `47447` | Corrected | The city name and adjective were already clear. The full item description now says it was distributed on the city's unification day and `힘과 비밀을 품고 은은하게 빛난다`, avoiding the unnatural “emits secrets.” |

## Separate Evidence-Limited Holds

| ID | Unresolved question |
| ---: | --- |
| `47280` | English does not specify whether Niahm is an older or younger brother; retain the broad Korean relation. |
| `47300` | The addressee's age and social status are not established well enough to choose a more specific Korean title. |
| `47496` | The isolated label `The Lustful Elf` could be a title or a description; do not guess whether it needs title-style pairing. |

## Verification

- Only `default:47293` and `default:47447` were changed, using
  `tools/replace_text_preserve_eol.py`; only their ledger fingerprints were
  refreshed.
- The active CSV currently contains 71,839 CRLF separators, 242 LF-only
  separators, and no bare CR. The two edited fields contain no line breaks;
  the byte-preserving editor leaves all bytes outside each target field
  unchanged. No newline normalization was performed.
- The candidate tally counts 13 new unique IDs and one previously counted
  linked ID: `3,196 / 4,027` (`79.36%`), with `831` remaining.
- See the machine-readable
  [decision manifest](dialogue-context-final-edits-followup-47250-47499-20261115.json).
