# Consolidated Context Review: 200 Default Keys, D-19649

Scope: the 200 English/Japanese/Chinese/Korean source-keyed entries in
`uncertain-200-D3426-D3746-20261012.jsonl`. English anchors meaning;
Japanese is the voice/register check, Chinese is supplementary. Reuse
the page-indexed `official-korean-manual-extracted.md`, verifying
applicable terms in the original PDF when text extraction is unclear.
Relevant official manual references: PDF p. 2 (`에테네`), p. 7
(`스콜리아 아르카나`, `트래블러`, `워스원`). PAK files not used.

Four findings had already been settled, linked here without recount:
11873 (`Court of Enchantments`, D-18235), 12199 (Scholia Arcana,
D-18207), 12593 (Argine / Queen of Staves, D-19462), and 12628
(Blood Plague, D-18240). Of the 196 new keys, **19 accepted** and
**177 not an issue**. No new hold.

## Accepted, Grouped by Term

| IDs | Evidence and correction |
| --- | --- |
| 11683 | Formal Warsworn `Oathblade` rank is established `맹세의 칼날`, not generic `검` (D-18254 and ID 11421). |
| 11881, 12277, 12449 | `Scion` is the named role `사이온`, not generic heir (`계승자`), per D-19496 and ID 8415; Japanese/Chinese phonetic forms corroborate. |
| 11932, 12491 | `Mitharan` is the established adjective `미타란`, not `미사란`; explicit `Prismere` in 12491 matches `프리즈미어`. Keep the item classes unchanged. |
| 11958 | English `Sworn to War?` and Japanese's Warsworn membership prompt refer to the official-manual `워스원`, not an unrelated `War Sworn` faction. Ask `워스원에 서약했나?`. |
| 12109 | Named ritual `Perform the Giving` already renders `봉헌 의식` at ID 10533; align the identical objective key. |
| 12133 | Named `Gallows End` is `교수대의 끝(Gallows End)` as at IDs 10491 and 11110, not a nonexistent hangman's end. |
| 12141 | Proper name `Ealfwig` is already `엘프윅` at ID 9586; retain Grilricas, Didenhil, and Saint Eadric's objectives. |
| 12165 | Official manual PDF p. 2 names goddess Ethene `에테네`; correct `에세네` without changing the avatar claim. |
| 12470, 12695 | Official manual PDF p. 7 identifies the named `Travelers` faction as `트래블러`; remove generic `여행자들`, preserve the plural/camp context. |
| 12523 | Reuse source-established `비사라네(Bisarane)`, without altering the kill target Saturnyn. |
| 12660 | Replace generic `아르카나 학회` with manual p. 7's `스콜리아 아르카나` for explicit `Scholia Arcana`; the store job request is unchanged. |
| 12670 | `the Marches` is the established frontier `변경지` (IDs 8582 and 9927), not a marching ground. |
| 12708 | English `How quaint` is wry/condescending; Korean `세련된 수법` reverses its appraisal and inserts an unsupported method. Render `별나군.` without affecting the following self-aggrandizement. |
| 12799 | Full English label `Flawless Mitharan Ravenous Fulcrum`: corresponding English base ID 1520 and Korean base `흠 없는 탐욕 지렛목`, plus D-19551's Mitharan/Fulcrum precedent, establish `흠 없는 미타란 탐욕 지렛목`. This is an item-component comparison from `src/csv/` and `work/zh_cn/`, not PAK. |
| 12812 | Named Kollossae people are established `콜로사이`; preserve the stone-statue misidentification and corpse narrative. |

Exact pre/post fragments are in `apply-uncertain-200-D19649.rb`.
The other 177 new snapshot keys are `not an issue` (all 200 minus
the four previously closed and 19 accepted IDs). This includes
ID 12192 (`Stay dry` interpreted as a drinking joke by the Japanese
and existing Korean), ID 12257 (Widow exclamation has no stable
non-speculative alternative), and ID 12306 (the intentionally
contradictory `lack the sympathy to kill` is present in English and
the other locales). Do not reopen these without new material evidence.

## Integrity

- Pre-edit default SHA-256:
  `4c56d6a9dea5eda83d681be5453b7fc16a91fe2ee7fcaad2ffbc663c7a10e82f`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19649/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `fe30c288604fd936f30714a772ed04b8687a33f4ce0d49b1dac7a62e6b56c944`.
- Exact inverse reconstruction, BOM, 72,011 CRLF / 73 bare-LF
  endings, row order, all other bytes, and parsed non-`Texto` cells
  verified for all 19 modified rows.
- Totals: **2,739 accepted / 27,086 not an issue /
  8,699 uncertain** (38,524). Chinese-only provisional affix
  holds: **55**. Overall review incomplete.
- Next **D-3747 / default ID 12844**; prepared
  `uncertain-200-D3747-D4122-20261012.jsonl` (200 keys).
