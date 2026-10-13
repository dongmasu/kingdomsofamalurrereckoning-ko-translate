# Consolidated Context Review: `default` IDs 25851-25900

- Date: 2026-10-11.
- Scope: re-review seven prior uncertain findings against English, Japanese
  source and Japanese-derived draft, Chinese, active Korean, prior decisions,
  and recurring terminology.
- Result: resolve all seven findings (two accepted corrections and five
  `not an issue`). ID 25871 links to D-18277 and is not recounted.
- English is the semantic authority; Japanese informs voice/register and
  supplies supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19248-D-19254

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19248 | 25851-25852 | mixed | The failed-coup line preserves Grim Onwig's failed attempt and the urgency. At 25852, use the established formal rank `사반트` from D-18268 and the repeated canonical name `라이나 노른` from ID 17810; the current `레이나 니욘` conflicts with that same character's active Korean spelling. |
| D-19249 | 25856-25861 | mixed | `Basilica Noscere` is traceably transliterated from English; Japanese's Nocera reading does not establish a Korean error. The bindings/key/vault/Heart of Sibun sequence is retained. At 25860, `Savant` is the established formal rank, so correct `석학들` to `사반트들`. |
| D-19250 | 25872-25880 | not an issue | Tuatha, the gate question, Esha, Niahm Kent, the generic Strange Barrier, trials, and urgency remain identifiable; phonetic variation alone does not justify changing the Korean. |
| D-19251 | 25884-25887 | not an issue | Deireadh, the awakening Sorrows, Paragon Barghest heart, talisman objective, and the formerly tended Fae place are retained. Locale spelling and phrasing differences do not show a Korean meaning error. |
| D-19252 | 25890 | not an issue | The Searstalk found in the Sidhe is delivered to Arhaus Vorm and used to heal Luca Soren, who recovers quickly. Names are traceable to English; other locale interpretations do not establish a wrong Korean item identity. |
| D-19253 | 25895-25898 | not an issue | The island needs the player rather than Akara; Gravehal residents and villagers recognize this; the Warren, troll, memorial statue, Aled Powell, and Principle of Harmony remain. |
| D-19254 | 25899 | not an issue | “Cleaning out the passage” is supported as clearing the passage by the following “uncover” clause, Japanese's excavation wording, and Chinese's mining-tunnel clearing/digging. Korean `통로를 치우다` preserves the intended action without over-specifying the debris. |

ID 25871 was corrected to `앰비언트의 거울` by D-18277. Link that
accepted decision without recounting it. IDs 25853-25855, 25862-25870,
25881-25883, 25888-25889, 25891-25894, and 25900 retain their existing
`not an issue` decisions and are not recounted.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25852 | `석학 레이나 니욘` | `사반트 라이나 노른(Raina Njorn)` | Reuse formal Savant rank `사반트` established at D-18268 and the same character's active spelling at ID 17810, including the exact English name for traceability. |
| 25860 | `빙의된 석학들` | `빙의된 사반트들` | Preserve the possession meaning while using the established formal rank `사반트` for English `Savants`. |

## Verification

- English source, Japanese source, Japanese-derived draft, Chinese source,
  and active Korean each contain 65,135 unique ascending IDs. IDs
  25851-25900 occur once in identical order in every file.
- The five aligned files were read by ID. The preliminary batch's structural
  check also records matching embedded line-break counts and runtime-token
  signatures; ID 25867 retains both longbow values and its embedded break.
- Only active Korean `Texto` cells at IDs 25852 and 25860 changed. Reversing
  the two exact substitutions reproduces the pre-edit backup byte-for-byte.
  UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and 73 pre-existing
  bare-LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25851-25900-D19248/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `65a3e909862eeab29618c5283567adaf4b565f0405c79760276838f8cab643e3`.
- Post-edit SHA-256:
  `bd1f988e5997be7bc983ff9878cd52ba0e2ca19d42e5bbd432f5d93ab9202c91`.
- Totals: 2,187 accepted / 24,307 `not an issue` / 12,030 uncertain
  (38,524). Resume at D-19255, ID 25901.
- The D-19162-D-19238 detail gap and D-18422-D-18452 register gap remain
  explicit and unreconciled.
