# Disposition Batch: `default` IDs 59451-59500

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 38 `not an issue` IDs, and ten uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17845 | 59499 | `그들이야말로 본래의 생명이지. 돌벽 안에 틀어박히거나 허다한 물건과 치장으로 삶을 짓누르지 않는 필멸자들 말이야.` | `그들이야말로 삶이 마땅히 그래야 할 모습이지. 돌벽 안에 틀어박히거나 허다한 물건과 치장으로 삶을 짓누르지 않는 필멸자들 말이야.` | English “life as it is meant to be” and Japanese `生きとし生けるもののあるべき姿` describe the proper way of living, not “original life.” Preserve the following explanation of mortals who avoid stone walls and material burdens. |
| D-17846 | 59500 | `그곳에는 아데사에서 가장 뛰어난 지성들이 모여 있어. 유형의 과학이나 현실적인 한계를 고민할 필요 없이 이론만 연구하지.` | `그곳은 아데사에서 가장 뛰어난 지성들이 모인 곳이야. 그들은 실증 과학이나 현실적인 한계를 고민할 필요 없이 이론적인 실험만 하지.` | Restore the contrast between practical/empirical science and experiments conducted only in theory; Japanese and Chinese retain the experiment/research action more explicitly. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17847 | 59452 | `Bursar` is consistently a financial office in the locale references, but whether Korean should use the current `회계관` or another formal office title is unresolved. |
| D-17847 | 59457 | The surname-based persecution claim is preserved; the canonical Korean spelling of `Darkvari` remains open. |
| D-17847 | 59458 | English and Chinese use “her,” while Japanese explicitly attributes the wrath to Tirnoch. The Korean resolution is plausible but depends on the antecedent. |
| D-17847 | 59462 | The stacked item title `Flawless Mitharan Magnifying Hilt` does not clarify what `Magnifying` modifies or whether this is a hilt with an effect. |
| D-17847 | 59472 | The parallel title is translated directly, but whether `Two Heirs, Two Brothers` is a named tale, quest title, or descriptive heading remains unknown. |
| D-17847 | 59473 | The book-taking condition is preserved, but the underlying sense and canonical Korean title of `Shroud of Omission` remain unresolved, linked to ID 59307. |
| D-17847 | 59479 | The northern religious institution is clear, but whether `Mission` is a proper place name and whether `선교소` is the intended institutional term remain open. |
| D-17847 | 59480 | The attack and honest-reporting choice are retained; `Fae maiden`/`Maid` and the House of Ballads title require reconciliation with the unresolved Windemere title. |
| D-17847 | 59487 | Korean spells `Murghan` as `머건` here and `머간` at ID 58852; English/Japanese support a name but do not settle canonical Korean spelling. |
| D-17847 | 59492 | English `Tarnished` is ambiguous; Japanese and Chinese support a defiled/tainted reading rather than Korean `빛바랜`. The quest/status context is insufficient to settle a replacement. |

## Not an Issue

Decision D-17848 records these 38 IDs: 59451, 59453-59456, 59459-59461,
59463-59471, 59474-59478, 59481-59486, 59488-59491, and 59493-59498.
The five-line Sidhe poem and the physical-resistance recipe layout and
ingredient quantities 3/3/1 are retained. Shroud usage at 59473 remains
consistent with the unresolved occurrence at 59307; no isolated
normalization was made.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. The full resources contain 65,135 records with matching
  key order.
- Rechecked source-keyed prompts for Motus Mining/Bursar, Darkvari, Tirnoch,
  the Sidhe poem, Mitharan hilt, the language potion, the heirs title,
  Shroud of Omission, Mission, House of Ballads, Murghan, Whitestone
  Tarnished, the Wells, the intended form of mortal life, and theoretical
  science. Unresolved prompts remain uncertain rather than being normalized.
- Rechecked the poem and recipe line breaks, ingredient quantities, runtime
  markers, and checked values; no structural discrepancy was found.
- Pre-edit CSV SHA-256:
  `d3073fb282cecf05b2e351b270b83272642cacc52dfb86057cfdda6e4d07a731`.
- Post-edit CSV SHA-256:
  `3b89ddb25d40a316e826f584df26ba36ca831345d86be84debb0090a34ba531b`.
  Byte comparison against the backup confirms only IDs 59499 and 59500
  changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and
  39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59451/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `d3073fb282cecf05b2e351b270b83272642cacc52dfb86057cfdda6e4d07a731`).

D-17845 and D-17846 record two accepted corrections, D-17847 records ten
uncertain IDs, and D-17848 records the remaining 38 `not an issue` IDs.
Direct register totals: 1,732 accepted, 13,230 `not an issue`, and 11,314
uncertain (26,276 total); next D-17849.

Resume at `default` ID 59501; 5,634 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
