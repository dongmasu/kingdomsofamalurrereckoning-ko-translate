# Disposition Batch: `default` IDs 57801-57850

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 35 `not an issue` IDs, and 14 uncertain findings.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57811 | `저 사람이 내 예쁜 사랑이야. 그녀 없이는 어찌 살았을지 모르겠어.` | `저 사람이 내가 사랑하는 예쁜 사람이야. 그녀가 없었다면 어떻게 지냈을지 모르겠어.` | English and Chinese express an affectionate “pretty love,” and Japanese specifies an affectionate wife. Replace the awkward literal `내 예쁜 사랑` with natural Korean that preserves affection and the speaker's dependence without asserting a specific marital status. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17409 | 57803 | Valor Arena and Jakin are identifiable; canonical Korean spellings and the venue's established name remain provisional. |
| D-17410 | 57804 | Passing prayer beads to another believer and following Mitharu's creed are clear; canonical Korean religious terms need alignment. |
| D-17411 | 57813 | The mortal/Boderill contrast is preserved, but Boderill's canonical Korean spelling remains unsettled. |
| D-17412 | 57815 | The captors' euphemistic “fun” before experimentation is threatening; avoid specifying an act not stated in the source. |
| D-17413 | 57816 | Warren is the city's old quarry and search destination; its named-place status and Korean form need context. |
| D-17414 | 57819 | Capitalized `the Wall` may be a prison destination rather than a generic city wall; Korean `성벽` does not resolve the institution. |
| D-17415 | 57824 | Effect, Alchemy Workbench, and both quantities are preserved; Sativa Fibers/Ysa's Breath terminology and the official Physical-resistance term need alignment. |
| D-17416 | 57825 | The sea-crossing question and female caller's imagery are retained; Korean `속삭이는 지혜` interprets “knowing whisper” and the poem's speaker/order differs across locales. |
| D-17417 | 57829 | `Maid of Windemere` may be a formal title or named figure; Korean `시녀` remains provisional and links to the Maid question at 57724. |
| D-17418 | 57837 | English describes St. Odwig's bricks and walls; Japanese treats St. Odwig as the subject and Chinese identifies a preaching hall. The institution/site and fear metaphor need context. |
| D-17419 | 57841 | `Stripped stopes` is mining jargon; Japanese describes exposed workings and Chinese an open pit. Korean retains an exhausted-workings interpretation pending mechanics/context. |
| D-17420 | 57842 | English and Chinese support `fence` as selling stolen goods, which Korean preserves; Eren Calse's Korean spelling remains provisional. |
| D-17421 | 57845 | English “broken,” Japanese “weak,” and Chinese “depressed” describe the woman's voice differently. Korean retains the broken/distressed reading without asserting a cause. |
| D-17422 | 57849 | Korean follows English/Japanese's formal memo and request for more guards. Chinese diverges on Primos, the masonry division, sprites/Pteryx, and how many sprites can be stopped; retain the English-based draft and flag those organization/source-context questions. |

## Not an Issue

The 35 IDs are 57801-57802, 57805-57810, 57812, 57814, 57817-57818,
57820-57823, 57826-57828, 57830-57836, 57838-57840, 57843-57844,
57846-57848, and 57850. They preserve evident meaning and voice. This
includes the title-price variable, the quiet-movement advice, team-member
selection, the deliberate good-deeds/deaths paradox, the building/armory
balance, and the musical reading of “played” at 57850, which Japanese
confirms.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57801-57850 once
  and in identical ascending order; every full default file has 65,135
  records.
- Newline counts match throughout this range. ID 57824 has three embedded
  newline characters in all locales; both ingredient quantities are `2`.
- The exact `$NQD_City_Ysa.title_cost$` variable at 57805 is unchanged in
  all locales. No runtime-marker discrepancy was found.
- At 57849, English/Japanese/Korean agree on the formal request for more
  sewer guards and the occupied guard crews; Chinese differs materially.
  Korean follows English for meaning, with Japanese supporting the memo
  structure. The conflict is recorded as uncertain rather than imported
  from Chinese.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57751/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`).
  Only the `Texto` cell at 57811 changed. The active CSV retains its UTF-8
  BOM, 65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.
- Post-edit active default CSV SHA-256:
  `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.

D-17408 records the accepted correction; D-17409 through D-17422 record the
14 uncertain findings; D-17423 records the remaining 35 `not an issue` IDs.
Direct register totals: 1,703 accepted, 12,088 `not an issue`, and 10,835
uncertain (24,626 decisions total); next D-17424.

Resume at `default` ID 57851; 7,284 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
