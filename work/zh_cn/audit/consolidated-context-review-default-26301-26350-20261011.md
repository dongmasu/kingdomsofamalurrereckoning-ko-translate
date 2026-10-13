# Consolidated Context Review: `default` IDs 26301-26350

- Review date: 2026-10-11.
- Scope: re-review the twenty-five unique uncertain keys from D-8569-D-8571.
  The previously accepted Keeper correction at 26306 is linked; only its
  separate `Crossing` term remains under review.
- Result: two accepted corrections, twenty-one `not an issue`, and two
  specific uncertainties remain at IDs 26306 and 26338.
- English controls meaning; Japanese and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19298-D-19302

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19298 | `default` 26303 | accepted | The six-line passage is retained. Replace `발러의 가문` with the established Fae House form `용맹의 집(House of Valor)` (D-148/D-650); the source and historical name comparison at 26558 identify the same proper faction. |
| D-19299 | `default` 26304, 26308, 26310-26314, 26317-26321, 26324, 26329, 26337, 26339-26340, 26343, 26347-26349 | not an issue | Names, factions, story relations, and proverb sense are retained. In particular, `Vagabond bandits` is a descriptive bandit phrase in context (supported by D-18937), not a reason to impose a faction name. The `\\\"` around the proverb remains unchanged; runtime appearance is not inferred. |
| D-19300 | `default` 26333 | accepted | English `Craft Hall`, Japanese `職人館`, and Chinese `工匠大厅` all indicate a hall; Korean `공방` narrowed it to a workshop. Change it to `공예 회관`. |
| D-19301 | `default` 26306 | uncertain | The accepted Keeper's Rite correction at D-8566 is linked. English capitalizes `Crossing`, Japanese marks it as a named `クロッシング`, while Chinese and Korean allow a passage/gateway reading; the row does not settle whether `통로` should be a proper lore term. |
| D-19302 | `default` 26338 | uncertain | English/Japanese `SpawnVol5`, Korean `생성 Vol. 5`, and Chinese `重生等级5` differ on whether this is a player-facing spawn/respawn label or internal metadata. Preserve it pending classification. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26303 | `발러의 가문은 이 원초적 힘의 보금자리가 되었다.` | `용맹의 집(House of Valor)은 이 원초적 힘의 보금자리가 되었다.` | Reuse the accepted proper Fae House form from D-148/D-650 and retain the exact English name. |
| 26333 | `다이덴힐 장인들의 이름난 공방` | `다이덴힐 장인들의 이름난 공예 회관` | Preserve the source's hall/building category rather than narrowing it to a workshop. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain 65,135 unique ascending IDs in identical order.
- IDs 26301-26350 were compared by ID across all five files. The House of
  Valor passage at 26303 retains all five embedded line breaks. ID 26321's
  proverb and quote escapes, and ID 26338's label, were not altered.
- Only active Korean `Texto` cells at IDs 26303 and 26333 changed. Reversing
  both exact substitutions reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM, row order, 72,011 CRLF endings, and 73 pre-existing bare-LF
  endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26301-26350-D19298/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `799c0009b7158403e3d88827c9aa2f740b6c177d3f64695931e77ebad3dac434`.
- Post-edit SHA-256:
  `4860f8afb05a56218be723a00331c25f768180e073ed73241971deaa904e0b52`.
- Twenty-five prior uncertain keys were reclassified: two accepted and
  twenty-one `not an issue`; two remain uncertain. Totals: 2,199 accepted /
  24,377 `not an issue` / 11,948 uncertain (38,524). Resume at D-19303,
  ID 26351.
- The D-19162-D-19238 and D-18422-D-18452 register-detail gaps remain open.
