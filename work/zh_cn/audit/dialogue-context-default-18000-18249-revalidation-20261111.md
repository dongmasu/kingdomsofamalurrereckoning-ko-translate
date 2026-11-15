# Sequential `default` Revalidation: IDs `18000`-`18249`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared with English, Japanese,
  Chinese, current terminology evidence, and formatting.
- Sixty-three existing ledger records had matching four-language
  fingerprints; 187 previously unrecorded IDs were reviewed and added.
- No new correction candidate was added. Four existing candidates were
  rechecked and retained; 13 evidence-limited holds are recorded.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Retained Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `18005` | Naturalness / objective style | The active objective `나머지 유해를 찾아라` is a direct command rather than the concise objective form used elsewhere. The identical English row at `1961` has the same Korean. Consider aligning both as `다른 유해 찾기`. | High |
| `18118` | Terminology / consistency | The same adversary `the Headsman` is rendered with several unrelated Korean forms across the corpus; this row says `행맨`. Consider the established quest-review proposal `처형인(Headsman)`, without inferring an individual speaker from the asset. | Medium-high |
| `18134` | Artifact terminology / pairing | English names the Storm and Frost Stones; Korean says `폭풍의 돌과 서리석(Frost Stones)`, leaving the Storm Stone unpaired and not using the established artifact label. Consider `폭풍석(Storm Stone)과 서리석(Frost Stones)`, preserving the two statue assignments. | High |
| `18242` | Shared-source consistency | The second English sentence is identical to `48994`, but Korean varies `돈`/`골드` and `치르지`/`지불할게`. Consider using the current `18242` wording for the shared sentence at both IDs. | High |

## Evidence-Limited Holds

These are not confirmed translation errors. Available row-level evidence does
not settle the relevant distinction.

| ID | Dimension | Reason |
| ---: | --- | --- |
| `18001` | Meaning / terminology | `chantry` is translated as `예배당`; the references support a religious building, but do not establish the project's preferred Korean institution term. |
| `18026` | Format / UI context | `#NAMED_ICON_360_LB#` is preserved, but the space before the icon differs from the source locales. Whether that spacing is intentional requires display-context evidence. |
| `18032` | Meaning / reference | English says `the page`; Japanese and Chinese read the term as an attendant/assistant, as does Korean `시종`. The chronicle does not resolve the source conflict. |
| `18039` | Meaning / place name | English gives `Undersea Fasting`, while Japanese reads a passage and Korean transliterates the English as `언더시 패스팅`. The location/artifact context remains unresolved. |
| `18058` | Format / UI context | `DECIMAL` may be a player-facing decimal key or an internal input label. The Korean `소수점` is plausible, but display context is unavailable. |
| `18098` | Meaning / reference | English begins with `It`, whose antecedent is absent. Korean `여기도` selects a location reading that cannot be confirmed from this row alone. |
| `18145` | Meaning / terminology | `Beckoned` is used as direct address. Korean `부름받은 자` conveys the literal sense, but whether this is a formal class/title and its canonical term are not established here. |
| `18147` | Meaning / reference | The compressed phrase `Telogrus ... his fantasies of unrest` does not settle whether Telogrus imagines, promotes, or otherwise owns the unrest. Japanese omits the agent and cannot resolve it. |
| `18163` | Terminology / source conflict | The recipe names `Sativa Fibers`; Japanese says leaves and Chinese gives a linen-like reading. Korean preserves the English ingredient label, but the actual reagent is unresolved. |
| `18187` | Format / UI context | `Ambient Dialogue Holder` looks technical, but this row does not establish whether it is an internal label or player-facing text. |
| `18191` | Meaning / terminology | English and Chinese preserve `Pledgeshield`, while Japanese reads it as a second-rank mercenary. The formal role and canonical Korean title remain uncertain. |
| `18214` | Meaning / reference | Japanese treats `Almain Sojourner` as a vessel, while Chinese reads it as an Almain wanderer. Korean adds the ship suffix `호`; this isolated label does not settle the referent. |
| `18249` | Meaning / UI terminology | English says `Wield`, Japanese says equip, and Chinese says swing/dance the daggers. Korean `휘두르기` may be too narrow for the intended ability label. |

## Rechecked and Cleared Earlier Findings

- `18065` now has one quote pair around `그레이브홀(Gravehal)!`, and
  `18075` restores the explicit warning about Livia.
- `18102` uses the age-neutral `누이`; `18120` no longer adds `Grave` to
  `Thresh`; and `18142` now pairs the corrected source spelling
  `Coilsbain`.
- `18166` uses a single quote pair, and `18174` now preserves the request
  that laborers assist with experiments and the established
  `프레토리안 근위대(Praetorians)` term.
- `18212` now describes pain being caused in the present; `18223` uses one
  quote pair around `Victory Games`; and `18237` includes `내 형제` without
  assigning an older-sibling distinction.
- These current rows match the four-language evidence; their earlier
  accepted corrections were not reopened.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the English, Japanese,
  Chinese, and active Korean tables.
- Fifty-nine exact-English duplicate groups touch this range (1,161 corpus
  rows). Every group has identical Korean text.
- Logical line-break counts match: 47 in each language. The five multiline
  rows are `18156` (4), `18163` (3), `18166` (8), `18195` (4), and `18198`
  (28); their line-break positions match across all four languages.
- Extracted runtime/layout token signatures match across all four locales,
  including the tribute variable and gold icon at `18064`, the platform icon
  at `18215`, and the five-section betting list at `18198`.
- Of the 187 new IDs, 133 have indexed quest-asset links and 54 do not; six
  link to multiple assets. Asset links do not establish individual speakers,
  addressees, or playback order; unsupported attributions remain unassigned.

The ledger now contains 30,509 of 65,135 IDs (46.83%), leaving 34,626
unreviewed. The next sequential range is `18250`-`18499`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
