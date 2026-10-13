# Consolidated Context Review: `default` IDs 25101-25150

- Date: 2026-10-11.
- Re-reviewed all 24 keys previously left uncertain against English meaning,
  Japanese voice/register and draft, Chinese supporting evidence, active
  Korean, recurring corpus forms, and earlier decisions.
- Resolved all 24: one accepted correction and 23 `not an issue`.
- ID 25146 and the separate cross-range correction at ID 10863 were already
  accepted and are linked without recounting.

## Decisions D-19074-D-19087

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19074 | 25102, 25108 | not an issue | Reddle is rendered in the recurring form `레들`, and Blackshriek matches the active form `블랙슈리크` used in its creature context. Their referent classes are not needed to understand these standalone labels. |
| D-19075 | 25106 | not an issue | `아넬라 세르그렌` matches recurring corpus uses for Anela Cergren; locale transliteration differences do not establish a spelling error. |
| D-19076 | 25110-25111 | not an issue | The plea to destroy the beast and resume life is preserved. `손상된 일기` is compatible with “Ruined Diary” and the Japanese damaged-diary reading; Chinese's stronger “destroyed” reading does not require changing it. |
| D-19077 | 25115 | not an issue | `{1}`, `{2}`, `{3}` remain in order. The Japanese duration construction and surrounding placeholder syntax support Korean `({3}초 동안)` without inventing the missing stat/effect context. |
| D-19078 | 25118-25120 | mixed | At 25118, normalize the named Boots of Last Breath to `라스트 브레스의 장화`, matching the same item in the objective at ID 33138. The Executioner, map-marked secret location, Ferrin Shaw, explorer's estate greeting, Nerotelos, and part-six label remain at 25118-25120. |
| D-19079 | 25126-25127 | not an issue | The Font is discussed as a named source/place and Korean `샘(Font)` matches established usage. The selected Rathir residents' service notice, hard work, and “look the part” condition remain. |
| D-19080 | 25130-25131 | not an issue | The Whitestone joke and the Castellan of Helmgard's role as a respected superior are preserved; no locale evidence establishes a necessary narrower title. |
| D-19081 | 25132 | not an issue | The invitation to Gastyr and the bolgan/one-eyed-friends image remain. Korean preserves the ambiguity of “as red as they come” rather than choosing an unsupported cause. |
| D-19082 | 25134-25135 | not an issue | Wencen's loss, the question about the Telling, Zefwyn's shipwreck investigation, and the wait for his report remain in sequence. Existing name/tradition variants do not prove a row-local defect. |
| D-19083 | 25139-25140 | not an issue | The family Staff and Talisman, concealment, theft, war consequence, Dolve Arne, and cousin address remain. “The rest of Dolve Arne” is ambiguous across locales; Korean's estate/property reading is plausible and should not be replaced by a guess. |
| D-19084 | 25141 | not an issue | The Summer Fae Lorestone at Castle Yolvan, conditional search for more, Webwood-control clue, and possible Canneroc rescue remain. |
| D-19085 | 25142 | not an issue | Korean transliterates the malformed source title without pretending to repair it. Other locales do not establish the intended spelling “Three Quater Theams.” |
| D-19086 | 25143 | not an issue | Detect Hidden, the Alchemy Workbench, all four reagent names and quantities, and the blank-line recipe layout are preserved. |
| D-19087 | 25147-25149 | not an issue | Scholia Arcana grounds, the crumbling Chaos Magic text, the book-inspection objective, and Chaos Thrall XII remain. Locale differences do not establish a local meaning error or justify changing XII. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 25118 | `전설적인 자경단원 처형인이 입었던 복장의 마지막 남은 조각인 최후의 숨결 장화를 찾아 회수해야 한다. 페린 쇼가 지도에 표시해 둔 비밀 장소에 있을 것이다.` | `전설적인 자경단원 처형인이 입었던 복장의 마지막 남은 조각인 라스트 브레스의 장화를 찾아 회수해야 한다. 페린 쇼가 지도에 표시해 둔 비밀 장소에 있을 것이다.` | Match the exact recurring item-name translation at ID 33138 while preserving the source's final surviving costume-piece and map-location details. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 25101-25150 exactly once and in identical order;
  all five contain 65,135 data rows.
- ID/variant keys and normalized embedded line-break counts match across
  all five files. Runtime-marker identities, counts, and order match between
  English and active Korean; `{1}`, `{2}`, and `{3}` at ID 25115 remain exact.
- A byte-level comparison against the pre-edit backup proves only the
  approved `Texto` cell at ID 25118 differs. The UTF-8 BOM, row order,
  72,011 CRLF endings, and 73 existing bare LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25101-25150-D19074/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `7586a097493b833b0ecfcd5af7b80f416920b6ffa5b5a74aa0c3bfd3aed7d786`.
- Post-edit SHA-256:
  `02e6c93bcbd329c59b3f476d7a7fb563f2e5dcf43712c69be0f7d40ed5aacea9`.
- Totals: 2,146 accepted / 23,963 `not an issue` / 12,415 uncertain
  (38,524 counted keys). Resume D-19088 at ID 25151. Sequential IDs
  25151-65134 remain (39,984), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
