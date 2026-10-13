# Consolidated Context Review: High/Low Card Calls

- Date: 2026-10-12.
- Decision: D-19472.
- Scope: `default` IDs 10443, 31562, 34823, 35375, and 55916.

## Finding

These lines are self-contained card-call exchanges. Their exact game rules
and card ranking system need not be inferred to assess whether Korean
preserves the stated call, revealed card, and outcome. English is the meaning
baseline; Japanese and Chinese corroborate the exchanges, with Japanese
sometimes making the win/loss wording more explicit.

| ID | English evidence | Japanese / Chinese cross-check | Active Korean | Disposition |
| ---: | --- | --- | --- | --- |
| 10443 | Calls `Lower`, reveals a `Hex` described as the highest, and says the player loses. | Japanese likewise says `ロー`, `ヘックス`, high, and loss; Chinese diverges on the card's point value but agrees it is the high result and a loss. | `낮은 패` / `헥스` / `가장 높은 패` / loss | not an issue |
| 31562 | Confirms the `Lower` call, reveals an ace, and says the player wins. | Japanese and Chinese also identify the low call, ace/one, and win. | `낮은 패` / ace / win | not an issue |
| 34823 | Says the `Lower` call matches a three and congratulates the player. | Japanese explicitly confirms the player wins; Chinese also calls the three low. | `낮은 쪽` / three / win | not an issue |
| 35375 | Confirms `Higher`, reveals a four, and says the player does not win. | Japanese and Chinese preserve the higher call, four, and loss. | `높은 쪽` / four / loss | not an issue |
| 55916 | Confirms `Higher`, reveals an ace, notes it could not be lower, and says there is no win. | Japanese and Chinese preserve the higher call, ace/one, low-card observation, and loss. | `높은 쪽` / ace / `이보다 낮을 순 없지` / loss | not an issue |

The review confirms only the translation of each stated exchange; it does
not establish generalized card rankings, whether aces are always high or
low, or the role of `Hex` in other contexts. Five prior uncertainties were
resolved as `not an issue`. No Korean CSV cells changed. These rows contain
no runtime markers or embedded line breaks.

## Verification

- Compared English, Japanese source and preserved draft, Chinese source, and
  active Korean by `ID_Linha`.
- Active default SHA-256 remains
  `df9685d685ab7dd41c9490ef6e46283f16d370592f617e28beba4ac34c7306dc`.
- Totals after D-19472: **2,350 accepted / 25,102 not an issue / 11,072
  uncertain** (38,524). Resume at **D-19473** from the deduplicated
  unresolved-source queue.
