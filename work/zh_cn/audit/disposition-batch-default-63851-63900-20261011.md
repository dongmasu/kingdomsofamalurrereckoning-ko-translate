# Disposition Batch: `default` IDs 63851-63900

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- One accepted targeted correction, 35 `not an issue` IDs, and 14 uncertain
  IDs. These are working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18093 | 63852 | `제대로 손질하면 이 기묘한 진홍색 뿌리가 거의 모든 물약에 추가 {*3힘}을 더해 준다.` | `제대로 손질하면 이 기묘한 진홍색 뿌리는 거의 모든 물약에 {*3힘}을 보탤 수 있다.` | English/Japanese/Chinese say the root can lend additional Power to a potion. Preserve `{*3힘}` while removing the doubled “additional/add” wording and retaining the ability meaning. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18094 | 63851 | The English deed's final clause is malformed; Japanese says the owner becomes part of Adessa, Chinese mentions services, and Korean follows the latter. The benefit's legal meaning is unresolved. |
| D-18094 | 63854 | Keepers of the Crossing may be a formal group name or a descriptive role; the three locale readings do not settle the canonical Korean form. |
| D-18094 | 63855 | The scholar and city are identified, but locale transliterations differ and the English article before the name is awkward. |
| D-18094 | 63856 | `Adept` may be a formal rank/class or generic proficiency label; Korean uses the general `숙련자`. |
| D-18094 | 63858 | `Silkfarmer` may refer to silkworm/silk cultivation or collection; Japanese/Chinese say silk worker while Korean's `비단 농부` may imply crop farming. |
| D-18094 | 63864 | `Missives` may be a named document set; Korean's generic `서한들` is understandable but the item/category identity remains open. |
| D-18094 | 63868 | All locales preserve three `{*1...}` labels and `{LINE_SPACE}`, but Korean orders the localized inventory and housing labels differently from English/Japanese. Keep the order pending label-to-marker confirmation. |
| D-18094 | 63871 | `Hall of the Firstsworn` is retained as a bilingual proper name, but the project's canonical Korean group/hall form is unsettled. |
| D-18094 | 63873 | The single-line formal death notice and “your ward” relation are preserved; several names and the Varlaine/Klurikon spellings need glossary review. |
| D-18094 | 63877 | English `blight of winter` is metaphorical; Japanese says a winter tyrant and Chinese a destructive winter force. Korean's `겨울의 역병` is plausible but not settled. |
| D-18094 | 63884 | The death, twelve-day timeline, walking staff, and return objective are retained; locale proper-name spellings and the walking staff term need consistency review. |
| D-18094 | 63886 | The Barghest training/food sequence is preserved; character/place transliterations and whether `beast master` is a formal title remain provisional. |
| D-18094 | 63892 | English capitalizes `Godstorm`; Japanese/Chinese translate it as a divine storm while Korean transliterates it. Confirm whether it is a proper entity/name. |
| D-18094 | 63895 | English says `Testament`, but Japanese/Chinese say Belen Covenant. Korean follows the English reading and prior provisional decision; source conflict remains unresolved. |

## Not an Issue

Decision D-18095 records these 35 IDs: 63853, 63857, 63859-63863,
63865-63867, 63869-63870, 63872, 63874-63876, 63878-63880, 63881-63883,
63885, 63887-63891, 63893-63894, 63896-63897, and 63898-63900. They
preserve available meaning, voice, labels, values, and structure. ID 63869
renders the apparent `devlish` typo without changing the meaning; ID 63887's
military-rank reading is supported by Japanese and Chinese; ID 63897 retains
the paid request to make the vagrants leave without strengthening it to
killing them.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63851-63900 once,
  in identical ascending order.
- Embedded newline counts match for every row; ID 63851 retains two
  paragraph breaks and the formal notice at 63873 remains a single line.
- ID 63852 retains the `{*3...}` marker. ID 63868 retains all three
  `{*1...}` spans and `{LINE_SPACE}`; its localized-label ordering question
  remains open. No numeric-value differences were detected.
- Rechecked historical questions for the deed, `Adept`, silkfarmer,
  localized stash/inventory/housing labels, Firstsworn Hall, the death
  notice, Godstorm, Testament/Belen, and Beggar's Bluff.
- Pre-edit CSV SHA-256:
  `895fc78f57c832036eda6744f53fab18b60fa2a44aece2ac5d8d5a290200e7c0`.
  Post-edit CSV SHA-256:
  `fe9c6eb731f331c3f1b12fb4fac7f1054a5cfc48426f327242832c183f892595`.
  Byte-level comparison against the batch-start backup confirmed that only
  the `Texto` field at ID 63852 changed. The UTF-8 BOM, 65,135 records, key
  order, embedded lineation, and outer CRLF record separators are preserved.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63851/locatexts_zh_cn.koalocatext_default.csv`.
- D-18093 records one accepted correction, D-18094 records 14 uncertain
  findings, and D-18095 records 35 `not an issue` IDs. Totals at D-18095:
  1,823 accepted, 16,332 `not an issue`, and 12,550 uncertain (30,705
  dispositions); next D-18096.

Resume at `default` ID 63901; 1,234 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
