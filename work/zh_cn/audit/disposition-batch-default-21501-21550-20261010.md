# Disposition and Edit Batch: `default` IDs 21501-21550

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: two accepted, two `not an issue`, and fourteen uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6680 accepts a correction at ID 21532: remove `그 대가로`, which invents
  an exchange relation absent from the English quest text.
- D-6688 accepts a natural idiomatic rendering at ID 21550: replace the
  literal `돈을 한 배 가득 벌어들이지` with `돈을 두둑이 벌지`.
- D-6677 and D-6679 are `not an issue`: the temporary 60% Freeze effect and
  the Shadow Prism acquisition/effect with `{LINE_SPACE}` are preserved.
- D-6671-D-6676, D-6678, and D-6681-D-6687 remain uncertain for unresolved
  terminology, name alignment, pronoun reference, or context-dependent
  readings.
- Only Korean `Texto` at IDs 21532 and 21550 changed.

## Verification

- The preliminary report checked IDs 21501-21550 across all four locales.
  Direct CSV parsing found exactly 50 matching records in each file, in
  ascending ID order. No key, row-order, or variant field was edited.
- ID 21532 retains the objective to find and kill Barten and the outcome of
  securing Garaner's leadership, without adding an explicit exchange.
- ID 21535's five paragraphs, ID 21514's 60% value, and ID 21521's runtime
  markers and `{LINE_SPACE}` remain unchanged.
- Active default CSV SHA-256:
  `6deeca4344877e6655a15045a0796d8429e9fd775b30b2001c4161401ec3fc77`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved. A whole-file CSV parse is not claimed because of existing
  malformed or multiline records.
- Register totals: 746 accepted, 2,180 `not an issue`, and 3,760 uncertain
  (6,686 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 21551; 43,584 rows remain.
