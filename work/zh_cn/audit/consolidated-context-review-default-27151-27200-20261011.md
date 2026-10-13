# Consolidated Context Review: `default` IDs 27151-27200

- Review date: 2026-10-11.
- Scope: Re-review previous uncertainty keys at 27152, 27164, 27168, 27189,
  27191, 27195, and 27196.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.

## Decisions D-19349-D-19351

| Decision | Key | Disposition | Evidence |
| --- | --- | --- | --- |
| D-19349 | `default` 27164 | accepted | English `Moderate increase` and Japanese `中` say moderate/medium; Chinese alone says slight. Change `소폭` to `중간` to follow English meaning. |
| D-19350 | `default` 27168 | not an issue | The line asks where the Master's Pick is; Japanese identifies a pick, and Korean `명장의 곡괭이` preserves that object and title. |
| D-19351 | `default` 27152, 27189, 27191, 27195, 27196 | uncertain at that checkpoint | House of Sorrows and Warsworn conventions, Pledgeshield's rank, the isolated Fire Attenuation category, and the Korean honorific convention for Dame remained unresolved. D-19481 later resolved only the House-name question at 27152; the other IDs remain open. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27164 | `체력 소폭 증가` | `체력 중간 증가` | Match the English `Moderate` and Japanese medium reading rather than Chinese's conflicting slight reading. |

## Verification

- Existing ID/order and runtime-structure checks remain valid; no marker or
  line-break exception was reported in this range.
- Only the authorized Korean `Texto` cell at ID 27164 changed. Reversing
  that exact substitution reproduces the pre-edit file byte-for-byte.
- UTF-8 BOM, 72,011 CRLF endings, and 73 bare-LF endings remain.
- Pre-edit SHA-256:
  `51cad27f1a98bd20e71141c52ef1afc8ba4794991fdb5712b16d37e17d12f3f3`.
- Post-edit SHA-256:
  `b0a8c419c601bab35c2ce7db3dc55d9c52751c70f2b77b2d4d986fbf95dcb8ef`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-27151-27200-D19349/locatexts_zh_cn.koalocatext_default.csv`.
- Totals: 2,224 accepted / 24,659 `not an issue` / 11,641 uncertain
  (38,524). Resume at D-19352, ID 27201.
- Subsequent disposition: D-19481 resolved the House of Sorrows naming issue
  at ID 27152. The distinct findings at 27189, 27191, 27195, and 27196 were
  not changed by that decision.
