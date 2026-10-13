# Consolidated Context Review: `default` IDs 26051-26100

- Date: 2026-10-11.
- Scope: re-review four prior uncertain findings against English, Japanese
  source and Japanese-derived draft, Chinese, active Korean, prior decisions,
  and recurring terminology.
- Result: resolve three findings (two accepted corrections and one
  `not an issue`); retain a specific ambiguity at ID 26076.
- English is the semantic authority; Japanese informs voice/register and
  supplies supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19270-D-19273

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19270 | 26068-26075 | accepted | Correct 26070's unsupported one-bottle-per-crew distribution. English says there are five crews and five bottles held collectively; Chinese also says five bottles are in their hands. Korean now reports the five bottles without assigning one to each crew. Hillared the Blade, Venomspitter, the Fae of Sorrows, Cradle of Summer, the trial, and the Offering remain traceable. |
| D-19271 | 26076 | uncertain | The six-paragraph tale's broad chronology is preserved, but malformed English “when he needed to jest at her behalf” does not establish whether the father jokes for the daughter or at her expense. Korean chooses the benevolent `자신을 위해 농담`; Japanese and Chinese interpret the surrounding behavior differently, so no replacement is sufficiently supported. |
| D-19272 | 26078-26086 | accepted | Correct the known Warsworn form at 26082 to the accepted `워스원(Warsworn)` (D-2857). The Sentinel, Shard, Bhaile/Tirnoch account, source-typo item name, and Tier 6 label remain intelligible and aligned to English. |
| D-19273 | 26095 | not an issue | The key opens the Hierophant's Court wing, identified by the speaker as her sanctum and the place she will meet Grim. Korean preserves that relation; Japanese and Chinese support the palace/court wing and sanctum reading. |

ID 26093's accepted `warden` correction is already recorded at D-8521 and
is not recounted.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26070 | `쓸모없는 탈영병 무리가 다섯 팀이나 있어. 그리고 값으로 매길 수 없는 보그스토언치 다섯 병을 각각 들고 있지. 내게 필요한 건 보그스토언치야.` | `쓸모없는 탈영병 무리가 다섯 팀이나 있어. 그놈들 손에 값으로 매길 수 없는 보그스토언치 다섯 병이 있지. 내게 필요한 건 보그스토언치야.` | Remove the unsupported claim that each crew carries one bottle; retain five crews and five bottles. |
| 26082 | `워스워른! 만나서 반갑군!` | `워스원(Warsworn)! 만나서 반갑군!` | Reuse the accepted Warsworn form D-2857 and retain the exact source label. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain 65,135 unique ascending IDs. IDs
  26051-26100 occur once in identical order in every file.
- Embedded line-break counts and extracted runtime-token signatures match
  across all five files in this range. ID 26076's paragraph breaks and the
  numbers/effects are unchanged.
- Only active Korean `Texto` cells at IDs 26070 and 26082 changed. Reversing
  the two exact substitutions reproduces the pre-edit backup byte-for-byte.
  UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26051-26100-D19270/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
- Post-edit SHA-256:
  `a3eb5aa5d3277db9f9e8389e87f2eecc1db4f6369f14ec9d7305d7fe683a9375`.
- Totals: 2,189 accepted / 24,322 `not an issue` / 12,013 uncertain
  (38,524). Resume at D-19274, ID 26101.
- The D-19162-D-19238 detail gap and D-18422-D-18452 register gap remain
  explicit and unreconciled.
