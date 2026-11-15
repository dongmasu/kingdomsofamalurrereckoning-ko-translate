# Candidate Reconciliation: IDs `8000`-`8249`

- Date: 2026-11-14.
- Scope: all 16 current candidate IDs in the numeric range, checked against
  the active English, Japanese, Chinese, and Korean rows and linked reviews.
- English controls meaning; Japanese is the primary voice and register
  reference; Chinese is supporting evidence.
- Two in-range candidates required corrections; the other 14 already matched
  supported wording or established terminology.
- The linked `SQ01` `meat-birds` finding also covered two candidate IDs outside
  this range. `50475` was retained; `64633` was corrected. Both are included
  in the cumulative reconciled-candidate count.
- No speaker identity or playback order was inferred from asset membership.

## In-Range Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `8022` | Retained | `어서 가!` already conveys the impatient hurry command in English, Japanese, and Chinese. |
| `8046` | Retained | The current conversational `만들었어 ... 그 주문이지` follows the plain Japanese dialogue. This correction was already present in the worktree; its stale source fingerprint was refreshed. |
| `8049` | Retained | `칙허장` is the established term for the Ratofer family document; the current sentence reads naturally. |
| `8105` | Retained | `그런 시절도 이미 오래전에 지났어` conveys the reflective “those seasons are long past” in natural Korean. |
| `8128` | Corrected | Replaced the awkward literal `고기새` with `닭고기`. English and Chinese say the speaker ate the food; Japanese independently identifies chicken. |
| `8135` | Retained | `빅터의 양조주(Victor's Brew)` is consistent with the other reviewed occurrences at `21338`, `32511`, `46789`, and `57870`; the Asker's Ale joke remains intact. |
| `8146` | Retained | `로포쿠(Lupoku)` uses the established Korean deity name and the exact English spelling in this source row. Its four-language fingerprint was already current. |
| `8156` | Retained | The recovered Ratofer family document is consistently called `칙허장`; the journal voice and objective remain clear. |
| `8159` | Retained | `화염 물약` is the established term for the fire potions, distinct from the damage type `화염 피해`. |
| `8177` | Retained | `사냥의 군주(Lord of the Chase)` matches the related references at `15999` and `46307`; the hesitant correction `그는... 아니, 예전에는` is preserved. |
| `8190` | Retained | The heading already pairs `컵의 여왕(Queen of Cups)` and `메어(Maire)`, matching the exact-source title group. |
| `8191` | Retained | `운명의 실(Weave)` clearly identifies the fate-weaving concept and avoids the ordinary-net reading; the full explanation is retained. |
| `8214` | Retained | `그녀의 원수를 갚았지만` is the natural Korean construction for avenging her death and preserves the speaker's grief. |
| `8217` | Retained | The source-specific `Ordination Tome` is already `서품서(Ordination Tome)`; the institution and sentence register are also consistent. |
| `8228` | Corrected | Recast the awkward “leave one team” phrasing as `팀을 잃고 싶지 않으면 지금 당장 아래로 내려가는 게 좋을 거야`, supported by the English, Japanese, and Chinese warnings. |
| `8235` | Retained | The standalone name already reads `앤드루(Andrew)`. |

## Linked `SQ01` Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `50475` | Retained | `닭고기처럼` is natural for the food simile in “shred them like meat-birds”; Japanese explicitly uses chicken meat. |
| `64633` | Corrected | Changed `먹잇감 새` to `닭`. English and Chinese describe catching a bird, and Japanese explicitly says the wolf-bodied speaker cannot catch even a chicken. |

## Changes and Verification

- Changed the Korean text at `8128`, `8228`, and linked candidate `64633`
  using the byte-preserving ID-scoped editor.
- Refreshed only the changed-row fingerprints for `8046`, `8128`, `8228`,
  and `64633`. The `8146` fingerprint already matched its current text.
- Kept all ledger dispositions and evidence links unchanged.
- The machine-readable decisions and verification results are recorded in
  [`dialogue-context-final-edits-followup-08000-08249-20261114.json`](dialogue-context-final-edits-followup-08000-08249-20261114.json).

All 18 reconciled candidates (16 in-range and two linked `SQ01` candidates)
are adjudicated. Cumulative candidate reconciliation is 436 / 4,015
(10.86%), with 3,579 not yet reconciled.
