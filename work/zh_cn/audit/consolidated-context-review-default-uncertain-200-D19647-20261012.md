# Consolidated Context Review: 200 Default Keys, D-19647

Scope: the 200 exact English/Japanese/Chinese/Korean source-keyed entries
in `uncertain-200-D2664-D3004-20261012.jsonl`. All four cells of each
key were matched against the active CSVs before editing. English
controls meaning, Japanese informs voice, and Chinese supports term
disambiguation. The official Korean manual is already extracted at
`official-korean-manual-extracted.md`; source PDF page 7 confirms
`하우스 오브 발라드`, `스콜리아 아르카나`, `워스원`, and
`트래블러`. No PAK data was used.

Two snapshot entries were already resolved by earlier decisions, so
they are linked without recount: **9530**, accepted under D-18206
(`스콜리아 아르카나`), and **9537**, `not an issue` under D-18236
(`미든`). Of the other 198 keys, **23 accepted** and **175 not an
issue**. No newly deferred key.

## Accepted, Grouped by Context

| IDs | Evidence and correction |
| --- | --- |
| 9497, 9847 | Explicit `Scholia Arcana` is official `스콜리아 아르카나` (manual p. 7), not `아르카나 대학`. Context retains the mage affiliation. |
| 9499, 10474 | Explicit `House of Ballads` is manual p. 7 `하우스 오브 발라드`, without changing armor-looting or the quest destination; at 10474 also align the already established `윈더미어` name. |
| 9577 | Capitalized Scholia rank `Savants`, not generic scholars. D-18268 and the Japanese first-rank-mage term establish `사반트들`. |
| 9591 | Faction `Warsworn` is official `워스원` (manual p. 7); keep the speaker's insulting `돼지들`, corroborated by Chinese. |
| 9611, 9625 | Reuse established `전승` for Fae `telling` / `the Telling` (D-19645), with Japanese `伝承` and Chinese `天谕`; preserve the separately named Cycle and songs. |
| 9670, 9705 | `Praetorians` denotes the Gnomish military group, and `Decanus` is a ten-man commander (English/Japanese/Chinese and ID 8433); align `프라이토리안` to `프레토리안` and make the rank explicit at 9670. |
| 9738, 10341 | Familiar lowercase `dove` is `친구` as established in earlier contexts (IDs 4084 and 9385); remove unsupported romantic `자기` / `자기야`. |
| 9851, 10095, 10197 | `Hollowlands` names the region `홀로우랜드` as already used at ID 9382 and approved ID 9432. The latter two rows have identical English and Korean source keys and both require the same correction. |
| 9927 | `the Marches` names the frontier, previously resolved `변경지` at ID 8582; avoid falsely literal `행진지`. |
| 10201, 10245 | Exact named `Circle of Engard` corresponds to existing ID 8563 `엥가드 교단`; align name in title and objective. |
| 10225 | `Beckoned` is previously approved `부름받은 자` and `Kollossae` is `콜로사이`; preserve the gratitude and speaker's address. |
| 10283 | Reuse established `위대한 순환` for `Great Cycle`, leaving the second question general rather than interpreting it as literal resurrection. |
| 10298 | Standalone faction `Travelers` is official `트래블러(Travelers)` (manual p. 7), not a generic plural. |
| 10331 | Align the named `Kollossae` people with established `콜로사이`; retain the contested view and offer to debate. |
| 10385 | Consistent place-label spelling `교수대의 끝(Gallows End)` as used at earlier named Gallows End mentions; the English parenthetical preserves searchability. |

Exact pre/post fragments for the 23 rows are in
`apply-uncertain-200-D19647.rb`. The other 175 new keys are `not an
issue`: the 200-row snapshot minus the two linked IDs and the 23
accepted IDs. This includes formal `Docent` as `강사` (9559 and 9843,
approved rank at D-18475/D-18557), `Tender` as guardian and `Delver`
as `탐굴자` in 9916 (no contrary official Korean title), the literal
mechanism at 10404, and the extended poems/narratives whose English
meanings remain represented. No speculative item class or unestablished
proper-name normalization was applied.

## Integrity and Resume

- Pre-edit default SHA-256:
  `9a683428ba7c91cec308df8287acdf4669b1c05db7a8f4de023982a6ba93d989`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19647/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `8523f66ab00f9bbedabdb166238e2be0daf93881a22f2c693e5cd2ae1f466dac`.
- Inverse byte reconstruction, UTF-8 BOM, row order, 72,011 CRLF /
  73 bare-LF endings, unapproved bytes, and parsed non-`Texto` cells
  verified unchanged.
- New default totals: **2,700 accepted / 26,732 not an issue /
  9,092 uncertain** (38,524). Separate Chinese-only provisional
  `affix` holds remain **55**. Review incomplete.
- Next **D-3005 / default ID 10475**. Prepared 200-key source snapshot:
  `uncertain-200-D3005-D3424-20261012.jsonl`. The extractor uses
  source-keyed physical records and a guarded fallback for pre-existing
  malformed unquoted multiline CSV; the active CSV was not normalized.
