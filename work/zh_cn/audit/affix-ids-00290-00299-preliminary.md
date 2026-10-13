# Preliminary Language Scan: `affix` IDs 290-299

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 290-299.
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 297 | `Fateshift` | 운명 전환 | Check the Korean form against the game's established name for this mechanic/ability before deciding whether it should be a title or a descriptive action. | English and Japanese use the same named mechanic, Chinese gives a short “change fate” reading, and several other locales phrase it as an action. `운명 전환` is semantically plausible, but the exact in-game UI term is not established by these strings. | Low |
| 299 | `of Flamability` | 가연성의 | The English source misspells `Flammability`; preserve the intended flammability meaning and confirm the approved Korean stat/item terminology. | Chinese `可燃` and German, Spanish, French, Italian, and Russian references all support a flammability/combustibility sense. The Korean candidate conveys that meaning. The spelling error belongs to the source and is not silently corrected here. | Low |

## Chinese-Only Variant Follow-Up

- ID 299 variants 12, 14, 21, 22, and 24 are absent from the
  Japanese-derived draft and listed in `affix-extra-variant-review.tsv`.
- All five were checked against their exact Chinese, German, Russian, and,
  where present, Spanish/French/Italian variant entries. English supplies one
  `FF` entry for the ID; Japanese has only variant 11. The sibling evidence
  supports the same flammability meaning across the five fallback rows.
- The Korean fallback `가연성의` remains provisional; this cross-check does
  not authorize accepting the extra rows as final translations.

## Variant Coverage

- All six target variants for each ID 290-299 were examined (60 rows).
- Korean wording is identical across the target variants for each ID. This
  is plausible for Korean, which does not inflect these modifiers for the
  gender and number distinctions encoded by several sibling locales;
  preserve every target key nevertheless.
- IDs 290 (`Assassin's`), 291 (`of the Inferno`), 292 (`Scout's`), 293
  (`Augur's`), 294 (`Scourge's`), 295 (`Knock on`), 296 (`Vigorous`), and 298
  (`of the Duelist`) had no additional high-confidence concern.

## Batch Status

All 60 target variant rows for IDs 290-299 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
