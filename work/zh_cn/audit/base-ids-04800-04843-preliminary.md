# Preliminary Language Scan: `base` IDs 4800-4843

- Review date: 2026-10-07
- Scope: all 44 remaining active `base` rows, IDs 4800-4843.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `base` questions and checked official Korean
  terminology.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4815 | 획득 가능 아이템 부모 항목 | Confirm whether `Pickupable Item PARENT` is a developer/category label; preserve its internal hierarchy wording if it is exposed in-game. | English uses uppercase `PARENT`; Japanese and Chinese also identify a parent/category node. Korean explains the hierarchy but reads as a UI label. This repeats the historical question. | Low |
| 4824 | 언젠가 다시 사랑하리 | Confirm whether `Love Again Another Day` is a poetic title, imperative, or statement; preserve the lyric tone. | Japanese says “I shall love again someday,” Chinese says “love again another day,” and English is title-like but syntactically open. Korean follows the Japanese lyric/statement reading. This repeats the historical question. | Medium |
| 4839 | 알메인 커틀러스 | Use the official Korean manual's established `Almain = 알마인` form rather than the current `알메인`, subject to confirming the manual entry applies to this people/material name. | English/Japanese/Chinese identify an Almain cutlass. The project's terminology notes already record `알마인` as the official form; the current spelling differs. | High |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 4815 and 4824 against the
  active Korean and source locales. The internal parent label and poetic
  title remain provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` rows.

## Other Checks

- IDs 4800-4843 were all compared. The item names, quality modifiers,
  character/place labels, and numbered book title had no additional
  high-confidence mismatch in this pass.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4800-4843 received one preliminary reading against the stated references.
This completes the first preliminary reading of all 4,844 `base` rows.
Findings remain candidates/questions only and do not authorize edits.
