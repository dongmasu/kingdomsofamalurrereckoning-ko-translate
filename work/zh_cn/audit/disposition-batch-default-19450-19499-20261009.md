# Disposition and Edit Batch: `default` IDs 19450-19499

- Decision date: 2026-10-09.
- Scope: all candidate groups in the preliminary report; English meaning,
  Japanese voice/register, supporting Chinese, active Korean, historical
  questions, and recurring terms were compared.
- Decisions: one accepted, five `not an issue`, and seven uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 19454 is `not an issue`: Korean preserves that the narrator never saw
  the Fateless One again and traveled across Amalur from the Barking Spines
  to Valaria.
- ID 19458 remains uncertain: the English label `Undersea Fasting` conflicts
  with the Japanese underground-passage interpretation and Chinese literal
  rendering; Korean provisionally retains the phonetic source form.
- IDs 19460, 19462-19463, 19465-19468, 19472, 19480, 19487, 19490-19491,
  and 19498 remain uncertain: meanings are retained, but proper names,
  faction/title terms, and whether isolated labels should be translated need
  global alignment.
- ID 19464 remains uncertain: `game of knuckles` may be boxing, arm-wrestling,
  or another contest. Korean's `주먹 겨루기 내기` does not settle which game
  awarded the inn.
- IDs 19474-19476 remain uncertain: the child and twelve Warsworn are
  preserved, but `grotesque whimsy`, the Hierophant's mistake, and the
  `Hireling` role are context-dependent; `장식물` may be too specific for
  the unnamed object.
- ID 19469 is `not an issue`: all three potion/merchant/alchemy labels are
  localized and their `{*1...}` runtime wrappers match the source structure.
- IDs 19470 and 19481 are `not an issue`: the lockpicking increase remains
  unit-neutral at `1`, and the Boggart replacement trigger and five-summon
  cap are preserved.
- ID 19482 is accepted: change `일시적으로 공격받았을 때 적을 얼릴 확률이
  50% 증가합니다.` to `일시적으로 공격받을 때 적을 50% 확률로 얼립니다.`
  English, Japanese, and Chinese describe a temporary fixed 50% chance to
  freeze enemies when the player is attacked; the prior Korean incorrectly
  says an existing chance increases by 50%.
- ID 19477 is `not an issue`: the Korean lead-in preserves the source's
  deliberate colon and continuation boundary.
- ID 19479 remains uncertain: Korean preserves the rising-water and
  area-unlock condition, but the source does not establish whether the water
  exposes or breaks the dam support.
- IDs 19483-19484 remain uncertain: the challenge is retained, but `Master at
  Arms` and `Castellan` are specialized offices whose canonical Korean titles
  are unresolved.
- ID 19486 is `not an issue`: the English source is ungrammatical
  (`Sounds who makes?`), and Korean gives the well-supported intended
  question without modifying the source.
- ID 19497 remains uncertain: Korean preserves Decanus as a rank in the
  city's Praetorians and its protective role, but the official Korean rank
  equivalent remains unverified.

## Verification

- The Korean, English, Japanese, and Chinese keys and order for IDs
  19450-19499 were compared; each has 50 rows in matching order.
- Only the approved Korean `Texto` cell at ID 19482 changed.
- ID 19469 retains all three localized marker wrappers; the numeric `1` at
  ID 19470 and maximum of `5` at ID 19481 remain unchanged. ID 19482's
  numeric probability remains `50%`.
- Active default CSV SHA-256 after byte-level verification:
  `05ede506387d5509b664c37aa7be0ed998703b294dbfc9d1dc6b7239494f656b`.
  Preserve UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF
  endings.
- A whole-file CSV parse is not claimed because existing malformed/multiline
  records remain.
- Resume disposition work at ID 19500; 45,635 `default` rows remain.
- Register totals after this batch: 701 accepted, 1,984 `not an issue`, and
  3,466 uncertain findings (6,151 counted decisions). Duplicate rows
  D-5305 and D-5306 are excluded.

These dispositions do not complete the integrated linguistic review or
constitute independent approval.
