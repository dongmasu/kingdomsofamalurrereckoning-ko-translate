# Preliminary Language Scan: `base` IDs 850-949

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 850-949.
- Compared matching English, Japanese, and Chinese rows with active Korean.
- Checked applicable project terms in the official Korean manual glossary.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 869 | 복수의 집 | Reconcile the Korean form of `House of Vengeance` with the factional `House of ...` pattern and `base` ID 621 (`발라드 가문`). | Current `집` can read as a building, while the parallel House of Ballads uses `가문`. Determine one organization term before normalizing related rows. | Medium |
| 872 | 운명의 곡선 | Confirm whether `Fate's Curve` is a named weapon and whether `Curve` refers to its shape or another effect. | English/Japanese say “curve,” while Chinese calls it a bow. Korean follows the literal English phrase, but the item model/context could settle the weapon sense. | Low |
| 891 | 전승석 | Use the official-manual form `로어스톤` for `Lorestone`, pending any documented in-game exception. | The project glossary explicitly gives `Lorestone = 로어스톤`; current Korean `전승석` replaces the established name. | High |
| 904 | 라시르(Rathir) 지하 묘지 | Normalize `Rathir` against other rows, including IDs 763 and `default` ID 125 (`라시어`). | The same place name has multiple active Korean spellings. | Medium |
| 937 | 주변의 방패 | Verify the proper-name/effect sense of `Ambient`. | English `Ambient`, Japanese “view,” and Chinese “all-around” differ; Korean chooses a literal “surroundings” reading. The item context is needed before settling the name. | Low |

## Other Checks

- ID 858's `Gallows End` is currently romanized; it should be considered with the corpus-wide Gallows End consistency inventory rather than corrected in isolation.
- ID 869 adds another `House` faction form; see the cross-resource issue at `default` IDs 253 and 280.
- ID 891 is a direct official-manual terminology conflict, not a style preference.

## Batch Status

IDs 850-949 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
