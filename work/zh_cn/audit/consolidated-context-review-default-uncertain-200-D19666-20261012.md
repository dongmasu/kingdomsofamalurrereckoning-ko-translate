# Grouped Default Uncertain Review: D-19666

**Correction:** The final wording for ID 36487 is `미타란
사람들은`, not `미사루 신도들은`; see
`consolidated-context-review-default-mitharan-corrigendum-D19670-D19671-20261012.md`.
The recorded D-19666 post-edit hash remains a valid historical
checkpoint, not the current active hash.

Reviewed the 200 distinct keys in
`uncertain-200-D11743-D12177-20261012.jsonl` against their exact
English, Japanese, Chinese and pre-edit Korean `Texto` cells. English
governs meaning, Japanese voice, Chinese is a cross-check. Consulted
the official Korean manual extraction (printed pp. 2, 4, 7, 13-14)
and earlier accepted faction, skill, deity and place-name decisions.
No PAK sources were used.

| IDs | Approved correction | Evidence |
| --- | --- | --- |
| 36487, 36838, 36993, 37035, 37257 | `미타루` -> `미사루` (including `미타루 사람들은` -> `미사루 신도들은`) | Official manual's Mitharu form; the Mitharan speaker at 37035 describes religious affiliation, not a separate species. |
| 36542 | `은신 탐지 기술` -> `숨겨진 물건 찾기 기술` | Official Detect Hidden skill name, reused at D-19664/33993. |
| 36609 | `슐리아 아르카나` -> `스콜리아 아르카나` | Established Scholia Arcana institution form. |
| 36648, 36767, 37417 | House of Ballads variants -> `발라드의 집` | Named faction, not an ordinary hall/family. |
| 36655, 36973, 37138 | `콜로세` -> `콜로사이족` in inflected clauses | Established Kollossae people, as in D-19665. |
| 36763, 37415 | `갤로스 엔드` / `교수대 끝` -> `갤로우즈 엔드` | The named Gallows End location; established in D-19665. |
| 36938, 37033, 37464 | Generic `여행자` -> `트래블러` | Capitalized faction Travelers; Japanese names the same faction. |
| 37217 | `우리 현자들을` -> `우리 사반트들을` | Named Savants held by the entity; established role term. |
| 37432 | `긍지의 수호자` -> `교만의 수호자` | Defender of Pride is a named House of Pride title; D-19664 uses `교만의 집`. |

**20 accepted**, **180 not an issue**, **0 retained in this batch**.
The other 180 match the English-led meaning or preserve source-supported
voice/ambiguity. For example, 36563 already correctly uses the approved
`Adept = 숙련자`; 36495's short English and disagreeing Japanese do not
justify overwriting the existing contextual reading. The two Basilica
Gnostra spellings (36500, 37253) are source-traceable and cannot be
normalized solely from disagreement between locales.

Pre-edit SHA-256:
`ae73f0a6c47cb64564f71fed8fb2d0efc9d2521db99d2d24f864c351f149c232`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19666/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`58e2eb44354d3511ca231390e690c21d2407e11e2dcd37a9c1c3eab59724332d`.
Applicator: `REVIEW_BATCH=D19666 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`.
Verified 200/200 four-locale cells, exact inverse byte reconstruction,
BOM, mixed endings, ordered IDs, and all other record bytes.

Totals: **3,058 accepted / 30,164 not an issue / 5,302 uncertain**
(38,524). The separate affix 55 were closed at D-19565.
Default review remains incomplete.
