# Combined `base` + `affix` Disposition: Round 12

- Date: 2026-10-11
- Scope: `base` IDs 1100-1199 and all six active Korean variants for
  `affix` IDs 110-119.
- English determines meaning; Japanese informs voice and affix structure;
  Chinese is supporting evidence. Existing preliminary reports and accepted
  terminology decisions were checked by exact ID.
- These are working dispositions, not independent final linguistic approval.
  No runtime base/affix pairing or rendered complete name has been verified.

## Accepted `base` Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18164 | 1122 | `료살파르(Ljosalfar) 목걸이` | `료스알브(Ljosalfar) 목걸이` | The official Korean manual and accepted D-050 establish `Ljosalfar = 료스알브`; change only the conflicting name form. |
| D-18165 | 1187 | `하드윈(Hadwyn)의 미타루(Mitharu) 성소` | `하드윈(Hadwyn)의 미사루(Mitharu) 성소` | The official Korean manual and accepted D-152 establish `Mitharu = 미사루`; preserve the name, relation, and shrine noun. |

## Uncertain `base` Findings

| Decision | ID(s) | Finding |
| --- | --- | --- |
| D-18166 | 1102 | `Imminent Gloves` is literally rendered as `임박한 장갑`; the item/effect sense and a natural Korean modifier cannot be established from the isolated row. |
| D-18167 | 1132 | `Scion` may be a formal office/title rather than a generic descendant; retain `후손` pending lore context and terminology alignment. |
| D-18168 | 1155, 1159, 1164, 1181 | The source consistently uses `Bindings`, but the equipment/crafting component and Korean `결속구` construction are not established by the isolated names. |
| D-18169 | 1163 | `Warding String` may be a bowstring or another string/material; Korean `활시위` commits to the bowstring reading without inventory context. |
| D-18170 | 1179 | `Master Flameguard` may name an item/effect or describe a defensive property; the Korean category and tier relation remain unresolved. |
| D-18171 | 1199 | `Gallows End` has competing corpus spellings. Do not normalize this occurrence separately from the corpus-wide place-name decision. |

## `affix` Findings

| Decision | ID(s) / variants | Disposition | Rationale |
| --- | --- | --- | --- |
| D-18172 | 112 / 11, 12, 14, 21, 22, 24 | uncertain | English `Examine the grave of` and the colon-marked UI fragment leave a following-name relation. The Korean `무덤 조사하기:` follows the action sense, but the complete UI assembly order is unavailable. |
| D-18173 | 115 / 11, 12, 14, 21, 22, 24 | uncertain | `of the Reckoned` has judgment/recompense readings across the locales; the exact in-world title/effect and a safe Korean postposed form are not established. The five Chinese-only keys are also the fallback keys listed under D-18173. |
| D-18174 | 116 / 11, 12, 14, 21, 22, 24 | uncertain | `of Phasing` plausibly refers to phase shifting, but the game effect and Korean `위상 변화의` construction need item context. |
| D-18175 | 117 / 11, 12, 14, 21, 22, 24 | uncertain | `Fortune's` may mean luck, fate, or the named Fortune; the Korean `행운의` cannot be confirmed without its item/effect context. The five Chinese-only keys are also the fallback keys listed under D-18175. |
| D-18176 | 110, 111, 113, 114, 118, 119 / all six variants each | not an issue | Current Korean retains the evident possessive, clarity/plenty/preservation, sentinel, and shattering senses. No specific defect is established by the slot-aware comparison. |

## Remaining `base` Rows

D-18177 records the other 89 IDs in 1100-1199 as `not an issue` for this
combined-name pass: the current wording preserves the available source
meaning, and no additional actionable defect was established. This set is
all IDs in the range except 1102, 1122, 1132, 1155, 1159, 1163, 1164, 1179,
1181, 1187, and 1199. The accepted corrections above do not settle unrelated
name, equipment-category, or global terminology questions.

## Coverage and Structure

- This is round 12 of the targeted combined-name reread, not a repeated
  first-pass scan. Rounds 1-12 cover `base` IDs 0-1199 (1,200/4,844 rows)
  and `affix` IDs 0-119 (700/3,451 variants).
- The English, Japanese source, Japanese-derived Korean draft, Chinese
  source, and active Korean `base` files each contain the same 4,844 unique,
  ascending `(ID_Linha, Tipo_Variante)` keys. All 100 target IDs occur once
  in each file.
- Active Korean `affix` IDs 110-119 and Chinese source keys contain all six
  variants per ID, 60 keys total. English supplies one `FF` source row per
  ID. The Japanese source has only variant 11 for IDs 115 and 117; the
  Japanese-derived Korean sibling exists for variant 11, so missing Japanese
  variant keys were not treated as independent source evidence.
- Korean `affix` text is identical across the six variants for each ID.
  No variant rows were added, removed, or reordered.
- The pass reviewed the slot/composition risk only; it did not infer an
  actual `base`/`affix` pairing from matching ID ranges.
- The companion disposition of the 140 Chinese-only fallback keys is in
  [`disposition-affix-extra-variants-20261011.md`](disposition-affix-extra-variants-20261011.md).

## Edit Integrity and Running Counts

- Only the active Korean `base` `Texto` cells at IDs 1122 and 1187 changed.
  The UTF-8 BOM, 4,844 data rows, keys/order, and 4,845 CRLF record endings
  are preserved.
- Pre-edit SHA-256:
  `b02cdeec1640b0fbb89ccd8240961f6b41aad75f9c1c029c057ef5fb5f4a9e3f`.
- Post-edit SHA-256:
  `124bae756b438f4819fbfd71c3f722df07487206514723ab24d0aa4a107a4ca8`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-base-affix-review-1100-1199/locatexts_zh_cn.koalocatext_base.csv`.
- The 140-row fallback inventory has its own byte-identical backup and
  disposition/hash details in the companion report.
- Round 12 plus the fallback disposition adds 2 accepted, 210 `not an issue`,
  and 78 uncertain unique row/key dispositions (290 total); the 10 fallback
  keys for affix IDs 115 and 117 are linked to their existing decisions and
  are not double-counted.
- Combined register totals through D-18179: 1,867 accepted, 17,444
  `not an issue`, and 12,920 uncertain (32,231 total); next D-18180.
  These are cross-resource working totals, not the `default`-only subtotal.

## Resume

Continue the existing slot-aware second pass with `base` IDs 1200-1299 and
`affix` IDs 120-129 (round 13). There are 59 aligned range buckets through
`affix` ID 585; 12 are complete. The base lane completes after 37 more
100-ID batches, while the affix lane continues for 47 more 10-ID batches.
The original first-pass source coverage remains 73,430/73,430; this is a
targeted composition pass, not a repeated full scan.
