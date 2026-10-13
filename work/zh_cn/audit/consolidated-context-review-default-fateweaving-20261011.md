# Consolidated Context Review: `Fateweaving` and Repeated Labels

- Date: 2026-10-11
- Scope: consolidate repeated English labels and exact repeated sentences
  among recorded `default` uncertainties; review source rows by ID and compare
  English, Japanese, Japanese-derived Korean, Chinese, and active Korean.
- Result: D-18208 reclassifies five previously uncertain rows as `not an
  issue`. No Korean CSV cells changed. This is a focused context review, not
  closure of the remaining uncertainty inventory.

## `Fateweaving`

The five standalone labels at IDs 15424, 23680, 26476, 34645, and 63340
repeat the same value in each corresponding locale:

| English | Japanese | Japanese-derived Korean | Chinese | Active Korean |
| --- | --- | --- | --- | --- |
| `Fateweaving` | `フェイトウィーブ` | `운명 엮기` | `织命` | `운명 엮기` |

All five rows preserve the English compound's fate-weaving meaning. Japanese
transliterates the term and Chinese literally expresses weaving fate; neither
supports a conflicting meaning. The unresolved question of whether each
isolated label names an activity, skill, service, or discipline does not
establish a translation error in `운명 엮기`. Elsewhere the corpus also uses
`운명 직조`; this review does not choose a global glossary form or normalize
those variants.

D-18208 therefore reclassifies IDs 15424, 23680, 26476, 34645, and 63340 as
`not an issue`, without changing the active Korean text. Related
uncertainties about Fateweaving in broader narrative/service contexts remain
open where the locale evidence conflicts or the Korean term is not the only
unresolved issue.

ID 26786 also uses `운명 엮기` in dialogue and matches the Japanese and
Chinese meaning. However, its prior grouped uncertainty also flags whether
`Den` is a named place; Japanese and Chinese say casino/gambling hall while
English capitalizes `Den`. The row remains uncertain until that separate
context question is resolved.

## Repeated Sentence Retained as Uncertain

IDs 10095 and 10197 contain the exact same sentence and agree across all five
files:

| English | Japanese | Japanese-derived Korean / active Korean | Chinese |
| --- | --- | --- | --- |
| `Winds in the Hollowlands can be fierce.` | `ホローランドの風は時に荒々しくなる` | `홀로랜드에는 거센 바람이 분다.` | `虚空之地里的风有时很猛。` |

The sentence meaning is clear, but the unresolved issue is the region name,
not the sentence translation. The active corpus contains competing Korean
forms including `홀로랜드`, `할로우랜드`, `홀로우랜드`, and `공허의 땅`;
the Japanese transliteration and Chinese semantic translation do not select
a canonical Korean proper name. Both IDs remain uncertain without edits.

Other repeated candidates were not automatically cleared: for example,
`Higher` has different Korean renderings, while `Pledgeshield`, `The Sidhe`,
and `FAIL LINE` retain source-locale, name, or runtime-context questions.
Exact English repetition alone is not sufficient evidence to resolve those
items.

## Verification and Totals

- All five D-18208 IDs were joined by ID in the English, Japanese, Japanese
  draft, Chinese, and active Korean `default` CSVs. Each has the same
  ascending key in every file.
- The five D-18208 rows contain no runtime markers or embedded line breaks.
- No active Korean CSV was edited. Active `default` SHA-256 remains
  `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
- Cross-resource totals through D-18208: 1,910 accepted, 22,966 `not an
  issue`, and 13,646 uncertain (38,522 unique dispositions); next decision:
  D-18209.

These are working dispositions, not independent final linguistic approval.
