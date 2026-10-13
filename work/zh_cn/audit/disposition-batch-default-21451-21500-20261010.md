# Disposition and Edit Batch: `default` IDs 21451-21500

- Decision date: 2026-10-10.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, historical questions, and the 50-row preliminary scan.
- Decisions: one accepted, nine `not an issue`, and fourteen uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6658 accepts a correction at ID 21478: `catch them by surprise` means
  surprise them with a quick strike, not capture them. The Korean no longer
  adds `붙잡아서`.
- D-6648, D-6653, D-6655, D-6656, D-6660, D-6664, D-6665, D-6668, and D-6669
  are `not an issue`: preserve the truncated source fragment; translate the
  apparent typos in the Dead Kel letter by intended meaning while keeping all
  eight physical lines; retain the land-threat text, broad manse reading,
  praise of the general, separate staff damage values, control-token labels,
  recipe quantities/line breaks, and intended identification request.
- D-6647, D-6649-D-6652, D-6654, D-6657, D-6659, D-6661-D-6663, D-6666-D-6667,
  and D-6670 remain uncertain because of implicit reference, ambiguous
  pronouns, literary metaphor, or unresolved names/game-mechanics terminology.
- Only Korean `Texto` at ID 21478 changed.

## Verification

- The preliminary report checked IDs 21451-21500 across all four locales.
  Direct CSV parsing found exactly 50 matching records in each file. No key,
  row-order, or variant field was edited.
- ID 21478 now reads `그녀와 남편은... 근처에 있어. 서둘러 기습하면 이
  공포를 끝낼 수 있을 거야.` The unsupported capture outcome was removed.
- ID 21465 retains the eight-line letter; IDs 21483 and 21496 retain their
  paragraph/recipe breaks. ID 21488's `{1}`, `{2}`, and both localized
  wrappers remain untouched.
- Active CSV SHA-256 and encoding/line-ending checks are recorded in the
  current checkpoint. A whole-file CSV parse is not claimed because of
  existing malformed or multiline records.
- Register totals: 744 accepted, 2,178 `not an issue`, and 3,746 uncertain
  (6,668 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 21501; 43,634 rows remain.
