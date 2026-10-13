# Preliminary Language Scan: `default` IDs 23051-23100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 23051-23100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 23051 | Might / “heaviest weapons” | Preserve the superlative for both armor and weapons. | Korean says “가장 무거운 갑옷” but only “무거운 무기”; English and Japanese specify the heaviest weapons. | High |
| 23053 | Dverga | Keep the people-name form consistent with prior draft usage. | Korean uses `드베르가`, matching established occurrences; the Chinese form is a supporting transliteration only. | Low |
| 23057 | “You don't trouble me none” | Retain the English meaning that the addressee causes no trouble; note a source-language disagreement. | Korean agrees with English and Japanese. Chinese instead says the addressee has caused trouble, reversing the polarity. | High |
| 23059 | “all the same. All the same!” | Preserve the repeated grief/emphasis without resolving the speaker's unfinished thought. | Korean retains the concession but compresses the final repetition to `참 안됐지`; English/Japanese repeat the phrase. | Medium |
| 23066 | Equipment requirement labels | Align the labels inside the localized UI markers with Korean gameplay terminology. | All seven wrappers occur in the same order, but Korean leaves their English labels untranslated; the historical question also flags these terms. | Medium |
| 23078 | Rathir rite / aura | Clarify the rite's nature and whether `aura` should be distinguished from general energy. | Korean retains the once-or-twice lifetime frequency, hard work, and slow fading; the source does not identify the rite further. | Medium |
| 23080 | Sagecraft / reagent names | Verify the established Korean skill and ingredient names while preserving recipe layout and amounts. | Korean retains all three ingredients, quantities, and two paragraph breaks; English/Japanese identify the skill as Sagecraft, while Chinese uses a different skill concept. | Medium |
| 23081 | Litanies / `연도문 배치` | Determine whether this objective concerns prayer texts, ritual objects, or a named quest item. | The short English objective and Japanese/Chinese renderings do not settle the object or placement context. | Medium |
| 23087 | The Offering / `봉헌물` | Establish whether this is an object, rite, or named quest title before standardizing the label. | English capitalization and the locale renderings permit more than one reading; the historical question remains open. | Medium |
| 23089 | “I'll rent the bed” / inn-cost variable | Check whether `bed` is intentionally distinct from renting a room and retain the variable exactly. | Korean says `침대를 빌릴게`; all four locales preserve `$Gorhart_NQD.m_inn_cost$` and its position. | Low |
| 23091 | Niskaric artifacts / “early wisdom” | Clarify what early wisdom denotes and its relation to the chapel, without treating it as an artifact. | Korean preserves the conditional report and chapel location; English/Japanese distinguish the absent Niskaric artifacts from the stored wisdom. | Medium |
| 23092 | `otherwordly` | Keep the apparent English source typo distinct from any translation error. | English spells `otherwordly`; Korean's “이계의” conveys otherworldly and does not reproduce the typo. | Low |
| 23093 | `You'll find" him"` / Caer Nyralim | Preserve the source's stray quotation and ambiguous antecedent as an audit issue, not as a reason to invent identity. | Korean identifies a male referent with `그는`, but does not name him; Japanese/Chinese also retain an unspecified “him.” | Medium |

## Historical Audit Reconciliation

- Rechecked the archived source-keyed questions for IDs 23054-23055,
  23063-23064, 23066-23067, 23074, 23078, 23080-23081, 23087, and
  23091-23093 against the active rows. Name, UI, object, source-fragment,
  and context questions remain preliminary.
- Cross-checked recurring forms for Akara, Akara-Tor, Dverga, Rathir,
  Sagecraft, Lyria, Niskaru, Caer Nyralim, and Gavroche. ID 23053's
  `드베르가` matches the established active draft form.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 23051-23100 exactly
  once and in identical order.
- ID 23080 has two embedded line breaks in every locale; recipe item order
  and quantities `(2), (2), (1)` are preserved.
- ID 23066 preserves the seven runtime/UI wrappers in matching class and
  order. Marker label text is localized in Japanese and Chinese but remains
  English in Korean, as in the English source.
- No other line-break, runtime-marker, or numeric-value discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 23051-23100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
23101.
