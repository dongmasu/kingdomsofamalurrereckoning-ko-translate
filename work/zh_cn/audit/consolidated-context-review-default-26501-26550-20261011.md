# Consolidated Context Review: `default` IDs 26501-26550

- Review date: 2026-10-11.
- Scope: the 22 unique prior uncertain IDs from D-8595-D-8597 after linking
  ID 26547, already resolved as `not an issue` by D-18235. Overlaps across
  the three original findings were counted once.
- Result: all 22 remaining row-level concerns were resolved as
  `not an issue`. Previously accepted text corrections at 26531, 26539,
  and 26548 are linked, not recounted.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decision D-19311

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19311 | `default` 26502-26505, 26513, 26515-26518, 26524, 26526, 26531-26533, 26539-26540, 26543-26546, 26548-26549 | not an issue | The joke, titles, place/name references, faction/religious terms, and quest details are source-traceable. ID 26515 preserves the explicit uncertainty about whether Maire and Irion left voluntarily or were forced; 26517 preserves the intended “conqueror” sense despite the English typo. The Sparrow wording remains a quoted nickname rather than an unsupported bird/faction assertion. The accepted cave/downstream/drowned corrections remain intact. Seasteel wording varies elsewhere, but `해양 강철` accurately denotes the source material and no binding corpus-wide form makes these rows erroneous. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active
  Korean each contain IDs 26501-26550 exactly once in ascending order.
- No active Korean CSV cell changed in this context review; the previously
  accepted edits at IDs 26531, 26539, and 26548 remain as recorded.
- The prior preliminary scan verified the `<Lie>` wrapper, the
  `$SQ15_FIN.m_inn_cost$` runtime token, numeric values, and the four
  embedded line breaks and paragraph layout at ID 26548.
- Active default SHA-256 is unchanged:
  `6d60b9da225f25c8f925b2a1ca328c9643f3d14ddbb51d17367cd3586e88c74c`.
- Twenty-two prior uncertain IDs were reclassified as `not an issue`.
  D-18235 at 26547 and the accepted corrections at 26531, 26539, and 26548
  are linked without recounting. Totals: 2,204 accepted / 24,462 `not an
  issue` / 11,858 uncertain (38,524). Resume at D-19312, ID 26551.
