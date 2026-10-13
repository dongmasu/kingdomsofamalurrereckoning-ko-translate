# Preliminary Language Scan: `affix` IDs 350-359

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 350-359.
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 351 | `Plant Amulet on` | 부적을 놓기: | Check the completed UI string for the relation `on`; Korean currently expresses placing an amulet but leaves its target relation implicit. | English and several European references preserve “on”; Japanese also renders it as a compositional `place amulet:` fragment. Korean may be natural when joined with the following target, so inspect the assembled string before changing. | Low |
| 354 | `Pipe to` | 관을 연결하기: | Confirm the intended action and target; `pipe` may mean route/connect a pipe to a destination, not simply connect a pipe. | English and Chinese include a destination relation; European references generally retain a “to” construction. Japanese is only `pipe:`. Korean `관을 연결하기:` is plausible but may omit the destination relation in the assembled prompt. | Low |
| 356 | `Use Phial on` | 약병 사용하기: | Check whether the Korean action fragment should explicitly connect the phial to its target. | English and the European references preserve `on`; Korean and Japanese omit the relation in the isolated fragment. A colon may make the concatenated Korean prompt work, so defer judgment until assembled UI context is checked. | Low |

## Variant Coverage

- All six target variants for each ID 350-359 were examined (60 rows).
- Korean wording is identical across the target variants for each ID. This
  is plausible for Korean, which does not inflect these modifiers for the
  gender and number distinctions encoded by several sibling locales;
  preserve every target key nevertheless.
- No Chinese-only fallback rows are listed for IDs 350-359.
- IDs 350 (`Awesome`), 352 (`Rabid`), 353 (`Savant's`), 355 (`Confront`),
  357 (`Trickster's`), 358 (`of Mending`), and 359 (`Burning`) had no
  additional high-confidence semantic concern. In particular, `Savant's`
  is rendered as the natural Korean `석학의`, while the source is also used
  as the honorific/title `Savant` elsewhere.

## Batch Status

All 60 target variant rows for IDs 350-359 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
