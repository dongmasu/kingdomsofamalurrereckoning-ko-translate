# Disposition and Edit Batch: `default` IDs 21801-21850

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: one accepted, eight `not an issue`, and nine uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6778 accepts a correction at ID 21820: `don't return until you do` refers
  to getting the coin, not bringing the map. The Japanese line supports
  waiting until the money is procured.
- D-6771-D-6772, D-6774, D-6780, and D-6782-D-6785 are `not an issue`:
  retain the replacement jab, poison/mercy condemnation, ability values,
  English-supported Whitestone meeting, survival-for-another turn, female
  archetype label, implicit Hollow/object references, and resistance/immunity
  feedback.
- D-6773, D-6775-D-6777, D-6779, D-6781, and D-6786-D-6788 remain uncertain
  because of unresolved names, titles, lore, and creature terminology.
- Only Korean `Texto` at ID 21820 changed.

## Verification

- The preliminary report checked IDs 21801-21850 across all four locales.
  Direct CSV parsing found exactly 50 matching records in each file, in
  ascending ID order.
- ID 21806 retains 16 seconds, 10% armor reduction, and 45 Mana. ID 21830's
  count and ID 21842's +10% value remain unchanged.
- Active default CSV SHA-256:
  `148ec3afd3c0f4ef134926eba9709ec2b6065e903d2167acac79dbe7806f77fa`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved. A whole-file CSV parse is not claimed because of existing
  malformed or multiline records.
- Register totals: 751 accepted, 2,214 `not an issue`, and 3,821 uncertain
  (6,786 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 21851; 43,284 rows remain.
