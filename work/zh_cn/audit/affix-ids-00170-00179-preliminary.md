# Preliminary Language Scan: `affix` IDs 170-179

- Review date: 2026-10-07
- Scope: 55 active target variants for IDs 170-179 (ID 176 has one variant;
  the other nine IDs have six variants each).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 172 | `Donate to` | 기부하기: | Verify the complete prompt's recipient attachment. | All available sibling references retain the recipient relation (“donate to ...”). Korean has an action-plus-colon fragment; it may work with the following recipient but should be checked in the assembled UI rather than judged alone. | Low |
| 173 | `of Ice Aversion` | 얼음 기피의 | Confirm whether this is an aversion effect or defensive resistance to ice. | English/Spanish/French are aversion-like, while German and Russian suggest defense/resistance; Chinese is compressed. Korean follows English literally but may describe dislike rather than an equipment resistance stat. | Low |

## Variant Coverage

- All target variants for IDs 170-179 were examined (55 total; ID 176 has only
  variant 11).
- English has one `FF` row per ID, so its meaning was matched by ID. Exact
  variant evidence was checked in all available locales.
- IDs 170 (`Knight's`), 171 (`Shatter`), 174 (`Continue`), 175 (`of
  Devouring`), 176 (`Upgrade with Cynoc's Eye`), 177 (`of the Copperhead`),
  178 (`Shrouded`), and 179 (`Outlaw's`) had no additional high-confidence
  concern in this pass.
- Preserve each existing `(ID_Linha, Tipo_Variante)` key even when Korean
  strings repeat.

## Batch Status

All 55 target variant rows for IDs 170-179 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
