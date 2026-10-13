# Consolidated Context Review: `default` IDs 27001-27050

- Review date: 2026-10-11.
- Scope: Re-review the three unresolved items from D-8648-D-8650, against
  English, Japanese source and draft, Chinese, the active Korean CSV, and
  recurring terminology. Earlier accepted corrections at 27020, 27043, and
  27044 and the prior not-an-issue decisions are linked, not recounted.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19340-D-19342

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19340 | `default` 27030 | accepted | The English, Japanese, and Chinese passages each open the first quotation. Korean already has the closing quote and preserves all seven embedded line breaks; add only the missing opening ASCII apostrophe before `네가`. Leave the irregular English grammar and all other quote boundaries untouched. |
| D-19341 | `default` 27050 | accepted | English says they arrived with a bag of gold for each worker; Japanese says they showed/flashed money and Chinese says they gave each worker gold. `매수했어` asserts a completed bribe beyond the English. Rephrase to say they brought gold bags for the workers without asserting the transaction. |
| D-19342 | `default` 27014 | uncertain | `Fallen Hall` is a named place, but active Korean occurrences conflict (`몰락의 전당`, `쓰러진 전당`, `폴른 홀`) and Japanese/Chinese disagree on the place's identity/meaning. Keep this row unchanged pending a corpus-wide place-name decision. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27030 | `27030;"네가...` | `27030;"'네가...` | Restore only the missing opening quote; preserve the seven line breaks and all existing closing/opening boundaries. |
| 27050 | `...우리는 금 자루를 들고 올라와 그쪽 인부 한 명 한 명을 매수했어.` | `...우리는 그쪽 인부 한 명 한 명에게 줄 금 자루를 들고 올라왔어.` | Remove the unsupported assertion that the workers were bribed while retaining the source's gold-for-each-worker detail. |

## Verification

- The existing preliminary report's ID/order, line-break, and runtime-marker
  checks remain valid. ID 27030 still has seven embedded line breaks.
- Only the two authorized Korean `Texto` substrings changed. Reversing those
  substitutions reproduces the pre-edit file byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, and 73 pre-existing bare-LF endings remain.
- Pre-edit SHA-256:
  `4bb07ea79da77893c0d264f316c3dbcc2d73b86f681b84c9918ff23291f78801`.
- Post-edit SHA-256:
  `c3f6c8ddcd3bede275fdfc6388d5c437845f9899394fd355e4b22b628b4cb1ba`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-27001-27050-D19340/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,221 accepted / 24,646 `not an issue` / 11,657 uncertain
  (38,524). Resume at D-19343, ID 27051.
