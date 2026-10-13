# Consolidated Context Review: `default` IDs 24651-24700

- Date: 2026-10-11.
- Re-reviewed the prior uncertain findings against English meaning, Japanese
  voice/register and draft, Chinese supporting text, active Korean, earlier
  decisions, and repeated corpus terminology.
- Resolved all 14 prior uncertain keys in this interval: two accepted
  corrections and 12 `not an issue`. Also resolved linked prior hold 35478
  with an accepted terminology correction.

## Decisions D-18976-D-18988

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-18976 | 24651 | accepted | The Korean corpus overwhelmingly uses `벤트리니오` for Ventrinio; normalize this standalone key from the minority variant `벤티리니오`. |
| D-18977 | 24658 | not an issue | Freezing duration `+150%` and Ice Barrage damage `+50%` match all source values and the two distinct effects. |
| D-18978 | 24660 | accepted | The same corpus explicitly defines First Sword as an Alfar military title (ID 63777); use the established `퍼스트 소드` form. |
| D-18979 | 24668 | not an issue | The Widow is the recurring named spider-linked figure; `과부` is the established Korean rendering of this title. |
| D-18980 | 24671 | not an issue | The Maid, Troll Nix, Cairns, theft, and speaker's frustration remain; established terms are retained. |
| D-18981 | 24673 | not an issue | Winter Realm, declining Fae magic, mortal trespass, and the one-at-a-time threat are preserved without changing the speaker's hostile intent. |
| D-18982 | 24677 | not an issue | St. Hadwyn's refers to the recurring religious institution; `성 하드윈 선교원` is supported by its named Mission entries and Japanese monastery wording. |
| D-18983 | 24688 | not an issue | English and Chinese support Ethene's love; the hardship and futility are preserved. |
| D-18984 | 24690 | not an issue | “Of that order, I was the first” remains an appropriately broad first-in-the-order statement; the following burden and sorrow contrast is intact. |
| D-18985 | 24692-24693 | not an issue | Fateweaving livelihood, forecast yields, Bristletongue seeds, Gertern Asker, ale, Felltown, and Asker's Alley are retained with recurring forms. |
| D-18986 | 24695-24696 | not an issue | Idylla and Henge use established forms. `쓰러졌다` safely retains English “fell” without asserting death or deposition. |
| D-18987 | 24698 | not an issue | `{1}` is exact, and `소켓` is a noun label matching English and Japanese; no insertion action is added. |
| D-18988 | 35478 | accepted | Linked prior hold D-11484 is superseded: the repeated English key is the First Sword title, established elsewhere in the corpus. Use `퍼스트 소드 처치`. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24651 | `벤티리니오` | `벤트리니오` | Normalize to the prevailing Ventrinio form in the active corpus. |
| 24660 | `첫 번째 검 처치` | `퍼스트 소드 처치` | Match the established Alfar title First Sword. |
| 35478 | `첫 번째 검 처치` | `퍼스트 소드 처치` | Apply the same resolved title to the linked duplicate quest key. |

## Verification

- All 14 prior uncertain keys in IDs 24651-24700 were reclassified. Linked
  ID 35478 resolves the earlier D-11484 hold and is counted once here.
- Only active Korean `Texto` at IDs 24651, 24660, and 35478 changed. No
  source or other active CSV was edited. Runtime token `{1}` and values at
  ID 24658 remain unchanged.
- UTF-8 BOM, 65,135 IDs, row order, 72,011 CRLF endings, and 73
  pre-existing bare LF endings are unchanged.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-24651-24700-D18976/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `ff06e9b14b35691d640b1c643b83d4b6bdbd21cb0efd6f634e1c43bb3bb05eeb`.
- Post-edit SHA-256:
  `366fd41062ab0daaf41329b3f32fe1ea2ed4698ea8767f762043f74dcf8e0bd6`.
- Totals: 2,130 accepted / 23,829 `not an issue` / 12,565 uncertain
  (38,524 counted keys). Resume at D-18989, ID 24701. Sequential IDs
  24701-65134 remain (40,434), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
