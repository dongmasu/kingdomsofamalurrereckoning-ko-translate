# Preliminary Language Scan: `default` IDs 26501-26550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26501-26550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26501-26505, 26509-26516, 26518-26522, 26526, 26528, 26530-26534, 26536-26540, 26542-26547, 26550 | Dialogue, short labels, and quest wording | Recheck context-dependent register, titles, names, and concise UI strings during integrated review. | Korean generally preserves the English meaning and Japanese voice. The Maire/Irion line at 26515 retains uncertainty over voluntary departure versus expulsion; the Maid's Champion passage at 26513 preserves the gate-defense role and access condition. | Medium |
| 26506 | `<Lie>` markup | Preserve the wrapper and determine whether its enclosed label is intentionally localized. | All four locales retain one angle-bracket label. English, Chinese, and Korean use `<Lie>`; Japanese localizes it as `<嘘>`. Korean retains the English payload, so this is a localized-label variation, not a missing wrapper. | High |
| 26513, 26515-26517, 26524, 26526, 26531-26533, 26539-26540, 26543-26548 | Maid / Amman Keys / Firstsworn / Sparrow / Chaos King / Saturnyn / Alleia / Rahnil / Keening / Order of the World / Mitharu / Court of Enchantments / Fomorous Hugues | Align proper names, factions, offices, and metaphysical terms with prior entries; retain source anomalies as such. | The historical log records these as open consistency questions. At 26517, English has the apparent misspelling `Conquerer`; Korean renders the epithet without reproducing the English typo. At 26539, `Alleia's hollow` is rendered with `공허`, which may be confused with abstract emptiness rather than a Fae place/realm term. | High |
| 26523, 26535, 26548-26549 | Mana reduction / inn-cost variable / Hugues memo / Seasteel bundles | Preserve exact values, variable spelling, list/paragraph layout, and signature; standardize material wording. | ID 26523 retains 13% Mana Cost Reduction. ID 26535 preserves `$SQ15_FIN.m_inn_cost$` and Gold. ID 26548 retains the memo's two blank-separated paragraphs, four embedded line breaks, and Fomorous Hugues signature. The warning about water downstream of ash-dumps is rendered as water below the ash piles; check whether Korean should make the downstream relation explicit. | High |
| 26531, 26539, 26544, 26547-26549 | Sparrow evidence / Alleia's hollow / Order of the World / Court of Enchantments / Hugues memo / Seasteel | Preserve lore sense and distinctions among proper groups, locations, and materials. | The shipwreck report lists “drowned street urchins, criminals, even a missing Sparrow”; Korean preserves the list, though “물에 빠진” may be less explicit than drowned/dead. The Order of the World line retains Mitharu's welcome in its missions/sanctuaries. These details remain candidates for contextual review. | Medium |

## Historical Audit Reconciliation

- The preserved question log groups the Maid/Amman Keys/Conquerer of Rats/
  Dellach/Sidhe/Sparrow/Talibor/Chaos King/Saturnyn questions in this range.
- It also records the Mana reduction, `$SQ15_FIN.m_inn_cost$`, the
  Fomorous Hugues memo, and title/name terms for Alleia, Rahnil, Keening,
  Apotyre, Effie Cruikshank, Helga Swanwhite, Order of the World, Mitharu,
  Court of Enchantments, Aster, Scaith, Myrinne, Teeth of Naros, Marauder,
  Bux, and House of Valor.
- `Conquerer` and the opaque named-place sense of `hollow` remain source/
  glossary questions, not approval to change the Korean draft.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26501-26550 exactly
  once and in identical order.
- Actual embedded line-break counts match across all four locales. ID 26548
  has four embedded line breaks in each locale and preserves its two
  paragraph breaks and attribution.
- Runtime-token identity/order matches, including
  `$SQ15_FIN.m_inn_cost$`. The `<Lie>` wrapper is present in each locale;
  only Japanese localizes its enclosed label.
- Numeric values are preserved. No key/order or line-break exception was
  found.
- Korean wording and all translation/source CSVs were not edited.

## Batch Status

IDs 26501-26550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26551.
