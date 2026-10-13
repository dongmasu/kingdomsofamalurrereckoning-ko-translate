# Consolidated Context Review: `Gallows End`

- Date: 2026-10-11
- Scope: the corpus-wide Korean place-name conflict and linked `default`
  ID 36763 wordplay question (D-11840).
- Result: D-18213 reclassifies ID 36763 from uncertain to `not an issue`.
  Its Korean sentence already expresses the English meaning; no CSV cell
  changes. The Korean spelling of `Gallows End` remains unsettled, so no
  global name normalization is authorized.

## Evidence

English ID 36763 reads: “But no good man would ever end up on Gallows End.”
Here, `end up on` means to wind up at the named place; it does not say that
the man is executed. The Japanese source uses `たどり着く` (“reach/arrive
at”), supporting that reading. The Chinese source can suggest being sent to
a gallows, but English governs meaning and does not establish an execution
reading. The current Korean `하지만 선량한 사람이 갤로스 엔드에 오게 될 리 없지.` preserves the destination and rhetorical claim. No rewrite
is warranted.

The proper name itself remains unresolved. Earlier accepted decisions
D-4464, D-4487, D-4515, D-4707, D-5672, and D-6431 use `갤로스 엔드`.
D-11264 accepted `갤로우스 엔드` using active-corpus frequency as its
rationale. D-11839 later returned two rows to `갤로스 엔드` by citing
D-5672. D-10903 merely found an existing `갤로우스 엔드` occurrence
semantically acceptable; it did not approve that spelling as canonical.

Japanese `ガローズ・エンド` supports retaining the English proper name but
does not select one Korean transliteration. Chinese `绞架角` is a semantic
translation, not evidence for a Korean spelling. Active-corpus frequency is
not decisive because the corpus contains legacy and conflicting forms.
Keep name-only uncertainties linked to a future corpus-wide terminology
decision; do not make isolated edits.

## Decision and Verification

- D-18213 changes only the disposition of ID 36763. Its existing Korean
  `Texto` remains unchanged.
- English, Japanese source, Japanese-derived Korean draft, Chinese source,
  and active Korean were joined by `ID_Linha` for ID 36763.
- No runtime marker, value, or line-break change was made.
- Active default CSV SHA-256 before and after review:
  `4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
- No backup was needed because no file contents changed.
- Cross-resource totals through D-18213: 1,917 accepted, 22,970
  `not an issue`, and 13,635 uncertain (38,522 unique dispositions);
  next decision: D-18214.

These are working dispositions, not independent final linguistic approval.
