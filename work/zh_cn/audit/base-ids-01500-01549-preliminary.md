# Preliminary Language Scan: `base` IDs 1500-1549

- Review date: 2026-10-07
- Scope: all 50 active `base` rows, IDs 1500-1549.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1514 | 강철 버팀대 | Verify the object category for `Steel Brace`. | English and Japanese use a generic brace, while Chinese identifies an arm/wrist guard. Korean follows the generic structural-support sense; inspect the inventory item before deciding whether it is wearable armor. | Low |
| 1524 | 병영 | Check whether `Bunkhouse` is worker lodging rather than a military barracks. | Japanese calls it lodging and Chinese simple housing; English means a bunkhouse/dormitory. Korean `병영` narrows it to military barracks without source support. | Medium |
| 1526 | 스코리아(Scoria) 광산 | Reconcile the source spelling and Korean name with `Skoria Mine` at `base` ID 340. | English source has `Skoria` here, but the active Korean uses `Scoria`; the earlier audit already flagged the Scoria/Skoria one-letter source/name discrepancy at related rows. Preserve both source strings pending context; do not globally normalize by guess. | Medium |
| 1489 | 브라우니에게 가는 문 | Confirm whether `Brownie` names the Fae/creature rather than a generic or dessert-like “brownie.” | Chinese identifies a small folklore creature; Japanese transliterates it. Korean `브라우니` is ambiguous without the English form or creature term, though the sentence structure is preserved. | Low |

## Other Checks

- ID 1517's `유물 대전` is a plausible compendium rendering of `Tome of Artifacts`; verify against the established book-title style.
- ID 1531 preserves the condition that one or more nearby levers open the door.
- ID 1547 uses the established Alfar name form with a parenthetical; retain the broader display inconsistency for the global naming decision.
- The recurring `Shaft`, `Ward`, `Bindings`, and `String` equipment labels remain family-level questions rather than new isolated defects here.

## Batch Status

IDs 1500-1549 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
