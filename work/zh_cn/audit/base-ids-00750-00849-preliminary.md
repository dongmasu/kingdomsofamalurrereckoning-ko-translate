# Preliminary Language Scan: `base` IDs 750-849

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 750-849.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 763 | 라시르(Rathir) 선술집 | Normalize `Rathir` against other rows, including `default` ID 125 (`라시어`). | The same place name has differing Korean transliterations across the corpus; Japanese and Chinese readings also vary. | Medium |
| 815 | 안식처의 보석 | Confirm which sense of `Haven` is intended before settling the gem name. | English `Haven`, Japanese “heaven,” and Chinese “harbor” diverge; Korean selects a sanctuary/refuge sense. | Low |
| 829 | 가죽 버팀대 | Verify whether `Brace` is an arm/wrist guard and align with `Chainmail Brace` at `base` ID 644. | Chinese translates the corresponding chainmail item as a wrist guard, while Korean uses `버팀대` for both brace items. The English term may denote armor protection rather than a structural support. | Medium |
| 845 | 볼건 왕의 검 | Normalize the spelling of `Bolgan` against other occurrences, including `default` ID 208 (`볼간`). | The same faction/species name has different Korean spellings in active rows. | Medium |

## Other Checks

- ID 428 of the `default` resource is a separate `Reckoning` glossary conflict, recorded in its batch report.
- ID 828's `Upper Houses` has housing/district versus family readings across locales; Korean's `상층 주거지` is plausible but context-dependent.
- ID 773 `Windstones` uses the same Korean `바람돌` as singular `Windstone` at ID 408.
- Item-name parentheses remain inconsistent by policy; no blanket change is proposed.

## Batch Status

IDs 750-849 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
