# Sequential `default` Revalidation: IDs `3000`-`3249`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `3000`-`3249`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 179 new IDs were reviewed and recorded. The other 71 IDs in this interval
  already had ledger records and were left unchanged.
- Sixteen correction candidates and one evidence-limited hold were identified.
  Candidates are proposals, not approval to edit the translation CSV.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. UI, objective, item, book,
  and other non-dialogue text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `3073` | Terminology / naturalness | In the context of arranging a match, `arena` is translated as `경기장`; the House of Valor material generally uses `투기장` for its fighting venue. Consider aligning this occurrence with that established sports meaning. | Medium-high |
| `3075` | Format / title | The list of epithets pairs `Detyre`, `Elcmar`, and `Gilded Gorgon`, but not the named `Spear of Light`, `Rum of Fate`, or possibly `Eastern Shores`. The same `Grasper of the Spear of Light` phrase at ID `56854` is `빛의 창을 움켜쥔 자`, versus `빛의 창을 쥔 자` here. Review the complete list and align the named terms and repeated epithet where context supports it. | Medium |
| `3077` | Naturalness / meaning | `Aye, good day` is a greeting, as supported by Japanese `あら、こんにちは` and Chinese `啊，你好`; Korean `그래, 안녕` reads as an affirmative answer. Consider a greeting such as `아, 안녕`, without inferring a more specific speaker voice. | High |
| `3085` | Terminology / UI label | `Activity - Bedroll 01` is rendered `활동 - 침낭 01`. This appears to label an animation/action; other `Activity` labels use `활동`, `행동`, and `동작`, while Japanese and Chinese support an action/motion sense. Confirm the category convention and align the label, for example to `동작 - 침낭 01`. | Medium-high |
| `3092` | Naturalness | `최근 며칠 사이 실종은 더 심해졌다` is awkward Korean. Japanese and Chinese also describe the disappearances becoming worse/more serious. Consider `최근 며칠 사이 실종 사건은 더 심각해졌다` or equivalent wording. | High |
| `3123` | Naturalness / meaning | `deceptively simple blade` is rendered `소박한 칼날은 겉보기와 다르다`, an awkward construction that obscures the contrast between appearance and significance. Japanese and Chinese support a seemingly simple-looking blade; consider `겉보기엔 단순한 이 칼날은...` while retaining the following claim. | High |
| `3124` | Meaning / terminology | The standalone label `Entry II` is rendered `제2부`, which means “Part II.” Japanese `その2`, Chinese `条目II`, and `Entry I` at ID `32598` (`기록 I`) support an entry/record label instead. Consider `기록 II` or another consistent entry label. | High |
| `3157` | Meaning / naturalness | `Holden LaFayette, at your service` is rendered only as `홀든 라파예트다`, omitting the courteous self-introduction also present in Japanese `よろしく` and Chinese `为你效劳`. Consider restoring a natural equivalent such as `잘 부탁해`; the line itself identifies Holden as the speaker. | High |
| `3177` | Meaning / naturalness | `nondescript book` is rendered `수수께끼의 책`, adding the sense “mysterious” rather than “unremarkable.” Consider wording such as `눈에 띄지 않는 책이지만, 평범한 겉모습과 달리 특별해 보인다`. | High |
| `3201` | Terminology / format | The same region is consistently rendered `케일드 해안(Caeled Coast)` elsewhere, but the final paragraph uses `카엘드 지역` for `Caeled` without English pairing. Consider aligning the spelling and pairing the name while preserving the paragraph's meaning and breaks. | High |
| `3207` | Meaning | `I will not be bound by you or those you serve` is rendered `너나 네가 섬기는 자들에게 굴복하지 않겠다` (“I will not submit”), shifting “bound” to “submit.” Japanese `縛られる` and Chinese `束缚` support “be bound/restrained”; consider `구속당하지 않겠다` or equivalent. | High |
| `3216` | Format / terminology | Capitalized `Living Quarters` is rendered `생활 구역` without its English name. Other occurrences vary between `생활 구역` and `거주 구역`; review the location label across its uses and apply the chosen form consistently, with English pairing if treated as a named location. | Medium |
| `3218` | Format / entity label | The standalone enemy/class label `Viper Sorcerer` is translated `바이퍼 마법사` without the source pairing. Consider `바이퍼 마법사(Viper Sorcerer)` if this label follows the project's named-creature/class convention. | Medium |
| `3223` | Format / terminology | The same creature is written `보가트(boggart)` and then `보가트(Boggart)` within one entry; the established Korean form elsewhere is paired as `보가트(Boggart)`. Consider making the two occurrences consistent. | High |
| `3237` | Meaning / naturalness | `All that I am has been compromised by the Maid` is rendered `난 시녀에게 완전히 짓밟혔어`, which changes “compromised” to a physical image of being trampled. Japanese describes succumbing and Chinese being controlled; consider a phrase conveying that the Maid corrupted or damaged the speaker's whole being. | Medium |
| `3241` | Meaning | `a humble student of the faith` is rendered `신앙심 깊은 평범한 신도`, shifting “humble” toward “devout.” Chinese supports humility and Japanese supports being an ordinary believer. Consider `겸손히 신앙을 따르는 신도` or another natural equivalent. | Medium |

## Evidence-Limited Hold

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `3215` | Meaning / title | `Professor Emeritus Abscondus of Postmortem Studies` has an unclear relationship between `Abscondus`, the academic title, and the field of study. Japanese and Chinese do not resolve the same phrasing, while Korean retains `앱스콘두스(Abscondus)`. Keep the wording pending stronger evidence; the line explicitly identifies Ventrinio Descellini as its speaker, but the asset's other NPCs do not establish additional context. |

## Duplicate and Structural Checks

- Forty-two exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (1,153 rows total). Every
  group has identical Korean text.
- Line-break counts and runtime/layout-token identities and order matched
  across English, Japanese, Chinese, and Korean for all 179 newly recorded
  IDs. Localized text inside display markers was normalized for this check.
- The 71 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links remain evidence about containing files only; no
  per-key speaker or dialogue order was inferred. ID `3157` self-identifies
  Holden LaFayette and ID `3215` explicitly names Ventrinio Descellini.

## Newly Recorded IDs

`3000`, `3001`, `3003`, `3004`, `3005`, `3007`, `3008`, `3009`, `3010`,
`3012`, `3013`, `3014`, `3016`, `3017`, `3018`, `3019`, `3020`, `3022`,
`3024`, `3025`, `3026`, `3027`, `3028`, `3029`, `3031`, `3032`, `3033`,
`3034`, `3036`, `3038`, `3040`, `3042`, `3043`, `3044`, `3045`, `3046`,
`3047`, `3048`, `3049`, `3050`, `3055`, `3056`, `3059`, `3060`, `3061`,
`3062`, `3064`, `3066`, `3067`, `3068`, `3069`, `3070`, `3071`, `3072`,
`3073`, `3075`, `3076`, `3077`, `3078`, `3079`, `3081`, `3083`, `3085`,
`3087`, `3088`, `3089`, `3090`, `3092`, `3093`, `3094`, `3095`, `3096`,
`3097`, `3098`, `3100`, `3102`, `3103`, `3104`, `3105`, `3106`, `3108`,
`3110`, `3111`, `3113`, `3114`, `3115`, `3116`, `3117`, `3118`, `3119`,
`3120`, `3121`, `3123`, `3124`, `3126`, `3128`, `3130`, `3132`, `3134`,
`3135`, `3136`, `3137`, `3139`, `3141`, `3143`, `3144`, `3145`, `3147`,
`3148`, `3150`, `3151`, `3153`, `3154`, `3156`, `3157`, `3158`, `3159`,
`3160`, `3161`, `3162`, `3164`, `3165`, `3167`, `3168`, `3170`, `3172`,
`3173`, `3174`, `3175`, `3177`, `3179`, `3181`, `3182`, `3184`, `3185`,
`3186`, `3188`, `3189`, `3190`, `3191`, `3192`, `3193`, `3194`, `3197`,
`3199`, `3200`, `3201`, `3202`, `3203`, `3204`, `3205`, `3207`, `3208`,
`3209`, `3211`, `3212`, `3213`, `3215`, `3216`, `3217`, `3218`, `3219`,
`3221`, `3223`, `3224`, `3225`, `3226`, `3228`, `3229`, `3230`, `3231`,
`3232`, `3237`, `3239`, `3240`, `3241`, `3245`, `3248`, `3249`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
