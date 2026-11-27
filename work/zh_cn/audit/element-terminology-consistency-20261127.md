# Element Terminology Consistency Review

- Date: 2026-11-27.
- Scope: `default` sentences that name Fire, Ice/Frost, and Lightning
  together.
- Decision: use `불`, `얼음`, and `번개` for these elemental forces,
  regardless of English source word order.
- Source authority: English establishes the element and sentence meaning;
  Japanese is checked for voice and nuance; Chinese and other localized
  versions provide corroborating evidence.

## Cross-Language Review

The English source explicitly names the same three-element set in IDs
`3797`, `4336`, `34908`, `42280`, `42825`, `51469`, `55176`, and `59011`.
The same sentence from `3797` also appears after an active-state label at
`51550`. It uses `Ice` in some sentences and `Frost` in others. Japanese
renders these as the corresponding elemental powers (usually `氷`, with
`霜` at `42825`); Chinese uses `寒冰`/`冰`. German, French, Italian, and
Spanish likewise confirm the shared ice element rather than a separate
fourth element.

Accordingly, the consistent names in this explicit triad are `불`, `얼음`,
and `번개`. This corrects only the inconsistent `화염` at `3797` and
`서리` at `34908`, `42825`, and `51469`. The Korean already used the chosen
forms at `4336`, `42280`, `51550`, `55176`, and `59011`. Although `51550`
repeats the `3797` sentence, its active-state label makes the full source row
different; it was checked as a contextual repeat rather than an exact-text
duplicate.

The damage-type list at `default:64998` is intentionally excluded. Its
established game labels remain `화염(Fire)`, `냉기(Ice)`, and
`번개(Lightning)`; those are damage categories, not ordinary names for the
elemental forces in these sentences. No named ability or other standalone
use was changed.

## Edited IDs

- `3797`: `화염` to `불`.
- `34908`, `42825`, and `51469`: `서리` to `얼음`.

Only the `Texto` field for these four IDs was changed. The existing
conversational revision at `34908` retains its register. The corresponding
four-language review fingerprints were refreshed for these IDs only.
Proper-name occurrence snapshots were updated only where their Korean
snapshot included the edited phrase: two records for `34908` and nine for
`51469`.

## Verification

- Compared all nine reviewed rows in English, Japanese, Chinese, Korean,
  German, French, Italian, and Spanish.
- Confirmed the active Korean rows use `불`, `얼음`, and `번개` without
  `화염` or `서리` in the reviewed triad contexts.
- Confirmed `default:64998` retains `화염(Fire)`, `냉기(Ice)`, and
  `번개(Lightning)`.
- Rebuilt the exact-English occurrence index after the Korean CSV changed.
- No source CSV, extracted asset, or game binary was changed; no commit was
  made.
