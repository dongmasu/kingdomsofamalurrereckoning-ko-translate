# Disposition Batch: `default` IDs 59351-59400

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Three accepted corrections, 38 `not an issue` IDs, and nine uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17837 | 59358 | `올라와 대화` | `오를라와 대화` | Existing Korean usage at IDs 6656, 9279, and 25487 identifies Orla as `오를라`. The previous phrase was liable to parse as “come up and talk,” obscuring the quest target. |
| D-17838 | 59383 | `돌을 활성화할 때마다 네 배에 저주를 걸고, 약해진 네가 상대할 적들을 불러낸다.` | `돌을 활성화할 때마다 네 몸에 저주를 걸고, 약해진 상태에서 상대할 적들을 불러낸다.` | English `vessel` is rendered as the player's body in Japanese (`肉体`) and Chinese (`肉体`). Korean `배` can mean ship or belly; restore the supported body sense and keep the curse/activation and weakened-state sequence. |
| D-17839 | 59399 | `기계가 날카롭게 울며 덜컹거리더니 화려한 상자가 녹아 없어지고, 대가의 곡괭이가 네 손가락 사이에 떠올랐다. 하지만 엔진의 마법이 대가의 곡괭이에 악영향을 준 듯하다. 이제 망가져 있다.` | `기계가 날카롭게 울며 덜컹거리더니 화려한 상자가 녹아 없어지고, 달인의 자물쇠따개(Master's Pick)가 네 손가락 사이에 떠올랐다. 하지만 엔진의 마법은 그 자물쇠따개에 악영향을 준 듯하다. 이제 망가져 있다.` | Chinese explicitly identifies a lock-opening tool; established decisions D-734 and D-7086 identify this recurring Master's Pick as a lockpick. The current `곡괭이` names a mining tool. Use the established `달인의 자물쇠따개` form here; other Master's Pick title variants remain a broader consistency question. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17840 | 59354 | English `band`, Japanese `帯`, and Chinese `指环` differ on the silver object's form; the Korean Docent rank and canonical Scholia Arcana title also remain unresolved. |
| D-17840 | 59360 | The sentence clearly identifies a woman as the best candidate, but whether `Primos` is a personal/title name or a generic leadership office is unsettled. |
| D-17840 | 59367 | English repeats `Wine` as a vocative and Chinese transliterates it, while Japanese omits the name; whether it is a character's name or a source oddity remains unclear. |
| D-17840 | 59369 | The praise and credit are preserved, but canonical Korean forms for `Hyperian` and `Concourse` remain open. |
| D-17840 | 59370 | The second chance, Akara's role, and the fate-revelation claims are preserved; Akara's canonical name/title and the source's differing gender cues remain open. |
| D-17840 | 59379 | The location and Winter Fae lore are retained, but the canonical Korean form and capitalization treatment of `Esharra` remain unresolved. |
| D-17840 | 59388 | Japanese explicitly calls the Lykeios opponent a debate opponent; English and Chinese are broader. The contest type is not clear enough to replace the Korean verb safely. |
| D-17840 | 59393 | English and Japanese say “gone/disappeared,” while Chinese specifies death. Korean `죽은` selects the stronger death reading; retain pending scene context. |
| D-17840 | 59397 | The fall and epithets are preserved, but the canonical Korean treatment of `Sir` and the two honorific epithets is not established. |

## Not an Issue

Decision D-17841 records these 38 IDs: 59351-59353, 59355-59357, 59359,
59361-59366, 59368, 59371-59378, 59380-59382, 59384-59387, 59389-59392,
59394-59396, 59398, and 59400. These rows preserve the evident English
meaning, appropriate Korean register, and the checked names, claims, and
sentence relations without an independently supported correction.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. The full resources contain 65,135 records with matching
  key order.
- Reconciled the historical prompts covering the 59350-59449 range,
  including Docent, Primos, Wine, Hyperian/Concourse, Akara, Esharra,
  Lykeios, Alfar/Ljosalfar/Dokkalfar, Sagrell, and Master's Pick. The
  historical notes are prompts, not approvals; the Master's Pick correction
  reuses previously accepted lockpick evidence.
- Rechecked line breaks, runtime markers, and numeric values; none differ
  across this batch. The three accepted edits change only `Texto`.
- Pre-edit CSV SHA-256:
  `2e52cecf80077f8041fd80ac890053de10feee2cc37f33ddfd7d1b81d728e5ff`.
- Post-edit CSV SHA-256:
  `56463e8babc814428ff5e17402d0e6d5c4e4d6f8c3f53ab8e9ba166405801e5f`.
  Byte comparison against the backup confirms only IDs 59358, 59383, and
  59399 changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59351/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `2e52cecf80077f8041fd80ac890053de10feee2cc37f33ddfd7d1b81d728e5ff`).

D-17837 through D-17839 record three accepted corrections, D-17840 records
nine uncertain IDs, and D-17841 records the remaining 38 `not an issue` IDs.
Direct register totals: 1,729 accepted, 13,144 `not an issue`, and 11,303
uncertain (26,176 total); next D-17842.

Resume at `default` ID 59401; 5,734 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
