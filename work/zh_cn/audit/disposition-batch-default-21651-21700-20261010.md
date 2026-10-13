# Disposition and Edit Batch: `default` IDs 21651-21700

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: two accepted, seven `not an issue`, and nine uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6712 accepts a correction at ID 21651: render `I'll be damned if I can
  read this thing` as inability to read, not a wish to accept punishment.
- D-6719 accepts a correction at ID 21668: make the final rhetorical praise
  explicitly about the listener's expected performance.
- D-6715-D-6716, D-6718, D-6720, D-6723, and D-6728-D-6729 are
  `not an issue`: preserve separate chakram stats, the unspecified arm-worn
  object, the green/Fae scent, recipe effect/values/layout, urgent rat plea,
  the cultist complaint, and the two tournament outcomes.
- D-6713-D-6714, D-6717, D-6721-D-6722, and D-6724-D-6727 remain uncertain
  because of unresolved lore terms, context, item function, or interpretation.
- Only Korean `Texto` at IDs 21651 and 21668 changed.

## Verification

- The preliminary report checked IDs 21651-21700 across all four locales.
  Direct CSV parsing found exactly 50 matching records in each file, in
  ascending ID order. No key, row-order, or variant field was edited.
- IDs 21658 and 21671 retain their separate stat values and recipe layout;
  the recipe quantities remain 3, 3, and 1.
- Active default CSV SHA-256:
  `eaacd6160d9075241f31d68b0b939872ea6ac4525daa1ec8fd34bf81aa7d0190`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved. A whole-file CSV parse is not claimed because of existing
  malformed or multiline records.
- Register totals: 749 accepted, 2,190 `not an issue`, and 3,788 uncertain
  (6,727 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 21701; 43,434 rows remain.
