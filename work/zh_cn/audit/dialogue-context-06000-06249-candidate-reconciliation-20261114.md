# Candidate Reconciliation: IDs `6000`-`6249`

- Date: 2026-11-14.
- Rechecked all eight current `overall=candidate` IDs against English,
  Japanese, Chinese, active Korean, and linked review records.
- Four candidate findings were corrected; four were already resolved in the
  active Korean.
- The exact title `Argine, Queen of Staves` was checked across all 26
  occurrences and aligned as one identical Korean title.
- Asset membership was used only as grouping evidence; no individual speaker
  or playback order was inferred.

## Applied Corrections

- `6013`: Removed the redundant `투기장` from `투기장 구덩이`; the sentence
  now distinguishes the `pit` (`구덩이`) from the Arena (`투기장`). The five
  related arena references in this asset already use `투기장`.
- `6044` and 25 exact-English duplicates: Changed
  `지팡이 여왕 아르진(Argine, Queen of Staves)` to
  `아르진(Argine), 지팡이의 여왕(Queen of Staves)`. English, Japanese, and
  Chinese each use one identical string across all 26 IDs, so Korean now
  pairs the personal name and title consistently at every occurrence.
- `6239`: Replaced the literal, stiff `운명의 멋진 반전` with
  `기막힌 행운`, supported by Japanese `なんという幸運だ`. The rest of the
  line was rechecked and made natural while retaining the respectful
  reference to Lyria and the casual offer to the player.
- `6243`: Recast the parallel phrasing as `전쟁에는 공포가 따르지` and
  retained the contrast with glory and a place to test one's valor, matching
  the Japanese sense without changing the casual register.

## Retained

- `6103`: `유골함` already matches the reviewed Teeth of Naros urn
  terminology; the sentence's meaning is supported by the language sources.
- `6117`: `도박장(The Den)` already conveys the named Gambling Den naturally
  and is consistent with the corpus usage.
- `6144`: The active Korean already matches the proposed natural wording:
  `필요한 걸 찾지 못한 모양이군. 내가 도와줄 수 있을지도 모르지.`
- `6245`: The concise `넝마주이(Rag Pickers)` label is already natural and
  correctly paired.

## Verification

- All eight in-range candidates have explicit dispositions in the manifest.
- Korean `Texto` fields changed at the four candidate findings and the full
  26-ID title group, for 29 unique IDs; only those fingerprints were
  refreshed.
- The full 65,135-ID ledger passed fingerprint validation. Index and
  asset/ID catalogs reproduced exactly; all 11 CSV-preservation tests and
  all nine context-index tests passed.
- The active CSV retains its UTF-8 BOM, 65,135 ordered rows, and unchanged
  newline inventory: 71,838 CRLF, 244 LF-only, and zero bare CR.
- Sequential candidate reconciliation now covers 310 of 4,015 candidates
  (7.72%); 3,705 remain unreconciled.
- No commit was made.
