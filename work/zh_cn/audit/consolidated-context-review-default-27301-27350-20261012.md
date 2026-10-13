# Consolidated Context Review: `default` IDs 27301-27350

- Review date: 2026-10-12.
- Scope: Re-review prior uncertainties in D-8692-D-8696. D-8691's accepted
  correction at 27332 and prior not-an-issue decisions are linked, not
  recounted.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19358-D-19359

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19358 | `default` 27306 | accepted | English and Chinese say “trophies”; Japanese's “decorate heads” is compatible with trophies but not generic loot. Replace `전리품` with `트로피`; retain the display action. |
| D-19359 | `default` 27302-27303, 27308, 27311, 27313-27317, 27324-27328, 27333-27337, 27339, 27341-27344, 27350 | not an issue | The translations preserve the source meanings. Proper-name variants alone do not establish row-level errors. At 27327, all locale texts preserve the source's distinction between the body/dead man and the prone man; Korean retains that ambiguity. `먼지 인간들` conveys the disparaging `dustlings` address, and `사용자 2` accurately translates the source label; whether that label is player-facing is outside the row's linguistic accuracy. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27306 | `전리품 전시하기` | `트로피 전시하기` | Preserve the English trophy category rather than broadening it to loot. |

## Verification

- The existing four-locale key/order, line-break, value, and runtime-marker
  checks remain valid. ID 27301 retains two embedded line breaks; values and
  markers are unchanged.
- Only the Korean `Texto` cell at ID 27306 changed. Reversing that exact
  substitution reproduces the pre-edit file byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, and 73 bare-LF endings remain.
- Pre-edit SHA-256:
  `67551a53d84bb5eec6e6ae4c76dd6bcdcd8d296379e6cb5d075b8cc253fa8f2f`.
- Post-edit SHA-256:
  `499513202eedc841d94943b8e1e0710c2ff94e3da7073722aa65a7b1ec384e60`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27301-27350-D19358/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,227 accepted / 24,694 `not an issue` / 11,603 uncertain
  (38,524). Resume at D-19360, ID 27351.
