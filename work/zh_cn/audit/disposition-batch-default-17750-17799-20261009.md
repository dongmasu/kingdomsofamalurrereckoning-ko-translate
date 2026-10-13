# Disposition and Edit Batch: `default` IDs 17750-17799

- Decision date: 2026-10-09.
- Scope: all 16 direct findings in the preliminary report; historical
  questions were rechecked against the four active locale rows.
- Decisions: one accepted, eight `not an issue`, and seven uncertain.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 17752 is `not an issue`: Korean preserves the speaker's weariness, the
  condition that news should cheer them, and the request to sit elsewhere.
- ID 17753 is `not an issue`: `아무리 먹어도 성에 안 차지만` naturally conveys
  that the rat meat leaves the speaker unsatisfied; the differing Japanese
  joke does not establish a Korean meaning error.
- ID 17762 is `not an issue`: Korean retains that the staffs belong in the
  Cradle of Summer, the request to retrieve them promptly, and the resulting
  safety for everyone.
- ID 17767 remains uncertain: the row is a quest objective, but the references
  disagree on whether `Grinning Vane` is a translated epithet or a proper
  creature/name; its canonical Korean form is not established.
- ID 17772 remains uncertain: Korean localizes the spawn label and its
  quotation marks differ from the source encoding, but it is unclear whether
  this is an internal diagnostic or player-facing text.
- ID 17774 remains uncertain: `힘` conveys physical might, but this isolated
  stat-help string does not establish the canonical Korean name of the formal
  `Might` attribute.
- ID 17775 remains uncertain: `병원 구역` is understandable, but the row does
  not establish whether `Hospitalis Quarters` is a proper institution/place
  name or a descriptive medical ward.
- ID 17776 is `not an issue`: the deferential address to the Chancellor and
  the speaker's wish to serve are both retained.
- ID 17778 is `not an issue`: Korean identifies the Calamity as a ship and
  preserves the speaker's found-family grief and loss; the abbreviated
  repeated phrasing remains understandable in context.
- ID 17779 is `not an issue`: the frightened volunteer's distinction from a
  formal warden is preserved. The doubled final period follows the English
  source's punctuation rather than introducing a translation discrepancy.
- ID 17781 remains uncertain: the four-paragraph account, causal sequence,
  and fate change are retained, but lore-name spellings and terms such as
  `Hyperian`, `Kollossae`, and `brethren` need broader alignment.
- ID 17783 is `not an issue`: both `{*1...}` marker identities and their order
  are preserved, as are the beam damage, shield protection, and instruction
  to stand behind Tilera.
- ID 17787 is `not an issue`: `수백 년은 거뜬히 버틸 거야` conveys that the
  city will endure for centuries; it does not reduce the claim to surviving
  one attack.
- ID 17797 remains uncertain: Japanese identifies the House of Pride, while
  English alone does not resolve whether `Pride` is the faction or abstract
  virtue. Do not rewrite `자존심의 수호자` without broader lore evidence.
- ID 17798 remains uncertain: the quest sequence, last-seen location, and
  looting motive are retained, but the Korean spellings of the people and
  place names remain provisional.
- ID 17799 is accepted: reduce the two doubled ASCII quote pairs around the
  remembered warning to one pair each. English, Japanese, and Chinese each
  use one pair. After CSV decoding, Korean has one ASCII quote pair around
  each warning, matching the references; no wording or speaker attribution
  changed.

## Verification

- English, Japanese, Chinese, and Korean contain IDs 17750-17799 once and in
  identical order, as checked in the preliminary structural scan.
- The accepted edit changes only the Korean `Texto` value at ID 17799. All
  quoted dialogue, the attribution, and the trailing ellipsis
  sentence remain in the same order.
- No line breaks or runtime markers occur in the accepted row. The prior
  preliminary scan found matching embedded line-break counts and matching
  localized marker class/order for the structurally relevant row at ID 17783.
- The active CSV remains semicolon-delimited UTF-8 with BOM. Its SHA-256 is
  `af15d623ae1ad9389bfc6797218323584e472b19a6200f82b3074f88259e2ade`;
  it has 72,046 CRLF endings and 39 pre-existing bare-LF endings.
- Resume disposition work at ID 17800; 47,335 `default` rows remain. The
  preliminary report for IDs 17800-17849 already exists.
- Register totals after this batch: 667 accepted, 1,776 `not an issue`, and
  3,196 uncertain findings (5,639 counted decisions). Duplicate register
  rows D-5305 and D-5306 remain excluded.

These dispositions do not complete the integrated linguistic review or
constitute independent approval.
