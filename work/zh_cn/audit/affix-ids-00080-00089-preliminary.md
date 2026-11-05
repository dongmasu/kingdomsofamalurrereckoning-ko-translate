# Preliminary Language Scan: `affix` IDs 80-89

- Review date: 2026-10-07
- Scope: all 55 active target variants across IDs 80-89. ID 84 has only
  variant 11; the other nine IDs have six variants each.
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, and available French, German, Spanish, and
  Italian rows.
- Read-only; no translation CSV was edited.
- This is a preliminary pass, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 84 | Activate | 활성화: | Verify the completed UI string; consider an imperative such as `활성화하기:` if the target follows as an object. | English, Japanese, French, Spanish, and Italian use an imperative; Korean is a noun label with a colon. Its correctness depends on the concatenated text. | Low |

## Variant Coverage

- All 55 active target variants across IDs 80-89 were examined, including the single-variant ID 84.
- The en_us source contains one `FF` row per ID, so English meaning was matched by ID. Other locales provide fewer exact variants for some codes; all available exact-variant evidence was checked.
- IDs 80 (`Frosted`), 81 (`Master's`), 82 (`Staunch`), 83 (`Arctic`), 85 (`Fundamental`), 86 (`Reweave`), 87 (`Major`), 88 (`Ebony`), and 89 (`Harvested`) had no additional high-confidence concern in this pass.

## Batch Status

All 55 target variant rows across IDs 80-89 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.

## Subsequent Approved Correction

- 2026-11-05: Updated all six variants of ID 89 from `수확된` to `수확:`. English is `Harvested`; Japanese `収穫した` and Chinese `已收割` support the harvest meaning. In the game's affix-plus-item composition, the Korean adjective reads as `수확된 [item]`, while the approved label form `수확:` fits the displayed prefix structure.
- Verified that only variants 11, 12, 14, 21, 22, and 24 were changed; IDs, variant codes, row order, BOM, and CRLF line endings are preserved.
