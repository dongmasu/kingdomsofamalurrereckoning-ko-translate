# Preliminary Language Scan: `default` IDs 7000-7049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 7000-7049.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 7001 | `Balor` → `발로` | Standardize with the many active occurrences rendered `발로르(Balor)`; confirm the canonical name form before global normalization. | The same proper name is rendered both `발로` and `발로르` in the active draft. | High |
| 7004 | `pyhril tree` → `피릴 나무` | Keep the plant name and poem imagery provisional; review spelling, season-count imagery, and four-line cadence together. | English/Japanese/Chinese/Korean all retain a four-line seasonal poem, but `pyhril` is unexplained and the “five hundred” phrasing differs in presentation. | Medium |
| 7008 | `Rathir` → `라시어` | Standardize to the established `라시르(Rathir)` spelling. | This short name entry uses `라시어`, while the active corpus predominantly uses `라시르`. | High |
| 7018 | `Repair Equipped` → `장착품 수리 완료` | Confirm the UI action; `완료` may incorrectly make this a completed-status label instead of a repair action for equipped items. | English/Japanese describe repairing currently equipped equipment; Korean adds a completion state not explicit in the source. | Medium |
| 7029 | `Nullify Locus` → `로커스 무효화` | Clarify whether `Locus` is a proper mechanic/name or an ordinary locus/ground term before fixing its Korean form. | Japanese reads as nullifying earth/ground and Chinese as eliminating a track; Korean transliterates `Locus`. | Medium |
| 7037 | repeated `Out` → `나가, 나가, 나가, 나가` | Preserve the source's repeated shout if the five repetitions are intentional; Korean has one fewer repeated `나가`. | English repeats `out` five times after “Out of my sight”; Korean has four repetitions. Japanese/Chinese also compress the stutter, so context/register should be considered. | Medium |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 7002, 7004, 7009,
  7011, 7013-7014, 7016, 7021-7022, 7027-7028, 7030, 7034-7035.
- The authority/disdain line, Nianallon effect, Court membership/leadership,
  Eswin's characterization, Sorrogweth quest sequence, Freedom fragment,
  debug command, Gravehal bonus, Fateweaver metaphor, localized markers,
  Circle/Crossing, defense values, and apprentice/repairer relationship
  remain as recorded questions or are supported by the source comparison.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts match across all four locales, including the
  four-line poem at ID 7004 and three-line defense text at ID 7034.
- Runtime marker identities/order at ID 7028 are preserved, including all
  `{*1...}` wrappers and `{LINE_SPACE}`.
- Numeric values are equivalent: the 500-year phrasing at ID 7004, 15 years
  at ID 7043, four nobles at ID 7046, and `+3%` at ID 7022 are retained.
- No active CSV structure or text was changed.

## Batch Status

IDs 7000-7049 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
