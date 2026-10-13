# Disposition and Edit Batch: `default` IDs 20651-20700

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, prior decisions, and the 50-row preliminary scan.
- Decisions: two accepted, three `not an issue`, seven uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6382 accepted: ID 20661 now reads `보가트 처치 수`, correcting the
  malformed creature name and making the kill-counter label clear.
- D-6390 accepted: ID 20687 now ends with a question mark, matching the
  English and Japanese question rather than asserting immunity as fact.
- D-6383, D-6388, and D-6392 are `not an issue`: the suspicion, two-stage
  attack values/layout, and slave-ship simile preserve their source functions.
- D-6384-D-6387, D-6389, D-6391, and D-6393 remain uncertain: lore names,
  branch/craft terminology, fragment/UI context, debug-label display,
  Counsel's referent, resource terminology, and proper-name forms need
  context or corpus-level review.

## Verification

- The preliminary scan checked all 50 IDs across the four locales in matching
  order, physical line breaks, the multiline ability's values, and runtime
  marker IDs/order at 20690.
- Only Korean `Texto` cells at IDs 20661 and 20687 changed. UTF-8 BOM,
  72,046 CRLF endings, and 39 existing bare-LF endings remain.
- Active CSV SHA-256:
  `70c3b24b5427221c572575f3cb714195429ba7b7eede2e37cce7c4b6653c188e`.
- A whole-file CSV parse is not claimed because of existing malformed or
  multiline records.
- Register totals: 723 accepted, 2,064 `not an issue`, 3,604 uncertain
  (6,391 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 20701; 44,434 rows remain.
