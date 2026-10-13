# Consolidated Context Review: `default` IDs 26951-27000

- Review date: 2026-10-11.
- Scope: 21 unique prior uncertainties in D-8641-D-8643. ID 26996's
  accepted occupational correction at D-8644 is linked without recounting.
- Result: two accepted corrections, sixteen `not an issue`, and three
  specific unresolved questions at IDs 26952, 26956, and 26971.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19336-D-19339

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19336 | `default` 26951 | accepted | English `the other night` and Japanese `この前の晩` refer to a recent night without specifying several days. Replace the narrower `며칠 전 밤` with `얼마 전 밤`. |
| D-19337 | `default` 26969 | accepted | English says the Hyperian soars `within our city`, and Chinese places it in the city. Replace `도시 위로` with `도시 안에`; do not import the Japanese-only merger wording. |
| D-19338 | `default` 26953, 26955, 26962, 26968, 26976, 26978-26980, 26984, 26991-26992, 26994-26995, 26997-26999 | not an issue | The meanings remain source-traceable. The Mathon poem retains all five lines/four embedded line breaks; the unidentified substance at 26991 remains unnamed. The earlier accepted occupational correction at 26996 is linked separately at D-8644, and that row's remaining account is not recounted. |
| D-19339 | `default` 26952, 26956, 26971 | uncertain | At 26952, `라시르` versus `라시어` remains unresolved across the repeated Rathir Chapter labels. At 26956, English `The Pack`, Japanese's generic `パック`, and Chinese `狼群` do not establish whether the group is specifically the Wolf Pack. At 26971, literal `\"` visibility depends on unverified runtime/export behavior. Preserve all three unchanged. |

D-8644's accepted `광부들` to `노동자들` correction at ID 26996 is linked
without recounting.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26951 | `며칠 전 밤, 보가트 세 마리가 마을 광장에 들어왔어.` | `얼마 전 밤, 보가트 세 마리가 마을 광장에 들어왔어.` | Match the recent but unspecified time in English and Japanese without adding a day count. |
| 26969 | `...하이페리안이 우리 도시 위로 떠 있어.` | `...하이페리안이 우리 도시 안에 떠 있어.` | Correct the above-city location to English `within our city`, supported by Chinese; retain the Korean draft's stammer and do not assert a merger. |

## Verification

- English, Japanese source, Japanese-derived Korean draft, Chinese, and
  active Korean each contain IDs 26951-27000 exactly once, in ascending
  consecutive order.
- Only active Korean `Texto` cells 26951 and 26969 changed. Reversing those
  exact substitutions reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF endings and 73
  pre-existing bare-LF endings.
- The five-line Mathon poem at 26955 retains its four embedded line breaks;
  26954's 6%/5-second values and both quote escapes at 26971 are unchanged.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26951-27000-D19336/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `430114874b5145814debd4b4abaa66c74e5f623a94ce8cbedc7bec48233ebdd3`.
- Post-edit SHA-256:
  `4bb07ea79da77893c0d264f316c3dbcc2d73b86f681b84c9918ff23291f78801`.
- Totals: 2,219 accepted / 24,646 `not an issue` / 11,659 uncertain
  (38,524). Resume at D-19340, ID 27001.
