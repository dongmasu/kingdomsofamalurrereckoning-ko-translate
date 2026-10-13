# Consolidated Context Review: Repeated `Your Grace` Addresses

- Date: 2026-10-11
- Decision: D-18260
- Scope: uncertain `default` addresses at IDs 5073, 5120, 5829, 5894,
  12854, 14405, 23928, 24090, 25064, 30891, 40797, 45342, 45690, 55335,
  55446, 58750, 64150, and 64494. English, Japanese source, Japanese-derived
  Korean draft, Chinese source, active Korean, and prior honorific decisions
  were compared.
- Result: 17 IDs are accepted under the established general formal address
  `각하`; ID 30891 remains uncertain only for `Viator`.

## Evidence and Decision

The English `Your Grace` signals respect and elevated status but does not
itself establish royalty. Repeated English identifies the player as the
House of Ballads ruler (IDs 5778, 24093, and 30786); ID 30786 specifically
describes the ruler as a legendary knight who does not even own a crown.
Japanese source rows commonly use the broader `閣下`, while Chinese varies
between `大人` and `陛下`. Following the English meaning and the established
accepted decisions D-10950, D-13407, D-13459, and D-18259, `각하` preserves
deference without adding a royal rank.

The following rows had no remaining row-level uncertainty after this context
review and are reclassified as accepted: 5073, 5120, 5829, 5894, 12854,
14405, 23928, 24090, 25064, 40797, 45342, 45690, 55335, 55446, 58750,
64150, and 64494.

ID 30891 also changes from `전하` to `각하`, but stays uncertain because the
meaning and status of `Viator` remain unresolved. This edit does not clear
that separate question.

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 5073 | `안녕히 가십시오, 전하.` | `안녕히 가십시오, 각하.` |
| 5120 | `당신과는 이야기하고 싶지 않습니다... 전하.` | `당신과는 이야기하고 싶지 않습니다... 각하.` |
| 12854 | `훈련이 필요하십니까, 전하? 발라드의 집에서 그토록 높은 지위에 계신 분이 훈련이라니 믿기 어렵습니다.` | `훈련이 필요하십니까, 각하? 발라드의 집에서 그토록 높은 지위에 계신 분이 훈련이라니 믿기 어렵습니다.` |
| 14405 | `안녕하십니까, 전하.` | `안녕하십니까, 각하.` |
| 23928 | `다시 뵙습니다, 전하.` | `다시 뵙습니다, 각하.` |
| 24090 | `안녕히 가십시오, 전하.` | `안녕히 가십시오, 각하.` |
| 25064 | `문안드립니다, 전하.` | `문안드립니다, 각하.` |
| 30891 | `제가 말할 일은 아닙니다, 전하. 비아토르와 직접 이야기하셔야 합니다. 이쪽으로 오시죠.` | `제가 말할 일은 아닙니다, 각하. 비아토르와 직접 이야기하셔야 합니다. 이쪽으로 오시죠.` |
| 40797 | `무슨 일이십니까, 전하?` | `무슨 일이십니까, 각하?` |
| 45342 | `저는 설득술 교관 엘로바입니다. 유혹도 가르치죠. 아마 이미 짐작하셨겠지만요. 전하를 뵙게 되어 영광입니다.` | `저는 설득술 교관 엘로바입니다. 유혹도 가르치죠. 아마 이미 짐작하셨겠지만요. 각하를 뵙게 되어 영광입니다.` |
| 55335 | `오셨군요, 전하. 이게 보이세요? 무슨 일이 벌어졌는지 보이십니까?` | `오셨군요, 각하. 이게 보이세요? 무슨 일이 벌어졌는지 보이십니까?` |
| 55446 | `도시를 즐겁게 둘러보십시오, 전하. 발라드의 집(House of Ballads)이여 영원하라!` | `도시를 즐겁게 둘러보십시오, 각하. 발라드의 집(House of Ballads)이여 영원하라!` |
| 58750 | `예, 전하?` | `예, 각하?` |
| 64150 | `찾아와 주시다니 큰 영광입니다, 전하. 윈드미어에서 거두신 승리는 저희 모두 들었습니다. 감사드립니다.` | `찾아와 주시다니 큰 영광입니다, 각하. 윈드미어에서 거두신 승리는 저희 모두 들었습니다. 감사드립니다.` |
| 64494 | `전하...` | `각하...` |

IDs 5829, 5894, and 45690 already used `각하`; their cells were unchanged.

## Verification

- Fifteen approved Korean `Texto` cells changed. No IDs, row order, markers,
  or unrelated field values changed.
- UTF-8 BOM, 65,135 data records, and record separators are preserved:
  72,011 CRLF and 73 bare-LF endings.
- Reversing only the 15 approved substitutions reproduces the pre-edit CSV
  byte-for-byte.
- Pre-edit SHA-256:
  `651c4d78ec4a888cff19e1e6cb765391ec7fb50ac2a979ef2a58fab1723a70c4`.
- Post-edit SHA-256:
  `5cf2c5e3c51332a954fb3226bbad0c6e276e691223708f07e4bf155912c12946`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-your-grace-cluster-D18260/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18260: 1,951 accepted, 23,088 `not an
  issue`, and 13,483 uncertain (38,522 unique dispositions); next decision:
  D-18261.

These are working dispositions, not independent final linguistic approval.
