# Disposition and Edit Batch: `default` IDs 18000-18049

- Decision date: 2026-10-09.
- Scope: all 13 findings in the preliminary report; historical questions
  were rechecked against the active four-locale rows.
- Decisions: zero accepted, four `not an issue`, and nine uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 18000 is `not an issue`: the game title and `{LINE_CENTER}` control are
  retained, and the feature names remain as in the English/Japanese source.
- ID 18001 remains uncertain: Korean's `예배당` conveys the chantry building
  sense, but the canonical Korean religious-building term needs alignment.
- ID 18005 remains uncertain: `유해` selects human remains, while English is
  ambiguous and Chinese can mean ruins/remains; the quest context is not
  available to resolve the target.
- ID 18006 remains uncertain: the armed infiltration and rebuke are retained,
  but the canonical Korean form of `Bhaile` varies across the corpus.
- ID 18009 remains uncertain: the trigger and stun effect are retained, but
  exact Korean combat-status terminology needs glossary/mechanics
  verification because Japanese uses a paralysis term.
- ID 18023 remains uncertain: `현자 리엔(Savant Reen)` preserves the name
  and learned-person sense, but whether `Savant` is a formal rank/title is
  unresolved.
- ID 18025 is `not an issue`: Korean preserves the speaker's dismissive
  indifference and the joke about reduced competition; the mild profanity is
  softened but the pragmatic effect remains.
- ID 18026 remains uncertain: the `#NAMED_ICON_360_LB#` token is intact, but
  the Korean space before the icon differs from every source locale and
  should be judged in the actual UI rather than removed speculatively.
- ID 18032 remains uncertain for “the page”: English says `the page`, while
  Japanese and Chinese read it as an attendant/assistant; Korean follows the
  latter. This material source conflict cannot be resolved from this
  chronicle alone.
- ID 18032 remains uncertain for the Gardens: Korean preserves the
  Seelie-to-Ysa renaming, but canonical Korean name forms for the Seelie and
  Gardens of Ysa need broader alignment.
- ID 18038 is `not an issue`: the trained-soldier claim and service under
  White Nil are retained; the malformed English comma is a source defect,
  not a Korean translation error.
- ID 18039 remains uncertain: the journal facts are retained, but English
  `Undersea Fasting` conflicts with the passage interpretation in Japanese
  and Chinese and with Korean `패스`; do not silently normalize the place
  or artifact title.
- ID 18044 is `not an issue`: the surprise at seeing the Hierophant chained
  and the resulting freedom from her gaze are preserved; Japanese and
  Chinese support the surveillance reading of “gaze.”

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 18000-18049 once
  and in identical order.
- No CSV `Texto` value changed in this batch. `{LINE_CENTER}` and
  `#NAMED_ICON_360_LB#` remain intact; the icon spacing remains open pending
  runtime UI evidence.
- The preliminary scan found matching embedded line-break counts, including
  the multi-paragraph account at ID 18032.
- The active default CSV SHA-256 remains
  `30d2788981a965b41aea26dab675f09ef59cfd5d74b69575c644a59a524a28c8`;
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Resume disposition work at ID 18050; 47,085 `default` rows remain. The
  preliminary report for IDs 18050-18099 already exists.
- Register totals after this batch: 671 accepted, 1,803 `not an issue`, and
  3,237 uncertain findings (5,711 counted decisions). Duplicate register
  rows D-5305 and D-5306 remain excluded.

These dispositions do not complete the integrated linguistic review or
constitute independent approval.
