# Disposition and Edit Batch: `default` IDs 20801-20850

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: two accepted, four `not an issue`, nine uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6431 accepted: ID 20840 now uses the previously accepted
  `갤로스 엔드(Gallows End)` place-name form.
- D-6432 accepted: ID 20849 now renders `broken` as `상심한`, preserving the
  emotional devastation of the return rather than implying physical injury.
- D-6423, D-6427-D-6428, and D-6430 are `not an issue`: life-force drain,
  family spokesperson, recipe structure/quantities, and weapon/parry marker
  content are retained.
- D-6418-D-6422, D-6424-D-6426, and D-6429 remain uncertain: the Litany
  collectible, Oratory, faction/title, UI parameter, Travelers' identity,
  Kollossae spelling, initiation timing, Shattertier, and defensive mechanic
  need contextual or glossary review.

## Verification

- The preliminary scan checked all 50 IDs across the four locales in matching
  order, recipe line breaks, and runtime markers at ID 20839.
- Only Korean `Texto` cells at IDs 20840 and 20849 changed. UTF-8 BOM,
  72,046 CRLF endings, and 39 existing bare-LF endings remain.
- Active default CSV SHA-256:
  `0b0a0dc802308642add488228d0f650088c4854e8f6708a0f5f92039d5c2671a`.
- A whole-file CSV parse is not claimed because of existing malformed or
  multiline records.
- Register totals: 727 accepted, 2,078 `not an issue`, 3,625 uncertain
  (6,430 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 20851; 44,284 rows remain.
