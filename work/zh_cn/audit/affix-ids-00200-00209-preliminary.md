# Preliminary Language Scan: `affix` IDs 200-209

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 200-209 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 200 | `Hang placard from` | 현판을 걸기: | Preserve the `from/on` relation and verify object order in the complete prompt. | German, Spanish, French, Italian, and Chinese connect the placard to a following support/location; Korean only says to hang the placard. The exact relation may depend on the composed UI string and the game's action, so inspect that before recommending a final fragment. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 200-209 were examined.
- The active Korean text is identical across variants for each ID; preserve all
  six keys even where the translated string repeats.
- English has one `FF` row per ID, so its meaning was matched by ID. Exact
  variant evidence was checked in all available locales.
- IDs 201 (`Scalding`), 202 (`Slayers`), 203 (`Pray At`), 204 (`Raider's`),
  205 (`Sturdy`), 206 (`Search`), 207 (`of Gluttony`), 208 (`Dilettante's`),
  and 209 (`Boundless`) had no additional high-confidence concern in this
  pass; their composed UI/item context may affect final grammar.

## Batch Status

All 60 target variant rows for IDs 200-209 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
