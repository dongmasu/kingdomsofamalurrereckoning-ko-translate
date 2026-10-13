# Consolidated Context Review: Canonical `House of Sorrows`

- Date: 2026-10-12.
- Decision: D-19451.
- Scope: the ten previously uncertain exact-label rows at IDs 27052, 38353,
  40260, 40697, 41288, 42928, 47061, 49381, 49921, and 63232.
- Compared English, Japanese source and draft, Chinese, active Korean,
  neighboring context, and prior source-keyed decisions.

## Finding

English ID 39470 explicitly defines the House of Sorrows as a collective of
Winter Fae based at the Midden and opposed to the Tuatha. Japanese gives the
same definition and describes the group as `若き種族`; Chinese likewise
describes a group/family of Winter Fae. The ten exact labels therefore name
that established faction, not an unidentified family or location.

The active Korean corpus already has accepted `비탄의 집(House of Sorrows)`
precedents, including the exact standalone label at ID 47061 and accepted
sentence uses at IDs 30489, 30763, 31413, 45093, and 62154. The established
Korean proper-name form is transferable to these same exact faction labels.

| ID | Previous Korean | Result |
| ---: | --- | --- |
| 27052 | `슬픔의 가문` | Accepted: `비탄의 집(House of Sorrows)` |
| 38353 | `슬픔의 가문` | Accepted: `비탄의 집(House of Sorrows)` |
| 40260 | `소로스 가문` | Accepted: `비탄의 집(House of Sorrows)` |
| 40697 | `비탄의 가문` | Accepted: `비탄의 집(House of Sorrows)` |
| 41288 | `비탄의 가문` | Accepted: `비탄의 집(House of Sorrows)` |
| 42928 | `하우스 오브 소로우즈` | Accepted: `비탄의 집(House of Sorrows)` |
| 47061 | `비탄의 집(House of Sorrows)` | Not an issue; already matches the established standalone form. |
| 49381 | `슬픔의 집` | Accepted: `비탄의 집(House of Sorrows)` |
| 49921 | `하우스 오브 소로우` | Accepted: `비탄의 집(House of Sorrows)` |
| 63232 | `슬픔의 가문` | Partial accepted correction to `비탄의 집(House of Sorrows)`; the ID remains uncertain on the separate Foes' Hearth place-name question. |

## Verification

- All ten keys align across English, Japanese source, Japanese draft, Chinese,
  and active Korean. Their labels contain no runtime markers or embedded
  line breaks.
- Nine Korean `Texto` cells changed; ID 47061 was already correct. Eight
  findings were fully resolved; ID 63232 received a limited name correction
  without clearing its unrelated hold.
- Pre-edit SHA-256:
  `cc8c2706805482a13a2bd44a8d58687b1804a8f06bea3c6632b47639f20073f4`.
- Post-edit SHA-256:
  `f7f1d5aebc4c6c6f8be4bfdbd37820d73e2131103e80db4de6296909571a6857`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-D19451/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the nine exact `Texto` substitutions reproduces the backup
  byte-for-byte. BOM, all 65,135 records, key order, 72,011 CRLF endings,
  and 73 existing bare-LF endings are preserved.
- Nine uncertainty dispositions were fully resolved: eight accepted and one
  `not an issue`. The partial correction at ID 63232 remains uncertain and
  is not recounted. Totals: **2,292 accepted / 24,995 not an issue /
  11,237 uncertain** (38,524). Continue with D-19452.
