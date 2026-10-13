# Consolidated Context Review: `default` IDs 26551-26600

- Review date: 2026-10-11.
- Scope: the 24 unique uncertain IDs in D-8602-D-8604 within IDs
  26551-26600. Repeated IDs across the original findings were counted once.
  D-19311's prior resolutions for IDs 26515 and 26517 are linked, not
  recounted.
- Result: two accepted corrections, twenty-one `not an issue`, and one
  specific unresolved meaning at ID 26573.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19312-D-19314

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19312 | `default` 26558, 26567 | accepted | Reuse accepted canonical forms: House of Valor is `용맹의 집(House of Valor)` per D-148/D-650 and ID 26303/D-19300; Sun Camp is `태양 야영지(Sun Camp)` per D-16041 and repeated source-aligned rows. |
| D-19313 | `default` 26551-26552, 26554-26555, 26561, 26564-26565, 26571-26572, 26575, 26577, 26581, 26584-26585, 26587-26588, 26592, 26594-26595, 26598-26599 | not an issue | Family and character references, the suggestive exchange, bounty/altar details, war-support view, named titles, quest steps, blessing, offering, Akara belief, merchant displacement, ongoing aid, and Tala-Rane metaphor remain traceable. The accepted idiom and ongoing-tense edits at 26565 and 26598 remain unchanged. |
| D-19314 | `default` 26573 | uncertain | English/Chinese say the speaker's `gift` would start with a woman; Japanese renders a power given to the speaker that they decided to test on her. Current Korean `내 힘은 그녀에게서 시작하리라` suggests the power originates from her, so the direction and intended act cannot be settled safely from these locales. Leave unchanged pending quest/speaker context that distinguishes an offered gift from a power used on her. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26558 | `용맹의 가문` | `용맹의 집(House of Valor)` | Reuse the accepted proper name from D-148/D-650 and the correction at ID 26303. |
| 26567 | `...선 캠프처럼 되고 싶진 않아.` | `...태양 야영지(Sun Camp)처럼 되고 싶진 않아.` | Reuse the accepted semantic rendering for the named Travelers camp, including D-16041. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain IDs 26551-26600 exactly once in ascending order.
- Only the active Korean `Texto` cells at 26558 and 26567 changed.
  Reversing the two exact substitutions reproduces the pre-edit backup
  byte-for-byte.
- UTF-8 BOM is retained. The file still has 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The preliminary scan checked the `<Lie>` label, runtime variables,
  numeric values, and embedded layout. This review's direct ID-sequence
  checks confirmed 50 ordered rows in each of the five files.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26551-26600-D19312/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `6d60b9da225f25c8f925b2a1ca328c9643f3d14ddbb51d17367cd3586e88c74c`.
- Post-edit SHA-256:
  `c7e3b09af219210751aee2adfa012866e64258e5d9958bcee6d7ba22810adb14`.
- Twenty-four prior uncertain IDs were reclassified: two accepted, twenty-one
  `not an issue`, and one remains uncertain. Totals: 2,206 accepted /
  24,483 `not an issue` / 11,835 uncertain (38,524). Resume at D-19315,
  ID 26601.
