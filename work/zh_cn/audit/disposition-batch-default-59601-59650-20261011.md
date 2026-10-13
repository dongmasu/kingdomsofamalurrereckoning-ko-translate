# Disposition Batch: `default` IDs 59601-59650

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 39 `not an issue` IDs, and ten uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17859 | 59603 | `라시논이라는 투아사 사제가 이 성채를 점령했다. 그가 개스티르 가문을 폐위시키고 대대로 내려온 집을 빼앗았으니, 반드시 처치하겠다고 맹세했다.` | `라시논이라는 투아사 사제가 이 성채를 점령했다. 그가 개스티르 가문을 몰아내고 대대로 내려온 집을 빼앗았으니, 반드시 처치하겠다고 맹세했다.` | English and Chinese say Racinon deposed House Gastyr; Korean `가문을 폐위시키다` is an awkward collocation for removing a ruling house. `몰아내다` preserves the removal from power without changing the ancestral-home theft or vow. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17860 | 59601 | The epitaph preserves Colad's service and Tywili deeds, but canonical spellings for Colad/Tywili and the Alfar Army title remain open; English misspells `Lieutenant`. |
| D-17860 | 59604 | The two-paragraph journal and argument are retained, but `emerald wing`, Rotelos/Kollossae forms, and the crypt's “vindictive purpose” require lore context. |
| D-17860 | 59607 | English capitalizes `House` without naming it; Japanese identifies the House of Sorrows and Chinese says family. Korean retains the broad family reading pending context. |
| D-17860 | 59610 | `Walls` and `Isles` may be named districts/landmarks or generic city features; Korean uses ordinary `성벽` and `군도`. |
| D-17860 | 59611 | The 12-line winter poem and major images are preserved; compressed syntax, voice, and line-level imagery need a dedicated literary pass. |
| D-17860 | 59613 | The request and disturbance warning are preserved, but Callor/Terenia and the formal title `Guardians of the Cradle` remain provisional. |
| D-17860 | 59633 | `Lords of Valor` is translated literally, but its formal group/title status and canonical Korean form are unresolved. |
| D-17860 | 59636 | The survival assurance and concern about enchantment are retained; `Maid of Windemere` remains an unresolved title/name. |
| D-17860 | 59645 | `Pride of Pryderi` may be a named ship, company, title, or descriptive phrase; the locale readings conflict. |
| D-17860 | 59649 | `Pledge to Action` is preserved as `실천의 서약`, but the isolated label does not establish whether it is a group, tenet, vow, or objective. |

## Not an Issue

Decision D-17861 records these 39 IDs: 59602, 59605-59606, 59608-59609,
59612, 59614-59632, 59634-59635, 59637-59644, 59646-59648, and 59650.
The diplomacy variable/icon order at 59609, Sagecraft Level 3 at 59620,
Windstones musical wording at 59627, the 40-year service duration at 59647,
and the `monstersSW` label at 59631 are retained.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. The full resources contain 65,135 records with matching
  key order.
- Rechecked source-keyed historical prompts for Colad/Alfar Army/Tywili,
  Racinon/House Gastyr, the emerald-wing journal, Heartstone/House, the
  diplomacy variable/icon, Walls/Isles, the High Fulgen poem,
  Callor/Terenia/Cradle, Sagecraft, Windstones, Lords of Valor, Maid of
  Windemere, Kandrian Guards, and Pride of Pryderi.
- Rechecked embedded newlines, runtime marker/value identity and order,
  `monstersSW`, Sagecraft level 3, and the 40-year value. The poem at 59611
  retains 12 lines, and the journal at 59604 retains its paragraph break.
- Pre-edit CSV SHA-256:
  `72de66d4c484b838c241f0a02bf969436477e8bbd4ce663ecc18eb82678ba35c`.
- Post-edit CSV SHA-256:
  `ab2e48c9068c3afe99c271bfb3fe90a61b5f4a8f68fd96df130067b85c870880`.
  Byte comparison against the backup confirms only ID 59603 changed.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59601/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `72de66d4c484b838c241f0a02bf969436477e8bbd4ce663ecc18eb82678ba35c`).

D-17859 records one accepted correction, D-17860 records ten uncertain IDs,
and D-17861 records the remaining 39 `not an issue` IDs. Direct register
totals: 1,739 accepted, 13,341 `not an issue`, and 11,349 uncertain
(26,429 total); next D-17862.

Resume at `default` ID 59651; 5,484 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
