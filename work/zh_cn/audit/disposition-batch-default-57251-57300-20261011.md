# Disposition Batch: `default` IDs 57251-57300

- Date: 2026-10-11. Rechecked all 50 active Korean rows against English
  meaning, Japanese voice/register, Chinese supporting evidence, historical
  audit prompts, terminology, structure, runtime markers, and values. These
  are working dispositions, not independent final linguistic approval.
- Five accepted corrections, 37 `not an issue` IDs, and eight uncertain
  findings.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 57264 | `행운의 시녀` | `행운의 시녀호` | Japanese explicitly identifies the Maid of Fortune as a ship and Chinese uses a ship-name suffix. Add the vessel marker while preserving the name. |
| 57280 | `용맹의 전당` | `용맹의 집` | Reuse the previously accepted House of Valor form at D-148; the source is a named institution/place, not a generic hall. |
| 57287 | `네가 도와주면 보상하겠다고 약속했었지. 기꺼운 마음은 아니지만, 여기 돈이야. 이제 날 혼자 내버려 둬.` | `네가 해 준 일에 보상하겠다고 약속했었지. 기꺼운 마음은 아니지만, 여기 돈이야. 이제 날 혼자 내버려 둬.` | The service has already been performed and the compensation is now paid. Japanese and Chinese support the past promise; the former conditional Korean incorrectly makes payment depend on future help. |
| 57292 | `질서의 흔적` | `질서의 겉모습` | English `Semblance of Order` and Japanese `秩序の外観` describe an appearance, not a remnant or trace. The revision avoids overcommitting to the Chinese implication of illusion. |
| 57297 | `우린 불리한 조건으로 싸우니까, 우리한테 돈을 걸 도박꾼은 별로 없을 거야.` | `우리에게 불리한 조건이 있으니, 우리 쪽에 돈을 걸 도박꾼은 별로 없을 거야.` | English and Japanese say the group has a handicap but do not specify that it is a fight. Remove that unsupported activity while preserving the betting inference. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17246 | 57253 | The notes and hidden-secret possibility are preserved, but the canonical Korean name for Old Mitharan as a language needs terminology alignment. |
| D-17247 | 57254 | The request to speak with Engar is clear; `Savant` is a formal rank/title whose Korean form remains unresolved. |
| D-17248 | 57263 | The staff/talisman tradition, battle, and death three days after the wounds are preserved; Arne's cultural role and Orieator's Stand's status/name are unclear. |
| D-17250 | 57265 | The information/access chain is intact, but the canonical Korean form and status of `Templar` need corpus alignment. |
| D-17251 | 57274 | Korean's “accept what was lost” is plausible in grief context, but English/Japanese/Chinese emphasize understanding or making sense of the loss. Surrounding context is needed before choosing. |
| D-17252 | 57276 | The town's only-waystation function is preserved; the established Korean regional form for the Faelands varies across the corpus. |
| D-17254 | 57282 | The bundled sea-steel material is retained, but whether `Seasteel` should be translated or transliterated is unresolved. |
| D-17256 | 57288 | The energy's causal role and the Hyperian's rise are retained; the intended physical/lore sense of English `raised` remains unclear against Japanese/Chinese descriptions of floating upward. |

## Not an Issue

The 37 IDs are 57251-57252, 57255-57262, 57266-57273, 57275, 57277-57279,
57281, 57283-57286, 57289-57291, 57293-57296, and 57298-57300. They preserve
evident meaning, register, numeric values, and structure. This includes all
Wrath values (50, 300, 120, and +10), the three Travelers Camps, the equipment
tutorial, and its localized display labels.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 57251-57300
  once and in identical ascending order. Their full `default` key order
  matches across all 65,135 records.
- Line-break counts and runtime-marker identity/order match throughout the
  range. At 57289 the localized payloads inside `{*2...}` differ as expected;
  the `{LINE_LEFT}`, `{*2}`, and `{LINE_SPACE}` structure/order matches.
- Wrath values at 57272 (`50`, `300`, `120`, and `+10`) match all locales.
  The count of three camps at 57278 is preserved; Japanese uses the digit
  `3` while other locales spell out the same number.
- Rechecked the source-keyed historical entry for IDs `57250-57349`.
  Prompts at 57253-57254, 57263-57266, 57276, 57278, 57282, 57285,
  57288-57290, 57292, 57294, and 57298 are resolved here as accepted,
  `not an issue`, or open uncertainty. Later prompts in that historical
  range continue with the next batches. ID 57250 was counted in the previous
  batch and is not counted again.
- The preliminary report's active-CSV hash is a 2026-10-09 snapshot and
  predates the later dispositions. The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57251/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `9b4ef4ac64ab27cb1a8a690cbca4bca92e27f1089798afea32af8991cacaec2c`).
  Post-edit active default SHA-256:
  `dfd47516558f6c69796ee462e09e914808fe8f5c3fb5e6bf5f559f968b39888b`.
  Only the five accepted `Texto` cells changed. The UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

D-17246 through D-17258 record the eight uncertain findings and five
accepted corrections; D-17259 records the remaining 37 `not an issue` IDs.
Direct register totals: 1,688 accepted, 12,077 `not an issue`, and 10,697
uncertain (24,462 total); next D-17260.

Resume at `default` ID 57301; 7,834 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-57301-57350-preliminary.md`](default-ids-57301-57350-preliminary.md).
These are working dispositions, not independent final linguistic approval.
