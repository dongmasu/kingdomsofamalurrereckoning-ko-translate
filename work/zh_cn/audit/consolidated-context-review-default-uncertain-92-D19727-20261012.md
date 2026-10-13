# Consolidated Context Review: 92 Default Keys (D-19727)

Scope: the 92 IDs remaining in `uncertain-100-D19727-20261012.jsonl` after
excluding eight keys already closed by D-19303. English anchors meaning;
Japanese informs voice/register; Chinese supports interpretation. The active
Korean cells and all three source-locale cells were matched by ID. The
official Korean manual and accepted terminology decisions were applied. No
PAK or PAK-derived material was used.

## Accepted Corrections

| ID | Correction | Evidence |
| ---: | --- | --- |
| 26422 | `교차점` -> `크로싱(Crossing)` | Later accepted Crossing decisions D-19661, D-19673, and D-19674 establish this as the named magical location. |
| 28556 | `맹세의 방패들` -> `서약방패병들` | Pledgeshield is the formal Warsworn rank established by D-18254; Japanese is a localized rank rendering, while English and Chinese identify the same group. |
| 28730 | `브레이코르` -> `브래코르` | The official Korean manual, printed page 2, names Vraekor `브래코르`. |
| 35253 | `시드헤` -> `시드(Sidhe)` | Reuse the source-keyed Sidhe form accepted at ID 47813 in D-19675; Japanese phonetics support the form. |
| 35265 | `여행자` -> `트래블러(Travelers)` | This standalone faction label names the Travelers; the official Korean manual establishes `트래블러`. |
| 35290 | `완벽한 미타란` -> `흠 없는 미타란` | Apply the established Flawless item modifier; Mitharan remains distinct from Mitharu. |
| 35379 | `세이블의 서신들을 찾았다` -> `세이블의 서신(Missives of Sable)을 찾았다` | Reuse the established named-book form at IDs 19173 and 21927; the English capitalized title identifies the same book. |
| 35480 | `워스워른` -> `워스원(Warsworn)` | The official Korean manual, printed page 7, establishes the Warsworn faction name. |
| 35652 | `오드윅과 이드릭, 그리고 우리 임무지마다 미타루의 특별한 제단이 하나씩 있어` -> `오드윅의 선교원과 이드릭의 선교원, 그리고 우리 선교원마다 미사루를 모시는 특별한 제단이 하나씩 있어` | English's possessive missions each contain a shrine; Japanese identifies monasteries and Chinese a preaching/mission station. `미사루` is the official-manual deity form. |
| 35717 | `하이페리안` -> `하이페리언`; `나로스의 송곳니` -> `나로스의 이빨` | Reuse accepted Hyperian spelling D-19584/D-19722 and Teeth of Naros form D-19714; Japanese and Chinese identify the same named region. |

## Not an Issue

The other 82 exact keys are `not an issue`:
15960, 15964, 15971, 26192-26193, 27985, 28554, 28568, 28726,
29037-29038, 29476, 29494, 29857-29858, 34335-34336, 34579-34581,
35252, 35264, 35266, 35276, 35279-35280, 35291, 35325-35326, 35330,
35333, 35335, 35337, 35362-35363, 35368-35370, 35377-35378, 35380,
35383, 35453, 35462-35463, 35470, 35472-35473, 35479, 35488-35489,
35493, 35497-35498, 35580-35581, 35604, 35608-35609, 35611,
35615-35616, 35618, 35625-35626, 35651, 35661-35662, 35667-35669,
35673-35675, 35689, 35692-35693, 35696-35697, 35714-35716.

These rows preserve English meaning and supported voice. Locale-only
differences, competing but plausible phonetic spellings, and uncertainty
about a label's internal/player-facing use do not establish a Korean defect.
The lower-case adjective `un-adept` at ID 35325 describes magical aptitude;
it does not use the formal `Adept` rank. The prior uncertainty at ID 26422
is closed using later accepted Crossing terminology. No item in this batch
remains uncertain.

## Integrity and Resume

- Pre-edit SHA-256: `189c79bdf0302e2ddb0a325276f9bdcd219158566a149069239a96bc6aaca725`.
- Byte-identical backup: `/private/tmp/ko-translate-backups/20261012/before-uncertain-92-D19727/locatexts_zh_cn.koalocatext_default.csv`.
- The apply script checked all 100 snapshot rows against English, Japanese, Chinese, and active Korean; the eight prior closures were excluded from this disposition.
- Post-edit SHA-256: `826ac181c9986a63a2d8d7cc20675413298e3a5f916b092818c0cd165953d42b`.
- BOM, mixed line endings, row order, all non-target record bytes, and inverse reconstruction passed.
- The last recorded operational tally before this batch was **3,419 accepted / 34,118 not an issue / 987 uncertain** (38,524). It remains a historical checkpoint; exact membership of these 92 rows in that tally is unverified, so no revised cumulative tally is asserted here.
- The corrected ledger reconstruction had 1,097 candidates before this batch and 1,005 after closing these 92 exact candidate keys. Comparing 1,005 with the conditional arithmetic `987 - 92 = 895` leaves the same unresolved 110-key discrepancy. Neither candidate count replaces the recorded operational tally.
- Default review remains incomplete. The separate Chinese-only affix review has 55 previously recorded closures.
