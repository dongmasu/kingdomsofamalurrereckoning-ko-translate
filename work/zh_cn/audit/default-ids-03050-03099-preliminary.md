# Preliminary Language Scan: `default` IDs 3050-3099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3050-3099.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked long-form quest
  text, dialogue voice, lore terms, and UI markup.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3056 | ... 아르카디움(Arcadium)의 인간과 알파르(Alfar) 상인들은 ... 병원 구역(Hospitalis Quarters) ... | Reconcile the English source's repeated “their” and the charity/“cheaper custom” phrase with context; verify the proper-name forms and whether `Arcadium` is a district/institution. | English and Japanese identify the Arcadium, while Chinese says arena. Japanese/Chinese also diverge on the Hospitalis Quarters and trade wording. Korean follows the English place name and interprets the request as charity or discounted help; the location and exact commercial arrangement remain open. This repeats the historical question. | Medium |
| 3059 | ... 시종 리릴길드(Page Lilligild)가 내게 주었다. | Confirm whether `Page` is a formal palace role and whether the chain enables conversation with visiting dignitaries or simply identifies the wearer. | English and Chinese retain `Page` as a title/name element; Japanese generalizes it to a servant. Korean interprets it as a court attendant. This repeats the historical question. | Medium |
| 3066 | ... 내가... 어, 한 대 치면 엉엉 울겠지. | Preserve the intentionally broken/comic speech and check whether the boast's short clauses should retain a rhythmic or childlike voice. | English and Japanese both show hesitant, non-native phrasing; Chinese is more explicit about a punch. Korean preserves the hesitation and taunt, but voice/rhythm are context-dependent. This repeats the historical question. | Medium |
| 3069 | 대그랜드 챔피언 | Choose one rendering for `Grand Champion`; avoid the redundant mixed form `대그랜드`. | English and Japanese use the formal competition title; Chinese renders it as overall champion. Korean translates `Grand` with `대` while retaining `그랜드`, producing an awkward hybrid. | High |
| 3076 | `{LINE_LEFT}{*1메인 메뉴}{LINE_LEFT}...` | Keep UI terminology consistent with the game's established labels and independently recheck every indexed label and `LINE_*` marker before any later edit. | The long tutorial contains two indexed labels plus repeated line-position/indent markers. Korean retains the marker sequence and communicates the menu instructions; English casing and Japanese UI labels differ from Korean localization conventions. | Medium |
| 3077 | 그래, 좋은 하루야. | Use a natural Korean greeting rather than a literal “good day”; preserve the brief, casual greeting. | English `Aye, good day` is a greeting, and Japanese/Chinese render it as a conventional hello. Korean's `그래, 좋은 하루야` reads like a statement wishing someone a good day and sounds unnatural in this exchange. | High |
| 3084 | 아직도 우리에게 관심이 있나? 다른 이들이 날 짓누르진 않아. 별로는. | Repair the awkward fragment after `Much`; preserve the dry, self-deprecating understatement and determine what “weigh me down” refers to. | English and Chinese describe the others as not weighing the speaker down “much”; Japanese instead says the speaker is not very concerned with other people. Korean follows the English metaphor but ends with the unnatural fragment `별로는`. | High |
| 3087 | ... 이 지역의 인상적인 석판이 미사란(Mitharan)족의 작품이라고 ... | Verify whether `liths` are standing stones/monuments, stone tablets, or a setting-specific object before fixing the Korean noun. | English uses the lore term `liths`; Japanese says impressive stones, Chinese says stone carvings, and Korean says stone tablets. The references disagree on the object's form. This repeats the historical question. | Medium |
| 3096 | 과부(The Widow)는... | Confirm that `The Widow` is a named creature/figure and align its Korean form with other Webwood/Widow references rather than treating it as a generic widow. | English capitalizes the title and describes an apparently undefeatable entity; Japanese/Chinese preserve it as a named figure. Korean's `과부` is literal but may be mistaken for a person's marital status. This repeats the historical question. | Medium |
| 3099 | 손수건 하나 팔게. | Confirm the object type and replace `손수건` if the vendor means a head/neck kerchief or scarf. | English says `kerchief`; Japanese says scarf and Chinese says headscarf. Korean `손수건` normally suggests a handkerchief and may identify the wrong item. | High |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3056, 3059, 3062, 3066,
  3074, 3076, 3079, 3087, and 3096 against active Korean and source rows.
  IDs 3056 (`Savant's Ring`) and 3075 (`Shilelagh`) in the same-numbered
  historical `base` audit are separate resource entries and were not merged.
- ID 3076's two indexed menu labels and `LINE_LEFT`, `LINE_SPACE`, and
  `LINE_INDENT` markers remain represented in the Korean row; verify marker
  ordering again in the later structural pass.
- No historical disposition was treated as approval.

## Other Checks

- ID 3074 preserves both enemy names; ID 3092 preserves the named missing
  persons, location, and the reason the Warsworn cannot investigate.
- IDs 3075 and 3091 are title-heavy dialogue. English/Japanese/Chinese
  source-name differences should be considered in the corpus-wide name pass.
- No structural changes were made.

## Batch Status

IDs 3050-3099 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
