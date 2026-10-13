# Disposition Batch: `default` IDs 59551-59600

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Three accepted corrections, 37 `not an issue` IDs, and 11 uncertain
  findings. The uncertainty at 59563 is separate from the accepted
  institution-name correction.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17854 | 59553 | `아르진이 그림을 배신하라고 해.` | `아르진이 그림(Grim)을 배신하라고 해.` | English, Japanese, and Chinese identify Grim as a person. Add the established English disambiguator so Korean `그림` is not misread as the common noun “picture.” |
| D-17855 | 59563 | `연금술 박물관에서 그런 식물에 관해 읽은 기억이 나서` | `스파지릭 박물관(Spagyric Museum)에서 그런 종류의 식물에 관해 읽은 기억이 나서` | English capitalizes the named institution despite the source typo `Museaum`, and Chinese transliterates it; generic `연금술 박물관` drops the proper name. Japanese's “alchemy compendium” reading is noted but does not override English. |
| D-17856 | 59600 | `필요한 당사자 중 한 명 이상이 사망하여 이 퀘스트를 더는 완료할 수 없습니다.` | `필요한 인물 중 한 명 이상이 사망하여 이 퀘스트를 더는 완료할 수 없습니다.` | English `required parties` and Chinese's required quest members refer to people; Korean `당사자` sounds legal/transactional here. `필요한 인물` preserves the unspecific referent without inventing an NPC role. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17857 | 59551 | The desire to take a piece of Ticneri to the general is clear, but the object/material is unspecified in English; Japanese says fragment and Chinese specifies flesh. Keep the Korean broad pending scene context. |
| D-17857 | 59554 | English grammar and locale readings differ on the relation between Master Edmure, Shardfall's caverns, and the source of the unusual cold. |
| D-17857 | 59561 | English says `Alley`, Japanese says tavern, and Chinese says valley; the type of Asker's named location is unresolved. |
| D-17857 | 59563 | The institution's name is corrected above, but the reported plant's “grows as fast as the crow flies” claim and the plant/Hollowlands terms remain context-dependent. |
| D-17857 | 59571 | Bolton's role in caravan security is preserved; whether Pledgeshield is a formal rank/title or mercenary class remains unresolved. |
| D-17857 | 59575 | The plan and Belmaid's action are preserved; `Maid of Windemere` remains an unresolved title/name, not normalized here. |
| D-17857 | 59578 | The recovery objective is retained, but the identity of Fae Cairns as a collectible type and its distinction from Lorestones are unresolved. |
| D-17857 | 59587 | The isolated UI label `partners` may denote a relationship status; Korean `동료` is broader, and the screen context is unavailable. |
| D-17857 | 59591 | `Last Breath` is retained, but the isolated label does not establish whether it is an ability, effect, or status. |
| D-17857 | 59597 | English/Japanese/Chinese do not identify whether `Congo` is a person, place, or other proper label. |
| D-17857 | 59598 | `Stalker's Way` may be a named route/location; the phrase alone does not establish whether it should be translated semantically or treated as a proper name. |

## Not an Issue

Decision D-17858 records these 37 IDs: 59552, 59555-59560, 59562,
59564-59570, 59572-59574, 59576-59577, 59579-59586, 59588-59590,
59592-59596, and 59599. The one-to-hundreds refugee argument is preserved;
the Frost Trap values (30 additional damage, 40%, and 5 seconds) are
unchanged; and the Telogrus/Mithros restriction and weapon-crafting
requirements remain intact.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain all 50 target IDs in
  ascending order. The full resources contain 65,135 records with matching
  key order.
- Rechecked historical prompts for Ticneri, Argine/Grim, Edmure/Shardfall,
  the Dunehead plant journal and Spagyric Museum, refugee policy,
  Pledgeshield Bolton, Belmaid/Maid, Fae Cairns, partners, Last Breath,
  Congo, Stalker's Way, and Chaos Weapons/Telogrus/Mithros.
- Rechecked embedded line breaks, runtime markers, variables, and checked
  values; no structural discrepancy was found in the batch.
- Pre-edit CSV SHA-256:
  `71ec16a797ee214a868b8510de6ce9d4239f065445fbc1b75dfc19eac1e8432d`.
- Post-edit CSV SHA-256:
  `72de66d4c484b838c241f0a02bf969436477e8bbd4ce663ecc18eb82678ba35c`.
  Byte comparison against the backup confirms only IDs 59553, 59563, and
  59600 changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings,
  and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59551/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `71ec16a797ee214a868b8510de6ce9d4239f065445fbc1b75dfc19eac1e8432d`).

D-17854 through D-17856 record three accepted corrections, D-17857 records
11 uncertain findings, and D-17858 records the remaining 37 `not an issue`
IDs. Direct register totals: 1,738 accepted, 13,302 `not an issue`, and
11,339 uncertain (26,379 total); next D-17859.

Resume at `default` ID 59601; 5,534 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
