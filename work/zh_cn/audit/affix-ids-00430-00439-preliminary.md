# Preliminary Language Scan: `affix` IDs 430-439

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 430-439.
- Matched English `FF` source entries by `ID_Linha`; compared Japanese,
  Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 430 | `Shielded` | 방패를 두른 | Confirm whether this describes armor surrounded by a shield or an item protected by a shield. | Chinese and most sibling locales use shield/protection language, while Russian describes armor-like plating. Korean `방패를 두른` reads literally as wearing a shield and may not express the modifier's effect. | Medium |
| 431 | `Static` | 정전기의 | Determine whether `Static` means electrical/static charge or simply fixed/unchanging. | English/Japanese/Chinese and European locales support a static modifier, but Russian says “sparkling.” Korean chooses the electrical sense, which is plausible in a combat modifier but not established by this fragment alone. | Medium |
| 434 | `Break circle around` | 둘러싼 원을 부수기: | Clarify the object/location around which the circle is broken and make the Korean fragment read naturally. | English and German are incomplete UI fragments; Japanese/Chinese give a compact action, while Spanish/French/Italian add different articles or “enchantment.” Korean's modifier-before-object structure is awkward without the following text. | Medium |
| 438 | `Chilled` | 차가워진 | Determine whether this describes a cold condition/status or merely an object's temperature. | Chinese reads as calm; Japanese transliterates; European locales and Russian indicate chilled/frosted. Korean's literal temperature-change wording may not fit an item modifier if this is a status/effect name. | Low |

## Variant Coverage

- All six target variants for each ID 430-439 were examined (60 rows).
- English affix source entries use `FF` rather than target-locale variant
  codes, so rows were matched by `ID_Linha`.
- Each ID has target variants 11, 12, 14, 21, 22, and 24; Korean wording is
  identical across all six for each ID, and all keys remain present.
- ID 436 (`of Inceneration`) is a historical open question: the English may
  intend `Incineration`. Korean `소각의` follows the likely sense, but the
  source spelling discrepancy remains recorded.
- IDs 432 (`Begin the`), 433 (`of the Hammerlord`), 435 (`of Shifting`),
  436 (`of Inceneration`), 437 (`Investigate Blood`), and 439 (`of Rage`)
  had no additional high-confidence concern in the fragment-level
  comparison.
- None of these IDs appears in the 140-row Chinese-only fallback inventory.

## Batch Status

All 60 target variant rows for IDs 430-439 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
