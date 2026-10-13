# Combined `base` + `affix` Review: Round 5

- Review date: 2026-10-09
- Scope: `base` IDs 400-499 (100 rows) and `affix` IDs 40-49 (45 target
  variants; IDs 40, 42, and 43 have one variant each).
- Compared English meaning, Japanese source forms, active Korean, Chinese
  supporting evidence, and existing preliminary reports.
- Read-only. No translation CSV was edited.
- Preliminary follow-up only; findings are not final corrections or approval.

## `affix` IDs 40-49

Japanese `オブ` forms confirm postposed English constructions at IDs 44 and
46. Their Korean must work after a complete base name, not merely read well as
standalone genitives.

| ID | English | Japanese | Current Korean | Combined-name follow-up |
| ---: | --- | --- | --- | --- |
| 40 | `Board the Chimera` | `キメラに乗船する` | `키메라호에 승선하기` | Action/UI fragment, not an item modifier; preserve its command-like function in the surrounding prompt. |
| 41 | `Starched` | `スターチド` | `풀 먹인` | Check as a preposed material/finish modifier; Korean is descriptive rather than transliterated and should retain the same register as adjacent item names. |
| 42 | `Enter` | `入る` | `들어가기` | Action/UI fragment, not an item modifier. |
| 43 | `Mitharan Ebony` | `ミサールのエボニー` | `미사란 흑단` | Recheck the `Mitharan`/Mitharu relationship against the official Korean name and related item names; Japanese and Chinese point to Mitharu-derived ebony. |
| 44 | `of Cold` | `オブ コールド` | `냉기의` | Postposed phrase. Appending `냉기의` to a base name leaves a dangling genitive. Test a compact suffix such as a cold-property label against actual complete names; do not approve a standalone phrase without the assembled result. |
| 45 | `Lord's` | `Lord's` | `군주의` | Possessive fragment. Verify the referent and full-name relation; a trailing genitive may sound incomplete after a base item. |
| 46 | `of Lightning Shield` | `オブ ライトニングシールド` | `번개 방패의` | Postposed phrase. Appending this genitive to the base is structurally awkward. Check a compact effect/category label in full names while retaining the shield effect. |
| 47 | `QAnium` | `クアニウム` | `QAnium` | Preserve the material/name spelling provisionally; verify whether this is an intentional in-world material label and how it attaches to Korean base names. |
| 48 | `Entrance to` | `入口:` | `입구:` | Fragment with a colon, not an ordinary item modifier; retain the relation to the following destination in the full UI string. |
| 49 | `Brilliant` | `ブリリアント` | `눈부신` | Check as a preposed quality modifier and ensure the descriptive register fits the base item. |

The 45 target rows, including all six variants where present, were checked.
No variant was removed or merged.

## `base` IDs 400-499

| ID | English | Current Korean | Follow-up |
| ---: | --- | --- | --- |
| 403 | `Dokkalfar Shadowgrips` | `도칼파르(Dokkalfar)의 그림자 손잡이` | Use the official Korean-manual form `도크알브` unless a documented exception applies; retain the equipment identity and check the complete name if an affix is attached. |
| 422 | `Gold Shock Guard` | `금빛 전격 수호자` | Recheck the compound and equipment category. The Korean ending `수호자` denotes a person/guardian, while the source and Japanese `ショックガード` indicate an item or protective component. |
| 432 | `Faer Gorta Vial` | `페어 고르타(Faer Gorta)의 약병` | Keep the creature/item relation clear and reconcile the `Faer`/`Fear Gorta` spelling difference with related entries before standardizing the proper name. |
| 440 | `Kite Shield` | `연 방패` | Recheck the conventional Korean name for this shield shape; `연 방패` can be mistaken for a shield associated with a flying kite. |
| 482 | `Skill Book (Mercantile)` | `기술서(상업)` | Use the official-manual skill name `상술` for `Mercantile`, absent a documented UI exception. |
| 494 | `Scuttler` | `스커틀러(Scuttler)` | Keep the English identity traceable while resolving the material source conflict: English says `Scuttler`, Japanese says “emergency escape,” and Chinese says “porthole.” Do not silently replace the source name based on one locale. |

Names not listed above received a combined-name reading. English remains the
meaning authority; Japanese helps with affix slot and item structure; Chinese
is supporting evidence. Parenthetical English is evaluated for the complete
name, not added mechanically to every base or affix.

## Status and Resume

This round reviewed 100 additional `base` rows and 45 additional `affix`
variants. Cumulative expanded follow-up coverage is 500/4,844 `base` rows and
285/3,451 `affix` variants (785/8,295 combined rows/variants). The original
73,430/73,430 first-pass coverage is unchanged. Resume with `base` IDs
500-599 and `affix` IDs 50-59.
