# Disposition Batch: `default` IDs 63251-63300

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Three accepted targeted corrections, 33 `not an issue` IDs, and 17
  uncertain IDs. Accepted IDs 63284, 63297, and 63299 retain separate
  context/terminology questions. These are working dispositions, not
  independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18060 | 63284 | `제11장: 주춧돌` | `제11장: 쐐기돌` | A keystone is the locking stone at the top of an arch, not a foundation stone; Chinese also uses the arch-keystone sense. |
| D-18060 | 63297 | `... 물약을 만들 때 필요한 ... 물약을 만드는 데 말이지요.` | `{*1레시피}에는 물약 제조에 필요한 {*1연금술 시약}이 나와 있습니다. 이 시약으로 {*1물약}을 만듭니다.` | Remove the repeated “make a potion” construction while retaining all three localized runtime markers in their original order. |
| D-18060 | 63299 | `폐하를 더는 얕볼 수 없을 것이다.` | `그 위엄은 더는 간과되지 않을 것이다.` | `Overlooked` means ignored/not noticed here, not underestimated; Japanese supports the sense that her majesty is apparent to everyone. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18061 | 63252 | Myria, Apotyre, and Motus Mining are retained; “city boy” tone and the company's `cut their losses` departure need context. |
| D-18061 | 63253 | The Scholia Arcana base and speaker's duty are retained; scale/name terminology and `town` versus `city` remain open. |
| D-18061 | 63254 | English/Chinese/Korean agree that the addressee should go first; Japanese instead says the addressee will die. Do not resolve without scene evidence. |
| D-18061 | 63255 | The two-step formation and protection of vanguard scouts are retained; the shield/redoubt tactical metaphor needs context. |
| D-18061 | 63258 | Lobby failure and unknown error are clear; the English typo does not affect meaning, but exact UI wording is unverified. |
| D-18061 | 63261 | The pay/glory contrast and lurking enemies are retained; the referent of `them` and compressed payment phrase need context. |
| D-18061 | 63264 | Distance-related weakening and mortal-aging comparison are retained; speaker identity and precise weakening remain unknown. |
| D-18061 | 63269 | The returned item's asking price, sarcastic payment, and curse are retained; the item/transaction differs among locales and needs context. |
| D-18061 | 63270 | Gem assistance and reluctance are retained; exact socketing/service terminology is not established. |
| D-18061 | 63275 | Refusal and the forced solo next Arena match are retained; Champion/Arena terminology and sequence need context. |
| D-18061 | 63277 | The abrupt reversal follows English/Chinese/Korean; Japanese supplies a materially different “dead before” reading. |
| D-18061 | 63284 | The Crownhold/Codex inscription, essences, and lineation are retained; lore terms and some poem relations remain open after the heading correction. |
| D-18061 | 63287 | The service offer is retained; `sagecrafter` has competing locale readings, though Korean follows the official-manual Sagecraft term. |
| D-18061 | 63292 | Returning `them` to the Mission is retained; English does not identify the items or whether Mission is an institution, and locales differ. |
| D-18061 | 63297 | Recipe, reagent, and potion labels remain localized in marker order; canonical UI terms and the sentence's game context need review. |
| D-18061 | 63298 | The gate closure and suspicious timing are retained; St. Odwig's Mission may be a religious site, and the scene's implication is unknown. |
| D-18061 | 63299 | The corrected ignored/noticed sense is clearer; `Her majesty` may still be a formal title or a reference to personal majesty. |

## Not an Issue

Decision D-18062 records these 33 IDs: 63251, 63256-63257, 63259-63260,
63262-63263, 63265-63268, 63271-63274, 63276, 63278-63283, 63285-63286,
63288-63291, 63293-63296, and 63300. These rows preserve available meaning,
voice, labels, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63251-63300 once,
  in identical ascending order.
- Embedded newline counts match for all rows, including the Crownhold
  inscription at 63284. The three `{*1...}` markers at 63297 remain in
  source order.
- Rechecked historical questions for Myria/Motus Mining, Scholia Arcana,
  shield/redoubt, the trial chamber, lobby error, Khamazandu, Rhewani,
  asking price, gem service, Belne, Fate bonus, Arena solo match, Crownhold/
  Codex/Quarternion, Sagecrafter, Might/Greatsword, Mission, recipe markers,
  St. Odwig's Mission, and the Emerald Lady.
- Pre-edit CSV SHA-256:
  `22faef0c11927e4da293b3edf3ad588bc6f943f13a800f37ba38d346b1653c5a`.
  Post-edit SHA-256:
  `b2169931722da4058acb1b2c94f54d4e7bd87ba59e6fdb41d786f5555ffa381c`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` fields at IDs 63284, 63297, and 63299 changed. The UTF-8 BOM,
  record count, key order, inscription lineation, runtime markers, and outer
  record separators are preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63251/locatexts_zh_cn.koalocatext_default.csv`.
- D-18060 records three accepted corrections, D-18061 records 17 uncertain
  findings (three overlap accepted IDs), and D-18062 records 33
  `not an issue` IDs. Corrected direct register totals: 1,812 accepted,
  15,921 `not an issue`, and 12,370 uncertain (30,103 dispositions total); next
  D-18063.

Resume at `default` ID 63301; 1,834 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
