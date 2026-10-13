# Disposition and Edit Batch: `default` IDs 20501-20550

- Decision date: 2026-10-09.
- Scope: English meaning, Japanese voice/register, supporting Chinese,
  active Korean, earlier dispositions, and the 50-row preliminary scan.
- Decisions: one accepted, three `not an issue`, nine uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- D-6337 accepted: at ID 20502, remove the unsupported `집` in `비탄의 집`;
  English contrasts devotion to the Sorrows against Winter, while Japanese
  and Chinese do not establish a specific House for the Sorrows. The edit
  does not decide whether Sorrows names a faction, spirits, or a power.
- D-6338-D-6339 and D-6342-D-6348 remain uncertain: named people, factions,
  titles, abilities, and the status of a developer-like scene note require
  context or consistent glossary decisions.
- D-6340-D-6341 and D-6349 are `not an issue`: the gold-cost variable and
  unused warning, Chakram action sequence, founder line, and diplomatic
  choices preserve their source functions.

## Verification

- The preliminary scan checked all 50 IDs across the four locales in matching
  order and checked physical line breaks and `$SQ62.poison_cost$`.
- Only ID 20502's Korean `Texto` was changed. Its CRLF was restored after the
  text edit. UTF-8 BOM, 72,046 CRLF endings, and 39 existing bare-LF endings
  remain; other rows, keys, and token strings were not intentionally changed.
- Active CSV SHA-256:
  `eeeeee72b71dc90023834b4cc4b244deb807596b66c7abcafae2a7b15e84ea13`.
- A whole-file CSV parse is not claimed because of existing malformed or
  multiline records.
- Register totals: 719 accepted, 2,050 `not an issue`, 3,578 uncertain
  (6,347 counted; D-5305/D-5306 excluded).
- Resume at `default` ID 20551; 44,584 rows remain.
