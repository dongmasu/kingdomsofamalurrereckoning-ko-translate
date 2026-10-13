# Preliminary Language Scan: `base` IDs 4500-4599

- Review date: 2026-10-07
- Scope: all 100 active `base` rows, IDs 4500-4599.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for disputed item names and reconciled historical
  `base` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4501 | 팔링(Paling)의 마법봉 | Determine whether `Paling` is a proper name/modifier or the source's description of a stake/palisade; do not silently adopt one language's reading. | English says `Paling Wand`; Japanese reads it as a cultivation wand, Chinese as a pointed wand, German/Spanish/French/Italian use pale/palisade-like forms, and Russian says a sparkling wand. The current bilingual proper-name treatment preserves traceability but is not established. This repeats the historical question. | Medium |
| 4512 | 오도나타(Odonata)의 흉상 | Confirm whether `Odonata` is a personal name or the taxonomic order of dragonflies; if the latter, decide whether to localize the common name. | Chinese explicitly renders dragonfly; the European locales preserve `Odonata`, and Japanese transliterates it. Korean follows the name-like reading, which remains plausible but unverified. This repeats the historical question. | Medium |
| 4516 | 셰퍼드(Shepard)의 투구 | Keep `Shepard` as written until it is confirmed whether this is a character name or a source misspelling of `Shepherd`. | The English spelling is `Shepard`; Japanese and most European locales retain it, while Chinese/Russian transliterations vary. Do not normalize to “Shepherd” based on spelling alone. This repeats the historical question. | Medium |
| 4535 | 흑단 수호자 | Determine whether `Guard` denotes a defensive equipment part/effect rather than a person; align its treatment with `base` IDs 4405 and 4408. | German/French/Italian and Russian identify protection or a shield component; Spanish says guard, Japanese retains the English, and Chinese says a guard. The Korean agent noun `수호자` may imply a person. This repeats the historical question and the same concern at IDs 4405/4408. | High |
| 4556 | 부패의 보석 | Preserve the English-supported decay/putrefaction reading, but retain the source/reference conflict for later context review. | English misspells `Putrefication`; Chinese and German/Spanish/French/Italian/Russian indicate corruption/decay, while Japanese says purification, reversing the sense. Korean follows English and the majority of sibling locales. This repeats the historical question. | High |
| 4568 | 가죽 뒤축 | Confirm whether `Heel` is footwear or a leather crafting blank/component before using a body-part label. | English/Japanese are ambiguous; German/Italian/Russian describe footwear or a shoe blank, Spanish says heel, and French names a foot/ankle armor piece. Korean `뒤축` is too specific if the item is a component. This repeats the historical question. | High |
| 4585 | 영웅과 시녀 | Determine whether capitalized `Maid` names the Windemere figure/title or means a generic servant; standardize it with the other Maid references. | Japanese says “hero and fierce heroine,” Chinese says maiden, and the English capitalizes `Maid`. Korean's `시녀` can imply a household servant. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `base` questions for IDs 4501, 4512, 4516, 4535,
  4556, 4568, and 4585 against the active Korean and source locales. The
  Paling item, Odonata, Shepard spelling, Guard category, Putrefication
  conflict, Heel component, and Maid title remain open or provisional.
- Same-numbered historical `default` findings were kept separate from these
  `base` item rows.

## Other Checks

- ID 4525's `Skill Book (Dispelling)` reads as a dispelling/uncursing skill
  book; the Korean category and the effect name remain terminology candidates,
  not a confirmed meaning error.
- The remaining inspected labels, names, and crafting-part modifiers had no
  additional high-confidence semantic mismatch in this pass.
- No row keys, order, or multiplicity changed.

## Batch Status

IDs 4500-4599 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
