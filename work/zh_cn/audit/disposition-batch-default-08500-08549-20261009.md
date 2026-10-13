# Disposition and Edit Batch: `default` IDs 8500-8549

- Decision date: 2026-10-09.
- Scope: preliminary findings and carried historical questions for `default`
  IDs 8500-8549.
- Decisions use the existing four-locale preliminary comparison and active
  Korean draft. English governs meaning, Japanese informs voice/register, and
  Chinese is supporting evidence.
- Thirteen findings received dispositions: two accepted corrections, three
  `not an issue`, and eight uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 8500 remains uncertain: `Plumb` may identify an item or plumbing; the
  Chinese hammer reading does not resolve the ambiguity.
- ID 8501 is `not an issue`: Korean preserves the dry irony that lofty
  Kollossae overlook details.
- ID 8503 remains uncertain: the English source has a typo and locale versions
  differ in emotional nuance; Korean retains affection, melancholy, and the
  fire/pool contrast.
- ID 8505 remains uncertain: English and Japanese leave the great-aunt's side
  unspecified, while Korean chooses the maternal `큰이모할머니`; a natural
  neutral Korean kinship term needs context.
- ID 8517 is `not an issue`: all locale strings end mid-sentence and Korean
  does not invent the continuation.
- ID 8523 is accepted. Change `자신의 본성이 제 몫을 못 한다 여겼네.` to
  `자신의 처지가 못마땅했네.` English, Japanese, and Chinese describe Nix's
  dissatisfaction with its role or lot, not its nature failing to do its part.
- ID 8525 remains uncertain: the capitalized Travelers faction alternates
  between Korean translation and transliteration/name-paired forms.
- ID 8526 remains uncertain: English and Chinese retain `TMP`, while Japanese
  marks the label provisional; player-facing intent is unknown.
- ID 8529 is `not an issue`: the blank paragraph, reagent list, item names,
  and quantities `(2)` and `(1)` are preserved.
- ID 8534 is accepted. Change `그레이홀` to `그레이브홀(Gravehal)`, matching
  the same place `Gravehal Keep` at ID 8409 (`그레이브홀 성`).
- ID 8537 remains uncertain: the threat and pet insult are preserved, but
  `House of Ballads` usage differs from the related unresolved form at ID 8428.
- ID 8540 remains uncertain: the Maid may be a title/heroine rather than a
  servant; related Korean usage is not enough to settle it.
- ID 8549 remains uncertain: team names are retained, but the Korean form for
  `Crows` is unresolved in the related entry at ID 8393.

## Applied Edits

| ID | Previous Korean / affected text | Applied Korean / replacement | Decision |
| ---: | --- | --- | --- |
| 8523 | `자신의 본성이 제 몫을 못 한다 여겼네.` | `자신의 처지가 못마땅했네.` | D-2391: preserve Nix's dissatisfaction with its lot, not a failure of its nature. |
| 8534 | `그레이홀` | `그레이브홀(Gravehal)` | D-2395: align the repeated place name with `Gravehal Keep` at ID 8409. |

## Verification

- The preliminary report documents matching ordered keys, record line breaks,
  and runtime/control-marker identities and order across all four locales
  for this range.
- Only the approved Korean `Texto` values at IDs 8523 and 8534 changed; the
  poem's line count and row keys remain unchanged.
- Active Korean `default` CSV SHA-256:
  `6d8e0a3ad7e34c3402d13bfb6f79fa5d8f101ec7262b6fd6d92b99d983123d54`.
- Parsed CSV verification passed: 65,135 records, two fields per record,
  unique ordered IDs 0-65134, UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and no bare LF/CR.
- After this batch: 383 accepted, 770 `not an issue`, and 1,245 uncertain.
  Resume at ID 8550; 56,585 rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
