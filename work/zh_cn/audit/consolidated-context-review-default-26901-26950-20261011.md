# Consolidated Context Review: `default` IDs 26901-26950

- Review date: 2026-10-11.
- Scope: the 25 unique prior uncertainties in D-8636-D-8638.
- Result: two accepted corrections, twenty-two `not an issue`, and one
  specific unresolved display-format question at ID 26909.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19332-D-19335

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19332 | `default` 26923 | accepted | The capitalized `Cipher of Ethene` is described as an artifact seen in tomes but not yet in person; Japanese transliterates it as `サイファー`. Replace generic `암호문` with the named-object form `사이퍼(Cipher)`, consistent with the accepted row-specific reading at D-19060. |
| D-19333 | `default` 26926 | accepted | English identifies the people as Kollossae. Reuse the latest accepted spelling `콜로사이` from D-18878/D-18933 rather than the older variant `콜로새`. |
| D-19334 | `default` 26913, 26921-26922, 26924-26925, 26927-26930, 26933-26934, 26939-26949 | not an issue | The English meanings and stated relationships remain traceable. Japanese/Chinese support the name, rank, and narrative readings where relevant. At 26930, all locales retain the terse higher-card/four/win exchange; Korean does not introduce a contradictory outcome. At 26934, Korean preserves the source's unspecified object and conditional warning. At 26947, generic `무리` preserves the ambiguous `pack` without asserting it is the Wolf Pack. Name-form variation alone does not establish row-local mistranslation. |
| D-19335 | `default` 26909 | uncertain | The four slash-separated poem segments are intact, but the Korean field contains literal `\"` sequences absent from the other locale strings. Whether these are visible characters or transformed by the runtime/export path cannot be established from the CSVs. Leave unchanged pending display evidence. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26923 | `...에테네의 암호문은...` | `...에테네의 사이퍼(Cipher)는...` | English names a capitalized artifact and says the speaker has seen it in books but not in person; Japanese transliterates the named object. |
| 26926 | `콜로새` | `콜로사이` | Reuse the latest accepted Kollossae spelling. |

## Verification

- English, Japanese source, Japanese-derived Korean draft, Chinese, and
  active Korean each contain IDs 26901-26950 exactly once, in ascending
  consecutive order.
- Only active Korean `Texto` cells 26923 and 26926 changed. Reversing those
  exact substitutions reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF endings and 73
  pre-existing bare-LF endings.
- The four poem segments and literal quote-escape sequences at 26909 remain
  unchanged. The five-stack cap at 26905 and `{1}`/`{2}` order at 26908
  remain unchanged.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26901-26950-D19332/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `a1a01d3373fce22842b8a99ad24c37963133c023d69755456a310fa739535aea`.
- Post-edit SHA-256:
  `430114874b5145814debd4b4abaa66c74e5f623a94ce8cbedc7bec48233ebdd3`.
- Totals: 2,217 accepted / 24,630 `not an issue` / 11,677 uncertain
  (38,524). Resume at D-19336, ID 26951.
