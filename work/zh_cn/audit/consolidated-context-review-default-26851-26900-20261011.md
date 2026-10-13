# Consolidated Context Review: `default` IDs 26851-26900

- Review date: 2026-10-11.
- Scope: 26 unique prior uncertain keys in D-8630-D-8632. ID 26896 was
  already accepted at D-8633 and is linked without recounting.
- Result: three accepted corrections, twenty-three `not an issue`, and no
  remaining uncertainty in this range.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19328-D-19331

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19328 | `default` 26856 | accepted | English and Japanese identify the named House of Ballads. Replace `발라드의 가문` with the established `발라드의 집` form used in prior accepted edits. |
| D-19329 | `default` 26878 | accepted | English makes a courteous request to ready weapons; Japanese uses an apologetic, polite request. Replace the unnatural courtesy formula and align the two Korean clauses' familiar, courteous register. |
| D-19330 | `default` 26891 | accepted | English explicitly identifies the Ariad as warrior scouts, and Japanese calls them a scouting unit. Reuse the previously dispositioned group form `아리아드대` from D-1449. |
| D-19331 | `default` 26858-26860, 26862-26863, 26870, 26872, 26874, 26877, 26879-26880, 26883-26885, 26889-26890, 26892-26895, 26897-26899 | not an issue | The Korean remains traceable to the English; name-transliteration variation and the broad but plausible `부족` for `Clan` do not establish row-local mistranslation. At 26879, English leaves the taken item's referent implicit; Korean preserves that omission, and the Japanese/Chinese difference does not justify inventing a referent or agent. |

D-8633's accepted Wolf Pack unit description at ID 26896 is linked without
recounting. Its `정예 암살 부대` wording remains unchanged.

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26856 | `발라드의 가문에서 비어 있는 자리를 채우기 위해서야.` | `발라드의 집에서 비어 있는 자리를 채우기 위해서야.` | Reuse the established Korean name for House of Ballads. |
| 26878 | `친절을 베풀어 무기를 준비해 주게. 곧 공격받을 것 같아.` | `미안하지만 무기를 준비해 주게. 곧 공격받을 것 같네.` | Remove the unnatural literal courtesy formula and keep a consistent courteous, familiar register supported by Japanese. |
| 26891 | `나는 아리아드를 지휘한다. 우리는 알파르의 눈이 되어 주는 전투 정찰병이다.` | `나는 아리아드대를 지휘한다. 우리는 알파르의 눈이 되어 주는 전투 정찰병이다.` | Make the explicitly identified scouting group clear using the established group form. |

## Verification

- English, Japanese source, Japanese-derived Korean draft, Chinese, and
  active Korean each contain IDs 26851-26900 exactly once, in ascending
  consecutive order.
- Only the active Korean `Texto` cells at 26856, 26878, and 26891 changed.
  Reversing those exact substitutions reproduces the pre-edit backup
  byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF endings and 73
  pre-existing bare-LF endings.
- The named-icon token at 26865, +15% value at 26869, Chinese-only U+FEFF
  at 26870, and `{LINE_SPACE}{LINE_LEFT}` sequence at 26893 were left
  unchanged.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26851-26900-D19328/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `3c8eac63846bd2c7a765d5b39688cc32797eeba41f13994e05a604161c2652ca`.
- Post-edit SHA-256:
  `a1a01d3373fce22842b8a99ad24c37963133c023d69755456a310fa739535aea`.
- Totals: 2,215 accepted / 24,608 `not an issue` / 11,701 uncertain
  (38,524). Resume at D-19332, ID 26901.
