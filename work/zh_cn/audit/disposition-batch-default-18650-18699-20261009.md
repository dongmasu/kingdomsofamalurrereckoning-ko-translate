# Disposition and Edit Batch: `default` IDs 18650-18699

- Decision date: 2026-10-09.
- Scope: eleven candidate groups, covering 25 unique source rows after
  reconciling the overlapping name and dialogue findings.
- Decisions: three accepted, four `not an issue`, and four uncertain.
- English meaning, original Japanese, supporting Chinese, active Korean, and
  historical notes were checked. These are working dispositions, not
  independent final linguistic approval.

## Decisions

- ID 18650 remains uncertain: the ledger retains English's 905-yard figure
  and transaction amounts, while Japanese converts the distance and locale
  readings of the wine types and exchange differ. Do not silently normalize
  these source/reference conflicts.
- IDs 18653, 18655-18657, 18659-18660, 18668, 18677, 18684-18685, 18689,
  18695-18696, and 18699 remain uncertain as a terminology group: the Korean
  forms are traceable to the English names, but recurring place, faction,
  personal-name, and `Traveler` forms need corpus-wide consistency review.
  At ID 18668, the sequence of Jeibir's Traveler, captain, and war experience
  is retained; the uncertainty concerns terminology and name consistency.
- ID 18661 is `not an issue`: `이만` is a natural Korean leave-taking for
  `So long`.
- ID 18666 is `not an issue`: English and Japanese also retain the internal
  staff-credit title `Sr. QA Manager`; Korean leaves it intact.
- ID 18671 is accepted: change the farewell `또 보자` to `또 만났네` to match
  English `Hello again`, Chinese's greeting, and Japanese recognition on
  meeting again.
- ID 18678 remains uncertain: the map and strongbox are clear, but English's
  final `until you do` leaves the exact object of `do` elliptical; Korean's
  `찾아올 때까지` does not resolve what is to be found.
- ID 18680 is accepted: change `믿을 수 있겠지만` to `믿기 어렵겠지만` to
  restore the incredulous aside about the floating city, supported by the
  original Japanese and Chinese.
- IDs 18681-18682 are accepted: reduce the doubled literal quote pairs around
  `운명에 충실한 자의 희망` and `걸어 다니는 시체` to one pair each.
  English/Japanese use one quoted phrase; all armor, faction, and plot
  information remains unchanged.
- ID 18686 is `not an issue`: `좋아, 이번엔 또 어떤 죽음이지?` retains the
  dark, sarcastic reaction to another death without inventing its referent.
- ID 18694 remains uncertain: the hymn's lineation and broad imagery are
  retained, but the mythic references and meaning of `Teeth` need lore context.
- ID 18698 is `not an issue`: `그들조차도` clearly refers back to `우리 민족`
  within the sentence and retains the source's emphasis that even this group
  avoids crossing the expanse without need.

## Verification

- English, original Japanese, Chinese, and Korean each contain IDs
  18650-18699 once and in identical ascending order (50 rows per locale).
- Only Korean `Texto` at IDs 18671, 18680, 18681, and 18682 changed. No key,
  variant, row order, or extracted game token changed.
- The edited quote rows now contain one literal quote pair per quoted phrase.
  A whole-file CSV parse is not claimed because existing malformed/multiline
  records remain.
- The active default CSV SHA-256 is
  `46befc19f10aa84b58f752f929ed2afbd8fe1eb124302c0c13c46c7e81914d57`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 existing bare-LF endings are
  preserved.
- Resume disposition work at ID 18700; 46,435 `default` rows remain.
- Register totals after this batch: 691 accepted, 1,907 `not an issue`, and
  3,311 uncertain findings (5,909 counted decisions). Duplicate register
  rows D-5305 and D-5306 remain excluded.

These dispositions do not complete the integrated linguistic review or
constitute independent approval.
