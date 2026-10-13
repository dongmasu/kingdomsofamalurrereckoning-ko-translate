# Consolidated Context Review: Rune Status and Contract Lines

- Date: 2026-10-11
- Decision: D-18264
- Scope: `default` IDs 19965, 19969, 19973, 19974, and 19976; compare
  English, Japanese, Chinese, Japanese-derived Korean, active Korean, and
  accepted UI/contract wording.
- Result: accept corrections at IDs 19965 and 19973; reclassify IDs 19969,
  19974, and 19976 as `not an issue`. ID 19972 was resolved separately at
  D-18263 and is not counted again.

## Evidence and Decisions

| ID | English meaning | Korean result | Disposition and rationale |
| ---: | --- | --- | --- |
| 19965 | `Reveal Rune activated` | `룬 드러내기 활성화` -> `룬 드러내기가 활성화되었습니다.` | Accepted. Japanese says the Reveal Rune is operating and Chinese says it has been activated. The existing Korean is a bare noun phrase that can read like an activation command. Reuse the completed-status pattern approved for `Ice Rune activated` at ID 17191 / D-5417, while retaining this row's established `룬 드러내기` wording. |
| 19969 | Survived Akara-Tor's collapse, escaped the mountainside, and should speak with Nina to learn what lies ahead at Gallows End. | Unchanged | `not an issue`. The English has a source grammar error (`should speak ... and found out`), but Japanese explicitly says to ask Nina and Chinese says to see what they will face. The Korean preserves that intended journal objective and the survival/escape sequence without importing the English typo. |
| 19973 | A required party to a contract has died, preventing its completion. | `필수 당사자` -> `계약 당사자` | Accepted. Chinese explicitly says one side of the contract has died; Japanese says a related party has died, and the following English sentence identifies a contract. Existing Korean rows at IDs 335, 14860, and 32309 already use the natural, context-specific `계약 당사자`. |
| 19974 | The speaker eagerly accepts a fight and threatens the listener for entering Mithros. | Unchanged | `not an issue`. The Korean `아니, 내가 바라던 바야. 덤벼.` conveys the speaker's eagerness to fight. Japanese compresses the first response; Chinese says the speaker is asking for it. The awkward English idiom does not justify silently rewriting the source or changing the supported Korean intent. |
| 19976 | The city thanks the addressee for correcting past wrongs and showing Idylla's people their true paths. | Unchanged | `not an issue`. English, Japanese, Chinese, and Korean preserve the same gratitude, correction, and guidance metaphor; Korean adds no unsupported outcome or agency. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 19965 | `룬 드러내기 활성화` | `룬 드러내기가 활성화되었습니다.` |
| 19973 | `필수 당사자 중 한 명이 죽었다. 이 계약은 더 이상 완료할 수 없어.` | `계약 당사자 중 한 명이 죽었다. 이 계약은 더 이상 완료할 수 없어.` |

## Verification

- Only the active Korean `Texto` values at IDs 19965 and 19973 changed.
- IDs 19969, 19974, and 19976 were reclassified without CSV edits.
- The UTF-8 BOM, 65,135 data-row file, key order, CRLF count (72,011),
  bare-LF count (73), and all other bytes are preserved.
- Reversing only the two approved substitutions reproduces the pre-edit CSV
  byte-for-byte.
- Pre-edit SHA-256:
  `4bd4f2877865a19ed1f2b072bb3a8bfa779e45b2675dd454ba8c3e10fa8c009b`.
- Post-edit SHA-256:
  `056e952ecc9c6153c2136e9c61123598171b586a88291ec14565b3534ddd3f57`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-rune-contract-context-D18264/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18264: 1,955 accepted, 23,102 `not an
  issue`, and 13,465 uncertain (38,522 unique dispositions); next decision:
  D-18265.

These are working dispositions, not independent final linguistic approval.
