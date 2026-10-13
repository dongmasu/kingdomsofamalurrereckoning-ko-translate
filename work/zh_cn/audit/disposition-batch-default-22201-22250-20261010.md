# Disposition and Edit Batch: `default` IDs 22201-22250

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: zero accepted, fifteen `not an issue`, and twelve uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6944, D-6947-D-6949, D-6951-D-6952, D-6956-D-6958, D-6960-D-6962,
  D-6964-D-6965, and D-6968 are `not an issue`: the ammo/arrow distinction,
  chalice value, combat warning, Gizela's grief, revenge, omitted training
  object, two curses, homestead threat, Chaos Thrall numeral, health stat,
  title challenge, Ventrinio taunt, marker-only string, caught confession,
  and Fate warning are retained.
- D-6943, D-6945-D-6946, D-6950, D-6953-D-6955, D-6959, D-6963,
  D-6966-D-6967, and D-6969 remain uncertain due to unresolved lore/names,
  the English/Japanese source conflict, military/item terminology, omitted
  referents, or factional ambiguity.
- No Korean CSV text changed.

## Verification

- The preliminary report checked IDs 22201-22250 across all four locales.
  Direct CSV parsing found exactly 50 matching records in each file, in
  ascending ID order.
- ID 22204 retains all three ordered localized wrappers and the English
  ammo/arrows distinction. ID 22216 retains five narrative lines and four
  embedded line breaks. ID 22238's marker-only text matches English,
  Japanese, and Korean exactly; the Chinese ellipsis difference is confined
  to localized text inside the wrapper.
- Active default CSV SHA-256 remains
  `59e83f21e13d974d197e55e26e4c8f39d5a725bb92e04ab473d8b0e2b2773f86`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain
  intact.
- Register totals: 754 accepted, 2,304 `not an issue`, and 3,909 uncertain
  (6,967 counted; duplicate D-5305/D-5306 excluded).
- Resume at `default` ID 22251; 42,834 rows remain.
