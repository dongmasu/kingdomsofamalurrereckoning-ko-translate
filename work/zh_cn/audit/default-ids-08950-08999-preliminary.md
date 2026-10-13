# Preliminary Language Scan: `default` IDs 8950-8999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8950-8999.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8954 | Capitalized `the Telling` → `이야기` | Determine whether `the Telling` names a formal tradition/doctrine rather than generic storytelling; retain the capitalized concept's weight. | English, Japanese, and Chinese treat the Telling as a named tradition or prophecy. Korean uses generic `이야기`, which may flatten the faction's identity statement. | Medium |
| 8969 | Ethene / Nyxaros / Henge / Shrines / Cipher | Verify proper-name spellings and canonical terms for the Cipher, Henge, and Earth/Air Shrines; preserve the two-paragraph sequence and causal links. | English names `Ethene`, `Nyxaros`, and `Henge`; Japanese and Chinese render several names differently. Korean preserves the sequence, the useless Cipher, the intact city, and the undone Henge magic, but the proper-name forms remain unsettled. | Medium |
| 8971 | `Level 6 Familiar Mastery` → `친숙 숙련도 6레벨 보유` | Confirm the UI category and established Korean for `Familiar Mastery`; determine whether this is a prerequisite, rank, or modifier. | The English is a fragment beginning “with,” and the other locales render a level-six mastery label. Korean preserves level 6 but `친숙 숙련도` is not an established-sounding skill name. | Medium |
| 8975 | Aisle of Flame / Blackened Hall / Glass of Ambient / Missives of Sable | Verify which capitalized terms are named locations or objects and use consistent forms across the related quest chain. | The Korean retains the objective order and traceable transliterations, but forms such as `검게 그을린 전당`, `앰비언트의 유리`, and `세이블의 서신` need context and cross-row alignment. | Medium |
| 8980 | `StringBox` retained | Classify whether this is an internal/debug identifier or intended player-facing text before localizing. | English and active Korean retain `StringBox`; Japanese transliterates it and Chinese translates it literally. The historical audit already treats it as a possible developer string. | Medium |
| 8984 | `Omnibus Arcana` → `아르카나 대전집`; Scholia Arcana Chapterhouse | Align the book title, institution, branch building, and course terminology with other occurrences. | English names the Omnibus Arcana and the Scholia Arcana Chapterhouse; Japanese and Chinese use different title/institution forms. Korean keeps the institution in a recurring Korean form but translates the book title literally. | Medium |
| 8986 | Ratofer / ring payment / broken promise | Clarify whether the broken promise concerns marriage, payment for the ring, or both; retain the speaker's contrast between remaining unmarried and becoming a widow. | English, Japanese, and Chinese preserve the broken-promise framing but do not fully resolve its referent. Korean keeps the same ambiguity and emotional conclusion. | Medium |
| 8991 | `{*1ability}` / `{*1slotted}` tutorial sequence | Preserve all seven localized markers, `{LINE_SPACE}`, `{1}`, and their ordering; confirm the displayed Korean phrasing for ability slots. | English and Japanese use “ability” then “slotted” in the second clause, as Korean does. Chinese reverses those localized display labels there, but marker IDs/order and control-token placement remain intact. | High |
| 8997 | Plaguetimes / The Burning / Orbocant / Elund / Spiretop / spirebase | Verify names and political terms, preserve the three-paragraph historical account and 600-year interval, and record the source's repeated “harmony.” | Korean retains the three paragraphs, six hundred years, major events, and political change. Several institutional/place names need corpus-wide treatment; the English repeats “harmony” in the final sentence while Korean paraphrases the repetition. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8954, 8969, 8971, 8975, and 8980
  against the active rows.
- Also checked the previously logged historical uncertainties for IDs 8984,
  8986, and 8997. Their ambiguity remains; no historical candidate was
  treated as an approved edit.
- Added a marker/localized-label comparison for ID 8991. It is not a
  structural exception: marker IDs and order match English and Japanese.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales. ID 8969
  preserves the paragraph break in each locale; ID 8997 preserves all three
  paragraphs in each.
- Runtime-marker IDs and order match after disregarding translated display
  labels. ID 8991 preserves seven `{*1...}` markers, `{LINE_SPACE}`, and
  `{1}` in the same order as English; no ID or control-token loss was found.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 8950-8999 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
