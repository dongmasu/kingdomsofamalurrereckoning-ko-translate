# Consolidated Context Review: The Telling and Sagrell

- Date: 2026-10-11
- Decision: D-18261
- Scope: `default` IDs 8162 and 14991; compare English, Japanese source,
  Japanese-derived Korean draft, Chinese source, active Korean, related
  `The Telling` occurrences, and prior accepted decisions.
- Result: accept ID 8162 after changing `폐하` to `각하`; reclassify ID
  14991 as `not an issue`.

## Evidence and Decision

At ID 8162, English says the witch has died but `The Telling` will persist.
Japanese uses `伝承`, Chinese describes the prophecy continuing, and the
current Korean `전승(The Telling)` preserves the lore meaning and persistence.
IDs 7399 and 7526 use the same named Fae tradition, while accepted decisions
D-18125 and D-18131 establish `전승(The Telling)` for this concept. The
repeated question and deferential voice are retained.

The English `your grace` and Japanese source do not establish royal rank.
The current `폐하` overstates it; reuse the accepted general formal address
`각하` from D-18259-D-18260.

At ID 14991, Japanese explicitly identifies “the House” as the House of
Ballads and preserves the teasing switch from the name Sagrell to the formal
address. English and Chinese support that same joke. Korean's `발라드
가문` and `아니, '각하'라고 불러야 하나?` preserve the intended referents
and tone; no row-level correction is needed.

## Applied Text

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 8162 | `마녀는 죽었지만 전승(The Telling)은 계속 이어질 거야. 그렇지요, 폐하? 그렇죠?` | `마녀는 죽었지만 전승(The Telling)은 계속 이어질 거야. 그렇지요, 각하? 그렇죠?` | Reuse the accepted `전승(The Telling)` lore term and general formal address; do not imply royal rank. |
| 14991 | `발라드 가문에 돌아온 걸 환영하네, 사그렐. 아니, '각하'라고 불러야 하나? 할람에게 윈더미어에서 겪은 시련을 들었어. 보통 일이 아니었겠군.` | unchanged | Japanese identifies the House of Ballads; all references preserve the teasing switch to a formal address. |

## Verification

- Only the active Korean `Texto` cell at ID 8162 changed.
- The UTF-8 BOM, 65,135 data rows, ID order, and record separators are
  preserved: 72,011 CRLF and 73 bare-LF endings.
- Reversing only the approved substitution reproduces the pre-edit file
  byte-for-byte.
- Pre-edit SHA-256:
  `5cf2c5e3c51332a954fb3226bbad0c6e276e691223708f07e4bf155912c12946`.
- Post-edit SHA-256:
  `9ad0c54788bacf1adb14f875bac12bc40c4219e3d514969a14b647318d5e56b8`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-telling-8162-D18261/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18261: 1,952 accepted, 23,089 `not an
  issue`, and 13,481 uncertain (38,522 unique dispositions); next decision:
  D-18262.

These are working dispositions, not independent final linguistic approval.
