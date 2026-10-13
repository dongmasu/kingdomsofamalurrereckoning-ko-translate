# Combined `base` + `affix` Review: Round 8

- Review date: 2026-10-09
- Scope: `base` IDs 700-799 (100 rows) and all 60 target variants under
  `affix` IDs 70-79.
- Compared English meaning, Japanese source forms, active Korean, Chinese
  supporting evidence, and existing preliminary reports.
- Slot-aware linguistic check only; no item-specific base/affix pairing or
  runtime-rendered complete item name was verified.
- Read-only; no translation CSV was edited. Findings remain preliminary.

## `affix` IDs 70-79

Japanese `オブ` marks postposed constructions at IDs 70, 71, 77, and 79.
Review the Korean in that suffix slot; Japanese helps establish structure,
while English remains the meaning authority.

| ID | English | Japanese | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- | --- |
| 70 | `of Prophecy` | `オブ プロフェシー` | `예언의` | Postposed genitive may dangle after the base. Check whether Prophecy is a named effect/title and test a compact property label in the full name. |
| 71 | `of Accuracy` | `オブ アキュレシー` | `정확도의` | Postposed genitive. Check the intended game stat and whether the complete Korean name needs a stat/property label rather than a stranded `의`. |
| 72 | `Recruit` | `採用する:` | `모집하기:` | Colon-marked action/UI fragment, not an ordinary item modifier; retain the command and target relation in the surrounding prompt. |
| 73 | `Paragon's` | `パラゴンズ` | `파라곤의` | Possessive fragment. Determine whether Paragon is a rank/title or generic epithet, and check the whole-name relation. |
| 74 | `Jolting` | `ジョルティング` | `충격을 주는` | Relative-clause wording may be too sentence-like as an item modifier; confirm the electrical effect and use a register suited to the base name. |
| 75 | `Conqueror's` | `コンカラーズ` | `정복자의` | Possessive fragment. Check whether Conqueror is a named rank/title and whether the postposed genitive reads as a complete item name. |
| 76 | `Steel` | `スティール` | `강철` | Check as a material modifier in its actual slot and keep material naming consistent with related equipment. |
| 77 | `of Radiance` | `オブ ラディアンス` | `광휘의` | Postposed genitive. Verify the radiance/light effect and avoid approving the isolated form without its base. |
| 78 | `Entropic` | `Entropic` | `엔트로피의` | Korean adds genitive `의` to an English adjective. Confirm the intended entropy-related effect and test an adjective/property form in the complete name. |
| 79 | `of Bloodshed` | `オブ ブラッドシェッド` | `유혈의` | Postposed genitive. Preserve the violent effect/name sense while checking that the assembled Korean phrase is complete and natural. |

All 60 target rows (six variants per ID) were checked. Variant multiplicity is
unchanged.

## `base` IDs 700-799

| ID | English | Current Korean | Follow-up |
| ---: | --- | --- | --- |
| 711 | `The Chantry` | `예배당` | Confirm whether this is a generic chapel or a named religious institution; retain its proper-name status if the surrounding lore supports it. |
| 721 | `Improved Displacing Trim` | `개량된 변위 장식` | Recheck the item-property term `Displacing` against its effect and related `base` ID 102; the current literal `변위` remains opaque without mechanics context. |
| 732 | `Gloves of Sorrow` | `슬픔의 장갑` | Determine whether Sorrow refers to the named House/group or ordinary emotion; Japanese quotes it as a name while the current Korean uses the generic emotional sense. |
| 738 | `Skill Book (Detect Hidden)` | `기술서(은신 감지)` | Align with the official Korean-manual term `숨겨진 물건 찾기`. `은신 감지` changes the skill from finding hidden objects to detecting stealth; retain the UI exception only if separately documented. |
| 748 | `Galvanizing Gem` | `활성화의 보석` | Resolve the effect from the item mechanic and align with `affix` ID 33. English is polysemous; Japanese suggests strengthening and Chinese electrification, while Korean currently chooses activation. |
| 759 | `Children of Erathell Boots` | `에라셀의 후예 장화` | Keep the named group and footwear relation clear; align the collective `Children` rendering and `Erathell` spelling with ID 575 and other corpus occurrences. |
| 763 | `Rathir Tavern` | `라시르(Rathir) 선술집` | Align the city form with recurring entries such as `default` ID 125 (`라시어`); the mismatch is corpus-wide, not resolved by this row alone. |
| 787 | `Greaters Pilager's Hilt` | `상급 약탈자의 칼자루` | Preserve the source's apparent `Pilager's` typo and confirm whether the intended role is `Pillager`; do not silently normalize the English-key anomaly. |

Other rows received a combined-name reading. Existing preliminary concerns at
IDs 721, 738, 748, and 763 were rechecked and remain open; they are not
independent approval findings.

## Status and Resume

This round reviewed 100 additional `base` rows and 60 additional `affix`
variants. Cumulative expanded follow-up coverage is 800/4,844 `base` rows and
465/3,451 `affix` variants (1,265/8,295 combined rows/variants). The original
73,430/73,430 first-pass coverage is unchanged. Resume with `base` IDs
800-899 and `affix` IDs 80-89.

The inspected loot/item-set assets are opaque binaries, and no human-readable
item-specific pairing table was identified. Attachment comments therefore
describe likely source slots and Korean grammar, not verified in-game
combinations.
