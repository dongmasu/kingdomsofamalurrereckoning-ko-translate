# Candidate Reconciliation: IDs `39750`-`39999`

- Date: 2026-11-14.
- Rechecked the 27 candidates in the sequential-review report against English,
  Japanese, Chinese, active Korean, and related terminology decisions.
- A terminology sweep found one missed in-range occurrence, `39849`, which the
  earlier sequential ledger had marked `not-issue`. It is now corrected and
  added to the candidate pool.
- Exact-source review found linked candidate `59331`, whose English, Japanese,
  and Chinese match `39895`; its Korean farewell is now aligned. Linked
  candidate `41471` was checked with `39868`; both already have identical
  Korean objective text.
- The 27 original in-range candidates, the missed `39849`, and linked IDs
  `41471` and `59331` add 30 unique reconciled candidates. The candidate pool
  is corrected from 4,015 to 4,017 to include the two newly discovered IDs.

## Candidate Decisions

| ID | Result |
| ---: | --- |
| `39755` | Verified the complete forward instruction and the paired `Witch Knight Myrna` and `Prismere Chantry` names. |
| `39766` | Verified `비탄의 힘(The Sorrows)` for the named magical force. |
| `39791` | Verified the paired personal name `칼란(Calan)`. |
| `39798` | Verified the complete English label is paired with the Korean estate label. |
| `39811` | Verified `No quarter` as no mercy, not as a lack of surrender. |
| `39825` | Verified the complete `Adept Gar Gwydern` label pairing. |
| `39847` | Verified consistent plain written register throughout the three clauses. |
| `39848` | Verified the complete item name `켈러랙의 검(Kellerac's Sword)` and its exact-source group. |
| `39849` | Corrected the missed `소로스` to `비탄의 힘(The Sorrows)`; English, Japanese, and Chinese identify the same named force. |
| `39852` | Verified the paired names `제다(Jedda)`, `투린(Turin)`, and `오레인(Oreyn)` while preserving the speaker's hesitation. |
| `39858` | Verified consistent use of `비탄의 힘(The Sorrows)`. |
| `39860` | Verified the natural idiom `시장의 총애를 받고 지낸다`, supported by Japanese `子飼い`. |
| `39868` | Verified `후버 평원(Field of Huber)으로 이동하기`; exact-source duplicate `41471` matches in all four locales. |
| `39876` | Verified the established `대담한 알메르(Almere the Bold)` form. |
| `39884` | Verified the complete item-name pairing `흠 없는 미타란 신성의 손아귀(Flawless Mitharan Divine Grip)`. |
| `39895` | Verified the neutral/polite farewell `그럼 나중에 봐요.` against Japanese `では、後ほど`. |
| `39898` | Verified the natural conversational `지금은 상황이 좋지 않아`. |
| `39902` | Verified the current `충전 사격(Charged Shot)` ability-name pairing and effect statement. |
| `39916` | Verified `운명에 맹세한 자들(Fatesworn)` against the later approved faction terminology; no Warsworn alias was added. |
| `39929` | Verified the natural offer `원하면 잔 하나 집어 들고 한잔해`. |
| `39931` | Verified the natural statement that few members of the Winter Court remain. |
| `39934` | Verified `처형인(Headsman)` and the sentence's established names and relationships. |
| `39936` | Verified consistent use of `비탄의 힘(The Sorrows)`. |
| `39938` | Verified the natural serious-event phrasing while retaining the hesitation. |
| `39947` | Verified the polite offer to help as a `페이트위버(Fateweaver)`. |
| `39953` | Verified the source spelling `Skyblossom` in `하늘꽃(Skyblossom)`. |
| `39979` | Verified the direct warning `이제 넌 큰일 났어`. |
| `39984` | Verified `겨울 페이(Winter Fae)` and kept it distinct from the `House of Sorrows`. |

## Linked Consistency

- `39868` and `41471` have identical English, Japanese, and Chinese objective
  text and identical Korean `후버 평원(Field of Huber)으로 이동하기`.
- The six exact-source farewell rows `16152`, `21295`, `29847`, `39895`,
  `45387`, and `59331` now all read `그럼 나중에 봐요.`. This corrects the
  outlying casual ending at `59331`; no speaker or playback order is inferred.
- The exact-source item group `13990`, `39848`, and `56993` consistently uses
  `켈러랙의 검(Kellerac's Sword)`.
- The named force at `39766`, `39849`, `39858`, and `39936` consistently uses
  `비탄의 힘(The Sorrows)`, distinct from `비탄의 집(House of Sorrows)`.
- `39916` matches the later reviewed faction decision recorded in
  `review-fatesworn-faction-D21747.rb`; that decision supersedes the earlier
  local terminology hold.

## Evidence-Limited Holds

The nine holds from the sequential review remain unchanged: `39762`, `39779`,
`39809`, `39817`, `39840`, `39893`, `39907`, `39981`, and `39996`. Their
meaning, title boundary, role, or voice cannot be resolved safely from the
available row-level evidence.

## Verification

- The 28 in-range candidates and two linked candidates were reconciled; no
  previously counted candidate was counted again.
- Two Korean rows changed in this pass: `39849` and linked exact-source row
  `59331`. The four-language fingerprints for both rows were refreshed.
- All 65,135 ledger fingerprints and the index, asset catalog, and ID catalog
  reproducibility checks passed.
- The 11 CSV-preservation tests and nine dialogue-context tests passed.
- The active CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,840 CRLF
  sequences, 242 LF-only separators, and no bare CR. The CRLF-aware diff check
  passed.
- Exact-source groups for the Huber objective, farewell, and Kellerac's Sword
  were checked across English, Japanese, Chinese, and Korean.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.

Candidate reconciliation now covers 2,559 / 4,017 (63.70%), with 1,458
remaining.
