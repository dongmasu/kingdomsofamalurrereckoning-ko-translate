# Combined `base` + `affix` Review: Round 2

- Review date: 2026-10-09
- Scope: `base` IDs 100-199 (100 rows) and `affix` IDs 10-19 (60 target
  variants).
- Compared English meaning, Japanese source forms, active Korean, and the
  existing preliminary findings; Chinese was supporting evidence.
- Read-only. No translation CSV was edited.
- Preliminary follow-up only; no final corrections approved.

## `affix` IDs 10-19

Japanese forms help distinguish transliterated modifiers from `オブ`
postposed phrases and action fragments. The Korean must still be checked in
its actual prefix/suffix/UI slot.

| ID | English | Japanese | Current Korean | Follow-up |
| ---: | --- | --- | --- | --- |
| 10 | `Dig for` | `掘る:` | `캐기:` | Preserve the following target relation and verify the full UI prompt. |
| 11 | `Braced` | `ブレイスド` | `보강된` | Check as a preposed item modifier; wording may be serviceable, but the complete item name decides tone and naturalness. |
| 12 | `Crushing` | `クラッシング` | `분쇄의` | The Korean currently matches ID 17, although the English/Japanese distinguish `Crushing` from `Sundering`. Resolve the effect meaning and prefix form; do not conflate the two modifiers. |
| 13 | `Approach` | `近づく:` | `접근:` | Keep as a UI/action fragment and verify its following object/target. |
| 14 | `of Providence` | `オブ プロヴィデンス` | `섭리의` | Source marks a postposed phrase. Test its Korean form after a base noun rather than approving the standalone genitive. |
| 15 | `Overwhelming` | `オーバーウェルミング` | `압도적인` | Check in the preposed modifier slot and keep its register consistent with the base item name. |
| 16 | `of Wealth` | `オブ ウェルス` | `부의` | Source marks a postposed phrase; check whether the assembled name reads naturally and whether `wealth` has the intended game sense. |
| 17 | `of Sundering` | `オブ サンダリング` | `분쇄의` | Korean duplicates ID 12's rendering. Japanese transliterations differ (`クラッシング` vs. `サンダリング`), so preserve the English distinction and inspect the suffix composition. |
| 18 | `Fill amphora with` | `アンフォラを満たす:` | `암포라에 채우기:` | Verify how the chosen contents follow the command; the fragment needs its complete UI string. |
| 19 | `Serrated` | `セラテッド` | `톱니 모양의` | Check as a preposed item modifier; retain the serrated edge meaning without making the full title cumbersome. |

All six active Korean variants for each ID repeat the same text. Their keys
and multiplicity remain intact.

## `base` IDs 100-199

The existing source-keyed first-pass issues were reopened with emphasis on
item type, proper-name identity, and how item modifiers affect the complete
name:

| ID | English | Current Korean | Follow-up |
| ---: | --- | --- | --- |
| 102 | `Improved Displacing Lining` | `개량된 변위 안감` | Japanese transliterates `Displacing`; check the actual lining effect and use a Korean equipment modifier that is both accurate and natural. |
| 109 | `Belne's Staff of Ire` | `벨른(Belne)의 분노의 지팡이` | Recheck the stacked possessive and whether `Ire` is a named property. Preserve Belne's name and the staff/effect relation in a coherent item-title form. |
| 121 | `The Luminary Leaf` | `빛의 잎` | Japanese transliterates the full title (`ルミナリーリーフ`); Korean may flatten a named object into a descriptive “leaf of light.” Resolve its identity before settling the name. |
| 153 | `Silkfarmer Remains` | `비단 농부의 유해` | Japanese describes a silk picker/gatherer, not an ordinary crop farmer. Recheck the occupation term and preserve that meaning in the item label. |
| 160 | `Master-at-Arms Giri Urdur's Journal` | `무기 담당관 기리 우르두르(Giri Urdur)의 일지` | The role is context-dependent across references. Keep the character and journal relation clear; do not let a literal office label distort the proper-name entry. |

These are candidates/questions, not approved replacement strings. Proper-name
parentheses remain a whole-name decision and must be checked against how an
affix attaches.

## Status and Resume

This round reviewed 100 additional `base` rows and 60 additional `affix`
variants under the combined-name standard. Cumulative expanded follow-up
coverage is 200/4,844 `base` rows and 120/3,451 `affix` variants. The original
73,430/73,430 first-pass coverage is unchanged. Resume with `base` IDs
200-299 and `affix` IDs 20-29.
