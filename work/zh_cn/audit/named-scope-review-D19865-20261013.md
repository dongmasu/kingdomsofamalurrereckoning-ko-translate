# Default Scope Review D-19865

2026-10-13. Reviewed all active `default` IDs 38951-39050 with
English as the meaning anchor, Japanese for register, Chinese as
supporting evidence, and official/corpus terminology. All 100 rows
align across the four locale files with 65,135 ordered IDs. No PAK
or PAK-derived material was consulted.

Five D-19667 exact keys (38991, 39000, 39004, 39022, 39043)
match current English/Japanese/Chinese (5/5 per locale).
The accepted 39022 correction is present; other terminal `not an issue`
statuses remain unchanged and no prior finding was recounted.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 38972 | Subsequent Echo Stone term correction | English `Echostone` refers to the established lore item `메아리석` (seen in accepted ID 38082/D-19856). Replace inconsistent `메아리돌`. |
| 38991 | Subsequent quality/affiliation correction | English `Flawless Mitharan` is `흠 없는 미타란` (D-19551/D-19718 and later reuse), not `완벽한 미사루식`. Preserve `Piercing Handle` as `관통 손잡이`; do not add a component interpretation. The prior exact key remains terminal and is not recounted. |
| 39043 | Subsequent familiar-address normalization | English `dove` uses the established familiar address `친구` (D-19432 and subsequent accepted examples), not romantic `내 사랑`. Japanese omits the vocative, so retain the English address without intensifying the relationship. |

The remaining 97 rows retain their current translations and prior
dispositions. Manual terminology at 38974's Dispelling context and the
setting/race names were checked; no additional source-backed correction
is established. Preserve the plural `Traveler` reference and the other
local name/context forms. No global tally is asserted; affix 55 remain
closed by D-19565.

Pre-edit SHA-256:
`969974a20e2ed81e313f92d2688928f272eb3644c8d13b7c2ba25f3ee9aa66c3`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19865/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`c9901608611c780c532765adec8f2bdfa05b1431c762d6ddb8ba47f243c56304`.
Inverse byte reconstruction confirms only the three target `Texto`
cells changed; the BOM, 72,011 CRLF / 73 bare-LF endings and row order
remain intact.

Last reviewed ID 39050; next D-19866 / IDs 39051-39150.
26,084 actual default rows remain through 65134; review incomplete.
