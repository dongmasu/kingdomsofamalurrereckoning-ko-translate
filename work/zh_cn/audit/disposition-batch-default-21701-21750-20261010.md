# Disposition and Edit Batch: `default` IDs 21701-21750

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: one accepted, seven `not an issue`, and ten uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6731 accepts a correction at ID 21703: remove the unsupported “hero”
  characterization while preserving the Crystal War and legend.
- D-6730, D-6735, D-6737-D-6738, and D-6741, D-6745, D-6747 are
  `not an issue`: retain the separated name, Alserund travel-title reading,
  herald role, separate longbow stats, Fate tutorial markers/effect, petition
  board, and pursuit/instrument metaphors.
- D-6732-D-6734, D-6736, D-6739-D-6740, D-6742-D-6744, and D-6746 remain
  uncertain because of speaker/context, lore terminology, item meaning,
  test-string status, platform input, or proper-name questions.
- Only Korean `Texto` at ID 21703 changed.

## Verification

- The preliminary report checked IDs 21701-21750 across all four locales.
  Direct CSV parsing found exactly 50 matching records in each file, in
  ascending ID order. No key, row-order, or variant field was edited.
- ID 21719 retains +9 and +40% longbow damage; ID 21733 retains all
  localized markers, both `{1}` controls, and `{LINE_SPACE}` in source order.
- Active default CSV SHA-256:
  `4649562b52f4f65ac222d902d97be1237af236acc7b74d174b6cf24a1432c441`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved. A whole-file CSV parse is not claimed because of existing
  malformed or multiline records.
- Register totals: 750 accepted, 2,197 `not an issue`, and 3,798 uncertain
  (6,745 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 21751; 43,384 rows remain.
