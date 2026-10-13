# Preliminary Language Scan: `default` IDs 38101-38150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38101-38150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38105 | Midden / `미든`; `call for decay` / `부패의 소명` | Preserve Midden as the named lore/place term and check whether `소명` makes the natural decay-cycle phrase sound like a religious calling. | Korean retains honoring the Midden, tending its depths, and honoring nature's decay. Chinese explicitly mentions tending corpses; earlier audits leave Midden and its burial practice unresolved. | Medium |
| 38107 | `We did nothing to deserve this fate` | Record the Chinese source-locale meaning divergence; Korean follows English and should not be changed based on the Chinese line. | English, Japanese, and Korean say the group did nothing to deserve its fate. Chinese instead says the group owes everything to the listener, reversing the meaning. | High |
| 38108 | `{3}`, `{1}`, `{2}` | Preserve all positional values and the English order in Korean. | English, Chinese, and Korean use `{3}`, `{1}`, `{2}`. Japanese places `{2}` before `{1}` for localized syntax; no marker is missing. | High |
| 38121 | House of Ballads / `발라드 가문` | Align this named group/institution with the established corpus form without selecting a canonical Korean term in this pass. | Korean and Chinese use a family/House reading; Japanese retains a phonetic form. Prior audits track House of Ballads name variants. | Medium |
| 38128 | Gallows End / `갤로우스 엔드` | Carry forward the documented place-name consistency question; do not normalize the active text in this preliminary pass. | Korean uses one phonetic form, while the consolidated audit records multiple competing literal and phonetic renderings for Gallows End. | Medium |
| 38132 | Silken Seat / `실크 좌석` | Verify whether this capitalized name is a venue or inn rather than a generic seat. | Korean reads literally as a silk seat; Japanese uses an inn-like name and Chinese a generic seat. English capitalization and the Japanese reading support a named-place question, but the row lacks context. | Medium |
| 38133 | `TestTest` / `테스트` | Determine whether this is a visible label or an internal/debug string; preserve the source repetition if it is user-facing. | English and Japanese repeat “Test”; Korean contains it once. The row alone does not identify its UI context. | Medium |
| 38139 | Pyrderi / `피르데리` | Verify the source spelling and Korean form against the recurring Pryderi place name. | English spells this occurrence `Pyrderi`; nearby audit terminology includes `Pryderi`. Korean follows the present source, so do not silently normalize without game-context confirmation. | Medium |

IDs 38101-38104, 38106, 38109-38120, 38122-38127, 38129-38131,
38134-38138, and 38140-38150 generally retain the English meaning on this
first reading. Proper names, lore, register, and UI context remain subject
to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log does not cover this range;
  its documented gap includes IDs 37700-40349. No historical disposition
  is inferred for IDs 38101-38150.
- Existing consolidated audit notes were applied to Midden, House of
  Ballads, Gallows End, and Pryderi. Their Korean forms remain unresolved.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38101-38150 once
  and in identical order.
- Embedded line-break counts match across all four locales.
- Detected runtime markers match except for the documented Japanese order
  difference at ID 38108. All three markers are present in every locale.
- The +1% experience value at ID 38101 is preserved. No translation CSV or
  immutable source file was edited.

## Batch Status

IDs 38101-38150 received one preliminary reading. Their working dispositions
are recorded in
[`disposition-batch-default-38101-38150-20261010.md`](disposition-batch-default-38101-38150-20261010.md);
the later-ID findings carried forward from the preceding preliminary report
were not counted twice.
