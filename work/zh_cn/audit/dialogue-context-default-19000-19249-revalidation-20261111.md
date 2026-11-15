# Sequential `default` Revalidation: IDs `19000`-`19249`

- Date: 2026-11-11.
- Scope: all 250 current Korean rows compared by ID with English, Japanese,
  and Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 77 existing records; added 173 previously unrecorded IDs.
- Retained eight existing correction candidates; recorded five new
  correction candidates and seven evidence-limited dimensions affecting six
  IDs (one also has a pairing candidate).
- No translation CSV, source, extracted asset, or binary was changed.

## Correction Candidates

These findings are proposals, not approval to change the translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `19022` | Naturalness / terminology | English `A culling`, Japanese `排除`, and the hostile-group context support removal or clearing rather than the political connotations of `숙청`. Retain the existing proposal to use context-appropriate `소탕` or `제거`; do not infer a speaker from the asset. | Medium-high |
| `19037` | Name pairing | English and Japanese explicitly identify a Sprite. Retain the existing scoped proposal `스프라이트(Sprite)` without treating every generic fairy as this species. | High |
| `19051` | Name pairing | The announcer names `Morsus Canis Imperius`; Korean transliterates the name but omits its English form. Consider `모르수스 카니스 임페리우스(Morsus Canis Imperius)`. Keep identity, gender, and the precise epithet separate from this format finding. | High |
| `19058` | Meaning | English `What should I expect out here?` and Japanese `この外には何が？` ask what is outside; Korean `뭘 조심해야 하지?` narrows this to danger. Consider `이 밖에는 뭐가 있지?`, preserving the plain question form. | Medium-high |
| `19063` | Name pairing | Retain the approved `사반트 메스닌` spelling/title and the existing proposal `사반트 메스닌(Savant Methneen)과 대화하기`. D-19511 and D-21909 are not reopened. | High |
| `19071` | Term pairing | The named dice game `High Roll` is unpaired here, unlike `2902`, `11559`, `14309`, and `15967`. Consider `하이 롤(High Roll)`; the two-dice/highest-total explanation is retained. | High |
| `19076` | Name pairing | The established `프라이데리` spelling lacks `Pryderi`. Retain `프라이데리(Pryderi)`; Japanese calls it a trading company, while related English calls it a market, so do not add an unsupported entity type. | High |
| `19089` | Name pairing | The letter is explicitly signed `Red`, rendered `レッド` in Japanese and `레드` in Korean. Consider `레드(Red)` in the signature, preserving the two embedded line breaks and the threatening informal voice. | High |
| `19097` | Title consistency / pairing | Retain the asset report's scoped `은둔 대장장이(Hermit Smith) 찾기` proposal. D-21591 treats the expression as a local description, not a global character alias. | Medium-high |
| `19105` | Name pairing | `Ragnall the Valiant` is named in the epitaph, but `라그널` lacks the English name. Consider at least `라그널(Ragnall)` without silently merging the named figure with other Ragnall epithets or changing the existing solemn epitaph register. | High |
| `19206` | Syntax / naturalness | `내 경비병들과 내가 ... 호위해 달라고 요청했어` blurs the recipients of Anokatos's request. English specifies the guards and speaker as requested escorts. Consider `아노카토스(Anokatos)가 직접 내 경비병들과 나에게 이곳에 있는 자신의 추종자들을 호위해 달라고 요청했어.` Preserve the current plain register; the asset alone does not prove a speaker. | High |
| `19214` | Naturalness | Retain the proposal to simplify `마법을 하찮은 일에 쓰지 않고는 농사조차 지을 수 없어서`, while preserving both the contempt for debasing Fae magic and the courteous `-군요` register. A direction is `페이(Fae)의 마법을 농사짓는 데까지 써야 하니, 그들이 당신을 이 페이(Fae) 동굴로 보낸 거군요.` | Medium |
| `19243` | Term pairing | Retain `투모스(thumos)` as already used at `17152` and `28612`. Preserve the third-painting number, two separate vials, Faer Gorta and Root Golem thresholds, and journal narration. | High |

## Evidence-Limited Holds And Retained Decisions

| ID | Dimension | Evidence / disposition |
| ---: | --- | --- |
| `19051` | Address / identity | The source uses `her excellence`; the related announcement `48309` uses `his excellence`. Japanese paraphrases the beast's title. Adding the name pairing does not settle identity, gender, or whether `각하` is appropriate. |
| `19078` | Reference | English `Widow spare you` and Chinese invoke the Widow, but Japanese `あなたが頼りよ` instead says the addressee is relied upon. The asset alone does not settle the referent; do not replace `과부` with an assumed character name. |
| `19109` | Title order / prior instruction conflict | The English source is `Ambassador Brenner`; Korean follows the user's combined person/title policy as `브레너 대사(Brenner Ambassador)`, explicitly documented in `translation-edit-addendum-20261109.md`. Later range reports at `14496` and `15577` propose source-order `Ambassador Brenner`. Those proposals are not an approved replacement for the user's earlier ordering. Hold this policy conflict instead of silently reversing the parenthetical or claiming the English order was already established. The introductory `-다` versus Japanese casual speech also lacks per-speaker/stage evidence. |
| `19121` | Meaning / unit | `five gold a hand` is rendered literally as `한 손에 금화 다섯 닢`. Japanese omits the unit, and Chinese is also literal. The sold item/quantity is not established, so do not guess a pack, bundle, or round. |
| `19211` | Names / reference | Capitalized `Gardens` and `Trellis` may be named places; Japanese uses a garden and a meeting place, while Chinese is descriptive. Retain the current wording pending map/context evidence. |
| `19234` | Reference | English `the Sorrows`, Japanese `嘆きの力`, and Chinese `悲灵` do not independently establish a person, force, or place. Preserve the current interpretation provisionally, without inventing a named entity or pairing. |

- `19050`: D-21833 explicitly approves the player-awarded title
  `볼간을 막아 내는 자(Tyrannus Bolganus)`; older open title questions
  do not override that decision.
- `19136`: D-19721 approves `미타란족`; the current
  `미타란족(Mitharans)` preserves that decision.
- `19105`: related entries `8795` and `53833` use `라그날`, but shared
  English `Ragnall` does not prove that all epithets identify one character.
  The pairing proposal does not authorize an identity or spelling merger.

## Duplicate And Structural Checks

- All 250 IDs occur once in each language in the same ascending order.
- Fifty-two exact-English duplicate groups touch this range (1,242 corpus
  rows); all have matching Korean.
- Seven groups have Japanese differences, reviewed without forcing new
  Korean distinctions: `Run!` (`19181`; imperative variants), the champion
  warning (`19188`; voice variants), `Oathblade` (`19219`; untranslated
  Japanese versus rank paraphrases elsewhere), `Sparrow` (`19179`;
  untranslated Japanese at `20899`), `Telogrus` (`19057`; untranslated
  Japanese at `16624`), `Be on your guard.` (`19197`; imperative variants),
  and `They've left the area.` (`19240`; inferred-departure voice variants).
  The current shared Korean conveys the common meanings; the differences
  do not establish individual speakers.
- Localized wrappers at `19002`, `19055`, and `19205` preserve their control
  structure. At `19055`, `{LINE_SPACE}` and `{1}` remain in source order.
- `19110` has three logical embedded line breaks in English, Chinese, and
  Korean versus six in Japanese (extra blank lines between quoted turns).
  Record this source-layout difference rather than normalizing Korean.
- All other logical line-break counts match; runtime-placeholder order
  matches throughout. Existing Korean CRLF embedded breaks are unchanged.

The ledger now contains 31,241 of 65,135 IDs (47.96%), leaving 33,894
unreviewed. The next sequential range is `19250`-`19499`.
