# Disposition Batch: `default` IDs 59151-59200

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 39 `not an issue` IDs, and 10 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV matched the preceding checkpoint before the edit and was
  backed up byte-for-byte.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17823 | 59191 | `장인의 수지` | `장인의 동물성 지방` | Reuse accepted decisions D-145, D-16246, D-16267, and D-16809: English `tallow` is rendered animal fat, not resin. Japanese and Chinese offer supporting material-category evidence. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17824 | 59151 | English names the capitalized setting term `Reverie`; Korean uses generic `백일몽`. Whether it is a formal in-world name and its canonical Korean form need broader context. |
| D-17824 | 59152 | `thumos` and the painting/creature terms are preserved, but their canonical Korean forms and exact lore status remain open. |
| D-17824 | 59156 | The event is preserved, but the same Belen's Testament faction appears as `베일렌 결사`, `유언 결사`, and `벨렌의 유언 결사` in nearby rows; its canonical name is unsettled. |
| D-17824 | 59167 | `House of Vengeance` and `the Cur` are retained, but the latter may be a named enemy/title or an insult; locale evidence differs. |
| D-17824 | 59170 | The formal institution `St. Odwig's Perpetual Mission` is rendered as `성 오드윅 상설 선교소`; the institution type and canonical title need context. |
| D-17824 | 59172 | English asks about plural `they`, while Korean uses singular `그건`; the antecedent is absent from this row. |
| D-17824 | 59179 | The replacement mechanic is clear, but the canonical Korean skill term for `Block Dodge` is unverified. |
| D-17824 | 59190 | The poisoned speaker's segmented plea and pauses are preserved; the intended relation in the fragment `Thank... mercy` remains unclear across locales. |
| D-17824 | 59194 | `hardly sporting` may criticize fairness/sportsmanship, while Korean reads as “too boring”; the game-related banter does not settle the nuance. |
| D-17824 | 59197 | The Rathir and Officer's Hall directions are retained; whether `the Burn` is a formal place name and its canonical Korean form remain open. |

## Not an Issue

Decision D-17825 records these 39 IDs: 59153-59155, 59157-59166,
59168-59169, 59171, 59173-59178, 59180-59189, 59192-59193,
59195-59196, and 59198-59200. At 59155 the stealth-eye marker and
percentage meaning are intact. At 59200 the plural formula crates and the
Red Legion contrast are preserved.

## Structural and Historical Reconciliation

- The English, Japanese, Chinese, and Korean files each contain the 50
  target IDs in ascending order. Existing full-resource checks record 65,135
  matching keys and order.
- The source-keyed historical entry `59150-59249` flags Reverie (59151),
  thumos (59152), the Testament (59156), House of Vengeance/the Cur (59167),
  the Perpetual Mission (59170), Block Dodge (59179), the poison plea
  (59190), Master's Tallow (59191), the sporting line (59194), and the Burn
  (59197). The preliminary report incorrectly labeled 59151 as Ethene; the
  active source row is Reverie dialogue, so that Ethene prompt was excluded.
- At 59156, the current faction form adds a third variation to the two
  neighboring rows; this is recorded as uncertain, not silently normalized.
- The stealth-eye marker identity/order and percent at 59155 are retained.
  The thumos quest's two vials and separate creature thresholds, the
  fragmented plea's pauses, and the plural crates at 59200 are preserved.
  No supported numeric or row-structure correction was found.
- Pre-edit CSV SHA-256:
  `5701579c2802da8dc27fa21a36bd279e22a4c990b7735dbf40ce15301e3bbae3`.
- Post-edit CSV SHA-256:
  `67fde35f908683e49100528bbddd9fe25faaf88a252cb3ca5f99f7e6ec63c419`.
  Byte comparison against the backup confirms that only the approved 59191
  `Texto` cell changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF
  endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59151/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `5701579c2802da8dc27fa21a36bd279e22a4c990b7735dbf40ce15301e3bbae3`).

D-17823 records one accepted correction, D-17824 records 10 uncertain IDs,
and D-17825 records the remaining 39 `not an issue` IDs. Direct register
totals: 1,722 accepted, 12,984 `not an issue`, and 11,270 uncertain
(25,976 total); next D-17826.

Resume at `default` ID 59201; 5,934 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
