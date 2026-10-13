# Combined `base` + `affix` Review: Round 7

- Review date: 2026-10-09
- Scope: `base` IDs 600-699 (100 rows) and all 60 target variants under
  `affix` IDs 60-69.
- Compared English meaning, Japanese source forms, active Korean, Chinese
  supporting evidence, and existing preliminary reports.
- Slot-aware linguistic check only; no item-specific base/affix pairing or
  runtime-rendered complete item name was verified.
- Read-only. No translation CSV was edited.
- Preliminary follow-up only; findings are not final corrections or approval.

## `affix` IDs 60-69

Japanese confirms a postposed `オブ` structure for IDs 64 and 67. Other
English adjectives or possessives also need their actual Korean slot checked.

| ID | English | Japanese | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- | --- |
| 60 | `Putrefied` | `ピュートリファイド` | `부패한` | Confirm whether the item effect means putrefied/rotted rather than general corruption; check the descriptive modifier register with a base name. |
| 61 | `Student's` | `スチューデンツ` | `학생의` | Possessive fragment may leave a dangling genitive after the base; determine whether Student is a named role/group or generic owner. |
| 62 | `Fortified` | `フォーティファイド` | `강화된` | Check as an attached equipment modifier and distinguish reinforcement from a specific fortified effect. |
| 63 | `[Sealed]` | `[封印された]` | `[봉인됨]` | Preserve the square-bracket status wrapper as well as the sealed state; verify whether the game renders this as a prefix or a separate status label. |
| 64 | `of Skill` | `オブ スキル` | `기술의` | Postposed phrase. A bare genitive after a base name is awkward; test a compact skill-property label in a complete name. |
| 65 | `Frigid` | `フリジッド` | `혹한의` | English is an adjective but Korean is genitive. Check a direct adjective/property modifier that fits the actual slot. |
| 66 | `Uniting` | `ユナイティング` | `결속하는` | The relative-clause form may read as an unfinished sentence when attached; check the item effect and a concise modifier form. |
| 67 | `of Flurry` | `オブ フラーリー` | `질풍의` | Postposed phrase. Verify whether Flurry is a named effect and avoid a trailing genitive that does not resolve in the complete Korean item name. |
| 68 | `Silk` | `シルク` | `비단` | Check as a material modifier before the base name and retain consistent material terminology. |
| 69 | `broken` | `壊れた` | `부서진` | Meaning is plausible; verify whether this is a damage state or named item-quality label and keep its register consistent with other quality modifiers. |

All 60 target rows (six variants per ID) were checked. Variant multiplicity is
unchanged.

## `base` IDs 600-699

| ID | English | Current Korean | Follow-up |
| ---: | --- | --- | --- |
| 616 | `the Archsage's Dreamworld` | `대현자의 꿈세계` | Preserve the Archsage's named realm and check spacing/readability; the current compound can be read as one coined noun rather than “dream world.” |
| 621 | `House of Ballads` | `발라드 가문` | Keep the faction identity, but align the House/가문/집/전당 policy with its repeated corpus forms; prior audits document material variation. |
| 629 | `List of the Executed` | `처형자 명단` | English means people who were executed; Korean `처형자` can instead mean executioner. Chinese supports a list of those executed, while Japanese is less decisive. Check the item/document context and distinguish the victims from the executioners. |
| 644 | `Chainmail Brace` | `사슬 갑옷 버팀대` | Recheck the equipment type. Chinese says chainmail wrist guard, whereas the Korean support/brace reading sounds like a structural prop; confirm against the item model or UI context. |
| 646 | `Diden Stone` | `디든(Diden)의 돌` | Preserve the proper-name identity and align its Korean/English parenthetical treatment with related named stones and items. |
| 648 | `Statue of Amman in Summer` | `여름의 아만(Amman) 석상` | Check the attachment of the seasonal phrase and retain Amman's identity; compare the completed item-title reading with Japanese and Chinese. |

The rest of the 100 base rows received a combined-name reading. Existing
findings for `House of Ballads` and `Chainmail Brace` are carried forward as
open questions, not treated as approved corrections.

## Status and Resume

This round reviewed 100 additional `base` rows and 60 additional `affix`
variants. Cumulative expanded follow-up coverage is 700/4,844 `base` rows and
405/3,451 `affix` variants (1,105/8,295 combined rows/variants). The original
73,430/73,430 first-pass coverage is unchanged. Resume with `base` IDs
700-799 and `affix` IDs 70-79.

The inspected loot/item-set assets are opaque binaries, and no human-readable
item-specific pairing table was identified. Attachment comments therefore
describe likely source slots and Korean grammar, not verified in-game
combinations.
