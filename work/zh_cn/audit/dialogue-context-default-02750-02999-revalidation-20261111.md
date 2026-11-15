# Sequential `default` Revalidation: IDs `2750`-`2999`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `2750`-`2999`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 183 new IDs were reviewed and recorded. The other 67 IDs in this interval
  already had ledger records and were left unchanged.
- Seven correction candidates and five evidence-limited holds were identified.
  Candidates and holds are separate; no source row was silently resolved.
- The review checked meaning, Korean naturalness, speech/register where
  applicable, names and terms, and text structure. No speaker or dialogue
  order was inferred from asset association alone. UI, objective, item, book,
  and other non-dialogue text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `2799` | Terminology / naturalness | `Unmarked Grave` is rendered `무덤 표식이 없는 무덤`, which is redundant. `base:587` uses the concise matching form `표식 없는 무덤`. Consider aligning this row to that established wording. | High |
| `2820` | Format / title | The title `The Bursar's Collectors Have Come` is rendered with only the fragment `Bursar's` in parentheses (`대회계원(Bursar's)의 징수원들이 왔다`). Consider pairing the complete title and removing the possessive fragment from the middle: `대회계원의 징수원들이 왔다(The Bursar's Collectors Have Come)`. | High |
| `2846` | Meaning / naturalness | `Imbued with the tempered indifference of Archsage Caledus` is rendered as though the character inherited Caledus's indifference (`이어받아`). Consider wording that says the quality is imbued in the subject, such as `대현자 칼레두스(Caledus)의 절제된 무심함이 깃들어`. | Medium |
| `2853` | Naturalness / UI label | `Stubble Intensity` is rendered `수염자국 짙기`, an awkward slider label. Consider `수염자국 농도` or another concise label that describes adjustable intensity. | Medium-high |
| `2871` | Format / place name | The credit `Recorded at Smecky Music Studios, Prague` pairs the studio name but gives only `프라하` for the city. Consider `스메키 음악 스튜디오(Smecky Music Studios), 프라하(Prague)에서 녹음`. | High |
| `2959` | Naturalness / speech act | `Please, allow me to discount my services for you!` is rendered `내 서비스 요금을 깎아 주게 해 줘!`, which sounds like a request for permission rather than an offered reward and shifts abruptly from the preceding casual register. Consider `보답으로 내 서비스 요금을 할인해 줄게!`, subject to the speaker's established voice if later identified. | High |
| `2999` | Naturalness | `I'm no proper nature guide` is rendered as the stiff compound `전문 자연 안내인`. Consider a more conversational form such as `난 제대로 된 자연 안내자는 아니지만`, while preserving the speaker's modest qualification. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `2883` | Speech level / honorifics | Korean `뭘 찾으시나?` uses an honorific stem with a plain ending; Japanese is feminine casual, while the asset contains many possible NPC speakers and provides no key-level mapping. Preserve the current line pending speaker/addressee evidence. |
| `2913` | Meaning / terminology | English `chandlery` may refer to a candle shop or, in a maritime context, a ship-supply shop. Korean `양초 가게` depends on the first sense; Japanese is generic (`商売`) and Chinese transliterates the term. The linked asset covers multiple quests and NPCs and does not resolve the intended business. Hold rather than guess. |
| `2938` | Meaning / terminology | `the testament` could refer to Belen's doctrine/covenant or the `Belen's Testament` faction. Existing Korean uses both `성약단` and `테스타먼트`; Japanese materially diverges and Chinese supports a covenant reading. Retain the current text until the specific referent is established. |
| `2956` | Speech level | Korean uses polite `무엇을 도와드릴까요?`, while Japanese is casual (`どんな用かな？`). The same English greeting occurs in a multi-quest, multi-NPC asset and the key is not mapped to a speaker or customer relationship. The wording is natural as a service greeting; keep the register question unresolved. |
| `2988` | Meaning / source discrepancy | English `Chamber of Trade` and Chinese `商会` indicate a trade body, while Japanese `収税局` indicates a tax office. Korean `무역 회의소` follows English and Chinese; retain it pending stronger game-context evidence. |

## Duplicate and Structural Checks

- Forty-five exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (712 rows total). Every group
  has identical Korean text. The `Lower` group includes IDs `2814` and `2971`;
  both are `낮음`.
- Line-break counts, runtime-variable indices/order, display markers, and
  markup signatures were compared across English, Japanese, Chinese, and
  Korean for all 183 newly recorded IDs. No Korean structural discrepancy
  was found. Localized text inside display markers was not treated as a
  structural mismatch.
- The 67 pre-existing ledger records in this interval were not rewritten or
  duplicated. Asset links remain evidence about containing files only; no
  per-key speaker or dialogue order was inferred.

## Newly Recorded IDs

`2750`, `2751`, `2752`, `2754`, `2755`, `2757`, `2759`, `2761`, `2762`,
`2763`, `2766`, `2768`, `2770`, `2771`, `2772`, `2774`, `2776`, `2777`,
`2778`, `2779`, `2780`, `2781`, `2783`, `2784`, `2786`, `2787`, `2788`,
`2789`, `2790`, `2791`, `2793`, `2795`, `2797`, `2798`, `2799`, `2800`,
`2801`, `2802`, `2803`, `2804`, `2805`, `2807`, `2808`, `2809`, `2811`,
`2812`, `2813`, `2814`, `2815`, `2817`, `2818`, `2819`, `2820`, `2821`,
`2822`, `2823`, `2824`, `2826`, `2829`, `2830`, `2832`, `2834`, `2836`,
`2837`, `2839`, `2840`, `2842`, `2843`, `2844`, `2845`, `2846`, `2848`,
`2850`, `2853`, `2854`, `2855`, `2857`, `2858`, `2861`, `2862`, `2863`,
`2864`, `2865`, `2867`, `2869`, `2870`, `2871`, `2874`, `2875`, `2876`,
`2877`, `2878`, `2879`, `2880`, `2881`, `2882`, `2883`, `2884`, `2886`,
`2887`, `2889`, `2890`, `2892`, `2894`, `2895`, `2897`, `2900`, `2902`,
`2903`, `2904`, `2905`, `2906`, `2907`, `2909`, `2911`, `2912`, `2913`,
`2914`, `2916`, `2917`, `2918`, `2919`, `2921`, `2924`, `2925`, `2926`,
`2927`, `2928`, `2929`, `2930`, `2931`, `2932`, `2933`, `2934`, `2935`,
`2938`, `2939`, `2940`, `2941`, `2942`, `2944`, `2946`, `2947`, `2948`,
`2949`, `2950`, `2951`, `2954`, `2955`, `2956`, `2957`, `2959`, `2960`,
`2961`, `2962`, `2965`, `2966`, `2967`, `2968`, `2969`, `2971`, `2972`,
`2974`, `2977`, `2978`, `2979`, `2980`, `2981`, `2983`, `2984`, `2985`,
`2987`, `2988`, `2990`, `2991`, `2992`, `2993`, `2994`, `2995`, `2996`,
`2997`, `2998`, `2999`.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
