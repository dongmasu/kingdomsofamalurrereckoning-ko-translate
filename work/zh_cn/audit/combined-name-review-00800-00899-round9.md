# Combined `base` + `affix` Review: Round 9

- Review date: 2026-10-09
- Scope: `base` IDs 800-899 (100 rows) and all 55 target variants under
  `affix` IDs 80-89; ID 84 has one variant, the other IDs have six each.
- Compared English meaning, Japanese source forms, active Korean, Chinese
  supporting evidence, and existing preliminary reports.
- Slot-aware linguistic check only; no item-specific base/affix pairing or
  runtime-rendered complete item name was verified.
- Read-only; no translation CSV was edited. Findings remain preliminary.

## `affix` IDs 80-89

| ID | English | Japanese | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- | --- |
| 80 | `Frosted` | `フロステッド` | `서리 내린` | Check as a concise preposed item-quality/material modifier; preserve the distinction between frosted and frost-enchanted effects. |
| 81 | `Master's` | `マスターズ` | `장인의` | The possessive may not naturally attach in the actual slot. Confirm whether `Master` is a crafting tier/title or an owner before deciding between a tier modifier and possession. |
| 82 | `Staunch` | `ストーンチ` | `확고한` | Check the intended equipment effect and whether the descriptive adjective fits the base item register. |
| 83 | `Arctic` | `アークティック` | `북극의` | English is an adjective; Korean's genitive may read as geographical possession. Verify the cold-property sense and a natural modifier form. |
| 84 | `Activate` | `起動` | `활성화:` | Single-variant, colon-marked action fragment. Existing preliminary review notes that an imperative may be required; the full following UI text determines the construction. |
| 85 | `Fundamental` | `Fundamental` | `근본적인` | Check as a concise item-tier/property adjective rather than approving a sentence-like descriptive form in isolation. |
| 86 | `Reweave` | `編み直す:` | `다시 짜기:` | Action/UI fragment, not a normal item modifier. Preserve the colon and verify the full command/target wording. |
| 87 | `Major` | `メジャー` | `주요한` | Verify whether `Major` means a large/major effect tier; the current “principal/important” adjective may not fit a generated item quality. |
| 88 | `Ebony` | `エボニー` | `흑단` | Check as a material modifier and keep the wood/material sense consistent with `base` names such as `Ebony Limb`. |
| 89 | `Harvested` | `収穫した` | `수확된` | Check whether this modifies a harvested material or an item produced by harvesting; retain a concise item-name register. |

All 55 target rows, including all six variants where present, were checked.
Variant multiplicity is unchanged.

## `base` IDs 800-899

| ID | English | Current Korean | Follow-up |
| ---: | --- | --- | --- |
| 802 | `Forged from elements ...` | `혼돈의 영역에서만 발견되는 원소로 벼려낸 ...` | This row is a full item description, not a composable item name. It was checked for scope and meaning but should not be counted as an affix-attached title. |
| 810 | `Cuirass of Bolgans' Bane` | `볼건(Bolgans)의 파멸 흉갑` | Preserve whether the cuirass is the bane of the Bolgans or belongs to a named “Bolgans' Bane” effect; the current Korean attachment can obscure that relation. |
| 815 | `Gem of Haven` | `안식처의 보석` | English, Japanese, and Chinese disagree on Haven's sense (refuge, heaven, harbor); keep the item interpretation open until context resolves it. |
| 828 | `Upper Houses` | `상층 주거지` | English and Chinese may refer to an upper district/housing area, while Japanese says upper floor. Korean's district reading is plausible but context-dependent. |
| 829 | `Leather Brace` | `가죽 버팀대` | Recheck the equipment category against `Chainmail Brace` at ID 644; Chinese supports a wrist/arm guard rather than a structural brace. |
| 845 | `Sword of the Bolgan King` | `볼건 왕의 검` | Align `Bolgan` with the corpus form `볼간` used at `default` ID 208; preserve the king's possessive relation. |
| 861 | `Contract (Sealed)` | `계약서(봉인됨)` | Check the status-label wording and punctuation against the separate bracketed `[Sealed]` affix; do not assume those wrappers are structurally interchangeable. |
| 869 | `House of Vengeance` | `복수의 집` | Confirm this is the named faction and align `House` with the project's competing `가문`/`집`/`전당` forms, including `House of Ballads`. |
| 871 | `The Running Man Boots` | `달리는 사나이의 장화` | Determine whether `The Running Man` is a named title/item identity rather than a generic running man; check how it reads with the equipment noun. |
| 876 | `Gem of Tempest's Vengeance` | `폭풍의 복수 보석` | Recheck the nested relation among gem, Tempest, and Vengeance; the Korean sequence can read as a loose noun stack rather than one coherent item title. |
| 896 | `against traps` | `함정 방어` | This is a lowercase fragment/stat label rather than an ordinary named item; verify its UI context and avoid forcing a title-style translation. |

Other base rows received a combined-name reading. Existing questions at IDs
815, 828, 829, and 845 remain open and preliminary.

## Status and Resume

This round reviewed 100 additional `base` rows and 55 additional `affix`
variants. Cumulative expanded follow-up coverage is 900/4,844 `base` rows and
520/3,451 `affix` variants (1,420/8,295 combined rows/variants). The original
73,430/73,430 first-pass coverage is unchanged. Resume with `base` IDs
900-999 and `affix` IDs 90-99.

The inspected loot/item-set assets are opaque binaries, and no human-readable
item-specific pairing table was identified. Attachment comments therefore
describe likely source slots and Korean grammar, not verified in-game
combinations.
