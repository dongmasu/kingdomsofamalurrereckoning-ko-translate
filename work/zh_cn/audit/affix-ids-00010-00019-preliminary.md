# Preliminary Language Scan: `affix` IDs 10-19

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 10-19 (six variants per ID).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, and available French, German, Spanish, and
  Italian rows.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 10, 13 | Dig for / Approach | 캐기: / 접근: | Verify these fragments in their complete UI strings to ensure the following target connects naturally. | Several locales retain an explicit preposition or imperative ending; Korean uses compact action labels. This may be acceptable UI shorthand, but the fragment boundary makes a standalone decision unreliable. | Low |
| 17 | of Sundering | 분쇄의 | Check whether `분쇄` conveys the intended weapon/property effect. | German, Spanish, Italian, and Chinese emphasize division, breaking, or cutting; Korean `분쇄` specifically suggests crushing into pieces. The exact game mechanic is needed before choosing a narrower term. | Medium |
| 18 | Fill amphora with | 암포라에 채우기: | Check the completed instruction and object placement in the UI. | English and most available locales explicitly introduce the contents with “with/of”; Korean can work as a command fragment, but its naturalness depends on how the selected material follows it. | Low |

## Variant Coverage

- All six `zh_cn` target variants for each ID 10-19 were examined; the active Korean text is identical across variants for each ID.
- The Japanese and Chinese rows have the same six target variants for these IDs. The en_us source contains one `FF` row per ID rather than these six variants, so English meaning was matched by ID.
- French, Spanish, and Italian do not provide every Chinese variant; German provides all six for these IDs. No target variant was dropped or merged.
- IDs 11 (`Braced`), 12 (`Crushing`), 14 (`of Providence`), 15 (`Overwhelming`), 16 (`of Wealth`), and 19 (`Serrated`) had no additional high-confidence semantic concern in this pass.

## Batch Status

All 60 target variant rows for IDs 10-19 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
