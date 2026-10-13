# Disposition and Edit Batch: `default` IDs 20601-20650

- Decision date: 2026-10-09.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, earlier decisions, and the 50-row preliminary scan.
- Decisions: one accepted, six `not an issue`, ten uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6368 accepted: at ID 20613 use the already accepted traceable form
  `스콜리아 아르카나(Scholia Arcana)` instead of omitting `Scholia` from the
  institution's name.
- D-6365, D-6367, D-6372, D-6375, D-6377, and D-6381 are `not an issue`:
  bandit paradox, bed-price variable, Fae contrast, flight to the mountains,
  Jottun etymology, and +25% magic damage retain their supported meaning.
- D-6366, D-6369-D-6371, D-6373-D-6374, D-6376, and D-6378-D-6380
  remain uncertain: species antecedent, titles and places, poetic imagery,
  item names, tone, and reconnaissance referent require context.

## Verification

- The preliminary scan checked all 50 IDs across the four locales in
  matching order, line breaks, and runtime-token structures, including
  four-line poems and the ingredient list.
- Only ID 20613's Korean `Texto` changed; its CRLF was restored. UTF-8 BOM,
  72,046 CRLF endings, and 39 existing bare-LF endings remain. A whole-file
  CSV parse is not claimed because of existing malformed or multiline records.
- Active CSV SHA-256:
  `06ea13fc7557d6839f4a84adb21197f2b8a0eddd92be3bf0181429e2b8d54c1d`.
- Register totals: 721 accepted, 2,061 `not an issue`, 3,597 uncertain
  (6,379 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 20651; 44,484 rows remain.
