# Dialogue Context Translation Edit Batch: IDs `20000`-`20249`

- Date: 2026-11-14.
- Rechecked every candidate against the current English, Japanese, Chinese,
  and Korean rows. No speaker or playback order was inferred.
- Applied 17 candidate corrections in or linked to this range. `20052`,
  `20097`, and `20233` already had the required English pairing and were
  retained.
- The title `Blood Doge` was aligned across `20141`, `20258`, and `47675`
  with the established `피의 총독(Blood Doge)` form at `54182`.
- Reviewed all 18 English occurrences of the named location `Freehold`.
  Japanese and Chinese consistently identify it as a proper location name;
  all Korean references now use `프리홀드(Freehold)`. Nine related IDs
  outside this range were updated: `1103`, `9997`, `24055`, `25148`,
  `28620`, `29810`, `30178`, `47741`, and `62895`.
- Existing ledger dispositions were retained. Fingerprints were refreshed
  only for the 26 edited IDs.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `20022` | Paired the named item `Gem of Eternal Ice`. |
| `20041` | Paired `Schneggar's Cave`. |
| `20059` | Smoothed the journal voice and made the possible confession an intended attempt, not a certainty. |
| `20094` | Standardized `결혼반지` and paired Hanrik's name. |
| `20095` | Paired the complete location as `트래블러 태양 야영지(Travelers Sun Camp)`. |
| `20141`, `20258`, `47675` | Standardized the title as `피의 총독(Blood Doge)`. |
| `20145` | Changed the action objective to `국경 통행증 획득하기`. |
| `20178` | Paired the named `Testament` group. |
| `20188` | Paired `Culminite`. |
| `20204` | Recast the lovers' song and rhetorical question in more natural Korean; retained the single-line layout. |
| `20205` | Separated the reward from the request for help forgetting the past. |
| `20206` | Recast the life-stress sentence without changing its event or register. |
| `20219` | Moved `Shield Bash` inside the existing localized display wrapper and preserved its line break. |
| `20244` | Replaced the inconsistent generic rendering of `Freehold` with its established proper-name form. |
| `20248` | Paired the complete item name `Vennt's Stealth Potion`. |
| `1103`, `9997`, `24055`, `25148`, `28620`, `29810`, `30178`, `47741`, `62895` | Aligned related `Freehold` occurrences; surrounding wording and particles were preserved. |

## Retained Or Held

- `20052`, `20097`, and `20233` already had their complete source names
  paired in Korean.
- The evidence-limited holds at `20011`, `20045`, `20053`, `20127`, and
  `20174` remain unresolved. No entity type, text type, or speaker was
  inferred for them.

## Verification

The exact post-batch snapshot was reconstructed in memory after the subsequent
`20250`-`20499` edits by reversing only those later text-field edits and their
fingerprints. No repository files were changed during reconstruction.

- Post-`20000`-`20249` CSV SHA-256:
  `702988cc0fac65134a8f856c26f0375a6bf16117a637a490c7f51bd10182f6d9`.
- Post-`20000`-`20249` ledger SHA-256:
  `45cb02d71001211811d3bb3ef42996c9820f70ad8fe30ec777555031997133bf`.
- Cumulative structure, ledger, test, and diff-check results after the next
  range are recorded in
  `dialogue-context-edit-batch-20261114-20250-20499.md`.
