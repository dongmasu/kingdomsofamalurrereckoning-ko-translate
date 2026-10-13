# Preliminary Language Scan: `affix` IDs 340-349

- Review date: 2026-10-07
- Scope: all 55 active target variants for IDs 340-349 (ID 342 has variant
  11 only; the other nine IDs have six variants each).
- Compared English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 341 | `of Clairy` | 클레어리의 | Resolve whether `Clairy` is a proper name or a source error for `Clarity`, then choose the Korean accordingly. | English, Chinese, German, and French support a name `Clairy`; Spanish, Italian, and Russian read the word as clarity. Japanese has only one matching target variant and repeats the English spelling. Korean follows the name interpretation, which remains unresolved. | Medium |
| 346 | `Disarm` | 해제하기: | Confirm whether this action means disarming/defusing a trap or disarming a person/weapon; retain the UI fragment until assembled context is checked. | German, Spanish, French, Italian, and Russian use a defuse/disarm verb, while Chinese is more literal. Korean `해제하기` is plausible for a trap but broad without its following target. | Low |

## Chinese-Only Variant Follow-Up

- ID 341 variants 12, 14, 21, 22, and 24 are absent from the
  Japanese-derived draft and listed in `affix-extra-variant-review.tsv`.
- All five were compared with their exact Chinese, German, Russian, and,
  where present, Spanish/French/Italian entries. English has one `FF` row;
  Japanese has only variant 11. These references disagree on the name-vs-
  clarity interpretation, so the fallback's identical Korean form remains
  provisional and the ambiguity is not resolved by copying the sibling.

## Variant Coverage

- All 55 target variants were examined: ID 342 has variant 11 only; IDs 340,
  341, and 343-349 have variants 11, 12, 14, 21, 22, and 24.
- Korean wording is identical across the target variants for each ID. This
  is plausible for Korean, which does not inflect these modifiers for the
  gender and number distinctions encoded by several sibling locales;
  preserve every target key nevertheless.
- IDs 340 (`Obliterating`), 342 (`Choose`), 343 (`Take Tear of Mitharu from`),
  344 (`(Very Hard) Dispel`), 345 (`Place purse in`), 347 (`Trollhide`), 348
  (`of Ravening`), and 349 (`Bewildering`) had no additional high-confidence
  concern. IDs 342-346 remain compositional UI fragments; check completed
  strings before editing.

## Batch Status

All 55 target variant rows for IDs 340-349 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
