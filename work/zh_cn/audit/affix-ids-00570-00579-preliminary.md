# Preliminary Language Scan: `affix` IDs 570-579

- Review date: 2026-10-07
- Scope: all 60 active target variants for IDs 570-579.
- Matched English `FF` source entries by `ID_Linha`; compared exact target
  variants in Japanese, Chinese, German, Spanish, French, Italian, and Russian.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | English | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- | --- |
| 570 | `Clean` | 청소하기: | Keep the action fragment, but verify that the following object produces a natural Korean prompt; Spanish explicitly retains an object article, while Japanese and German retain a colon. | All compared sources treat this as a transitive clean action. Korean's `청소하기:` is plausible as a compositional UI fragment, but the completed string is needed to assess the object relation. | Medium |
| 573 | `of Lightning Warding` | 번개 방호의 | Confirm the established Korean term for `Warding` and keep it consistent with other damage-warding modifiers. | English, German, Spanish, French, Italian, and Russian identify protection against lightning; Japanese transliterates the term and Chinese compresses it to lightning protection. The Korean meaning is supported, but terminology remains corpus-dependent. | Medium |
| 574 | `Indestructable` | 파괴 불가능한 | Preserve the intended meaning “indestructible”; record the English source typo rather than copying it into Korean. | The historical audit already flags `Indestructable` as a likely misspelling of `Indestructible`. German, Spanish, French, Italian, and Russian all support “indestructible”; Japanese repeats the English typo and Chinese says “imperishable.” | High |
| 576 | `(Average) Dispel` | (보통) 해제하기: | Retain the difficulty and action fragment; confirm whether the final UI term should be the broad `해제` or a more explicit spell/curse-dispelling term. | All compared locales identify dispelling/removing magic. The Korean preserves the average difficulty and colon, but `해제하기` can describe several kinds of removal. This continues the terminology question recorded for other `Dispel` fragments. | Medium |
| 578 | `Innervating` | 활력을 불어넣는 | Retain the energizing sense and check the final modifier's natural Korean attachment to the item or effect name. | English, French, and Italian support energizing/stimulating; German and Russian emphasize strengthening or renewal, and Chinese is closer to excitement. Korean conveys increased vitality without adopting the narrower Chinese nuance. | Medium |

## Other Rows

- IDs 571 (`Touch`), 572 (`Pick up`), 575 (`Removed`), 577 (`of Advancement`),
  and 579 (`of the Squall`) had no additional high-confidence meaning shift.
- English uses one `FF` row per ID; the target locales retain six variants
  (11, 12, 14, 21, 22, and 24) for each ID. All 60 active target keys were
  compared, including exact same-variant references where available.
- Korean wording is identical across the six target variants for each ID.
  Preserve every key; this does not establish the engine's variant-selection
  semantics.

## Historical Audit Reconciliation

- Rechecked the historical `affix` question for ID 574 against the active
  Korean and all available locale references. The intended meaning is clear;
  the source spelling issue remains documented.
- Same-numbered historical `base` and `default` entries were not treated as
  `affix` evidence.

## Batch Status

All 60 target variant rows for IDs 570-579 received one preliminary reading.
Findings remain candidates/questions only and do not authorize edits.
