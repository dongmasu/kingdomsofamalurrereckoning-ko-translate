# Disposition and Edit Batch: `default` IDs 13300-13349

- Decision date: 2026-10-09.
- Scope: all 24 source-keyed IDs represented by the preliminary report,
  counting IDs 13302 and 13303 separately.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, and archived questions.
- Twenty-four findings received dispositions: one accepted, nine `not an
  issue`, and fourteen uncertain.
- One accepted `Texto` correction was applied at ID 13314.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 13300 remains uncertain: English's double negative conflicts with the
  Japanese and Chinese readings; retain the ambiguity pending scene context.
- ID 13302 remains uncertain: the Maid of Windemere title has competing
  locale forms and no settled Korean convention.
- ID 13303 remains uncertain: it is unclear whether `House of Pride` is a
  named faction/House, and active Korean usage is not yet standardized.
- ID 13304 remains uncertain: the author and ingredient forms vary across
  locales; preserve the book-title structure pending terminology review.
- ID 13305 remains uncertain: the source ends in U+00A0, while Korean stores
  the six literal characters `\u00a0`. Do not normalize this character
  without resolving the serialization/display intent.
- ID 13306 remains uncertain: the diary's voice progression and Day 27
  assignment are context-heavy; embedded token counts match, but physical
  newline counts differ across locales.
- ID 13310 is `not an issue`: Korean's `영리한 아만` preserves the epithet
  `Amman the Clever`, consistent with the other locale readings.
- ID 13312 remains uncertain: `services in kind` is ambiguous between
  in-kind compensation and member services/amenities.
- ID 13314 is accepted: replace `외로운 페이` with `홀로 지내는 페이`.
  `Lone` describes solitude, not an emotional state; all reference languages
  support the solitary reading.
- ID 13316 remains uncertain: capitalized `Rat` may identify a creature type,
  and Gravehal Keep's canonical Korean form needs alignment.
- ID 13319 is `not an issue`: the offer retains both card-reading and
  dice-gambling alternatives.
- ID 13321 remains uncertain: the creature/race terms and the exact relation
  between Meathgra, leanashe, and the cremated Alfar remain lore questions.
- ID 13322 remains uncertain: `Default Statue Name` may be a development
  fallback or player-facing label.
- ID 13324 is `not an issue`: Korean preserves the surprise that this key is
  one of three required keys.
- ID 13326 is `not an issue`: Korean preserves the Warsworn's brave tales and
  the steel/valor opposition to Chaos.
- ID 13328 is `not an issue`: `대상들` conveys the caravans, and Korean
  retains the deliberate “who or what” uncertainty.
- ID 13332 remains uncertain: isolated `Pick` does not establish a lockpick,
  other tool, or selection.
- ID 13333 remains uncertain: capitalized `Weave` may be a named
  cosmological concept with a canonical Korean term.
- ID 13339 is `not an issue`: `#NAMED_ICON_360_Y#` is unchanged and
  `보조 무기` conveys Secondary Weapon.
- ID 13340 remains uncertain: `Delver` is a setting-specific role/title whose
  established Korean term is unresolved.
- ID 13342 is `not an issue`: Korean's north direction follows English and
  Chinese; Japanese alone says west.
- ID 13344 is `not an issue`: `반가운 소식이군` follows the good-tidings
  reading also used by Japanese and Chinese; the formal names remain a
  corpus-wide terminology matter.
- ID 13346 is `not an issue`: Korean preserves the contrast between youthful
  confidence and the speaker's current limits, using the established
  `페이트위버` form.
- ID 13348 remains uncertain: English is malformed and the canonical disease,
  place, and clerical-title terms need alignment.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 13314 | `...남쪽 절벽에서 광산촌을 내려다보는 외로운 페이, 칼로바르(Calovar)가...` | `...남쪽 절벽에서 광산촌을 내려다보며 홀로 지내는 페이 칼로바르(Calovar)가...` | D-3917 |

## Verification

- The four locale CSVs contain IDs 13300-13349 in identical key order; each
  full `default` CSV contains 65,135 IDs.
- Only the accepted single-line `Texto` cell at ID 13314 changed. The
  `{LINE_INDENT}` and `{LINE_NEXT_PAGE}` token counts at ID 13306 and the icon
  token at ID 13339 remain unchanged.
- The ID 13305 trailing-character mismatch and ID 13306 physical newline
  differences remain explicitly unresolved; neither was edited.
- Before this batch: 536 accepted, 1,249 `not an issue`, and 2,123 uncertain.
  After this batch: 537 accepted, 1,258 `not an issue`, and 2,137 uncertain
  (3,932 dispositions total).
- Resume at ID 13350; 51,785 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
