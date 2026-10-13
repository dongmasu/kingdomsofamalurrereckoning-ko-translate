# Preliminary Language Scan: `base` IDs 950-1049

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 950-1049.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 965 | 라시르 아르카나 학회 지부 | Normalize `Rathir` against other rows, including IDs 763 and 904 and `default` ID 125 (`라시어`). | The same place name has multiple Korean spellings; the organization/location phrase should be revisited with the corpus-wide name decision. | Medium |
| 973 | 계절의 성소 | Confirm whether this is the sanctuary of the named `House of Seasons` and align with `base` ID 219 (`계절의 집`). | Japanese explicitly says sanctuary of the House of Seasons; English and Chinese shorten the phrase. Korean may be correct, but the faction link is not visible. | Low |
| 989 | 볼건 파멸자의 정강이받이 | Recheck the possessive/title structure for `Greaves of Bolgans' Bane`. | English and Chinese mean greaves associated with being the bane of the Bolgans; current Korean can parse as the greaves of a “Bolgan destroyer.” Confirm the established item-name pattern. | Medium |
| 1002 | 혼돈의 연 방패 | Consider `혼돈의 연형 방패` or an equivalent shape term; cross-reference `base` ID 440. | Both rows translate `Kite Shield` as `연 방패`, which can be mistaken for a flying kite rather than the shield shape. | Medium |
| 1022 | 상급 상인의 지휘 | Verify whether `Merchant's Command` is a stat/effect, a merchant's order, or a named item. | Japanese says a merchant's sales pitch, Chinese says command, and English is ambiguous. Korean's `지휘` may imply military command without context. | Low |
| 1027 | 교수대의 꽃 | Reconcile source spelling with `base` ID 504 (`Gallow's Bloom`). | English alternates `Gallow's` and `Gallows`, while Japanese/Chinese both refer to a gallows flower. The Korean is the same, but the source-key discrepancy should not be silently normalized. | Low |

## Other Checks

- ID 1035 renders `House of Pride` as `긍지의 가문`, further evidence for a consistent factional `House` term.
- ID 973 should be reviewed with the broader House of Seasons terminology, not as an isolated building name.
- IDs 1002 and 440 share the same shape-term concern.

## Batch Status

IDs 950-1049 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
