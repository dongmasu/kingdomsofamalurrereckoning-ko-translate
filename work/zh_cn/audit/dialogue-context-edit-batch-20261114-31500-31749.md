# Dialogue Context Translation Edit Batch: IDs `31500`-`31749`

- Date: 2026-11-14.
- Rechecked the range's findings against the current English, Japanese,
  Chinese, and Korean text. English anchored meaning; Japanese guided voice
  and layout; Chinese was supporting evidence.
- Applied eight newly identified in-range corrections and the existing
  correction at `31521`. One linked correction at `35655` aligned its shared
  sentence with `25157` and `31547`, for ten changed IDs total.
- Retained supported wording already present at `31547`, `31721`, `31733`,
  and `31749`. The source-evidence holds at `31568`, `31667`, and `31571`
  remain unresolved; no speaker or playback order was inferred.

## In-Range Corrections

| ID | Correction |
| ---: | --- |
| `31502` | Added the complete `Lady Ahnrun` pairing without conflating her with the separate `Lady of Gravehal` title. |
| `31510` | Paired memoir author `Ganelun Hegem`; retained the description. |
| `31519` | Replaced the potentially occupational `선생님` with respectful `번즈 님(Master Byrnes)`, consistent with Japanese `バーンズさん`. |
| `31521` | Identified the referenced book as `세이블의 서신(Missives of Sable)` rather than generic plural “secret letters.” |
| `31608` | Smoothed the full line into one conversational register, preserving its restrained teasing and Beckoned reference. |
| `31657` | Paired `에피 크루익섕크(Effie Cruikshank)` and aligned the spelling with the confirmed occurrences at `26541` and `31279`. |
| `31665` | Added the source pairing for the hired `맹세의 칼날(Oathblade)` protectors. |
| `31685` | Paired `사반트들(Savants)` while preserving the distinction from senior members of the Scholia. |
| `31695` | Added `가란트(Garant)` without changing the casual aside. |

`31749` already had the supported conversational wording `좋아, 한잔할까?`.
The earlier candidates at `31547`, `31721`, and `31733` were also already
consistent with the approved shared-sentence, alchemical-formula, and Vorm
family wording.

## Related Consistency Correction

| ID | Correction |
| ---: | --- |
| `35655` | Aligned the shared sentence with `25157` and `31547` as `나도 이 점은 믿어. 하지만 폭력을 쓰진 않겠어.` and standardized the location consequence to `군사 기지`; retained its distinct continuation. |

The linked `Missives of Sable`, `Master Byrnes`, and `Effie Cruikshank`
references at `50398`, `55678`, `63864`, `27908`, `26541`, and `31279`
already matched their supported forms and were not rewritten.

## Verification

- Refreshed only the ten changed IDs' `source_fingerprint` values. The full
  65,135-ID ledger validates.
- The active `default` CSV retains its UTF-8 BOM, 65,135 ordered records,
  71,842 CRLF record endings, and 244 LF-only record endings.
- The index and both catalogs reproduce; all 20 CSV-preservation and
  context-index tests pass; the CRLF-aware diff check is clean.
- Source CSVs, extracted assets, and game binaries were not changed. No
  commit was made.

The next sequential candidate range is `31750`-`31999`; application remains
ongoing.
