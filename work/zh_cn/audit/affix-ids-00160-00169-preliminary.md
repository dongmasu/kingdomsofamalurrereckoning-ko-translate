# Preliminary Language Scan: `affix` IDs 160-169

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 160-169 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 161 | `Place honey-berry mash on` | 벌꿀열매 반죽을 놓기: | Preserve the target/location relation when the full prompt is composed. | German, Spanish, French, Italian, Russian, and Chinese all retain “on” plus a following location/object. Korean places the mash before the action and leaves “on” implicit; check the actual assembled instruction for readability and correct target relation. | Medium |
| 162 | `Place Alleia's Ring` | 알레이아의 반지를 놓기: | Verify the completed objective prompt and whether `place` means set down, offer, or present. | English and most sibling locales say place; Japanese says offer/dedicate. Korean follows English but the action may depend on the quest target/object. The colon indicates a continuation, so inspect the full UI string. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 160-169 were examined.
- The active Korean text is identical across variants for each ID; preserve all
  six keys even where the translated string repeats.
- English has one `FF` row per ID, so its meaning was matched by ID. Exact
  variant evidence was checked in all available locales.
- IDs 160 (`of Breadth`), 163 (`Rimy`), 164 (`Berserker's`), 165 (`of
  Achievement`), 166 (`Ascend`), 167 (`of Sanctuary`), 168 (`Ingenious`), and
  169 (`of the Viper`) had no additional high-confidence concern in this pass.

## Batch Status

All 60 target variant rows for IDs 160-169 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
