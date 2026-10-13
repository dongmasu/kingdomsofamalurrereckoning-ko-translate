# Consolidated Context Review: `default` IDs 24951-25000

- Date: 2026-10-11.
- Re-reviewed the 16 prior uncertain keys against English meaning, Japanese
  voice/register and draft, Chinese supporting evidence, active Korean,
  recurring corpus uses, and earlier decisions.
- Resolved all 16 keys: five accepted corrections and eleven `not an issue`.

## Decisions D-19042-D-19053

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19042 | 24951-24952 | accepted | ID 24951 correctly keeps `House of Sorrows` as `비탄의 집`; normalize Bisarane to the prevailing `비사라네`. At 24952, normalize Anira to the form accepted at ID 24950 and render the explicitly capitalized craft group `Master Makers` with the established `명장들`. Coerced work and Gadflow's bidding remain. |
| D-19043 | 24955 | not an issue | `라시르` is already the prevailing exact-label spelling for Rathir in the active corpus; no cell edit is needed. |
| D-19044 | 24956 | not an issue | Flawlessness, Mitharan origin, and sustaining bindings are represented. Japanese transliterates the item name and Chinese gives a literal bindings rendering; neither establishes a different Korean equipment class. |
| D-19045 | 24958 | not an issue | The offer of blessing and prayer is preserved. Chinese explicitly supports prayer, and the standalone `Orison` at ID 9151 is rendered as `기도문`; Japanese transliteration alone does not establish a separate rite name. |
| D-19046 | 24959 | accepted | Use the established `모투스 광업 회사` and `아포타이어` forms. Correct the claim to say the region holds a new rare ore deposit rather than that ore merely “will be discovered.” The five samples and reward remain. |
| D-19047 | 24964, 24967, 24969 | not an issue | Skye Sinclair is identified by the full source spelling; `Old Maslow` is supported as an older Maslow by Chinese; and the return-to-Mayor-Eswin objective preserves both role and name. |
| D-19048 | 24970 | accepted | Standardize Bonnlach to the recurring `본라크` form. The artifact-recovery location, Ariel Perien, Deod Dungaras, murghan capture, and both rescue/retrieval objectives remain. Locale transliteration differences do not establish other Korean name errors. |
| D-19049 | 24980 | not an issue | All locales present the same terse event synopsis. Korean retains Alyn Shir, the player's discovery of Gadflow's body, and the reveal of Tirnoch's power; whether the row is internal metadata is not a translation defect. |
| D-19050 | 24988 | accepted | Replace “disappeared” with “was taken” to preserve the English passive and the Japanese/Chinese evidence that the birth candle was removed from its holder. The ritual term remains a literal, appropriately unresolved `탄생의 초`. |
| D-19051 | 24989 | not an issue | The ability to practice Delving after others lost the art, and communion with Sorrows, are retained. The Korean describes Delving as 탐구; the references support investigation/study, but do not establish a canonical Korean skill label. |
| D-19052 | 24993 | not an issue | `병기 교관` is a defensible rendering of masters-at-arms, and the armories, training, weapons/spells, and damage-estimation function remain. Japanese and Chinese differ on the precise role title without proving a local meaning error. |
| D-19053 | 24997-24998 | not an issue | Lykeios already uses the prevailing `리케이오스` form. The compact `라토퍼의 단검 강화` reads as an upgrade notification and is supported by the completed-action Japanese and Chinese improvement notice. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24951 | `비사레인` | `비사라네` | Match the prevailing active-corpus form for Bisarane. |
| 24952 | `아나라가 우리 장인들을` | `아니라(Anira)가 우리 명장들을` | Apply the adjacent accepted Anira spelling and established Master Makers rendering. |
| 24959 | `모투스 광산 회사의 학자 루인 이마스는 아포타이르 지역에서 새롭고 희귀한 광석이 발견될 거라고 생각한다.` | `모투스 광업 회사의 학자 루인 이마스는 아포타이어 지역에 새롭고 희귀한 광석이 매장되어 있다고 믿는다.` | Align company/place forms and restore the English deposit claim. |
| 24970 | `본라흐` | `본라크` | Match the recurring spelling of Bonnlach. |
| 24988 | `내 탄생의 초가 촛대에서 사라졌어` | `내 탄생의 초를 촛대에서 가져가 버렸어` | Preserve that the candle was taken from its holder. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 24951-25000 exactly once and in identical order.
- The five complete CSVs have 65,135 rows and matching ID/order keys.
- A byte-level comparison against the pre-edit backup proves only the five
  approved `Texto` cells at IDs 24951, 24952, 24959, 24970, and 24988 differ.
  The UTF-8 BOM, row order, 72,011 CRLF endings, and 73 existing bare LF
  endings remain unchanged.
- Runtime-token signatures and embedded line-break counts match throughout
  the batch. `{1}` at ID 24973 is preserved exactly; the source grammar error
  at ID 24994 remains resolved without changing its meaning.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-24951-25000-D19042/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `c9e4bde6b55074652f978af990d8a07c740becb72499ca42867a1cf7b2e0b2eb`.
- Post-edit SHA-256:
  `9e41b6f836a37d9889327dbfd67c6db1e3a518c53b9992b7844de1b01608947c`.
- Totals: 2,142 accepted / 23,908 `not an issue` / 12,474 uncertain
  (38,524 counted keys). Resume D-19054 at ID 25001. Sequential IDs
  25001-65134 remain (40,134), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
