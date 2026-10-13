# Consolidated Context Review: 200 Default Keys, D-19648

Scope: `uncertain-200-D3005-D3424-20261012.jsonl`, 200 distinct
four-locale source keys. Reused the searchable page-indexed official
manual `official-korean-manual-extracted.md` (source PDF p. 7 for
faction names); checked English meaning, Japanese voice and Chinese
corroboration against each Korean cell. No PAK material used.

Earlier closed keys, linked without recount: 10597 (Even -> `짝수`,
D-19470), 10729 (Maire as Queen of Cups, D-19444), and 11305
(Blood Plague, D-18240). Of the remaining 197 keys, **20 accepted**
and **177 not an issue**. No new hold.

## Accepted Corrections

| IDs | Source/context and change |
| --- | --- |
| 10491, 11110 | The same named island `Gallows End` is `교수대의 끝(Gallows End)` per the prior name usage, not unrelated `교수대 끝`/`갈로스 엔드`. Both claims to return/reclaim stay intact. |
| 10547 | `Circle of Engard` -> existing `엥가드 교단` (IDs 8563, 10201, 10245); retain the replacement-keeper narrative. |
| 10578 | The named `Orison` is `오리슨` as at ID 10002; keep the first task and amphora instructions. |
| 10595, 11033 | Distinguish `the Sorrows` force from the faction `House of Sorrows`. Japanese/Chinese describe the force, and ID 11033's English makes it Saturnyn's target; remove the unsupported `집 사람들`. |
| 10699 | The arena team `Crows` is explicitly named `크로우즈` elsewhere (IDs 266, 296, 2403), not literal birds. Retain the prize invitation. |
| 11140, 11577, 11658 | Named `Travelers` is official manual p. 7 `트래블러`; correct `트래블러스` without changing the leader, founders, or Amman story. |
| 11147 | Place `Hollowlands` -> `홀로우랜드(Hollowlands)`, aligning earlier approved ID 9432 and the two duplicate keys 10095/10197. |
| 11204, 11624 | `House of Ballads` -> official manual p. 7 `하우스 오브 발라드`; keep the Maid of Windemere's deeds and the House's lore. |
| 11302 | Singular capitalized faction member `Traveler` -> `트래블러(Traveler)` rather than a generic traveler. |
| 11350, 11355 | Match recurring names `비사라네(Bisarane)` and `미타란(Mitharan)` without altering Fae rescue or item attributes. |
| 11407 | `The Eldest`, named Fae role elsewhere at ID 9374, -> `엘더스트(The Eldest)` instead of generic oldest child. |
| 11421 | Official Warsworn rank `Oathblade` -> previously approved `맹세의 칼날`; Kirby and coin remain. |
| 11502 | Explicit `Beckoned` -> established `부름받은 자` (D-19627); maintain the oracle's imperative register. |
| 11646 | Standalone `Delvers` names the Sorrows role previously rendered `탐굴자들` (IDs 9030, 9365); `탐험가` implies generic explorers and loses the faction role. |
| 11658 | `Amman the Clever` -> `영리한 아만` to align with the same named creator at ID 9480; avoid changing Clever to unrelated scholar. |

Exact fragments are in `apply-uncertain-200-D19648.rb`.
The 177 other newly reviewed keys are `not an issue`: exactly the
200 snapshot IDs minus the three earlier closures and 20 accepted
IDs. This includes `Scorned to War` at ID 11362 (Japanese explicitly
reads a reluctant fighter), `dove` in 10539 (`그대여` does not imply
romance or gender), and the Sorrows/Delver descriptions whose existing
phrasing is compatible with the English source. Ordinary `House` and
`Sorrows` were not mechanically renamed.

## Integrity and Resume

- Pre-edit default SHA-256:
  `8523f66ab00f9bbedabdb166238e2be0daf93881a22f2c693e5cd2ae1f466dac`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19648/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `4c56d6a9dea5eda83d681be5453b7fc16a91fe2ee7fcaad2ffbc663c7a10e82f`.
- Exact inverse reconstruction; UTF-8 BOM; row order; all 72,011
  CRLF and 73 bare-LF endings; all other bytes verified. All
  20 changed records also parsed: their pre-edit Korean `Texto` equals
  the snapshot and their other cells are unchanged.
- Totals: **2,720 accepted / 26,909 not an issue /
  8,895 uncertain** (38,524). Separate Chinese-only provisional
  `affix` holds **55**. Overall review incomplete.
- Next **D-3426 / default ID 11680**; prepared snapshot
  `uncertain-200-D3426-D3746-20261012.jsonl`.
