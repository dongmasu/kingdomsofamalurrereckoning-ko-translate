# Candidate Reconciliation: IDs `7500`-`7749`

- Date: 2026-11-14.
- Scope: all 15 current candidate IDs in the range, including the linked
  Khamazandu journal-entry group.
- English controls meaning; Japanese is the primary voice and register
  reference; Chinese is supporting evidence.
- One candidate required a correction; the other 14 were already resolved or
  adequately supported in the active Korean.
- Two rows were changed, including one linked row outside the numeric range.
  Speaker identity and playback order were not inferred.

## Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `7510` | Retained | The active text directly threatens to offer the addressee to Belen. |
| `7527` | Retained | `온 힘을 다해 그들을 찾은 뒤` conveys making every effort, not traveling a distance. |
| `7567` | Retained | `그가 부름받은 자(Beckoned)와 아는 사이라니 몰랐네` expresses the speaker's surprise naturally. |
| `7577` | Retained | The isolated 하오체 was already replaced with natural polite speech. |
| `7581` | Retained | Both mentions use the established `교만의 시종(Knave of Pride)` title. |
| `7588` | Retained | The objective already uses the project's `-기` form and pairs Aiden O'Conor's name. |
| `7589` | Corrected | Aligned `highest of the Warsworn` with `21922` as `워스원(Warsworn)의 최고 지도자`, and used the source-supported verb `처치하다`. |
| `7598` | Retained | The full `Savant Goyen Reen` title and name are paired. |
| `7612` | Retained | The Great Cycle resurrection is already expressed naturally without repeating the Tuatha pairing. |
| `7667` | Retained | The label separately pairs `Argine` and `Queen of Staves`. |
| `7683` | Retained | `안녕, 자상한 주인님` matches the casual Japanese greeting while retaining respectful address. |
| `7714` | Retained | `네가 바로 그 사람이구나` avoids assigning an unsupported gender. |
| `7720` | Retained | Borri, Hanrik, Grian, Gwyn, and Breid are all paired in the same sentence. |
| `7730` | Retained | The Korean preserves the repeated friendship and long-standing relationship. |
| `7733` | Retained | `같은 종족인 백색의 할람(Hallam the White)` is a natural rendering of “our own Hallam.” |

## Linked Khamazandu Entries

The identical opening sentence was compared across IDs `7589`, `15148`,
`19510`, `21922`, `54076`, `64167`, and `64664`. English, Japanese, and
Chinese use the same opening sentence in all seven. The active Korean was
already aligned in five; `54076` omitted the idea that Khamazandu's
instrument would carry out his will, so it was aligned to the established
wording:

`클라우드크레스트 산(Cloudcrest Mountain) 정상에서 니스카루(Niskaru) 군주 카마잔두(Khamazandu)는 내가 이 세상에서 자신의 뜻을 이루는 도구가 되어 준다면 선물을 주겠다고 제안했다.`

At `7589`, the following clause was also aligned with `21922`:
`워스원(Warsworn)의 최고 지도자를 처치했다/처치하고`. Each entry's
distinct quest progress and ending was preserved.

## Verification

- Refreshed only the `7589` and `54076` `source_fingerprint` fields in the
  append-only review ledger.
- All 65,135 ledger fingerprints validated; index and both catalogs reproduced.
- All 11 CSV-preservation tests and nine context-index tests passed.
- The CSV retains 65,135 ordered IDs and its UTF-8 BOM. The newline inventory
  remains 71,838 CRLF, 244 LF-only, and zero bare-CR endings.
- CRLF-aware `git diff --check` passed.
- No source CSV or extracted game asset was modified.

Sequential candidate reconciliation now covers 408 of 4,015 candidates
(10.16%), with 3,607 not yet reconciled.
