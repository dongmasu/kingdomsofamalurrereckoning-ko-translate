# Preliminary Language Scan: `affix` IDs 230-239

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 230-239 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 231 | `Putrified` | 부패한 | Reconcile the historical Chinese-only variant conflict, but do not assume the Korean is wrong. | The source spelling is `Putrified` (likely a typo for “putrefied”). English, German, Spanish, French, Italian, and Russian all support a rotten/putrefied sense; Chinese alone says “pure.” Korean matches the English and broad sibling-language evidence. Record the Chinese disagreement as a source-data conflict and retain the current candidate pending in-game context. | Medium |
| 236 | `of Amplitude` | 진폭의 | Confirm whether the suffix denotes literal amplitude or abundance in the item/effect system. | English, Japanese, German, Spanish, French, and Italian point to amplitude; Chinese and Russian suggest abundance. Korean follows the dominant English evidence with `진폭`, but the game-stat context should settle the sense. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 230-239 were examined.
- The active Korean text is identical across variants for each ID; preserve all
  six keys even where the translated string repeats.
- ID 231's Chinese-only conflict is an existing historical ambiguity from the
  extra-variant inventory; the current evidence favors, but does not formally
  approve, the Korean “rotten” sense.
- English has one `FF` row per ID, so its meaning was matched by ID. Exact
  variant evidence was checked in all available locales.
- IDs 230 (`of Precision`), 232 (`Browse`), 233 (`Venomous`), 234 (`Renewing`),
  235 (`of Voracity`), 237 (`of Displacing`), 238 (`Dazing`), and 239 (`Plant
  Heartflower Seed`) had no additional high-confidence concern in this pass.

## Batch Status

All 60 target variant rows for IDs 230-239 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
