# Sequential `default` Revalidation: IDs `57750`-`57999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 60 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 190 IDs in ascending order.
- Thirteen correction candidates are recorded on new ledger rows. Two
  additional findings at existing, previously unflagged IDs are documented
  separately without rewriting their append-only ledger rows. Five
  pre-existing candidate rows were rechecked. No new evidence-limited hold
  was identified.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `57753` | Meaning / terminology | English uses lowercase `crown`, and Japanese explicitly says `樹冠` (tree crown), while Korean says `왕관`. The parallel journal line `3540` has the same Japanese distinction; the capitalized `Crown` at `10815` is rendered `王冠` in Japanese. Recheck this line as a tree canopy/top, e.g. `카마잔두(Khamazandu)의 나무 꼭대기`, rather than a royal crown. | High |
| `57765` | Naturalness | `첫 번째 승리의 경기(Victory Games) 경기장` repeats the Korean word `경기` awkwardly. Preserve the named event and express that its first arena is nearly complete, e.g. `승리의 경기(Victory Games) 첫 경기장이 거의 완공됐어.` | High |
| `57767` | Name / format | `Cempestre Lyana` is rendered without an English pairing, and the established title `Desert Runner` is also unpaired. Add both source-matched forms, e.g. `셈페스트레 리아나(Cempestre Lyana)` and `사막의 질주자(Desert Runner)`, retaining `첫서약자(Firstsworn)`. | High |
| `57812` | Name / format | The named target `Muckbiter` is rendered `머크바이터` without its source form. Pair it as `머크바이터(Muckbiter)` in the objective. | Medium-high |
| `57910` | Name / format | `Archsage` is a named rank/title, but the Korean `대현자` has no English pairing. Consider `대현자(Archsage)` while preserving the sentence. | Medium-high |
| `57932` | Meaning | `She entered our camp with little fanfare` means she entered quietly or without a fuss. Korean `별다른 환대도 없이` instead says she was not welcomed; Japanese `ひっそりと` and Chinese `悄无声息` support `별다른 소란 없이 야영지에 들어왔어.` | High |
| `57933` | Name / format | The named Rathir district `the Quays` is rendered only as `부두`, although `부두(Quays)` is already used for this location elsewhere (e.g. `17623`). Add that source pairing; retain `번(The Burn)`. | Medium-high |
| `57940` | Name / format | `Cranalt` is a named location but appears only as `크래널트` here. Reuse the established `크래널트(Cranalt)` form (e.g. `57518`) without changing the rest of the objective. | High |
| `57954` | Naturalness / meaning | `기술이 일시적으로 3 증가합니다` leaves the unit implicit and reads awkwardly. Japanese specifies three levels and Chinese three points; use a clear, unit-neutral form such as `기술이 일시적으로 3만큼 증가합니다` unless the game's stat unit is independently confirmed. | High |
| `57955` | Objective format | `제작하라` shifts this short objective into a stiff imperative, unlike the project's usual concise `-기` objective form and Japanese `製作する`. Consider `순수한 파편 제작` or `순수한 파편을 제작하기`. | Medium-high |
| `57965` | Name / format | The source names bosun `Thorir` and his wife `Asa`; neither name is paired in Korean. Add source-matched pairings, e.g. `갑판장 토리르(Thorir)` and `아사(Asa)`, without changing the statement about their possible survival. | High |
| `57998` | Name / format | The named obstacle/location `Wall of Thorns` is rendered only as `가시덩굴 장벽`. Consider `가시덩굴 장벽(Wall of Thorns)` in the objective. | Medium-high |
| `57999` | Name / format | `Chaos Sword` is presented as the speaker's own invention, but Korean `혼돈의 검` lacks the name pairing. Consider `혼돈의 검(Chaos Sword)` at first mention. | Medium |

## Findings on Existing Ledger Rows

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `57816` | Name / format | `the Warren` is the named location consistently paired elsewhere as `워런(The Warren)`, but this row has only `워런`. Add the established pairing without nesting a second annotation, e.g. `워런(The Warren)의 폐허`. | High |
| `57867` | Naturalness | `땅구멍` is an awkward compound for `hole in the ground`; Japanese and Chinese both simply describe a damned hole. Prefer a natural curse such as `빌어먹을 구멍` without adding a more specific kind of hole. | High |

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `57762` | `그분들의 승인을 목격하는구나` remains an unnatural collocation for witnessing/confirming divine approval. The earlier direction `그분들의 인정을 직접 확인하는구나` remains supported. |
| `57783` | `Century Flower 1` remains inconsistently rendered as `세기꽃 1` against the established `백년꽃` label used for Century Flowers. The earlier terminology proposal remains supported. |
| `57845` | `목소리가 … 무너진 듯했어` remains unnatural for a voice sounding weak or broken. The earlier direction `목소리에 힘이 없어 보였어` remains supported. |
| `57901` | The existing name/format proposal remains supported: the row omits the English pairing for Serabel and Adarus and uses an inconsistent form for the Fae hollow. Prefer the established `아다루스 동굴(Adarus Hollow)` where that full place name is intended; retain the already paired `Paling Wand`. |
| `57991` | The existing material/name proposal remains supported. Reuse the accepted `장인의 동물성 지방(Master's Tallow)` and pair `허바르의 문턱(Hurvar's Doorsill)`; do not change the remaining sentence without source-based reason. |

## Repeated English and Structure

- Fifty-eight exact-English duplicate groups across the corpus touch this
  range, covering 1,273 rows. Korean wording matches within every group.
- Six rows contain embedded line breaks: `57824` (3), `57851` (3),
  `57855` (1), `57861` (15), `57932` (6), and `57973` (3). Each language
  contains 31 embedded breaks total, with matching per-ID counts.
- Runtime, display, and layout marker identities and order match across the
  range. Translated text inside display wrappers is not treated as a token
  difference.
- Of 250 IDs, 200 have indexed asset associations, represented by 207
  ID-to-asset links across 131 assets; 50 have none. Of the 190 newly
  recorded IDs, 140 are linked through 146 links across 81 assets, and 50
  are unlinked. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- All 60 pre-existing ledger rows remain unchanged; 190 new IDs were appended
  in ascending order. Thirteen new-row candidates were added to the ledger;
  the findings at existing IDs `57816` and `57867` remain report-only.
- The ledger covers 59,880 of 65,135 unique `default` IDs (91.93%), leaving
  5,255 unrecorded IDs. Sequential coverage reaches `57999`; next is
  `58000`-`58249`.
- The thirteen new-row candidates, two findings at existing rows, and five
  rechecked findings are proposals only. No translation CSV was changed.

## Verification

- Regenerated the quest-asset index and both catalogs; all three reproduce
  byte-for-byte with `build_dialogue_context_index.py --check`.
- The full review-ledger fingerprint/status check passes for all 59,880 IDs.
- All nine `test_build_dialogue_context_index.py` tests pass. The audit-only
  diff check is clean.
- A repository-wide `git diff --check` still reports trailing whitespace on
  pre-existing changed localization CSV lines. Those CSVs were outside this
  pass and were not modified.
